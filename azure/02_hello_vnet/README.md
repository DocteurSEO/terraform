# Azure 02 — Ton premier réseau : un VNet et un subnet

> Format : consigne à partir de zéro. `main.tf` contient un `// TODO`.
> Équivalent AWS : exercice 02 (VPC + subnet).

## Objectif (résultat observable)
Créer, avec Terraform, un **Virtual Network (VNet)** et **un subnet** à l'intérieur de ce VNet, et prouver leur création.

À la fin :
- `terraform apply` crée un **Resource Group**, un **VNet** et **un subnet** ;
- le subnet est bien **rattaché** au VNet (son préfixe est inclus dans l'espace d'adressage du VNet) ;
- un **output** expose l'ID du VNet et l'ID du subnet.

## Rappels de concepts
- **VNet** (équivalent du VPC AWS) : réseau virtuel isolé, défini par un ou plusieurs `address_space` (plages CIDR).
- **Subnet** : sous-plage (`address_prefixes`) du VNet.
- Tout vit dans un **Resource Group**.

## Prérequis
- Terraform ≥ 1.6 + provider `azurerm` (contrainte de version), `az login`.
- Coût : VNet et subnet sont **gratuits**.

## Tâches
1. Déclare le provider `azurerm` (`features {}`) + contraintes de version.
2. Crée le Resource Group.
3. Rends les **plages d'adresses paramétrables** via des **variables** (ne les code pas en dur). Choisis des plages cohérentes (le subnet inclus dans le VNet).
4. Crée le VNet, puis le subnet **rattaché** au VNet.
5. Expose les IDs en `output`.

## Critères de réussite (Definition of Done)
- [ ] `terraform fmt` et `terraform validate` passent.
- [ ] `terraform plan` crée le Resource Group, le VNet et le subnet.
- [ ] Le subnet référence bien le VNet créé.
- [ ] `terraform output` affiche les deux IDs.
- [ ] Aucun `*.tfstate`/`*.tfvars` commité ; `terraform destroy` en fin.

## Pièges connus
- Préfixe du subnet hors de l'espace d'adressage du VNet.
- Oublier le Resource Group.

## Documentation
- `azurerm_virtual_network` : <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network>
- `azurerm_subnet` : <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet>

## Livrable
Documente ta démarche dans ce README — cf. [README racine](../../README.md).
