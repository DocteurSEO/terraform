# 🌐 02 — Crée ton premier réseau : un VPC et un subnet

> **Format :** consigne à partir de zéro. `main.tf` ne contient qu'un `// TODO` — à toi d'écrire la configuration.

## 🎯 Objectif
Créer, avec Terraform, un **VPC** et **un subnet rattaché à ce VPC** sur AWS, et prouver leur création.

À la fin :
- `terraform apply` crée **exactement 2 ressources** (1 VPC + 1 subnet) ;
- le subnet **référence l'ID du VPC** (il vit bien *dans* le VPC) ;
- un **output** expose l'ID du VPC et l'ID du subnet.

## 🧭 Rappels de concepts
- **VPC (Virtual Private Cloud)** : un réseau virtuel isolé où tu lances tes ressources. Tu contrôles plages d'IP, sous-réseaux, routage.
- **Subnet** : une sous-plage d'IP du VPC, souvent rattachée à une zone de disponibilité.
- **Plages CIDR** : un VPC en `/16` ≈ 65 536 adresses, un subnet en `/24` ≈ 256 adresses. Le CIDR du subnet doit être **inclus** dans celui du VPC.

## ✅ Prérequis
- Terraform ≥ 1.6, compte AWS + CLI configurée (jamais de clés dans le `.tf`).
- 💰 **Coût :** VPC et subnet sont **gratuits** (attention si tu y ajoutes des ressources facturées plus tard).

## 🛠️ Tâches
1. Déclare le provider AWS (région imposée) + contraintes de version.
2. Rends les **CIDR paramétrables** via des **variables** (ne les code pas en dur). Choisis toi-même des plages cohérentes.
3. Crée le VPC, puis le subnet **rattaché** au VPC.
4. Expose les IDs en `output`.

## 🏁 Critères de réussite (Definition of Done)
- [ ] `terraform fmt` et `terraform validate` passent.
- [ ] `terraform plan` annonce **2 ressources**.
- [ ] Le subnet utilise bien `vpc_id = <id du VPC créé>`.
- [ ] `terraform output` affiche les deux IDs.
- [ ] Aucun `*.tfstate`/`*.tfvars` commité ; `terraform destroy` en fin.

## 🪤 Pièges connus
- CIDR du subnet hors du CIDR du VPC.
- Subnet non rattaché au VPC (oubli du `vpc_id`).
- Zone de disponibilité inexistante dans ta région.

## 📚 Documentation
- `aws_vpc` : <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc>
- `aws_subnet` : <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet>

## 📝 Livrable
Documente ta démarche dans ce README — cf. [README racine](../README.md).
