#Module      : Lightsail
#Description : Terraform module to create Lightsail instance, Lightsail Key Pair (Optional), Lightsail Static IP (Optional) resource on AWS.
output "arn" {
  value = aws_lightsail_instance.instance.*.arn
}

output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}


output "id" {
  value = aws_lightsail_instance.instance.*.id
}

output "created_at" {
  value = aws_lightsail_instance.instance.*.created_at
}

output "availability_zone" {
  value = aws_lightsail_instance.instance.*.availability_zone
}

output "blueprint_id" {
  value = aws_lightsail_instance.instance.*.blueprint_id
}

output "bundle_id" {
  value = aws_lightsail_instance.instance.*.bundle_id
}

output "key_pair_name" {
  value = aws_lightsail_instance.instance.*.key_pair_name
}

output "user_data" {
  value = aws_lightsail_instance.instance.*.user_data
}

output "staticip_arn" {
  value = aws_lightsail_static_ip.instance.*.arn
}

output "ip_address" {
  value = aws_lightsail_static_ip.instance.*.ip_address
}
