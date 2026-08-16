resource "azurerm_cognitive_account" "openai" {
  name                = "${var.prefix}-openai"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "OpenAI"
  sku_name            = "S0"
  
  tags = var.tags
}

resource "azurerm_cognitive_account" "face" {
  name                = "${var.prefix}-face"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Face"
  sku_name            = "S0"
  
  tags = var.tags
}

resource "azurerm_search_service" "search" {
  name                = "${var.prefix}-search"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "standard"
  
  tags = var.tags
}
