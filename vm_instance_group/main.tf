resource "google_storage_bucket" "bucket" {
  name     = "challenge-lab-codekaio-logs-instance-group"
  location = "us-east1"

  force_destroy = true
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