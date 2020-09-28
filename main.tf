# Managed By : CloudDrove
# Description : This Script is used to create Lightsail instance, Lightsail Key Pair (Optional), Lightsail Static IP (Optional), Metric alarm (Optional).
# Copyright @ CloudDrove. All Right Reserved.

#Module      : Label
#Description : This terraform module is designed to generate consistent label names and tags
#              for resources. You can use terraform-labels to implement a strict naming
#              convention.
module "labels" {
  source = "git::https://github.com/clouddrove/terraform-labels.git?ref=tags/0.12.0"

  name        = var.name
  namespace   = var.namespace
  application = var.application
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  attributes  = var.attributes
  tags        = merge(var.tags,local.tags)
}

data "aws_region" "default" {
}

locals {
  tags = map(
    "Application", var.name, 
    "CustomerEmail", var.customer_email, 
    "CustomerBusinessName", var.customer_business_name,
  )
}

resource "aws_lightsail_instance" "instance" {
  name              = module.labels.id
  availability_zone = var.availability_zone
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  key_pair_name     = var.key_pair_name == "" && var.use_default_key_pair == false ? "${module.labels.id}-keypair" : var.key_pair_name
  tags              = module.labels.tags
  depends_on        = [aws_lightsail_key_pair.instance]
}

resource "aws_lightsail_static_ip_attachment" "instance" {
  count          = var.create_static_ip == true ? 1 : 0
  static_ip_name = aws_lightsail_static_ip.instance[count.index].id
  instance_name  = aws_lightsail_instance.instance.id
}

resource "aws_lightsail_static_ip" "instance" {
  count = var.create_static_ip == true ? 1 : 0
  name  = "${module.labels.id}-IP"
}

resource "aws_lightsail_key_pair" "instance" {
  count = var.key_pair_name == "" && var.use_default_key_pair == false ? 1 : 0
  name  = "${module.labels.id}-keypair"
}

resource "null_resource" "email_alarm" {
  count = var.enable_email_alarm == true ? 1 : 0
  provisioner "local-exec" {
    command = <<EOT
      aws lightsail put-alarm --contact-protocols Email --alarm-name ${module.labels.id}-status-checks --metric-name StatusCheckFailed --monitored-resource-name ${module.labels.id} --comparison-operator GreaterThanThreshold --threshold 0 --evaluation-periods 1 --region ${data.aws_region.default.name}
    EOT 
  }
  depends_on = [aws_lightsail_instance.instance]
}