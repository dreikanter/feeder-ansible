# By default this will release the "release" branch
# ansible-playbook --inventory=inventory/production -vvvv ./provision.yml

# This command releases explicitly defined branch
# ansible-playbook --inventory=inventory/production -vvv ./deploy.yml -e git_branch=master
