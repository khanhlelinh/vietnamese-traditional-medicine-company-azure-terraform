# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2026-08-18
### Added
- Enterprise upgrade
- Added pre-commit hooks configuration (`.pre-commit-config.yaml`)
- Security scanning via GitHub Actions (tfsec, checkov)
- Staging environment (`environments/staging`)
- Examples directory for module usage
- Module specific documentation
- LICENSE (MIT)
- CONTRIBUTING.md guidelines

## [1.1.0] - 2026-08-16
### Added
- Azure Portal GUI Step-by-Step Guide with 10 screenshots in `docs/` directory to assist manual deployments and visual understanding.

## [1.0.0] - 2026-08-16
### Added
- Initial release
- 7 core Terraform modules: `networking`, `security`, `compute_aks`, `databases`, `integration`, `ai_hub`, `monitoring`
- Production environment structure (`environments/prod`)
- GitHub Actions CI/CD pipelines
- Architecture diagram
