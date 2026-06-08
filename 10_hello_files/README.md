# 📁 10 — Faire tourner `app.py` à distance avec les provisionneurs

> **Format :** consigne à partir de zéro (le fichier `app.py` t'est fourni).

> ⚠️ **À savoir avant de commencer :** HashiCorp considère les provisionneurs comme un **« dernier recours »** (l'approche moderne privilégie `user_data`/cloud-init, une image pré-construite, ou un outil de gestion de configuration). Cet exercice sert à **comprendre** les provisionneurs — pas à en faire ta méthode de déploiement par défaut. Avant d'utiliser `remote-exec`, cite au moins **une alternative**.

---

## 📖 PARTIE COURS — les 3 provisionneurs (référence)
- **`file`** : copie un fichier/dossier de ta machine locale vers une machine distante (via une connexion SSH/WinRM).
- **`remote-exec`** : exécute des commandes **sur la machine distante** (SSH/WinRM) — utile pour installer/configurer.
- **`local-exec`** : exécute une commande **sur ta machine locale** (là où tourne Terraform).

📚 Syntaxe exacte et arguments : <https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax>
(blocs `connection`, `file`, `remote-exec`, `local-exec`).

---

## 🎯 PARTIE MISSION — objectif (résultat observable)
Déployer une instance, y **faire tourner l'application Flask fournie** (`app.py`) et la rendre **accessible sur le port 80**.

**Réussite =** après `terraform apply`, `curl http://<ip_publique>/` renvoie exactement `Hello, Terraform!`.

> ℹ️ `app.py` est un **serveur web Flask persistant** (il ne se termine pas) : réfléchis à comment le **démarrer en arrière-plan** pour qu'il survive à la fin de l'`apply` (et ne bloque pas le provisionneur).

## ✅ Prérequis
- Terraform ≥ 1.6, un compte de provider cloud + CLI configurée, une **paire de clés SSH** existante, **Python/Flask** à installer côté hôte.
- 💰 **Coût :** instance facturée → free tier + `terraform destroy` à la fin.

## 🔒 Sécurité
- Gère ta clé privée SSH proprement (ne la commite pas).
- L'app écoute sur le port 80 : ouvre ce port **au strict nécessaire** et justifie.

## 🛠️ Tâches (sans te donner le code)
1. Définis le provider/région, le type d'instance, une **AMI résolue dynamiquement** (pas d'ID figé), la clé SSH, le security group — + **contraintes de version**.
2. Utilise **au minimum `file`** (copier `app.py` sur l'hôte) **et `remote-exec`** (installer les dépendances Python et démarrer l'app). Explique pourquoi `local-exec` ne convient pas pour *héberger* l'app.
3. Expose l'**IP publique** en `output`.

## 🏁 Critères de réussite (Definition of Done)
- [ ] `terraform fmt` / `validate` / `apply` passent.
- [ ] `curl http://<ip>/` renvoie `Hello, Terraform!`.
- [ ] L'app reste joignable **après** la fin de l'`apply`.
- [ ] Tu as cité une alternative moderne aux provisionneurs.
- [ ] Aucun secret/état commité ; `terraform destroy` en fin.

## 🪤 Pièges connus
- Provisionneur qui se bloque (app lancée en avant-plan).
- Utilisateur SSH incohérent avec l'OS de l'AMI.
- Provisionneurs **non idempotents** : que se passe-t-il au second `apply` ?

## 📝 Livrable
Documente ta démarche dans ce README — cf. [README racine](../README.md).
