# Azure 01 — Ta première machine virtuelle Linux

> Format : consigne à partir de zéro. `main.tf` contient un `// TODO`.
> Équivalent AWS : exercice 01 (EC2).

## Objectif (résultat observable)
Provisionner **une** VM Linux sur Azure avec Terraform, et prouver qu'elle tourne.

À la fin :
- `terraform apply` crée une VM (taille la plus petite possible, ex. `Standard_B1s`) ;
- la VM porte un **tag** (mets ton prénom) ;
- un **output** expose son **adresse IP publique**.

## Concepts Azure à connaître
En Azure, une VM ne se crée pas seule. Réfléchis à la chaîne de ressources nécessaires :
- un **Resource Group** (conteneur logique de toutes tes ressources) ;
- un **réseau** : VNet + subnet ;
- une **carte réseau (NIC)** rattachée au subnet ;
- une **IP publique** (si tu veux joindre la VM depuis Internet) ;
- la **VM** elle-même, qui référence la NIC.

## Prérequis
- Terraform ≥ 1.6 + provider `azurerm` (déclare une contrainte de version).
- Abonnement Azure + **`az login`** (aucune clé dans le code).
- Coût : choisis une taille éligible aux crédits gratuits / minimale ; **`terraform destroy`** à la fin.

## Tâches
1. Déclare le provider `azurerm` (n'oublie pas le bloc `features {}`) + les contraintes de version.
2. Crée le Resource Group, puis la plomberie réseau (VNet, subnet, NIC, IP publique).
3. Crée la VM Linux. Pour l'image : **trouve toi-même une image Ubuntu LTS valide** (publisher / offer / sku) dans la doc — ne devine pas un identifiant au hasard.
4. Authentifie l'accès par **clé SSH** (jamais de mot de passe en clair commité).
5. Expose l'IP publique en `output`.

## Critères de réussite (Definition of Done)
- [ ] `terraform fmt` et `terraform validate` passent.
- [ ] `terraform apply` crée la VM et ses dépendances.
- [ ] La VM apparaît **Running** dans le portail Azure.
- [ ] `terraform output` affiche l'IP publique.
- [ ] Aucun secret ni `*.tfstate` commité ; `terraform destroy` en fin.

## Pièges connus
- Oublier le bloc `features {}` du provider.
- Référence d'image (sku/offer/publisher) invalide.
- VM créée sans NIC/IP publique → injoignable.
- Mode d'authentification de la VM mal configuré.

## Documentation
- `azurerm_linux_virtual_machine` : <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine>
- Provider azurerm : <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs>

## Livrable
Documente ta démarche dans ce README — cf. [README racine](../../README.md).
