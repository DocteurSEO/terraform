# Azure 04 — Au secours, le stagiaire a (encore) tout cassé !

> Format : debug d'un code fourni. Un `main.tf` existe déjà — il contient des erreurs **volontaires**.
> Équivalent AWS : exercice 04.

## Objectif
Reprendre la configuration Azure laissée par le stagiaire, **identifier et corriger ses erreurs**, et mener le déploiement à bien.

## Combien d'erreurs, et de quelle nature ?
Le code contient **plusieurs problèmes**, répartis en **3 familles** :
1. (a) **Empêchent `terraform validate` / `plan`** — la config ne se valide pas en l'état (syntaxe, argument requis manquant…).
2. (b) **Empêchent un `apply` réussi** — valeurs invalides / placeholders.
3. (c) **Rendent l'infra non fonctionnelle ou peu sûre** — pense au pare-feu réseau et aux associations de ressources.

> On ne te dit pas *où* elles sont : c'est l'exercice. `terraform validate` et la doc du provider te guideront.

## Prérequis
- Terraform ≥ 1.6 + provider `azurerm`, `az login`.
- Les **valeurs des variables ne sont pas fournies** : copie [`terraform.tfvars.example`](terraform.tfvars.example) en `terraform.tfvars` et renseigne-les.
- Coût : une fois corrigée, la config crée des VM facturées → taille minimale et **`terraform destroy`** à la fin.

## Instructions
1. **Analyse** le code et repère les problèmes des 3 familles.
2. **Corrige** (et applique `terraform fmt` + un nommage cohérent).
3. **Déploie** sur Azure.
4. **Durcis la sécurité** : les règles du NSG sont-elles raisonnables ? Le NSG est-il seulement associé à quelque chose ? Justifie et restreins ce qui doit l'être.
5. **Documente** les changements effectués.

## Critères de réussite (Definition of Done)
- [ ] `terraform validate` passe.
- [ ] `terraform plan` s'affiche sans erreur.
- [ ] `terraform apply` aboutit.
- [ ] Tu peux **vérifier** que la VM est joignable comme prévu (décris la commande de test).
- [ ] `terraform fmt` ne renvoie aucune différence ; nommage cohérent.
- [ ] Tu as **justifié** tes choix de sécurité réseau.
- [ ] Aucun secret/état commité ; `terraform destroy` en fin.

## Documentation
- Provider azurerm : <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs>
- `az login` : <https://learn.microsoft.com/cli/azure/authenticate-azure-cli>

## Livrable
Documente ta démarche dans ce README — cf. [README racine](../../README.md).
