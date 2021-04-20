# create a service account for the project
resource "google_service_account" "terraform" {
  account_id = "terraform"
  project    = google_project.this.project_id
}

# add some roles to the service account to be able to create a bucket
resource "google_project_iam_member" "terraform-roles" {
  for_each = toset([
    "roles/compute.admin",
    "roles/storage.admin",
    "roles/iam.serviceAccountUser",
    "roles/iam.serviceAccountCreator",
    "roles/iam.serviceAccountCreator",
    "roles/iam.serviceAccountDeleter",
    "roles/resourcemanager.projectIamAdmin"
  ])

  project = google_project.this.project_id
  member  = "serviceAccount:${google_service_account.terraform.email}"

  role = each.key
}

# create a key for this service account
resource "google_service_account_key" "terraform-key" {
  service_account_id = google_service_account.terraform.id
}