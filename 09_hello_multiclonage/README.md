# 🌍 Terraform Vultr Instances with Python CLI 🐍

## Introduction 📖

Ce projet vous guide dans la création de plusieurs instances Ubuntu sur Vultr en utilisant Terraform. De plus, vous apprendrez à intégrer une CLI Python pour personnaliser le nombre d'instances.

## Prérequis 🧰

- Terraform
- Compte Vultr avec clé API
- Python 3

## Configuration Terraform 🌐

### Initialisation:

1. Clonez le dépôt et naviguez dans le répertoire.
2. Exécutez `terraform init` pour initialiser Terraform.

### Fichiers Terraform:

- `variables.tf`: Définit les variables pour le nombre d'instances, le plan, la région, et l'OS.
- `main.tf`: Contient la configuration pour déployer les instances Vultr.

### Déploiement:

1. Utilisez `terraform plan` pour vérifier la configuration.
2. Exécutez `terraform apply` pour déployer les instances.

## Intégration CLI Python 🐍

Nous allons créer une CLI simple en Python pour permettre aux utilisateurs de choisir le nombre d'instances à déployer.

### Création du Script Python:

- Nommez le fichier `cli.py`.
- Le script demandera à l'utilisateur le nombre d'instances et mettra à jour le fichier `terraform.tfvars`.

### Exécution de la CLI:

- Lancez `python cli.py 2 `  qui va faire deux instances

