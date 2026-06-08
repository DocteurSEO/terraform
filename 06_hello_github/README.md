# 🌐 06 — Terraform avec le provider GitHub + une CLI Python

> **Format :** consigne à partir de zéro.

## 🎯 Objectif (résultat observable)
À partir du **provider GitHub**, écrire une configuration Terraform qui **crée un dépôt** dont le **nom est paramétrable**, puis un **script Python** en CLI qui prend ce nom **en argument**, le transmet à Terraform et déclenche la création.

**Réussite =** le dépôt portant le nom fourni en argument existe bien sur ton compte GitHub après exécution.

## ✅ Prérequis
- **Terraform ≥ 1.6** — installe la **dernière version 1.x** depuis la page officielle : <https://developer.hashicorp.com/terraform/install> _(ne télécharge pas une vieille version figée à la main)._
- **Python 3**.
- Un **compte GitHub** + un **Personal Access Token (PAT)** avec le **scope minimal** permettant de créer un dépôt (principe de moindre privilège).
- 💰 **Coût :** gratuit côté GitHub.

## 🔒 Sécurité (au cœur de l'exercice)
- Le **token ne doit JAMAIS** apparaître dans un fichier `.tf` ni dans un fichier commité. Fournis-le via une **variable d'environnement** (le provider GitHub sait lire un token depuis l'environnement) ou un `*.tfvars` ignoré par git.
- Documente **comment** tu fournis le token.

## 🛠️ Tâches
1. Déclare le **provider GitHub** avec une **contrainte de version** (cherche sa `source` sur le Registry).
2. Déclare une **ressource** de type *dépôt* dont le **nom** provient d'une **variable** (pas un nom codé en dur).
3. Écris un **script Python** (nomme-le `cli.py`) qui :
   - reçoit le **nom du dépôt en argument** de ligne de commande,
   - **transmet** ce nom à Terraform (à toi de choisir le mécanisme : `-var`, fichier de variables, ou variable d'environnement — et de le justifier),
   - déclenche la création.
4. Teste : `python cli.py mon-super-repo`.

## 🏁 Critères de réussite (Definition of Done)
- [ ] `terraform fmt` / `validate` passent.
- [ ] Le **nom passé en CLI** se retrouve bien dans le dépôt créé (chaîne argument → variable → ressource).
- [ ] Le dépôt apparaît sur ton compte GitHub.
- [ ] Le script renvoie un **code 0** en succès et gère au moins une erreur (ex. token absent).
- [ ] Idempotence : que se passe-t-il si tu relances avec le même nom ? (documente-le.)
- [ ] Aucun token/état commité ; nettoyage du dépôt de test en fin.

## 🪤 Pièges connus
- Token absent ou scope insuffisant.
- Nom de dépôt déjà pris.
- Mécanisme de passage du nom mal câblé (le nom reste figé).

## 📚 Documentation
- Provider GitHub (Registry) : <https://registry.terraform.io/providers/integrations/github/latest/docs>
- API REST GitHub : <https://docs.github.com/en/rest>
- Terraform : <https://developer.hashicorp.com/terraform/docs>

## 📝 Livrable
Documente ta démarche dans ce README — cf. [README racine](../README.md).
