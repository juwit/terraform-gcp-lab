/**
 * # terraform-gcp-lab / project
 *
 * This module creates a GCP project in the root of an org, or in a folder.
 */

terraform {
  required_version = ">= 0.14"
  required_providers {
    random = ">= 3.1.0"
    google = ">= 3.64.0"
  }
}

resource "random_id" "id" {
  byte_length = 4
  prefix      = var.project_name
}

# create the project itself
resource "google_project" "this" {
  name       = var.project_name
  project_id = random_id.id.hex

  org_id    = var.org_id
  folder_id = var.folder_id

  billing_account = var.billing_account
}

# activate APIs on the project (GCS is enabled by default)
resource "google_project_service" "project_services" {
  for_each = toset([
    "compute.googleapis.com",
    "logging.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ])

  project = google_project.this.project_id
  service = each.key
}

# add myself as a owner of the project so i can view its content on the console
resource "google_project_iam_member" "me" {
  project = google_project.this.project_id
  role    = "roles/owner"
  member  = "user:julien@codeka.io"
}
