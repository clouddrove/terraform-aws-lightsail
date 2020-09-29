provider "aws" {
  region = "ap-south-1"
}


module "lightsail" {
  source        = "../"
  environment   = "prod"
  name          = "lightsail"
  key_pair_name = "testing"
  application   = "clouddrove"
  label_order   = ["environment", "application", "name"]
}