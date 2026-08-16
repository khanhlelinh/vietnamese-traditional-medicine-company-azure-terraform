resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags     = var.tags
}

module "networking" {
  source              = "../../modules/networking"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  prefix              = var.prefix
  address_space       = var.vnet_address_space
  aks_subnet_prefix   = var.aks_subnet_prefix
  agw_subnet_prefix   = var.agw_subnet_prefix
  db_subnet_prefix    = var.db_subnet_prefix
  tags                = var.tags
}

module "monitoring" {
  source              = "../../modules/monitoring"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  prefix              = var.prefix
  tags                = var.tags
}

module "security" {
  source              = "../../modules/security"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  prefix              = var.prefix
  tenant_id           = var.tenant_id
  aks_ingress_fqdn    = module.compute_aks.aks_fqdn
  tags                = var.tags
}

module "compute_aks" {
  source              = "../../modules/compute_aks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  prefix              = var.prefix
  vnet_subnet_id      = module.networking.aks_subnet_id
  node_count          = var.aks_node_count
  tags                = var.tags
}

module "databases" {
  source              = "../../modules/databases"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  prefix              = var.prefix
  db_subnet_id        = module.networking.db_subnet_id
  sql_admin_login     = var.sql_admin_login
  sql_admin_password  = var.sql_admin_password
  tags                = var.tags
}

module "integration" {
  source              = "../../modules/integration"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  prefix              = var.prefix
  tags                = var.tags
}

module "ai_hub" {
  source              = "../../modules/ai_hub"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  prefix              = var.prefix
  tags                = var.tags
}
