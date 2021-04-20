output "id" {
  description = "The id of the created VPC."
  value = google_compute_network.this.id
}

output "subnets_ids" {
    value = {
    for subnet in  google_compute_subnetwork.this: subnet.name => subnet.id
    }
}