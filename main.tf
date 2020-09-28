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
  name              = module.labels.name
  availability_zone = var.availability_zone
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  key_pair_name     = var.key_pair_name == "" && var.use_default_key_pair == false ? "${module.labels.name}-keypair" : var.key_pair_name
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
  name  = "${module.labels.name}-IP"
}

resource "aws_lightsail_key_pair" "instance" {
  count = var.key_pair_name == "" && var.use_default_key_pair == false ? 1 : 0
  name  = "${module.labels.name}-keypair"
}
