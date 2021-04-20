variable "name" {
  type = string
  description = "The name of the instance-group."
}

variable "base_instance_name" {
  type = string
  description = <<DES
The base name of the instances of the instance-group.
This value will be concatenated with a hyphen an 4 digits to generate the instance names.
  DES
}

variable "source_image" {
  type = string
  description = "The id of the source_image to use for the instances"
}

variable "service_account_email" {
  type = string
  description = "The name of the service-account to add to the instances"
}