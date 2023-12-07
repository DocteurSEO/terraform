# 🚀 Atelier Terraform AWS & Vault

Bienvenue dans notre atelier sur Terraform avec AWS et Vault! Cet atelier est conçu pour vous aider à comprendre comment utiliser Terraform pour déployer des ressources sur AWS et gérer des secrets avec Vault.

## 📋 Prérequis

- Compte AWS
- Terraform installé
- Accès à un serveur Vault

## 🛠 Configuration

Suivez ces étapes pour configurer votre environnement Terraform :

1. **Provider AWS**  
   Configurez le provider AWS avec la région souhaitée.

    ```hcl
    provider "aws" {
      region = "us-east-1"
    }
    ```

2. **Provider Vault**  
   Configurez le provider Vault, y compris l'authentification.

    ```hcl
    provider "vault" {
      address = "<>:8200"
      skip_child_token = true

      auth_login {
        path = "auth/approle/login"

        parameters = {
          role_id = "<>"
          secret_id = "<>"
        }
      }
    }
    ```

3. **Secrets Vault**  
   Accédez à un secret stocké dans Vault.

    ```hcl
    data "vault_kv_secret_v2" "example" {
      mount = "secret" // change it according to your mount
      name  = "test-secret" // change it according to your secret
    }
    ```

4. **Ressource AWS Instance**  
   Déployez une instance AWS en utilisant un AMI spécifique.

    ```hcl
    resource "aws_instance" "my_instance" {
      ami           = "ami-053b0d53c279acc90"
      instance_type = "t2.micro"

      tags = {
        Name = "test"
        Secret = data.vault_kv_secret_v2.example.data["foo"]
      }
    }
    ```

## 📚 Ressources Supplémentaires

- [Documentation Terraform AWS](https://www.terraform.io/docs/providers/aws/index.html)
- [Documentation Vault](https://www.vaultproject.io/docs)

 