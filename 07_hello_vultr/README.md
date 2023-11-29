# 🚀 Atelier Terraform avec Vultr et Docker

## Introduction 🌟

Bienvenue dans notre atelier ! Ce projet vous enseignera comment utiliser Terraform pour créer et gérer des ressources sur Vultr, en particulier une machine virtuelle (VM). Vous apprendrez à installer Docker sur cette VM et lancer une application Docker accessible sur le port 80, le tout sans utiliser SSH mais en automatisant avec Terraform.

## Objectifs 🎯

- Créer et gérer une VM sur Vultr entièrement via Terraform.
- Installer Docker sur la VM via des scripts Terraform ( il existe une autre solution )
- Lancer l'image docker  satzisa/html5-speedtest

## Prérequis 📚

- Connaissances de base en gestion de serveurs et en réseaux.
- Compte Vultr (ou un autre fournisseur de cloud si nécessaire).
- Terraform et Git installés sur votre machine.

## Étape 1: Configuration de Terraform avec Vultr 🌐

1. Installez Terraform si ce n'est pas déjà fait.
2. Configurez Terraform avec votre fournisseur de cloud (Vultr).
3. Écrivez un script Terraform pour déployer une VM sur Vultr en spécifiant taille, région, et système d'exploitation.

## Étape 2: Installation de Docker sur la VM via Terraform 🐳

1. Utilisez Terraform pour exécuter des scripts d'installation de Docker sur la VM.
2. Assurez-vous que Docker est correctement installé et configuré via Terraform.

## Étape 3: Clonage du dépôt et Lancement de l'Application Docker via Terraform 🚢


1. Configurez Terraform pour construire et lancer le conteneur Docker, en s'assurant qu'il écoute sur le port 80.
2. Assurez-vous que le site web est accessible via l'adresse IP de la VM.

## Accès au Site Web 🌍

- Le site web est accessible en saisissant l'adresse IP de votre VM dans un navigateur web.

## Conclusion et Prochaines Étapes 🛣️

Félicitations ! Vous avez utilisé Terraform pour déployer une application web sur Vultr avec Docker. Explorez des configurations plus avancées ou essayez avec d'autres fournisseurs de cloud.

---

Bonne chance et amusez-vous bien ! 💻
