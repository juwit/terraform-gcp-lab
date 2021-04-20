resource "google_compute_firewall" "allow-icmp" {
  name    = "backend-fw-icmp"
  network = module.vpc.id

  allow {
    protocol = "icmp"
  }

  source_service_accounts = [module.frontend-sa.email]
  target_service_accounts = [module.backend-sa.email]
}

resource "google_compute_firewall" "allow-ping-from-internet" {
  name    = "frontend-fw-icmp-internet"
  network = module.vpc.id

  allow {
    protocol = "icmp"
  }

  source_ranges           = ["0.0.0.0/0"]
  target_service_accounts = [module.frontend-sa.email]
}