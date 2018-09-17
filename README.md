# Ansible automation for Rails

Ansible-based provisioning and deployement automation for Rails project. Compatible with:

- Ubuntu 18.04 x64
- Ansible 2.6

Provision production:

```
bash ./provision_production.sh
```

Deploy to production:

```
bash ./deploy_production.sh
```

SSH connection test:

```
ansible all -i inventory/production -u root -m ping
```
