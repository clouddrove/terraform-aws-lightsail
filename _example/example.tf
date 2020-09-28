provider "aws" {
  region = "eu-west-2"
}

module "lightsail" {
  source                 = "../"
  namespace              = "anmol"
  environment            = "prod"
  name                   = "clouddrove"
  customer_email         = "abc@example.com"
  customer_business_name = "Clouddrove Inc."
}