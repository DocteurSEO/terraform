# 07 — Une VM Vultr qui lance une app Docker, sans SSH

> **Format :** consigne à partir de zéro.

## Objectif (résultat observable)
Provisionner une **VM Vultr** avec Terraform, y faire tourner le conteneur **`satzisa/html5-speedtest`** exposé sur le **port 80**, **sans jamais te connecter en SSH** : tout le provisioning se fait **au démarrage** de la VM.

**Réussite =** un seul `terraform apply`, puis en ouvrant `http://<IP_publique>` dans un navigateur, la page html5-speedtest s'affiche.

## Prérequis
- Terraform ≥ 1.6, Git.
- Un **compte Vultr** + une **clé API**.
- **Coût :** une VM Vultr est **facturée** → `terraform destroy` dès la validation. _(Pas de compte Vultr ? Tu peux adapter l'exercice à un autre fournisseur, voire au provider Docker local.)_

## Sécurité
- La **clé API Vultr ne doit jamais** être en clair dans un fichier versionné : passe-la par **variable d'environnement** (`VULTR_API_KEY`) ou un `*.tfvars` ignoré. Documente ton choix.
- N'expose **que** le port nécessaire au service web ; justifie tes règles de pare-feu.

## Deux approches possibles pour avoir Docker sur la VM
1. **L'installer au démarrage** (script d'init / cloud-init), ou
2. **Partir d'une image système qui l'inclut déjà** (marketplace).

 **Choisis-en une et explique ton choix.** (Rappel : `satzisa/html5-speedtest` est une **image publique du Docker Hub** — il s'agit de la *récupérer et l'exécuter*, pas de cloner un dépôt Git ni de construire une image.)

## Tâches
1. Configure Terraform pour Vultr (provider + **contrainte de version**, cherche la `source` sur le Registry).
2. Déploie **une VM** (plan, région, OS — récupère des identifiants **valides** dans la doc Vultr actuelle, ne recopie pas des valeurs d'un autre exercice).
3. Fais en sorte que Docker récupère et lance l'image sur le **port 80**, **automatiquement au boot**.
4. Expose l'**IP publique** en `output`.

## Critères de réussite (Definition of Done)
- [ ] `terraform fmt` / `validate` / `apply` passent.
- [ ] `terraform output` affiche l'IP publique.
- [ ] `curl http://<ip>` renvoie **HTTP 200** ; la page s'affiche dans un navigateur.
- [ ] **Aucune** connexion SSH manuelle n'a été nécessaire.
- [ ] Clé API non commitée ; état non commité ; `terraform destroy` en fin.

## Pièges connus
- Identifiants Vultr (plan/région/OS/image) périmés ou inexistants.
- Service Docker pas encore prêt quand le `run` se lance.
- Port 80 non ouvert côté pare-feu.

## Documentation
- Provider Vultr (Registry) : <https://registry.terraform.io/providers/vultr/vultr/latest/docs>
- Docker Hub — html5-speedtest : <https://hub.docker.com/r/satzisa/html5-speedtest>

## Livrable
Documente ta démarche dans ce README — cf. [README racine](../README.md).
