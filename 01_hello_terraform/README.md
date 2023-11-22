
### 🔥 Hé toi, jeune Padawan, commence par publier ta première instance AWS avec Terraform



Mini Cours ^^
# 🌐 Introduction à Terraform

## ❓ Qu'est-ce que Terraform ?
- 🛠 Un outil d'**Infrastructure as Code (IaC)** développé par HashiCorp.
- ✨ Permet de définir et de provisionner l'infrastructure cloud à l'aide de code.

## 🚀 Pourquoi utiliser Terraform ?
- 🔄 Gestion automatisée et reproductible des infrastructures.
- ☁️ Prise en charge de multiples fournisseurs de cloud, dont AWS, Azure, Google Cloud, etc.

## 📚 Concepts de base de Terraform
- **Providers**: Les plugins qui permettent l'interaction avec les API des fournisseurs de cloud.
- **Resources**: Les éléments d'infrastructure à créer (par exemple, instances, réseaux, etc.).
- **State**: Le fichier qui enregistre l'état actuel de l'infrastructure.

## 📦 Installation de Terraform
- Guide étape par étape pour installer Terraform sur différentes plateformes (Windows, MacOS, Linux).

## 🏗 Exemple Pratique : Déployer une Instance AWS

### 🛠 Configuration initiale
- Installation de l'AWS CLI et configuration des credentials AWS.
- Création d'un répertoire pour votre projet Terraform.

### 📝 Écriture du code Terraform
- Création d'un fichier principal, généralement nommé `main.tf`.
- Configuration du provider AWS :
  ```hcl
  provider "aws" {
    region = "us-west-2"
  }


Définir une instance EC2
Ajout de la ressource d'instance EC2 dans main.tf :
 ``` 

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

 ```

### 🚀 Initialisation et déploiement

Exécution de  ```terraform init ``` pour initialiser le répertoire.

Exécution de  ```terraform plan ``` pour voir un aperçu des changements.

Exécution de  ```terraform apply ``` pour créer l'infrastructure.

### 🧹 Nettoyage
Utilisation de  ```terraform destroy ```pour supprimer l'infrastructure lorsque vous avez terminé.



