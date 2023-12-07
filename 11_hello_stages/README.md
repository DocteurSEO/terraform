
# 🌐 Atelier Terraform AWS EC2 ou autre 🚀

Bienvenue dans cet atelier Terraform où nous apprendrons à configurer et déployer une instance EC2 sur AWS en utilisant Terraform. 🌟


## Objectifs 🎯

Comprendre les bases de Terraform.
Apprendre à configurer un fournisseur AWS avec Terraform.
Déployer une instance EC2 avec différentes configurations selon l'environnement (dev, stage, prod).
Prérequis ✅

```
Compte AWS avec les droits nécessaires.
Terraform installé sur votre machine.
Connaissances de base en AWS et Terraform.
```

## Étape 1 : Configuration du Fournisseur AWS 🛠️

```
provider "aws" {
  region = "us-east-1"
}
```
Dans cette étape, vous allez configurer Terraform pour utiliser le fournisseur AWS et définir la région sur us-east-1.

## Étape 2 : Déclaration des Variables 📝

```
variable "ami" {
  description = "value"
}

variable "instance_type" {
  description = "value"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.xlarge"
  }
}
```
Vous allez déclarer deux variables : ami pour l'AMI de l'instance EC2 et instance_type pour le type d'instance. Le type d'instance varie selon l'environnement.

### Étape 3 : Création du Module EC2 🌐

```
module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}
````

Ici, vous allez utiliser un module pour créer une instance EC2. Vous passerez les variables ami et instance_type au module.

