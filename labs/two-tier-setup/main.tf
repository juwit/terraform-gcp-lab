/*
 * # terraform-gcp-lab / two-tier-steup
 * This module creates a two-tier setup, with front-end and back-end, each autoscaled across 2 zones in a dedicated VPC
 * front-end accepts incoming traffic from the internet, and can connect outbound to the internet
 * back-end accepts incoming traffic from the front-end, but cannot connect to the internet
 * firewall rules are based on service accounts, except for the open-ssh-tag
*/

module "vpc" {
  source = "./modules/vpc"

  vpc_name = "two-tier-vpc"
}

module "frontend-sa" {
  source = "./modules/service-account"

  service_account_name = "frontend"
}

//module "frontend" {
//  source = "./modules/auto-scaling-instance-group"
//
//  name = "frontend"
//  base_instance_name = "frontend"
//  source_image = "debian-cloud/debian-10"
//
//  service_account_email = module.frontend-sa.email
//}

module "backend-sa" {
  source = "./modules/service-account"

  service_account_name = "backend"
}

//module "backend" {
//  source = "./modules/auto-scaling-instance-group"
//
//  name = "backend"
//  base_instance_name = "backend"
//  source_image = "debian-cloud/debian-10"
//
//  service_account_email = module.backend-sa.email
//}