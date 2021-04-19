variable "project_name" {
  type        = string
  description = "the name of the project to create"
}

variable "org_id" {
  type        = string
  description = "the id of the organisation to create the project in"
  default     = ""
}

variable "folder_id" {
  type        = string
  description = "the id of the folder to create the project in"
  default     = ""
}

variable "billing_account" {
  type        = string
  description = "the billing account id to use for the project"
}