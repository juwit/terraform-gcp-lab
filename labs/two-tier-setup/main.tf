/*
 * # terraform-gcp-lab / two-tier-steup
 * This module creates a two-tier setup, with front-end and back-end, each autoscaled across 2 zones
 * front-end accepts incoming traffic from the internet, and can connect outbound to the internet
 * back-end accepts incoming traffic from the front-end, but cannot connect to the internet
 * firewall rules are based on service accounts, except for the open-ssh-tag
*/

module "frontend-sa" {
  source = "./modules/service-account"

  service_account_name = "frontend"
}

module "backend-sa" {
  source = "./modules/service-account"

  service_account_name = "backend"
}