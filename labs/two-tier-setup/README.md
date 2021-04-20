# terraform-gcp-lab / two-tier-steup
This module creates a two-tier setup, with front-end and back-end, each autoscaled across 2 zones in a dedicated VPC:

* front-end accepts incoming traffic from the internet, and can connect outbound to the internet.
* back-end accepts incoming traffic from the front-end, but cannot connect to the internet.
* firewall rules are based on service accounts, except for the open-ssh-tag.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.64.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.64.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backend"></a> [backend](#module\_backend) | ./modules/auto-scaling-instance-group |  |
| <a name="module_backend-sa"></a> [backend-sa](#module\_backend-sa) | ./modules/service-account |  |
| <a name="module_frontend"></a> [frontend](#module\_frontend) | ./modules/auto-scaling-instance-group |  |
| <a name="module_frontend-sa"></a> [frontend-sa](#module\_frontend-sa) | ./modules/service-account |  |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc |  |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.allow-icmp](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow-ping-from-internet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.deny-internet-access-to-backend](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.ssh-from-tag](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | the id of the project to create resources in | `string` | n/a | yes |

## Outputs

No outputs.
