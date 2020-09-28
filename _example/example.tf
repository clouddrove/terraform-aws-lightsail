provider "aws" {
  region = "ap-south-1"
}

module "lightsail" {
  source                 = "../"
  namespace              = "anmol"
  environment            = "prod"
  name                   = "clouddrove"
  customer_email         = "abc@clouddrove.com"
  customer_business_name = "Clouddrove Inc."
}