.PHONY: init plan apply destroy fmt validate docs lint security pre-commit clean

ENV ?= environments/prod

init:
	cd $(ENV) && terraform init

plan: init
	cd $(ENV) && terraform plan

apply: init
	cd $(ENV) && terraform apply -auto-approve

destroy: init
	cd $(ENV) && terraform destroy -auto-approve

fmt:
	terraform fmt -recursive

validate: init
	cd $(ENV) && terraform validate

docs:
	terraform-docs markdown table modules/ > docs/modules.md

lint:
	tflint --recursive

security:
	tfsec .

pre-commit:
	pre-commit run --all-files

clean:
	find . -type d -name ".terraform" -exec rm -rf {} +
	find . -type f -name ".terraform.lock.hcl" -delete
