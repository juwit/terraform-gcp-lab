/**
 * # terraform-gcp-lab / instance_group
 *
 * This module creates a GCP regional instance group, with autoscaling.
 */

terraform {
  required_version = ">= 0.14"
  required_providers {
    random = ">= 3.1.0"
    google = ">= 3.64.0"
  }
}

resource "google_storage_bucket" "bucket" {
  name     = "challenge-lab-codekaio-logs-instance-group"
  location = "us-east1"

  force_destroy = true
}

resource "google_compute_region_instance_group_manager" "this" {
  name = "challenge-lab-instance-group"

  base_instance_name = "challenge-lab-instance"

  region = "us-east1"

  version {
    name              = "web-server"
    instance_template = google_compute_instance_template.tpl.id
  }
}

resource "google_compute_region_autoscaler" "this" {
  name = "challenge-lab-instance-group-autoscaler"

  region = "us-east1"

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
  name         = "challenge-lab-instance-template"
  machine_type = "f1-micro"

  metadata = {
    lab-logs-bucket    = google_storage_bucket.bucket.url
    startup-script-url = "https://raw.githubusercontent.com/ACloudGuru/gcp-cloud-engineer/master/compute-labs/worker-startup-script.sh"
  }

  disk {
    source_image = "debian-cloud/debian-10"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    scopes = [
      "logging-write",
      "monitoring-write",
      "pubsub",
      "service-management",
      "service-control",
      "trace",

      "storage-rw",
    ]
  }
}
