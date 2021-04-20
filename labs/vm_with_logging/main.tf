/*
 * # GCP VM
 *
 * This GCP VM will write some file to a GCS bucket
 */

resource "google_storage_bucket" "bucket" {
  name     = "challenge-lab-codekaio-logs"
  location = "us-east1"

  force_destroy = true
}

resource "google_compute_instance" "instance" {
  name         = "challenge-lab-vm"
  machine_type = "f1-micro"

  zone = "us-east1-b"

  metadata = {
    lab-logs-bucket    = google_storage_bucket.bucket.url
    startup-script-url = "https://raw.githubusercontent.com/ACloudGuru/gcp-cloud-engineer/master/compute-labs/worker-startup-script.sh"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
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

  allow_stopping_for_update = true
}