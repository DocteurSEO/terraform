# Parcours Azure

Déclinaison Azure des fondamentaux cloud (équivalents des exercices AWS 01 à 05), avec le provider `azurerm`. Même esprit : on te donne l'objectif et les critères de réussite, à toi d'écrire la configuration.

> Les règles générales (sécurité, coût, conventions, livrable) du [README racine](../README.md) s'appliquent aussi ici.

## Exercices

| #  | Exercice        | Concept clé                                        | Équivalent AWS | Coût        |
|----|-----------------|----------------------------------------------------|----------------|-------------|
| 01 | hello_vm        | 1re machine virtuelle Linux                        | 01             | facturé\*   |
| 02 | hello_vnet      | réseau : VNet + subnet                             | 02             | gratuit     |
| 03 | hello_web       | VM + serveur web (cloud-init) + NSG                | 03             | facturé\*   |
| 04 | hello_debug     | debug d'une config Azure existante                 | 04             | facturé\*   |
| 05 | hello_module    | modules (réseau + calcul) + assemblage             | 05             | facturé\*   |

\* _Reste dans une taille éligible aux crédits gratuits / la plus petite (ex. `Standard_B1s`) et lance `terraform destroy` dès la validation._

## Prérequis spécifiques Azure
- **Terraform ≥ 1.6** + le provider **`azurerm`** (déclare une contrainte de version, cf. [`../_TEMPLATE/versions.tf`](../_TEMPLATE/versions.tf)).
- Un **abonnement Azure** et l'**Azure CLI** : authentifie-toi avec **`az login`** (et `az account set` si plusieurs abonnements). **Aucune clé/secret dans le code** — Terraform réutilise ta session `az`.
- Notions de base : en Azure, **toute ressource vit dans un Resource Group** ; une VM nécessite en plus un réseau (VNet/subnet), une carte réseau (NIC) et, pour être joignable, une IP publique.

## Documentation
- Provider azurerm : <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs>
- Authentification via Azure CLI : <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli>
