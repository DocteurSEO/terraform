# 🚀 03 — EC2 + Apache + page « Hello Terraform »

> **Format :** consigne à partir de zéro. `main.tf` ne contient qu'un `// TODO`.

Salut, futur expert ! Ta mission : lancer une instance EC2 **Ubuntu** qui installe **Apache automatiquement au démarrage** et sert une page web.

## 🎯 Objectif (résultat observable)
À la fin, une requête HTTP sur l'**IP publique** de l'instance renvoie une page contenant **exactement un `<h1>` dont le texte est `Hello Terraform`**, servie par Apache — **sans connexion SSH manuelle** : tout doit se faire au boot.

## ✅ Prérequis
- Terraform ≥ 1.6, compte AWS + CLI configurée (jamais de clés dans le `.tf`).
- 💰 **Coût :** instance free tier recommandée ; **`terraform destroy`** à la fin.

## 🛠️ Tâches
1. **Instance** : choisis une **AMI Ubuntu valide pour ta région** (réfléchis : ID figé vs résolution dynamique), un type d'instance free tier, et impose ta région + tes contraintes de version.
2. **Provisioning au boot** : rédige un script d'initialisation qui s'exécute **automatiquement au premier démarrage** (mécanisme d'init au boot — pas de SSH manuel). Il installe Apache et crée le fichier HTML.
3. **Page HTML** : place ta page dans `/var/www/html` pour qu'Apache la serve. Elle contient un `<h1>Hello Terraform</h1>`.
4. **Réseau** : le port **80** doit être joignable. ⚠️ **Question de sécurité** (à traiter, pas juste à subir) : à quelle **plage source** ouvres-tu le port 80, et pourquoi `0.0.0.0/0` est-il risqué ? Le port **22 (SSH)** est-il *vraiment* nécessaire pour réussir ce test ?
5. **Output** : expose l'IP publique (c'est ton seul moyen de tester).

## 🏁 Critères de réussite (Definition of Done)
- [ ] `terraform fmt` / `validate` / `plan` / `apply` passent sans erreur.
- [ ] `terraform output` affiche l'IP publique.
- [ ] `curl http://<ip_publique>` renvoie **HTTP 200** et le corps contient `Hello Terraform`.
- [ ] Tu as **justifié** tes règles de pare-feu (sources ouvertes, ports).
- [ ] Aucun secret/état commité ; `terraform destroy` en fin.

## 🪤 Pièges connus
- AMI d'un autre OS/région → utilisateur SSH ou paquet (apt vs yum) incohérent.
- Script d'init qui n'écrit pas dans `/var/www/html`.
- Apache non démarré / service non activé au boot.

## 📚 Documentation
- `aws_instance` (user_data) : <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance>
- `aws_security_group` : <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group>

## 📝 Livrable
Documente ta démarche dans ce README — cf. [README racine](../README.md).
