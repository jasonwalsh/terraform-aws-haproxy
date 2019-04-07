output "public_dns_name" {
  description = "The public DNS name assigned to the instance"
  value       = "${element(concat(module.haproxy.public_dns, list("")), 0)}"
}
