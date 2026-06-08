# 12 — Gérer un secret avec Terraform + Vault

> **Format :** consigne à partir de zéro. **Prérequis : exercice 05.**

## Objectif (résultat observable)
Provisionner une ressource AWS (ex. une instance EC2) dont **une donnée provient d'un secret lu dans Vault**, et être capable de **prouver que la valeur vient bien de Vault** (et non d'une constante codée en dur).

## Étape 0 — Prépare ton Vault (la vraie difficulté est ici)
C'est souvent ce qui bloque : assure-toi, **avant** d'écrire du Terraform, d'avoir :
- [ ] un **Vault joignable** (le plus simple pour s'entraîner : un **Vault en mode dev local**, `vault server -dev` — voir doc ; sinon HCP Vault ou un Vault de TP) ;
- [ ] la **méthode d'authentification AppRole activée**, avec un **role** créé (tu récupéreras son `role_id`/`secret_id`) ;
- [ ] un **secret KV v2 créé** au préalable, avec une **clé** connue (c'est cette valeur que tu liras).

## Prérequis
- Terraform ≥ 1.6, compte AWS + CLI, accès à un Vault (cf. étape 0).
- **Coût :** crée de l'EC2 réel → free tier + `terraform destroy`.

## Sécurité (irréprochable attendue ici — c'est le sujet)
- **N'écris pas** les identifiants Vault (`role_id`/`secret_id`) ni les credentials AWS en clair dans tes `.tf`. Passe par des **variables d'environnement** (`VAULT_ADDR`, `VAULT_TOKEN` ou variables AppRole, `AWS_PROFILE`…) ou un `*.tfvars` ignoré.
- **Question réflexive obligatoire** : après `apply`, **où se retrouve la valeur du secret** ? (Dans la ressource ? Dans un *tag* visible en console ? Dans le **fichier d'état** — qui stocke les données lues en clair ?) Est-ce acceptable ? Que ferais-tu **autrement en production** ?

## Briques à implémenter (par leur rôle, pas le code)
1. **Provider AWS** (région imposée).
2. **Provider Vault** avec **authentification AppRole** (adresse, méthode d'auth) — sans valeurs en dur.
3. **Source de données** lisant un secret **KV v2** (mount + nom du secret).
4. **Ressource AWS** qui **consomme** la valeur lue depuis Vault.

> Pour l'AMI : ne code pas un ID figé (périmé/region-dépendant) — résous-la dynamiquement ou rends-la paramétrable.

## Critères de réussite (Definition of Done)
- [ ] `terraform fmt` / `validate` passent.
- [ ] `terraform apply` réussit en lisant réellement le secret depuis Vault.
- [ ] Tu peux **prouver** que la valeur provient de Vault (et non d'une constante).
- [ ] Tu as **répondu** à la question réflexive sur la localisation du secret.
- [ ] Aucun identifiant/état commité ; `terraform destroy` en fin.

## Documentation
- Provider Vault (Registry) : <https://registry.terraform.io/providers/hashicorp/vault/latest/docs>
- Vault (mode dev, AppRole, KV v2) : <https://developer.hashicorp.com/vault/docs>
- Provider AWS : <https://registry.terraform.io/providers/hashicorp/aws/latest/docs>

## Livrable
Documente ta démarche dans ce README — cf. [README racine](../README.md).
