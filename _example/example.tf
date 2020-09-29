provider "aws" {
  region = "ap-south-1"
}

module "keypair" {
  source          = "git::https://github.com/clouddrove/terraform-aws-keypair.git?ref=tags/0.12.3"
  key             = "~/.ssh/id_rsa.pub"
  key_name        = "devops"
  enable_key_pair = true
}

module "lightsail" {
  source        = "../"
  environment   = "prod"
  name          = "lightsail"
  key_pair_name = "devops"
  application   = "clouddrove"
  label_order   = ["environment", "application", "name"]
}