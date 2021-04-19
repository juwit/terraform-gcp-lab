output "service_account_key" {
  description = "the key of the created service account"
  value       = google_service_account_key.terraform-key.private_key
  sensitive   = true
}