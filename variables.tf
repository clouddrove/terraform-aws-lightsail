#Module      : LABEL
#Description : Terraform label module variables.

variable "environment" {
  type        = string
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "label_order" {
  type        = list
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `organization`, `environment`, `name` and `attributes`."
}

variable "application" {
  type        = string
  default     = ""
  description = "Application (e.g. `cd` or `clouddrove`)."
}

variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "managedby" {
  type        = string
  default     = "anmol@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove' or 'AnmolNagpal'."
}

variable "attributes" {
  type        = list
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "tags" {
  type        = map
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}


variable "availability_zone" {
  type        = string
  default     = "ap-south-1a"
  description = "The Availability Zone in which to create your instance"
}

variable "blueprint_id" {
  type        = string
  default     = "ubuntu_16_04_2"
  description = ""
}

variable "bundle_id" {
  type        = string
  default     = "micro_2_1"
  description = "The bundle of specification information"
}

variable "key_pair_name" {
  type        = string
  default     = ""
  description = "The name of your key pair. Created in the Lightsail console (cannot use aws_key_pair at this time)"
}

variable "use_default_key_pair" {
  type        = string
  default     = "true"
  description = "Default key pair name will be used, you must keep 'key_pair_name' empty"
}

variable "user_data" {
  type        = string
  default     = ""
  description = "launch script to configure server with additional user data"
}

variable "create_static_ip" {
  type        = bool
  default     = true
  description = "Create and attach a statis IP to the instance"
}

variable "lightsail_enabled" {
  type        = bool
  default     = true
  description = "Flag to control the lightsail instance creation."
}
