# 🌐 Projet Terraform GitHub

## Objectif 🎯

L'objectif de ce projet est de vous apprendre à utiliser Terraform avec GitHub comme fournisseur pour créer un nouveau dépôt GitHub.

## Étapes Clés ⚙️

### Configuration de Terraform 🛠️

1. **Installez et configurez Terraform sur votre machine.**
    ```bash
    # Exemple d'installation de Terraform
    wget https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
    unzip terraform_0.12.29_linux_amd64.zip
    sudo mv terraform /usr/local/bin/
    ```

2. **Comprenez les bases de Terraform et son fonctionnement.**

### Utilisation de GitHub comme Fournisseur 🤝

1. **Configurez GitHub comme fournisseur dans votre fichier Terraform.**
    ```hcl
    provider "github" {
      token = "votre_token_github"
    }
    ```

2. **Assurez-vous de comprendre les permissions nécessaires.**

### Création d'un Nouveau Dépôt 📁

1. **Utilisez Terraform pour écrire le script qui crée un nouveau dépôt sur GitHub.**
    ```hcl
    resource "github_repository" "mon_repo" {
      name        = "nom_du_repo"
      description = "Créé avec Terraform"
      private     = true
    }
    ```

2. **Testez le script pour s'assurer qu'il fonctionne correctement.**

### Ajout d'une Variable 🔄

1. **Intégrez une variable dans votre script Terraform.**
    ```hcl
    variable "nom_du_repo" {
      description = "Nom du dépôt GitHub"
      type        = string
    }
    ```

### Script Python pour l'Automatisation 🐍

1. **Écrivez un script Python qui utilise l'interface de ligne de commande (CLI) pour créer un dépôt sur GitHub.**
    ```python
    import subprocess

    subprocess.run(["terraform", "apply", "-auto-approve"])
    ```

2. **Ce script doit interagir avec votre configuration Terraform.**

Utilisez votre script Python en passant le nom du dépôt en tant qu'argument.
 ```bash

python mon_script.py nom_du_repo_souhaité
 ```

### Lecture et Compréhension de la Documentation 📚

1. **Familiarisez-vous avec la documentation de Terraform et GitHub API.**
2. **Assurez-vous de comprendre comment les deux peuvent interagir efficacement.**

## Documentation et Ressources 📖

- [Documentation Terraform](https://www.terraform.io/docs)
- [GitHub API Reference](https://developer.github.com/v3/)
