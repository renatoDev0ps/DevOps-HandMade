1. subir infra com vagrant "vagrant up"
  kube0 - direct box
  kube1 - master node
  kube2, kube3 - worker node

2. acessar kube0 "vagrant ssh kube0"

  2.1. executar:
    $ sudo su -
    $ apt-get update
    $ apt-get install git ansible -y
    $ ssh-keygen
    $ cat /root/.ssh/id_rsa.pub 
      copiar para authorized_key (kube1, kube2, kube3)
      $ vi ~/.ssh/authorized_keys

  2.2. clonar repositório k3s-ansible:
    $ git clone https://github.com/rancher/k3s-ansible

  2.3. criar diretorio:
    $ mkdir k3s-ansible/inventory/group_vars

  2.4. criar arquivo all.yml:
    $ vi k3s-ansible/inventory/group_vars/all.yml

  2.5. criar arquivo hosts.ini
    $ vi k3s-ansible/inventory/hosts.ini

  2.6. acessar diretório k3s-ansible e executar playbook:
    $ cd k3s-ansible
    $ ansible-playbook site.yml -i inventory/hosts.ini

3. acessar kube1 "vagrant ssh kube1":
  3.1. executar:
    $ sudo su -

  3.2. copiar .kube/config:
    $ mkdir .kube
    $ cp /home/vagrant/.kube/config /root/.kube/

  3.3. verificar instalação do cluster:
    $ kubectl get pod -A -o wide

4. resetar instalação
  $ ansible-playbook reset.yml -i inventory/hosts.ini

Perfumaria:
  1. criar alias:
    $ vi /root/.bashrc
      alias k="kubectl"

  2. install kubens:
    $ git clone https://github.com/ahmetb/kubectx /opt/kubectx
      ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
      ln -s /opt/kubectx/kubens /usr/local/bin/kubens

Criar registries insecure:
  $ vi /etc/rancher/k3s/registries.yaml
  $ service k3s restart
