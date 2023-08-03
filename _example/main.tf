provider "aws" {
  region = "us-east-1"
}

module "lightsail" {
  source = "../"

  environment = "dev"
  name        = "lightsail"
  label_order = ["name", "environment"]

  public_key           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDIqppj2U2K8norJh5/gxz7sbSSseLd+ldHEOM3+lajUSGqWk3Bw/NgygEf1Kgw7gyK3jsTVVcokhK3TDuR3pi4u2QDR2tvLXddPKd37a2S7rjeqecw+XRW9559zKaR7RJJfjO1u1Onc2tgA3y0btdju2bcYBtFkRVOLwpog8CvslYEDV1Vf9HNeh9A3yOS6Pkjq6gDMrsUVF89ps3zuLmdVBIlCOnJDkwHK71lKihGKdkeXEtAj0aOQzAJsIpDFXz7vob9OiA/fb2T3t4R1EwEsPEnYVczKMsqUyqa+EE36bItcZHQyCPVN7+bRJyJpPcrfrsAa4yMtiHUUiecPdL/6HYwGHxA5rUX3uD2UBm6sbGBH00ZCj6yUxl2UQR5NE4NR35NI86Q+q1kNOc5VctxxQOTHBwKHaGvKLk4c5gHXaEl8yyYL0wVkL00KYx3GCh1LvRdQL8fvzImBCNgZdSpKT2xjq/wc5c9L9NSc43TGoldnDYUjm79qAYMlwQHr0= prashant@prashant"
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
