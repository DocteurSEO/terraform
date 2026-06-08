# 🚧 05 — Reprise du projet : les modules

> **Format :** mixte **debug + à compléter**. Tu reprends un projet en chantier.

## 📢 Le contexte
Le stagiaire nous a lâchés en plein chantier de « terraformisation ». Le code est **en partie écrit, en partie cassé, en partie vide**. À toi de le remettre d'aplomb.

## 🎯 Objectif
Rendre **déployable** une infra à **deux modules** — un module **réseau** et un module **calcul** — où l'instance EC2 vit **dans le sous-réseau créé par le module réseau**.

## 📦 Point de départ fourni (lis bien)
- `main.tf` (racine) : le fichier d'**assemblage**. ⚠️ Il contient une **erreur de syntaxe volontaire** à trouver et corriger — en l'état, il ne s'initialise/valide même pas. Le module `ec2` y est laissé en suspens (`// la suite ?`).
- `vpc-module/` : **fourni en exemple** — son `main.tf` est complet (VPC, subnet, IGW, route, SG). Inspire-toi de sa structure. ⚠️ Ses `variables.tf` et `outputs.tf` sont **vides** : à toi de les écrire pour exposer ce dont l'assemblage a besoin.
- `ec2-module/` : **c'est ton vrai travail** — `main.tf` et `variables.tf` sont **vides**, à écrire entièrement (sur le modèle du module réseau).

## 📐 Contrat attendu des modules (à toi de l'implémenter)
| Module | Doit accepter en entrée (variables) | Doit exposer en sortie (outputs) |
|--------|--------------------------------------|----------------------------------|
| réseau (`vpc-module`) | CIDR du VPC, CIDR du subnet, AZ… | au moins l'**ID du subnet** et l'**ID du security group** |
| calcul (`ec2-module`) | une **AMI**, un **type d'instance**, + ce qu'il faut pour rattacher l'instance au réseau (subnet, SG) | l'**ID** (et/ou l'**IP**) de l'instance |

> 🔑 Compétence clé : faire **transiter une sortie d'un module → vers l'entrée de l'autre** via l'assemblage racine.

## ✅ Prérequis
- Terraform ≥ 1.6, compte AWS + CLI configurée. Ajoute des **contraintes de version**.
- ⚠️ **AMI** : l'ID écrit en dur dans l'assemblage n'est probablement plus valide / dépend de la région. Ne dépends pas d'une valeur figée — rends-la paramétrable et/ou résous-la dynamiquement.
- 🔒 **Sécurité** : le SG fourni est **volontairement trop permissif** (tout ouvert à `0.0.0.0/0`). Restreins les flux entrants au strict nécessaire et **justifie** tes choix.
- 💰 **Coût :** crée de l'EC2 réel → free tier + `terraform destroy` à la fin.

## 🛠️ Tâches
1. Trouve et corrige l'**erreur de syntaxe** de l'assemblage (`terraform fmt`/`validate` doivent finir par passer).
2. Complète les `variables.tf`/`outputs.tf` du module réseau.
3. Écris entièrement le module calcul.
4. Branche les deux modules dans l'assemblage (sortie réseau → entrée calcul).
5. Durcis le security group.

## 🏁 Critères de réussite (Definition of Done)
- [ ] `terraform fmt` et `terraform validate` passent (l'erreur de syntaxe est corrigée).
- [ ] `terraform plan` est cohérent ; l'instance est bien dans le subnet du module réseau.
- [ ] Les `output` prouvent le câblage (ID subnet/SG consommés par le module calcul, ID/IP de l'instance).
- [ ] Le SG est restreint et justifié.
- [ ] Aucun secret/état commité ; `terraform destroy` en fin.

## 📚 Documentation
- Modules : <https://developer.hashicorp.com/terraform/language/modules>
- Outputs : <https://developer.hashicorp.com/terraform/language/values/outputs>

## 📝 Livrable
Documente ta démarche dans ce README — cf. [README racine](../README.md).
