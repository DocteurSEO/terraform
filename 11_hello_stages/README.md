# 🌐 11 — Un environnement, trois tailles : les workspaces (dev/stage/prod)

> **Format :** consigne à partir de zéro. **Prérequis : exercice 05 (modules).**

## 🎯 Objectif (résultat observable)
Déployer **une** instance EC2 dont le **type change automatiquement selon le workspace actif** (dev/stage/prod), **sans modifier le code** entre deux environnements.

**Réussite =** dans le workspace `prod`, le `plan` montre un type d'instance « gros » ; dans `dev`, un type « petit » — uniquement en changeant de workspace.

## 🧭 C'est quoi un *workspace* ?
Un **workspace** Terraform permet de gérer **plusieurs états** à partir du **même code**. La variable spéciale `terraform.workspace` te donne le nom du workspace courant, ce qui permet d'adapter des valeurs (ici, le type d'instance).

> ⚠️ **Mise en garde (à documenter) :** les workspaces CLI conviennent pour des essais **éphémères**, mais sont **déconseillés** pour séparer de vrais environnements **persistants** (état/backend partagés, contrôle d'accès non séparable, dérive masquée). Pour de la vraie prod, on préfère des répertoires/backends distincts. Considère cet exercice comme une **découverte critique** du mécanisme.

## ✅ Prérequis
- Terraform ≥ 1.6, compte AWS + CLI configurée, + **contraintes de version**.
- **Prérequis pédagogique :** avoir fait l'exercice 05 (tu vas réécrire un module EC2).
- 💰 **Coût :** ⚠️ le type d'instance « prod » n'est **pas free tier** → reste en dev/petit type pour tester, et `terraform destroy` **par workspace**.

## 🛠️ Tâches
1. Configure le provider AWS + région.
2. Déclare une variable pour l'**AMI** (décide comment la fournir : variable + tfvars ; justifie) et une variable décrivant le **type d'instance par environnement**.
3. Fais en sorte que le type d'instance soit **résolu selon `terraform.workspace`** (avec un repli par défaut).
4. Écris un **module EC2** (réutilise l'esprit de l'exo 05). Définis-toi **l'arborescence** (ex. `modules/ec2_instance/`) et le **contrat** du module :
   - **entrées** : au moins une AMI et un type d'instance ;
   - **sorties** : au moins l'**ID** (et/ou l'**IP**) de l'instance.
5. **Crée et sélectionne** toi-même les workspaces (`dev`, `stage`, `prod`) et **constate** la différence de type entre eux (commandes de gestion des workspaces).

## 🏁 Critères de réussite (Definition of Done)
- [ ] `terraform fmt` / `validate` passent.
- [ ] Le `plan` dans `prod` montre un type différent du `plan` dans `dev`, sans changer le code.
- [ ] Le module expose ses outputs ; l'instance est bien créée par le module.
- [ ] Tu as documenté **les limites** des workspaces pour des environnements persistants.
- [ ] Aucun secret/état commité ; `terraform destroy` par workspace en fin.

## 🪤 Pièges connus
- Oublier de **créer/sélectionner** le workspace (tu restes sur `default`).
- AMI figée/region-dépendante.
- Type « prod » coûteux laissé tournant.

## 📚 Documentation
- Workspaces : <https://developer.hashicorp.com/terraform/language/state/workspaces>
- Modules : <https://developer.hashicorp.com/terraform/language/modules>

## 📝 Livrable
Documente ta démarche dans ce README — cf. [README racine](../README.md).
