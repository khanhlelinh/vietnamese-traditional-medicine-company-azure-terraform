resource "azurerm_frontdoor" "fd" {
  name                                         = "${var.prefix}-frontdoor"
  resource_group_name                          = var.resource_group_name
  enforce_backend_pools_certificate_name_check = false

  routing_rule {
    name               = "default-routing"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["default-frontend"]
    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "aks-backend"
    }
  }

  backend_pool_load_balancing {
    name = "lb-settings"
  }

  backend_pool_health_probe {
    name = "health-probe"
  }

  backend_pool {
    name = "aks-backend"
    backend {
      host_header = var.aks_ingress_fqdn
      address     = var.aks_ingress_fqdn
      http_port   = 80
      https_port  = 443
    }
    load_balancing_name = "lb-settings"
    health_probe_name   = "health-probe"
  }

  frontend_endpoint {
    name                              = "default-frontend"
    host_name                         = "${var.prefix}-frontdoor.azurefd.net"
    custom_https_provisioning_enabled = false
    web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.waf.id
  }
}

resource "azurerm_frontdoor_firewall_policy" "waf" {
  name                              = "${replace(var.prefix, "-", "")}waf"
  resource_group_name               = var.resource_group_name
  enabled                           = true
  mode                              = "Prevention"
  
  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"
  }
}

resource "azurerm_key_vault" "kv" {
  name                        = "${var.prefix}-kv"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = true
  
  tags = var.tags
}
