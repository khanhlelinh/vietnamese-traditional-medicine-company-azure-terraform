# This is a basic example of how to use the modules

# 1. Define the resource group
resource "azurerm_resource_group" "rg" {
  name     = "vtmc-example-rg"
  location = "Southeast Asia"
}

# 2. Provision Networking (VNet, Subnets)
module "networking" {
  source              = "../../modules/networking"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  prefix              = "vtmc-example"
  address_space       = ["10.1.0.0/16"]
  aks_subnet_prefix   = "10.1.1.0/24"
  agw_subnet_prefix   = "10.1.2.0/24"
  db_subnet_prefix    = "10.1.3.0/24"
}

# 3. Provision Monitoring resources
module "monitoring" {
  source              = "../../modules/monitoring"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  prefix              = "vtmc-example"
}

# 4. Provision AKS cluster
module "compute_aks" {
  source              = "../../modules/compute_aks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  prefix              = "vtmc-example"
  vnet_subnet_id      = module.networking.aks_subnet_id
  node_count          = 2
}

# 5. Provision Security (FrontDoor/WAF/KeyVault)
module "security" {
  source              = "../../modules/security"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  prefix              = "vtmc-example"
  tenant_id           = "YOUR_AZURE_TENANT_ID"
  aks_ingress_fqdn    = module.compute_aks.aks_fqdn
}

# 6. Provision Database (Azure SQL)
module "databases" {
  source              = "../../modules/databases"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  prefix              = "vtmc-example"
  db_subnet_id        = module.networking.db_subnet_id
  sql_admin_login     = "exampleadmin"
  sql_admin_password  = "ReplaceWithStrongPassword123!"
}

# 7. Provision API Management
module "integration" {
  source              = "../../modules/integration"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  prefix              = "vtmc-example"
}

# 8. Provision AI Hub (Cognitive Services)
module "ai_hub" {
  source              = "../../modules/ai_hub"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  prefix              = "vtmc-example"
}
