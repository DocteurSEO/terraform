# Infra VOLONTAIREMENT triviale et GRATUITE (aucun compte cloud, aucun secret
# réel) : l'enjeu de cet exercice est le WORKFLOW CI/CD, pas l'infrastructure.
# Examine ce fichier, puis écris la GitHub Action qui l'orchestre (voir README).

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

variable "environment" {
  description = "Nom d'environnement. Peut être fourni dans la CI via TF_VAR_environment."
  type        = string
  default     = "ci"
}

resource "random_pet" "demo" {
  prefix    = var.environment
  separator = "-"
}

output "demo_name" {
  value = random_pet.demo.id
}
