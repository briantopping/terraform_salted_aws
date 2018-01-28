# Terraform Salted AWS

This is an experimental framework for quickly building salt managed
environments in AWS. It uses terraform to provision the underlying
infrastracture, and provides--what I hope is--an intuitive organization of salt
components (states, pillar, formulas, etc.). The goal is provision an entire
environment (including the salt master) with a single execution of `terraform
apply`, and then enable rapid addition of new services.


## Getting Started

1. Fork this repo
1. Clone your fork
1. Set a name for your site: `export SITE_NAME=site-test`
1. Choose your platform: `export PLATFORM=aws` or `export PLATFORM=xenserver`
1. Create a site directory for assets: `mkdir terraform/sites/${SITE_NAME}`
1. `cp terraform/platforms/${PLATFORM}/terraform.tfvars.example terraform/sites/${SITE_NAME}/terraform.tfvars`
1. Review and update sites/${SITE_NAME}/terraform.tfvars
1. Create your TF environment: `terraform init terraform/platforms/${PLATFORM}`
1. Run `terraform plan --var-file=terraform/sites/${SITE_NAME}/terraform.tfvars terraform/platforms/${PLATFORM}`
1. Run `terraform apply --var-file=terraform/sites/${SITE_NAME}/terraform.tfvars terraform/platforms/${PLATFORM}`
