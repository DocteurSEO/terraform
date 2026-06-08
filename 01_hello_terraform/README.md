# 01 — Hé toi, jeune Padawan : publie ta première instance AWS EC2

> **Format :** consigne à partir de zéro. `main.tf` contient un `// TODO` — à toi d'écrire la configuration.

## Objectif
Provisionner **une** instance EC2 avec Terraform, puis prouver qu'elle tourne — sans copier de code tout fait.

À la fin :
- `terraform apply` crée **1 instance**, éligible au **free tier**, dans la région que tu choisis et que tu imposes dans ta config ;
- l'instance porte un **tag `Name`** (mets ton prénom) ;
- un **output** expose son **ID** et son **IP publique**.

## Mini-cours : c'est quoi Terraform ?
- Un outil d'**Infrastructure as Code (IaC)** de HashiCorp : tu décris ton infra en code, Terraform la crée pour toi.
- Reproductible, versionnable, multi-cloud (AWS, Azure, GCP…).
- Trois notions de base :
 - **Provider** : le plugin qui parle à l'API du cloud (ici AWS).
 - **Resource** : un élément d'infra à créer (ici une instance EC2).
 - **State** : le fichier où Terraform mémorise ce qu'il a créé ( il contient des données sensibles, on ne le commite jamais).

## Prérequis
- Terraform ≥ 1.6 — <https://developer.hashicorp.com/terraform/install>.
- Un **compte AWS** + l'**AWS CLI** configurée (`aws configure` ou un profil). **N'écris jamais tes clés AWS dans le `.tf`.**
- **Coût :** une `t2.micro`/`t3.micro` est *free tier*, mais facturée si tu dépasses ou si tu oublies de détruire.

## Tâches
1. Déclare le **provider AWS** et impose une **région**.
2. Ajoute une **contrainte de version** (Terraform + provider AWS) — voir [`_TEMPLATE/versions.tf`](../_TEMPLATE/versions.tf).
3. Trouve **toi-même** une **AMI valide pour ta région** (réfléchis : un ID figé périme et dépend de la région — existe-t-il une façon de le résoudre dynamiquement ?).
4. Déclare la **ressource** instance EC2 (type free tier + tag `Name`).
5. Expose **ID** et **IP publique** en `output`.
6. Déroule le cycle : `init` → `fmt` → `validate` → `plan` → `apply`.

## Critères de réussite (Definition of Done)
- [ ] `terraform fmt` et `terraform validate` passent.
- [ ] `terraform plan` annonce **1 ressource** à créer.
- [ ] Après `apply`, l'instance est **`running`** dans la console EC2.
- [ ] `terraform output` affiche l'ID et l'IP publique.
- [ ] Aucune clé AWS ni `*.tfstate` n'est commité.
- [ ] `terraform destroy` exécuté en fin d'exercice.

## Pièges connus
- AMI inexistante / d'une autre région → `InvalidAMIID.NotFound`.
- Région du provider ≠ région de l'AMI.
- Credentials AWS non configurés.

## Documentation
- Provider AWS : <https://registry.terraform.io/providers/hashicorp/aws/latest/docs>
- `aws_instance` : <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance>

## Livrable
Documente ta démarche (étapes, erreurs, mots-clés cherchés) dans ce README — cf. [README racine](../README.md).
