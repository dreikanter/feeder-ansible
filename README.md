# Ansible automation for Rails

Ansible-based provisioning and deployement automation for Rails project. Compatible with Ubuntu 16.04 and Vagrant.

Provision staging:

```
ansible-playbook -i inventory/staging -vvvv provision.yml
```

Provision production:

```
ansible-playbook -i inventory/production -vvvv provision.yml
```

Deploy to staging:

```
ansible-playbook -i inventory/staging -vvvv deploy.yml
```
