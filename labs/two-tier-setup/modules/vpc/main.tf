/*
 * # vpc
 *
 * creates a VPC network
 */

resource "google_compute_network" "this" {
  name = var.vpc_name

  auto_create_subnetworks = false
  delete_default_routes_on_create = true
}