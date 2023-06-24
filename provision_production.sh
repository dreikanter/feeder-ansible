PRODUCTION_HOST=188.166.64.60 \
  ansible-playbook --inventory $PRODUCTION_HOST -vvvv ./provision.yml
