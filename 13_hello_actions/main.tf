
terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.17.1"
    }
  }
}


provider "vultr" {
  api_key = "key"
  rate_limit = 100
  retry_limit = 3
}

resource "vultr_instance" "vm_docker" {
  plan     = "vc2-1c-1gb"  # Choisissez le plan selon vos besoins
  region   = "fra"      # Choisissez la région (exemple : Frankfurt)
  image_id = "docker"         # ID pour une distribution comme Ubuntu

  # Script d'initialisation pour installer Docker et lancer l'image Docker spécifiée
  user_data = <<-EOF
              #!/bin/bash
              docker pull satzisa/html5-speedtest
              docker run -d -p 80:80 satzisa/html5-speedtest
              EOF
}

output "ip_address" {
  value = vultr_instance.vm_docker.main_ip
}
