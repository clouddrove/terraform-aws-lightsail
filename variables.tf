#Module      : LABEL
#Description : Terraform label module variables.
variable "environment" {
  type        = string
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `organization`, `environment`, `name` and `attributes`."
}

variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-aws-lightsail"
  description = "Terraform current module repo"
}


variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove'."
}

variable "attributes" {
  type        = list(any)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

#Module      : Lightsail
#Description : Terraform Lightsail module variables.
variable "availability_zone" {
  type        = string
  default     = "ap-south-1a"
  description = "The Availability Zone in which to create your instance"
  sensitive   = true
}

variable "blueprint_id" {
  type        = string
  default     = "ubuntu_16_04_2"
  description = "The ID for a virtual private server image"
  sensitive   = true
}

variable "bundle_id" {
  type        = string
  default     = "micro_2_1"
  description = "The bundle of specification information"
  sensitive   = true
}


variable "use_default_key_pair" {
  type        = bool
  default     = true
  description = "Default key pair name will be used, you must keep 'key_pair_name' empty"
}

variable "user_data" {
  type        = string
  default     = ""
  description = "launch script to configure server with additional user data"
  sensitive   = true
}

variable "create_static_ip" {
  type        = bool
  default     = false
  description = "Create and attach a statis IP to the instance"
  sensitive   = true
}

variable "lightsail_enabled" {
  type        = bool
  default     = true
  description = "Flag to control the lightsail instance creation."
}

variable "port_info" {
  type = list(object({
    protocol = string
    port     = number
    cidrs    = list(string)
  }))
  default = null
}

variable "key_pair_name" {
  type        = string
  default     = ""
  description = "The key name to use for the instance."
  sensitive   = true
}

variable "instance_count" {
  type        = number
  default     = 1
  description = "Number of instances to launch."
}

variable "instance_enabled" {
  type        = bool
  default     = true
  description = "Flag to control the instance creation."
}

variable "pgp_key" {
  default     = null
  description = "Flag to control the instance creation."
  sensitive   = true
}

variable "public_key" {
  type        = string
  default     = ""
  description = "The public key material. This public key will be imported into Lightsail."
  sensitive   = true
}

variable "key_path" {
  type        = string
  default     = ""
  description = "Public key path  (e.g. `~/.ssh/id_rsa.pub`)."
  sensitive   = true
}

variable "domain_name" {
  description = "This is the name of the resource."
  type        = string
  default     = ""
}
