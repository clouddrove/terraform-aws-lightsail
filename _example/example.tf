provider "aws" {
  region = "ap-south-1"
}


module "lightsail" {
  source = "../"

  environment = "test"
  name        = "lightsail"
  label_order = ["name", "environment"]

  public_key           = "ssh-rsa AAAAB3NzaCrmXGb6068G+r3Q9PXtTs42tv1KoKxahY5vDo57RsPN+sQGPIVDclN6PbRm4c9guBwLBYFVQL4PvBOSYHrapXjbheebTQDQoyPV7SM7LK57J0BC8oEfcrTgCIdy9mIWAYFIeTWfj0Xw/c9thxNtSse9XTAH6esdasd+Sucn0XNRwxzM2yOufgfggXqiBWjU+bMDLfQ+QV6gd2kvnBv0wf22s9meldRPZttryhcIO6HfjbbDEk0Oyo66KI70034tVgvAN0"
  use_default_key_pair = true

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
