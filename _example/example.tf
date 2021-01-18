provider "aws" {
  region = "ap-south-1"
}


module "lightsail" {
  source               = "../"

  environment          = "test"
  name                 = "lightsail"
  label_order          = ["name", "environment"]

  public_key           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyAc7Y0aDsLkkm8UrmXGb6068G+r3Q9PXtTs42tv1KoKxahY5vDo57RsPN+sQGPIVDclN6PbRm4c9guBwLBYFVQL4PvBOSYHrapXjbheebTQDQoyPV7SM7LK57J0BC8oEfcrTgCIdy9mIWAYFIeTWfj0Xw/c9thxNtSse9XTAH6esdasd+Sucn0XNRwxzM2yOufgfggXqiBWjU+bMDLfQ+QV6gd2k/ZXvURmg5uAzimLFi7kF0tDRd8PNw4i+mvrgrBnJkvnBv0wf22s9meldRPZttryhcIO6HfjbbDEk0Oyo66KI70034tVgvAN0mdq/1OwQez2xwfgfhfhRH548tnp7XMcQ9nqemlDkmZeM4gB6B"
  use_default_key_pair = true

}
