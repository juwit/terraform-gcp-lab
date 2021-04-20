source "googlecompute" "httpd" {
  project_id = "challenge-lab-gcp51a9b506"
  source_image = "debian-10-buster-v20210316"
  ssh_username = "packer"
  zone = "us-east1-b"
  machine_type = "f1-micro"

  subnetwork = "backend-subnet"
  tags = ["open-ssh-tag"]

  image_name = "httpd"
  image_family = "http"
}

build {
  sources = ["sources.googlecompute.httpd"]

  provisioner "shell" {
    inline = [
      "sudo apt update",
      "sudo apt install -y apache2",
    ]
  }
}
