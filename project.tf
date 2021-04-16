# create the project itself
resource "google_project" "challenge-lab" {
  name            = var.project_name
  project_id      = var.project_name
  org_id          = var.org_id
  billing_account = var.billing_account
}
