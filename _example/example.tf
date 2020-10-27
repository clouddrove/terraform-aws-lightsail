provider "aws" {
  region = "ap-south-1"
}


module "lightsail" {
  source        = "../"
  environment   = "test"
  name          = "clouddrove"
  key_pair_name = "demo"
  application   = "lightsail"
  label_order   = ["environment", "application", "name"]
}