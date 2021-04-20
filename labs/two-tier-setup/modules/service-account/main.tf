/*
 * # service-account
 *
 * creates a simple service account
 */

resource "google_service_account" "this" {
  account_id = var.service_account_name
}