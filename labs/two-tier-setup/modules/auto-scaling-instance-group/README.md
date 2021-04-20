# auto-scaling-instance-group

This module creates a GCP regional instance group, with autoscaling.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.64.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.64.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance_template.tpl](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_template) | resource |
| [google_compute_region_autoscaler.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_autoscaler) | resource |
| [google_compute_region_instance_group_manager.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_instance_name"></a> [base\_instance\_name](#input\_base\_instance\_name) | The base name of the instances of the instance-group.<br>This value will be concatenated with a hyphen an 4 digits to generate the instance names. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the instance-group. | `string` | n/a | yes |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | The name of the service-account to add to the instances. | `string` | n/a | yes |
| <a name="input_source_image"></a> [source\_image](#input\_source\_image) | The id of the source\_image to use for the instances. | `string` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | The id of the subnet to create the instances in. | `string` | n/a | yes |

## Outputs

No outputs.
