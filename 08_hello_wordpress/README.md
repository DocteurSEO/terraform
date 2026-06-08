# 08 — WordPress + MySQL en Docker sur Vultr

> **Format :** consigne à partir de zéro. **Prérequis : avoir fait l'exercice 07** (socle VM + Docker).

## Objectif (résultat observable)
Déployer un site **WordPress** fonctionnel, connecté à une base **MySQL**, le tout en **conteneurs Docker sur une VM Vultr** provisionnée par Terraform.

**Réussite =** depuis une machine propre, **un seul `terraform apply`** produit une IP/URL publique sur laquelle l'**écran d'installation WordPress** s'affiche et **se connecte à MySQL**.

## Architecture attendue (pour lever toute ambiguïté)
- **WordPress** et **MySQL** sont **deux conteneurs Docker** tournant sur la **même VM Vultr**, démarrés **automatiquement au provisioning**.
- Les deux conteneurs doivent pouvoir **communiquer** (réseau Docker) et WordPress doit recevoir ses paramètres de connexion à la base.

> Tu **réutilises le socle de l'exercice 07** (VM + Docker au boot). Concentre-toi ici sur l'**orchestration des deux conteneurs** et la **configuration WordPress ↔ MySQL**.

## Prérequis
- Terraform ≥ 1.6, compte Vultr + clé API, notions Docker.
- **Coût :** VM facturée → `terraform destroy` à la fin.

## Sécurité
- Clé API Vultr **et** identifiants/mot de passe MySQL : **jamais en clair** dans un fichier commité (variables sensibles / variables d'environnement / `*.tfvars` ignoré).
- N'expose que les ports nécessaires ; justifie tes règles de pare-feu.

## Tâches
1. Reprends le socle 07 (VM + Docker, **contraintes de version**).
2. Démarre **MySQL** et **WordPress** au boot, **reliés** entre eux.
3. **Épingle les versions** des images Docker (évite `:latest`) — pense à la compatibilité MySQL ↔ WordPress.
4. Rends paramétrables : région/plan, identifiants de la base (en secret).
5. Expose l'**IP/URL** publique en `output`.

## Critères de réussite (Definition of Done)
- [ ] `terraform fmt` / `validate` / `apply` passent.
- [ ] `curl http://<ip>` (ou navigateur) atteint l'**écran d'installation WordPress** (HTTP 200).
- [ ] WordPress se **connecte** bien à MySQL.
- [ ] Un **second `apply`** ne recrée rien (idempotence) ; `terraform destroy` propre.
- [ ] Aucun secret/état commité.

> _Optionnel (non noté) : finaliser thème/plugins dans l'admin WordPress._

## Pièges connus
- Conteneurs non reliés / variables `WORDPRESS_DB_*` mal renseignées.
- Incompatibilité d'auth entre MySQL récent et WordPress.
- Ordre de démarrage (WordPress avant que MySQL soit prêt).
- Persistance des données (volume) — à décider.

## Documentation
- Provider Vultr : <https://registry.terraform.io/providers/vultr/vultr/latest/docs>
- Images officielles : <https://hub.docker.com/_/wordpress> · <https://hub.docker.com/_/mysql>

## Livrable
Documente ta démarche dans ce README — cf. [README racine](../README.md).
