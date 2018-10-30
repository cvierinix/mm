# Project Title

Ansible scripts to deploy Jenkins and K8S on AWS

### Prerequisites

```
ansible (minimum 2.6.3)
ansible-vault file with password
amazon infrastructure
```

### Configuring

All configuration is placed under ansible/group_vars directory

### Installing

```
cd ansible
```

Install required roles

```
ansible-galaxy install -r requirements.yml
```

Deploy Jenkins

```
ansible-playbook -i hosts playbooks/jenkins.yaml --vault-password-file=~/vault-mmnix
```

Deploy K8S cluster

```
ansible-playbook roles/aws-k8s-kops-ansible/create.yaml
```
