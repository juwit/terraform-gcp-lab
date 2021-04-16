# create a service account for the project
resource "google_service_account" "terraform-sa" {
  account_id = "terraform"
  project    = google_project.challenge-lab.project_id
}

# add some roles to the service account to be able to create a bucket
resource "google_project_iam_member" "terraform-sa-roles" {
  for_each = toset([ 
      "roles/compute.admin",
      "roles/storage.admin",
      "roles/iam.serviceAccountUser",
    ])
  
  project = google_project.challenge-lab.project_id
  member = "serviceAccount:${google_service_account.terraform-sa.email}"

  role   = each.key
}

# create a key for this service account
resource "google_service_account_key" "terraform-sa-key" {
  service_account_id = google_service_account.terraform-sa.id
}