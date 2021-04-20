resource "google_compute_firewall" "allow-http" {
  name    = "backend-fw-http"
  network = module.vpc.id

  allow {
    protocol = "tcp"
    ports = [80]
  }

  source_service_accounts = [module.frontend-sa.email]
  target_service_accounts = [module.backend-sa.email]
}

resource "google_compute_firewall" "allow-http-from-internet" {
  name    = "frontend-fw-http-internet"
  network = module.vpc.id

  allow {
    protocol = "tcp"
    ports = [80]
  }

  source_ranges           = ["0.0.0.0/0"]
  target_service_accounts = [module.frontend-sa.email]
}

resource "google_compute_firewall" "deny-internet-access-to-backend" {
  name = "deny-internet-access-to-backend"
  network = module.vpc.id

  direction = "EGRESS"

  deny {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]
  target_service_accounts = [module.backend-sa.email]
}

resource "google_compute_firewall" "ssh-from-tag" {
  name    = "allow-ssh"
  network = module.vpc.id

  allow {
    protocol = "tcp"
    ports = [22]
  }

  target_tags = ["open-ssh-tag"]
}