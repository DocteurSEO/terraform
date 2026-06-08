provider "azurerm" {
  features {}
}

# TODO : appelle le module réseau (Resource Group + VNet + subnet [+ NSG])
#        défini dans ./network-module.
#
# module "network" {
#   source = "./network-module"
#   # ... variables d'entrée ...
# }

# TODO : appelle le module calcul (NIC + IP publique + VM) défini dans ./vm-module,
#        en lui passant l'ID du subnet produit par le module réseau.
#
# module "vm" {
#   source    = "./vm-module"
#   subnet_id = module.network.subnet_id
#   # ... autres variables ...
# }

# TODO : expose ici l'IP publique de la VM (output) une fois les modules branchés.
