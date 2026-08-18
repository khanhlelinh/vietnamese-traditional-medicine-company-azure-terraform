# ☁️ Azure Cloud Modernization for Vietnamese Traditional Medicine Company

[![Terraform Version](https://img.shields.io/badge/Terraform-%3E%3D1.5-blue.svg)](https://www.terraform.io/)

[![Azure Cloud](https://img.shields.io/badge/Cloud-Azure-blue.svg)](https://azure.microsoft.com/)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[![CI/CD](https://github.com/khanhlelinh/vietnamese-traditional-medicine-company-azure-terraform/actions/workflows/terraform.yml/badge.svg)](https://github.com/khanhlelinh/vietnamese-traditional-medicine-company-azure-terraform/actions)

![Solution Architecture](LeKhanhLinh-Vietnamese-Traditional-Medicine-Company-Azure-Solution-Architech-v3.png)

## 📑 Table of Contents
1. [Overview](#-overview)
2. [Prerequisites](#-prerequisites)
3. [Quick Start](#-quick-start)
4. [Project Structure](#-project-structure)
5. [Modules](#-modules)
6. [Environments](#-environments)
7. [Documentation](#-documentation)
8. [Contributing](#-contributing)
9. [License](#-license)
10. [Author](#-author)

## 📖 Overview
I built this Infrastructure as Code (IaC) setup using Terraform to help migrate a Vietnamese Traditional Medicine Company to Microsoft Azure. This setup moves 27 important applications to the cloud, aiming for good uptime, security, and scalability.

My architecture relies on Azure Kubernetes Service (AKS), Azure API Management, Azure SQL, Cosmos DB, and some AI services to update legacy applications.

Automating infrastructure deployment from 3 days down to 30 minutes, ensuring healthcare security standards, and optimizing OPEX costs.

## 🛠️ Prerequisites
Before running this infrastructure, you'll need a few tools:
- **Terraform** (>= 1.5.0): [Download Terraform](https://developer.hashicorp.com/terraform/downloads)
- **Azure CLI**: [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- **Git**: For version control.
- **Pre-commit**: `pip install pre-commit`

**Authentication:**
Log in to your Azure account:
```bash
az login
az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
```

## 🚀 Quick Start
To deploy the infrastructure, navigate to the environment you want to build (e.g., `prod`) and run the standard Terraform workflow:

```bash
cd environments/prod

# Initialize the Terraform working directory
terraform init

# Review the execution plan
terraform plan -out=tfplan

# Apply the changes to Azure
terraform apply "tfplan"
```

## 🗂️ Project Structure
```text
.
├── .github/
│   └── workflows/          # GitHub Actions CI/CD pipelines
├── environments/
│   ├── prod/               # Production environment configurations
│   └── staging/            # Staging environment configurations
├── modules/
│   ├── ai_hub/             # Azure AI and Cognitive Services
│   ├── compute_aks/        # Azure Kubernetes Service clusters
│   ├── databases/          # Azure SQL, CosmosDB, Redis
│   ├── integration/        # API Management, Service Bus, Logic Apps
│   ├── monitoring/         # Log Analytics, App Insights, Azure Monitor
│   ├── networking/         # VNet, Subnets, ExpressRoute, Front Door
│   └── security/           # Key Vault, Defender, WAF, NSGs
├── docs/                   # Documentation and GUI deployment guides
├── .pre-commit-config.yaml # Pre-commit hook configurations
├── CHANGELOG.md            # Release history
├── CONTRIBUTING.md         # Contribution guidelines
├── LICENSE                 # Project license
├── Makefile                # Useful commands for common operations
└── README.md               # This file
```

## 🧩 Modules
I separated the infrastructure into these reusable modules:

| Module | Description | Link |
|--------|-------------|------|
| **networking** | Core network topology: Hub-Spoke VNet, VPN/ExpressRoute, Azure Front Door, App Gateway. | [networking](modules/networking) |
| **security** | Identity & Security: Azure Key Vault, Managed Identities, Network Security Groups, Azure Defender. | [security](modules/security) |
| **compute_aks** | Container Orchestration: Azure Kubernetes Service (AKS) with Node Pools and RBAC. | [compute_aks](modules/compute_aks) |
| **databases** | Data Persistence: Azure SQL Database Elastic Pools, Cosmos DB, Azure Cache for Redis. | [databases](modules/databases) |
| **integration** | Messaging & APIs: API Management, Azure Service Bus, Event Grid, Logic Apps. | [integration](modules/integration) |
| **ai_hub** | Analytics: Azure OpenAI, Cognitive Services, Machine Learning Workspaces. | [ai_hub](modules/ai_hub) |
| **monitoring** | Observability: Azure Monitor, Log Analytics Workspace, Application Insights, Alerts. | [monitoring](modules/monitoring) |

## 🌍 Environments
Here is my environment strategy for safe deployments:
- **`staging`**: Pre-production environment for integration testing and QA validation. Mirrors production but scaled down to save on costs.
- **`prod`**: Production environment serving end-users. Includes multi-region deployments for disaster recovery where applicable.

## 📚 Documentation
For users who prefer the Azure Portal GUI or need visual deployment steps, here is my comprehensive guide:
- [Azure Portal GUI Step-by-Step Guide](docs/) (Contains detailed instructions with screenshots)

## 🤝 Contributing
Feel free to open a PR if you want to improve this infrastructure! Please see my [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on branch naming, commit messages, PR processes, and required pre-commit hooks.

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ✍️ Author
**Le Khanh Linh**

---
*Built with ❤️ for the Vietnamese Traditional Medicine Company.*
