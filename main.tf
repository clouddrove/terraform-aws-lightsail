# Managed By : CloudDrove
# Description : This Script is used to create Lightsail instance, Lightsail Key Pair (Optional), Lightsail Static IP (Optional).
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
  label_order = var.label_order
  managedby   = var.managedby
}


data "aws_region" "default" {
}

#Module      : Lightsail
#Description : Terraform module to create an Lightsail instance resource on AWS with static IP and attachment.
resource "aws_lightsail_instance" "instance" {
  name              = module.labels.name
  availability_zone = var.availability_zone
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  key_pair_name     = var.key_pair_name == "" && var.use_default_key_pair == false ? "${module.labels.id}-keypair" : var.key_pair_name
  depends_on        = [aws_lightsail_key_pair.instance]
  tags = merge(
    module.labels.tags,
    {

      "Name" = format("%s%s", module.labels.id, var.delimiter)
    }
  )
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
