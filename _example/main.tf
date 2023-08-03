provider "aws" {
  region = "us-east-1"
}

module "lightsail" {
  source = "../"

  environment = "test"
  name        = "lightsail"
  label_order = ["name", "environment"]

  public_key           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDIqppj2U2K8norJh5/gxz7sbSSseLSpKT2xjq/wc5c9L9NSc43TGoldnDYUjm79qAYMlwQHr0= test@test"
  use_default_key_pair = true
  user_data            = file("${path.module}/lightsail.sh")

  port_info = [
    {
      port     = 80
      protocol = "tcp"
      cidrs    = ["0.0.0.0/0"]
    },
    {
      port     = 22
      protocol = "tcp"
      cidrs    = ["0.0.0.0/0"]
    }
  ]
}
