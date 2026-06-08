# Azure 03 — VM + serveur web + NSG

> Format : consigne à partir de zéro. `main.tf` contient un `// TODO`.
> Équivalent AWS : exercice 03 (EC2 + Apache + security group).

## Objectif (résultat observable)
Lancer une VM Linux qui installe **automatiquement un serveur web au démarrage** et sert une page, accessible depuis Internet — **sans connexion SSH manuelle**.

À la fin, une requête HTTP sur l'**IP publique** renvoie une page contenant un `<h1>Hello Terraform</h1>`.

## Prérequis
- Terraform ≥ 1.6 + provider `azurerm` (contrainte de version), `az login`.
- Coût : taille minimale ; **`terraform destroy`** à la fin.

## Tâches
1. Reprends la base de l'exercice 01 (Resource Group + réseau + NIC + IP publique + VM).
2. **Provisioning au boot** : fais installer un serveur web (nginx ou apache) et écrire la page via un script d'initialisation exécuté au premier démarrage (mécanisme `custom_data` / cloud-init — pas de SSH manuel).
3. **NSG** : crée un Network Security Group qui autorise le port **80** et **associe-le** au subnet ou à la NIC (un NSG non associé ne protège/ouvre rien).
4. Question de sécurité (à traiter) : à quelle **source** ouvres-tu le port 80 ? Le port **22 (SSH)** est-il nécessaire pour réussir ce test, et si oui, le laisses-tu ouvert à `*` (tout Internet) ou seulement à ton IP ? Justifie.
5. Expose l'**IP publique** en `output`.

## Critères de réussite (Definition of Done)
- [ ] `terraform fmt` / `validate` / `apply` passent.
- [ ] `terraform output` affiche l'IP publique.
- [ ] `curl http://<ip_publique>` renvoie **HTTP 200** et le corps contient `Hello Terraform`.
- [ ] Le NSG est bien **associé** (subnet ou NIC) et tu as **justifié** tes règles.
- [ ] Aucun secret/état commité ; `terraform destroy` en fin.

## Pièges connus
- NSG créé mais **non associé** → port non réellement ouvert (ou VM non joignable).
- Script d'init qui ne s'exécute pas au boot, ou serveur web non démarré.
- IP publique non créée/rattachée → VM injoignable.

## Documentation
- `azurerm_network_security_group` : <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group>
- `custom_data` (Linux VM) : <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine>

## Livrable
Documente ta démarche dans ce README — cf. [README racine](../../README.md).
