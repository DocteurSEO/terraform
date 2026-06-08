# Initiation à Terraform — Exercices Pratiques

Un parcours de **13 exercices** (+ une **déclinaison Azure** de 5 exercices) pour apprendre Terraform **par la pratique** et **par l'erreur**. Chaque exercice est un défi : on te donne l'**objectif** et les **critères de réussite**, à toi d'écrire la configuration.

> Dépôt pédagogique. Les exercices sont **volontairement incomplets** (`// TODO`, fichiers vides, bugs à corriger). Ce n'est pas un bug du dépôt, c'est le sujet.

## Comment ça marche
1. Forke ce dépôt.
2. Pour chaque exercice, lis le `README.md` du dossier, puis écris ta configuration dans ce dossier.
3. Documente ta démarche dans le `README.md` de ton dossier (voir « Livrable » plus bas).
4. À la fin de chaque exercice : `terraform destroy` + vérifie que tu n'as rien commité de sensible.

## Parcours principal (AWS, Vultr, GitHub)

| #  | Exercice           | Concept clé                                | Provider        | Coût      | Pré-requis (exos) |
|----|--------------------|--------------------------------------------|-----------------|-----------|-------------------|
| 01 | hello_terraform    | 1re ressource, cycle init/plan/apply       | AWS             | facturé\* | —                 |
| 02 | hello_vpc          | réseau : VPC + subnet                      | AWS             | gratuit   | 01                |
| 03 | hello_apache       | user_data, security group, web            | AWS             | facturé\* | 01, 02            |
| 04 | hello_debug        | debug d'une config existante              | AWS             | facturé\* | 02, 03            |
| 05 | hello_module       | modules + assemblage                      | AWS             | facturé\* | 02, 04            |
| 06 | hello_github       | un autre provider, variable, CLI Python   | GitHub          | gratuit   | 01                |
| 07 | hello_vultr        | VM + Docker, provisioning au boot         | Vultr           | facturé   | 03                |
| 08 | hello_wordpress    | 2 conteneurs (WordPress + MySQL)          | Vultr           | facturé   | 07                |
| 09 | hello_multiclonage | nombre variable d'instances + CLI Python  | Vultr           | facturé   | 07                |
| 10 | hello_files        | provisionneurs file/remote-exec/local-exec | AWS            | facturé\* | 03                |
| 11 | hello_stages       | workspaces (dev/stage/prod) + module      | AWS             | facturé   | 05                |
| 12 | hello_vault        | gestion de secrets avec Vault             | AWS + Vault     | facturé\* | 05                |
| 13 | hello_actions      | CI/CD avec GitHub Actions                 | local (gratuit) | gratuit   | 06                |

\* _Reste dans le **free tier** AWS et lance `terraform destroy` dès la validation. Une alternative locale gratuite (LocalStack, Vault `-dev`, provider Docker) est indiquée dans plusieurs exercices._

## Parcours Azure ([`azure/`](azure/))

Déclinaison des fondamentaux cloud avec le provider `azurerm` (équivalents des exercices AWS 01 à 05).

| #  | Exercice     | Concept clé                          | Équivalent AWS | Coût      |
|----|--------------|--------------------------------------|----------------|-----------|
| 01 | hello_vm     | 1re VM Linux                         | 01             | facturé   |
| 02 | hello_vnet   | réseau : VNet + subnet               | 02             | gratuit   |
| 03 | hello_web    | VM + serveur web (cloud-init) + NSG  | 03             | facturé   |
| 04 | hello_debug  | debug d'une config Azure existante   | 04             | facturé   |
| 05 | hello_module | modules (réseau + calcul)            | 05             | facturé   |

## Prérequis généraux
- **Terraform ≥ 1.6** (idéalement la dernière 1.x) — installation : <https://developer.hashicorp.com/terraform/install>.
  _(Alternative open-source : OpenTofu — <https://opentofu.org>.)_
- **Git** et un compte **GitHub**.
- Selon l'exercice : un compte **AWS** / **Vultr** / un abonnement **Azure**, **Python 3**, **Docker**, un serveur **Vault**.
- Les CLIs nécessaires (`aws`, `az`, `vault`, `docker`…) installés et configurés.

## Règles de sécurité — NON NÉGOCIABLES (valables pour TOUS les exercices)
1. **Jamais** de secret, clé, token, `role_id`/`secret_id` en clair dans un fichier `.tf` ou un fichier commité. Utilise une **variable d'environnement** (`AWS_PROFILE`, `TF_VAR_xxx`, `VULTR_API_KEY`, `VAULT_ADDR`/`VAULT_TOKEN`…), l'authentification **`az login`** pour Azure, ou un `*.tfvars` **ignoré par git**.
2. **Ne commite jamais** `*.tfstate` (il contient tes secrets en clair après `apply`), `*.tfvars`, ni `.terraform/`. Le `.gitignore` racine s'en charge — **vérifie-le avant ton premier `apply`**.
3. **Restreins les flux réseau** au strict nécessaire. `0.0.0.0/0` (AWS) ou `*` (Azure) sur SSH (22) ou sur une large plage de ports est un risque : ouvre à ton IP, et seulement le port applicatif au public.
4. **Versionne** ton `.terraform.lock.hcl` (reproductibilité), pas ton état.

## Coût
La plupart des exercices créent des ressources **facturées**. Avant de commencer :
- active une **alerte de budget** chez ton fournisseur,
- privilégie le **free tier** / la plus petite taille,
- termine **toujours** par `terraform destroy`.

## Conventions du dépôt
- Identifiants en **`snake_case`** (pas de tiret dans les noms de variables/ressources).
- Chaque exercice déclare ses **contraintes de version** (`required_version` + `required_providers`) — voir le gabarit [`_TEMPLATE/versions.tf`](_TEMPLATE/versions.tf).
- `terraform fmt` et `terraform validate` doivent passer sur ta solution.
- Un gabarit de consigne et de fichiers est disponible dans [`_TEMPLATE/`](_TEMPLATE/).

## Livrable attendu (documentation)
Dans le `README.md` de **ton** dossier d'exercice, consigne :
- ton **nom et prénom** ;
- les **étapes** suivies pour le déploiement ;
- les **sites consultés** et les **mots-clés** recherchés ;
- les **erreurs rencontrées** et les **solutions** apportées ;
- tes **notes personnelles** (difficultés, apprentissages).

## Objectif du projet
- Apprendre de nos erreurs.
- Documenter méthodiquement nos démarches.
- Créer un guide de référence pour des projets futurs.

## Besoin d'aide ?
N'hésite pas à me contacter, ou à chercher dans la [documentation Terraform](https://developer.hashicorp.com/terraform/docs).

## Licence
Ce dépôt est publié sous licence **MIT** (voir [`LICENSE`](LICENSE)) : tu peux le forker, le modifier et le réutiliser librement.

## Remerciements
Merci de prendre part à ce projet éducatif et de contribuer à cette base de connaissances collective.
