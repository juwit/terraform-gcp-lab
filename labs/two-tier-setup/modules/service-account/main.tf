/*
 * # service-account
 *
 * creates a simple service account
 */

resource "google_service_account" "this" {
  account_id = var.service_account_name
}

resource "google_project_iam_binding" "roles" {
  for_each = toset([
    "roles/logging.logWriter"
  ])

  role    = each.key

  members = [
    "serviceAccount:${google_service_account.this.email}",
  ]
}