1. instalar plugin vagrant-vbguest
# vagrant plugin install vagrant-vbguest --plugin-version 0.21

2. instalar dependências
# sudo apt-get install nfs-common nfs-kernel-server

configurar arquivo de inventário em: "/etc/ansible/hosts" e adicionar:
[apps]
app01
[dbs]
db01

Testar conexão:
$ ansible -m ping all

Ansible Galaxy
MySQL
$ ansible-galaxy install geerlingguy.mysql
Maven
$ ansible-galaxy install gantsign.maven
