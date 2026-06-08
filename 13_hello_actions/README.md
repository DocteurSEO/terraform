# 🚀 13 — Terraform piloté par GitHub Actions (CI/CD)

> **Format :** debug/lecture du `main.tf` fourni **+** création d'un workflow.

## 🎯 Objectif de l'atelier
Automatiser Terraform avec **GitHub Actions** : à chaque évolution du code, la CI doit exécuter Terraform pour toi. Tu te familiarises avec l'**IaC** et les **workflows CI/CD**.

> 💡 L'infra fournie (`main.tf`) est **triviale et gratuite** (provider `random`, aucun compte cloud, aucun secret réel) : concentre-toi sur le **workflow**, pas sur l'infrastructure.

## ✅ Prérequis
- Un **compte GitHub** + ton fork de ce dépôt.
- Bases de **Git**, **Terraform**, **YAML**, et des **GitHub Actions**.
- 💰 **Coût :** gratuit.

## 🛠️ Tâches

### 1. Examine le `main.tf`
Comprends ce qu'il crée (une ressource `random_pet` + un output). Vérifie que `terraform init`/`plan`/`apply` fonctionnent en local.

### 2. Crée le workflow GitHub Actions
- Produis un fichier de workflow dans **`.github/workflows/`** (ex. `terraform.yml`) **dans ton dépôt**.
- Il doit, à minima : récupérer le code, installer Terraform, puis lancer `init`, `plan` et `apply`.
- 🧠 **Question de conception (à justifier dans ton README)** : **quand** est-il sûr d'exécuter `plan`, et **quand** est-il sûr d'exécuter `apply` ? Choisis tes **événements déclencheurs** (ouverture de PR ? push/merge sur la branche principale ?) et **explique pourquoi**. _(Appliquer automatiquement sur chaque PR — surtout issue d'un fork — est risqué : pourquoi ?)_
- 🔒 **Secrets** : le provider `random` n'en a pas besoin, mais **si** ton infra en exigeait un (clé d'API, token…), il ne devrait **jamais** apparaître dans le code ni les logs. Montre comment tu le fournirais via les **GitHub Secrets** (ex. injecté en `TF_VAR_xxx`) — tu peux le démontrer avec la variable `environment`.
- 🗄️ **État** : un runner GitHub est **éphémère**. Que devient le `terraform.tfstate` entre deux exécutions ? Quelle solution proposes-tu pour le **rendre persistant** ?

### 3. Teste ton workflow
Ouvre une Pull Request et observe l'exécution dans l'onglet **Actions**.

## 🏁 Critères de réussite (Definition of Done)
- [ ] Le workflow s'exécute (job **vert**) sur l'événement que tu as choisi.
- [ ] Les sorties de Terraform (`plan`, output `demo_name`) sont **visibles dans les logs**.
- [ ] Tu as **justifié** ton choix `plan`-vs-`apply` et la gestion des secrets/état.
- [ ] Aucun secret ni `*.tfstate` n'est commité.

## 🧰 Briques utiles (à assembler toi-même)
- Action de checkout : `actions/checkout@v4`.
- Installation de Terraform : `hashicorp/setup-terraform@v3`.

## 📚 Documentation
- GitHub Actions : <https://docs.github.com/en/actions>
- GitHub Secrets : <https://docs.github.com/en/actions/security-guides/encrypted-secrets>
- Terraform : <https://developer.hashicorp.com/terraform/docs>

## 📝 Livrable
Documente ta démarche dans ce README — cf. [README racine](../README.md).
