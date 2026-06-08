# Squelette à RECOPIER dans chaque exercice et à COMPLÉTER.
# Objectif : rendre ta configuration reproductible dans le temps.
# (Ce fichier est un gabarit : remplis les TODO, ne le laisse pas tel quel.)

terraform {
  # TODO: impose une version minimale de Terraform, ex. ">= 1.6.0".
  required_version = "# TODO"

  required_providers {
    # TODO: déclare ici CHAQUE provider que tu utilises, avec :
    #   - sa "source" (cherche-la sur https://registry.terraform.io)
    #   - une contrainte de version en PLAGE (opérateur ~> ou >=),
    #     pas une égalité stricte.
    #
    # exemple_de_structure = {
    #   source  = "<organisation>/<provider>"
    #   version = "<contrainte, ex. ~> X.Y>"
    # }
  }
}
