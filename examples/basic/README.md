# Basic Example

This is a simple usage example that demonstrates how to instantiate the Azure infrastructure modules.

It includes hardcoded values for simplicity and provisions a resource group containing:
- Networking
- Monitoring
- Compute (AKS)
- Security (FrontDoor, Key Vault)
- Databases (Azure SQL)
- Integration (API Management)
- AI Hub (Cognitive Services)

## Usage

1. Fill in `tenant_id` and `sql_admin_password` with appropriate values.
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Apply the configuration:
   ```bash
   terraform apply
   ```
