resource "random_id" "id" {
  byte_length = 4
  prefix      = var.project_name
}

# create the project itself
resource "google_project" "this" {
  name            = var.project_name
  project_id      = random_id.id.hex
  org_id          = var.org_id
  billing_account = var.billing_account
}

# activate compute API on the project (GCS is enabled by default)
resource "google_project_service" "project_services" {
  for_each = toset([ 
      "compute.googleapis.com",
      "logging.googleapis.com",
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
