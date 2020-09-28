provider "aws" {
  region = "ap-south-1"
}

module "lightsail" {
  source      = "../"
  environment = "prod"
  name        = "lightsail"
  application = "clouddrove"
  label_order = ["environment", "application", "name"]
}