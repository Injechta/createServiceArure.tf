# resources.tf
# Création d'une application Azure AD pour le Service Principal
resource "azuread_application" "example" {
  display_name               = var.application_name
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
}

# Création du Service Principal à partir de l'application Azure AD
resource "azuread_service_principal" "example" {
  application_id = azuread_application.example.application_id
}

# Création d'un secret associé au Service Principal
resource "azuread_service_principal_password" "example" {
  service_principal_id = azuread_service_principal.example.id
  description          = var.secret_description
  end_date_relative    = "8760h"  # 365 days in hours
}
