# 04 — Au secours, le stagiaire a tout cassé !

> **Format :** **debug** d'un code fourni. Un `main.tf` existe déjà — il contient des erreurs **volontaires**. Tu ne pars pas de zéro : tu corriges.

## Objectif
Reprendre la configuration laissée par le stagiaire, **identifier et corriger ses erreurs**, et mener le déploiement à bien.

## Combien d'erreurs, et de quelle nature ?
Le code contient **plusieurs problèmes**, répartis en **3 familles** (pour savoir quand tu as « tout » trouvé) :
1. **(a) Empêchent `terraform validate` / `plan` de passer** — la config ne se valide pas en l'état.
2. **(b) Empêchent un `apply` réussi** — il manque/erre des *valeurs* nécessaires.
3. **(c) Rendent l'infra non fonctionnelle ou peu sûre une fois déployée** — réfléchis notamment aux règles réseau.

> On ne te dit pas *où* elles sont : c'est l'exercice. Une lecture attentive + `terraform validate` + la doc du provider te guideront.

## Prérequis
- Terraform ≥ 1.6, compte AWS + CLI configurée.
- Les **valeurs des variables ne sont pas fournies** : renseigne-les toi-même (copie [`terraform.tfvars.example`](terraform.tfvars.example) en `terraform.tfvars`).
- **Récupère une AMI valide pour TA région** — ne recopie pas un ID trouvé dans un autre exercice (la cohérence AMI ↔ région fait partie du sujet).
- **Coût :** une fois corrigée, la config crée **plusieurs instances EC2** — ça se facture vite. Reste en free tier (réduis le nombre d'instances si besoin) et **`terraform destroy`** à la fin. _(Tant que l'AMI est invalide, `apply` échoue avant toute facturation.)_

## Instructions
1. **Analyse** le code et repère les problèmes des 3 familles.
2. **Corrige** (et applique un nommage cohérent, `terraform fmt`).
3. **Déploie** sur AWS.
4. **Durcis la sécurité** : les règles de pare-feu actuelles sont-elles raisonnables ? Justifie et restreins ce qui doit l'être (pense au moindre privilège, à l'exposition de la base de données…).
5. **Documente** les changements effectués.

## Critères de réussite (Definition of Done)
- [ ] `terraform validate` passe.
- [ ] `terraform plan` s'affiche sans erreur et annonce le nombre attendu de ressources.
- [ ] `terraform apply` aboutit.
- [ ] Tu peux **vérifier** qu'au moins une instance est joignable comme prévu, et tu décris **la commande de test** et son résultat.
- [ ] `terraform fmt` ne renvoie aucune différence ; nommage cohérent.
- [ ] Tu as **justifié** tes choix de sécurité réseau.
- [ ] Aucun secret/état commité ; `terraform destroy` en fin.

## Ressources utiles
- Documentation Terraform : <https://developer.hashicorp.com/terraform/docs>
- Provider AWS : <https://registry.terraform.io/providers/hashicorp/aws/latest/docs>
- Guide AWS : <https://docs.aws.amazon.com>

---

*P.S. : l'attitude « je n'y arrive pas » n'a pas sa place ici. Tu es en M2, on a confiance en tes capacités ! *
