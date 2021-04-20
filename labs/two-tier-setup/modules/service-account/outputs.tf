output "email" {
    description = "The email of the service account"
    value = google_service_account.this.email
}