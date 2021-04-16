# create the project itself
resource "google_project" "challenge-lab" {
  name            = var.project_name
  project_id      = var.project_name
  org_id          = var.org_id
  billing_account = var.billing_account
}

# activate compute API on the project
resource "google_project_service" "project_services" {
  project = google_project.challenge-lab.project_id
  service = "compute.googleapis.com"
}

# add myself as a owner of the project so i can view its content on the console
resource "google_project_iam_member" "project" {
  project = google_project.challenge-lab.project_id
  role    = "roles/owner"
  member  = "user:julien@codeka.io"
}

# create a service account for the project
resource "google_service_account" "terraform-sa" {
  account_id = "terraform"
  project    = google_project.challenge-lab.project_id
}

# add some roles to the service account to be able to create VM
resource "google_project_iam_member" "terraform-sa" {
  project = google_project.challenge-lab.project_id

  role   = "roles/compute.admin"
  member = "serviceAccount:${google_service_account.terraform-sa.email}"
}