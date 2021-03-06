variable "vpc_name" {
  type = string
  description = "The name of the VPC to create."
}

variable "subnets" {
  type = list(object({
    name = string
    region = string
    cidr   = string
  }))
  description = "The subnet definitions to create in the VPC."
}

variable "lb-subnets" {
  type = list(object({
    name = string
    region = string
    cidr   = string
  }))
  description = "The subnet definitions foir load balancing to create in the VPC."
}