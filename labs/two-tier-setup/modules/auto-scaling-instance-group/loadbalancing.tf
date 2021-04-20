resource "google_compute_region_health_check" "this" {
  name = "${var.name}-health-check"

  http_health_check {
    port = 80
  }
}

# backend of the load balancer, with instance_group & healthcheck link
resource "google_compute_region_backend_service" "this" {
  health_checks = [google_compute_region_health_check.this.id]
  name = "${var.name}-backend-service"
  protocol = "HTTP"

  load_balancing_scheme = "INTERNAL_MANAGED"

  backend {
    group = google_compute_region_instance_group_manager.this.instance_group
    balancing_mode = "UTILIZATION"
    capacity_scaler = 1.0
  }
}

# forwarding rule is the load balancer itself
resource "google_compute_forwarding_rule" "this" {
  name   = "${var.name}-forwarding-rule"

  load_balancing_scheme = "INTERNAL_MANAGED"
  target = google_compute_region_target_http_proxy.this.id
  port_range = "80"
  subnetwork            = var.subnet
}

# the proxy uses ab url maps, to redirect towards multiple backends
resource "google_compute_region_target_http_proxy" "this" {
  name    = "${var.name}-proxy"
  url_map = google_compute_region_url_map.this.id
}

resource "google_compute_region_url_map" "this" {
  name            = "${var.name}-map"
  default_service = google_compute_region_backend_service.this.id
}