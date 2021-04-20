/*
 * # vpc
 *
 * creates a VPC network
 */

resource "google_compute_network" "this" {
  name = var.vpc_name

  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  for_each = {for network in var.subnets : network.name => { cidr = network.cidr, region = network.region }}

  network = google_compute_network.this.id

  name = each.key
  ip_cidr_range = each.value.cidr
  region = each.value.region
}