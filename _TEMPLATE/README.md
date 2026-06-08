<!--
 GABARIT DE CONSIGNE — à recopier pour chaque exercice.
 Règle d'or : on décrit CE QU'IL FAUT OBTENIR (objectif observable + critères
 de réussite), jamais COMMENT le coder. On ne colle pas de bloc HCL solution.
-->

# <emoji> NN_hello_xxx — <verbe d'action + sujet>

> **Format de l'exercice :** `consigne à partir de zéro` · `squelette à compléter` · `debug d'un code fourni`
> (préciser lequel pour lever toute ambiguïté)

## Objectif
Une à deux phrases décrivant le **résultat observable** attendu.
_Exemple : « À la fin, telle commande doit renvoyer tel résultat. »_

## Contexte / Scénario
Le pourquoi, l'histoire (« le stagiaire est parti… »), le cadre.

## Prérequis
- Outils + **versions** (Terraform ≥ 1.6, Python 3, CLI du provider…).
- Compte(s) nécessaire(s).
- **Coût** : gratuit / facturé (estimation d'ordre de grandeur).

## Point de départ fourni
Dire **explicitement** ce qui est donné et ce qui reste **à écrire**.
_Exemple : « `main.tf` contient un `// TODO` ; à toi de créer `variables.tf` et `outputs.tf`. »_

## Tâches
1. Verbe d'action…
2. Verbe d'action…

## Critères de réussite (Definition of Done)
- [ ] `terraform fmt` et `terraform validate` passent sans erreur.
- [ ] `terraform plan` crée exactement **N** ressources de type …
- [ ] `<commande de vérification>` renvoie `<résultat attendu>`.
- [ ] Aucun secret ni fichier d'état n'est commité.
- [ ] `terraform destroy` a été exécuté en fin d'exercice.

## Règles de sécurité (rappel, voir README racine)
- Jamais de secret/clé/token en clair dans un `.tf` ou commité.
- Restreindre les flux réseau au strict nécessaire.

## Pour aller plus loin
Pistes optionnelles d'approfondissement.

## Nettoyage
Rappel : `terraform destroy` pour ne rien laisser facturé.

## Pièges connus
Catégories d'erreurs fréquentes (sans donner la correction).

## Livrable à rendre
Cf. README racine : un `README.md` documentant tes étapes, mots-clés/sites
consultés, erreurs rencontrées et solutions, + ton nom/prénom.

## Documentation
- Terraform : https://developer.hashicorp.com/terraform/docs
- Registry (providers) : https://registry.terraform.io
