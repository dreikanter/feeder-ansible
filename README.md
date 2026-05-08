# feeder-ansible

Ansible playbooks for provisioning and deploying [feeder](https://github.com/dreikanter/feeder), a Rails application.

Target environment:

- Ubuntu 24.04 (Noble)
- Ruby 4.0.3 (Fullstaq, jemalloc variant)
- Node.js 24
- PostgreSQL, Redis, Nginx, Let's Encrypt
- Puma application server

## Prerequisites

- Ansible installed locally
- SSH key for the target host at `~/.ssh/feeder`
- Secrets repository checked out at `~/src/feeder-ansible-secrets` (must contain `production.key` for Rails credentials)
- Target host listed in `inventory/production`

## Usage

Test SSH connectivity:

```
ansible all -i inventory/production -u root -m ping
```

Provision the host (installs system packages, creates the deploy user, and configures PostgreSQL, Redis, Node.js, Ruby, Nginx, and Let's Encrypt):

```
bash ./provision_production.sh
```

Deploy the application (checks out the configured branch, builds a release, and reloads Puma):

```
bash ./deploy_production.sh
```

## Layout

- `provision.yml` — provisioning playbook (`bootstrap`, `deploy-user`, `postgres`, `redis`, `nodejs`, `ruby`, `nginx`, `letsencrypt` roles)
- `deploy.yml` — deployment playbook (`deploy`, `puma` roles)
- `group_vars/all.yml` — shared variables (app name, paths, versions, repository URL, branch)
- `inventory/production` — production inventory
- `roles/` — role definitions
