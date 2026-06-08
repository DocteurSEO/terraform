# 🌍 09 — N instances Vultr pilotées par une CLI Python 🐍

> **Format :** consigne à partir de zéro. **Prérequis : exercice 07.**

## 🎯 Objectif (résultat observable)
Déployer un **nombre variable** d'instances Ubuntu sur Vultr, ce nombre étant piloté par une **CLI Python** qui met à jour les variables Terraform.

**Réussite =** après `python cli.py 3` puis `terraform apply`, **exactement 3 instances** existent et leurs **3 IPs** apparaissent en sortie Terraform.

## ✅ Prérequis
- Terraform ≥ 1.6, **Python 3**, compte Vultr + clé API.
- 💰 **Coût :** N instances facturées → garde N petit et **`terraform destroy`** à la fin.

## 🔒 Sécurité
- Clé API **jamais en clair** dans un fichier versionné (`VULTR_API_KEY` ou `*.tfvars` ignoré).
- Le script écrit dans `terraform.tfvars` → assure-toi que ce fichier est **ignoré par git** (c'est le cas via le `.gitignore` racine).

## 📐 Contrat de la CLI (interface, pas le code)
- **Entrée :** un **entier N positif passé en argument** de ligne de commande : `python cli.py <N>`. _(Pas de saisie interactive — on choisit ce mode pour la reproductibilité.)_
- **Sortie :** le fichier `terraform.tfvars` mis à jour avec la variable qui pilote le nombre d'instances. Les **autres variables** (plan, région, OS) doivent être **préservées**.
- Gère le cas d'un argument **absent ou invalide**.

## 🛠️ Tâches
1. Écris une config Terraform qui produit un **nombre variable** d'instances, piloté par **une seule variable d'entrée** (à toi de choisir le mécanisme : `count`, `for_each`… et de le justifier).
2. Déclare les variables (nombre, plan, région, OS) — voir [`terraform.tfvars.example`](terraform.tfvars.example). Récupère des identifiants Vultr **valides** dans la doc actuelle.
3. Écris `cli.py` selon le contrat ci-dessus.
4. Expose les **IPs** des N instances en `output`.

## 🏁 Critères de réussite (Definition of Done)
- [ ] `terraform fmt` / `validate` passent.
- [ ] `python cli.py 3` puis `apply` → **3 instances** (`terraform state list`) et **3 IPs** en output.
- [ ] Relancer `cli.py` avec une autre valeur change le plan en conséquence (`+`/`-` instances).
- [ ] Clé API/état non commités ; `terraform destroy` en fin.

## 🪤 Pièges connus
- Le script écrase les autres variables du tfvars.
- Argument manquant non géré.
- Identifiants Vultr périmés.

## 📚 Documentation
- Provider Vultr : <https://registry.terraform.io/providers/vultr/vultr/latest/docs>
- `count` / `for_each` : <https://developer.hashicorp.com/terraform/language/meta-arguments/count>

## 📝 Livrable
Documente ta démarche dans ce README — cf. [README racine](../README.md).
