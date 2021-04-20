/**
 * # auto-scaling-instance-group
 *
 * This module creates a GCP regional instance group, with autoscaling.
 */

resource "google_compute_region_instance_group_manager" "this" {
  name = var.name

  base_instance_name = var.base_instance_name

  version {
    name              = "instances"
    instance_template = google_compute_instance_template.tpl.id
  }
}

resource "google_compute_region_autoscaler" "this" {
  name = "${var.name}-autoscaler"

  target = google_compute_region_instance_group_manager.this.id

  autoscaling_policy {
    min_replicas = 1
    max_replicas = 5
    cpu_utilization {
      target = 0.8
    }
  }
}

resource "google_compute_instance_template" "tpl" {
  name_prefix  = "${var.name}-template-"
  machine_type = "f1-micro"

  disk {
    source_image = var.source_image
  }

  network_interface {
    subnetwork = var.subnet

    access_config {
      // Ephemeral IP
    }
  }

  tags = ["open-ssh-tag"]

  service_account {
    email = var.service_account_email
    scopes = []
  }

  lifecycle {
    create_before_destroy = true
  }
}
