# Azure 05 — Découper en modules : réseau + calcul

> Format : squelette à compléter.
> Équivalent AWS : exercice 05.

## Objectif
Rendre déployable une infra Azure à **deux modules** — un module **réseau** et un module **calcul** — où la VM vit dans le subnet créé par le module réseau.

## Point de départ fourni
- `main.tf` (racine) : l'**assemblage**, avec le provider et des `# TODO`. À toi d'y appeler les deux modules et de **brancher** la sortie du module réseau vers l'entrée du module calcul.
- `network-module/` et `vm-module/` : des **squelettes** (fichiers avec `# TODO`). Les deux sont **à écrire** — il n'y a pas de module fourni « tout fait » (sinon ce serait la réponse de l'exercice 02).

## Contrat attendu des modules (à toi de l'implémenter)
| Module | Doit accepter en entrée (variables) | Doit exposer en sortie (outputs) |
|--------|--------------------------------------|----------------------------------|
| réseau (`network-module`) | nom/localisation du Resource Group, plages d'adresses… | au moins l'**ID du subnet** (et l'ID du NSG si tu en crées un) |
| calcul (`vm-module`) | une **image**, une **taille** de VM, + ce qu'il faut pour rattacher la VM au réseau (subnet) | l'**IP publique** (et/ou l'ID) de la VM |

> Compétence clé : faire **transiter une sortie d'un module vers l'entrée de l'autre** via l'assemblage racine.

## Prérequis
- Terraform ≥ 1.6 + provider `azurerm` (contraintes de version), `az login`.
- Sécurité : si tu crées un NSG, **restreins** les flux au strict nécessaire (pas de SSH ouvert à `*`).
- Coût : crée des ressources facturées → taille minimale + `terraform destroy` à la fin.

## Tâches
1. Écris le module réseau (Resource Group + VNet + subnet, et éventuellement un NSG).
2. Écris le module calcul (NIC + IP publique + VM).
3. Dans l'assemblage, appelle les deux modules et **branche** la sortie réseau → entrée calcul.
4. Expose en sortie de l'assemblage l'**IP publique** de la VM.

## Critères de réussite (Definition of Done)
- [ ] `terraform fmt` et `terraform validate` passent.
- [ ] `terraform plan` est cohérent ; la VM est bien dans le subnet du module réseau.
- [ ] Les `output` prouvent le câblage entre modules.
- [ ] Aucun secret/état commité ; `terraform destroy` en fin.

## Documentation
- Modules : <https://developer.hashicorp.com/terraform/language/modules>
- Outputs : <https://developer.hashicorp.com/terraform/language/values/outputs>

## Livrable
Documente ta démarche dans ce README — cf. [README racine](../../README.md).
