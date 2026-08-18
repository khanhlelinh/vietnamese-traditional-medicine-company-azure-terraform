# Contributing

First off, thank you for considering contributing to this project!

## How to Contribute
1. Fork the repository.
2. Create a new feature branch (`git checkout -b feature/your-feature-name`).
3. Make your changes.
4. Ensure your code passes all pre-commit hooks.
5. Commit your changes following the commit message conventions.
6. Push to your branch (`git push origin feature/your-feature-name`).
7. Open a Pull Request.

## Branch Naming Convention
Please use the following prefixes for your branches:
- `feature/` - for new features or infrastructure additions
- `fix/` - for bug fixes
- `docs/` - for documentation updates
- `refactor/` - for code refactoring

## Commit Message Conventions
We follow conventional commits. Examples:
- `feat: add Azure API Management to integration module`
- `fix: correct NSG rules in security module`
- `docs: update README with architecture diagram`

## PR Process
- Ensure the PR description clearly explains the changes.
- CI workflows (Terraform format, validate, Checkov, tfsec) must pass before a PR can be merged.
- At least one code review approval is required.

## Code Style
- All Terraform code must be formatted using `terraform fmt`.
- Follow standard HashiCorp Terraform styling conventions.

## Pre-commit Hooks
You **must** use pre-commit hooks. Install them locally:
```bash
pip install pre-commit
pre-commit install
```
This ensures trailing whitespace, end-of-file fixes, `terraform fmt`, `tfsec`, and `tflint` are run before you commit.
