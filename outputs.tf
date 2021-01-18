#Module      : Lightsail
#Description : Terraform Lightsail module variables.

output "arn" {
  value       = aws_lightsail_instance.instance.*.arn
  description = " The ARN of the Lightsail instance."
}

output "id" {
  value       = aws_lightsail_instance.instance.*.id
  description = "The ARN of the Lightsail instance."
}

output "created_at" {
  value       = aws_lightsail_instance.instance.*.created_at
  description = "The timestamp when the instance was created."
}

output "ip_address" {
  value       = aws_lightsail_static_ip.instance.*.ip_address
  description = "The Ip Address name of the Lightsail instance."
}

output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}
