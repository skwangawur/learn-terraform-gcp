output "vpc_id" {
  description = "The ID of the VPC network"
  value       = google_compute_network.this.id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = { for k, v in google_compute_subnetwork.this : k => v.id }
}