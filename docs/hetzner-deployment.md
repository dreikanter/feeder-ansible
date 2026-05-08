# Deploying to a new Hetzner instance

Short guide for bringing up `feeder` on a fresh Hetzner Cloud server.

## 1. Create the server

In the Hetzner Cloud Console:

- **Image:** Ubuntu 24.04 LTS
- **Type:** CX22 or larger (≥ 2 GB RAM recommended; the bootstrap role adds swap automatically)
- **Location:** any
- **SSH key:** upload the public half of `~/.ssh/feeder` (`~/.ssh/feeder.pub`) and select it so `root` login works key-only
- **Firewall:** allow inbound `22`, `80`, `443`

Note the public IPv4 address once the server is running.

## 2. Point DNS at the server

Create an `A` record for `status.fffeeder.com` (the value of `letsencrypt_domain_name` in `group_vars/all.yml`) pointing to the new IP. Let's Encrypt provisioning will fail if DNS is not resolving.

## 3. Update local config

- Replace the IP under `[app]` in `inventory/production` with the new server's address.
- Make sure the secrets repo is checked out at `~/src/feeder-ansible-secrets` and contains `production.key`.

## 4. Verify SSH

```
ansible all -i inventory/production -u root -m ping
```

Accept the host key on first connect. If this fails, fix SSH before going further.

## 5. Provision

```
bash ./provision_production.sh
```

Installs system packages, creates the `deploy` user, and configures PostgreSQL, Redis, Node.js, Ruby, Nginx, and Let's Encrypt.

## 6. Deploy

```
bash ./deploy_production.sh
```

Checks out the `release` branch, builds a release, and reloads Puma. The app is then reachable at `https://status.fffeeder.com`.
