1. criar diretório para usuário jenkins
  $ sudo su -
  $ usermod -s /bin/bash jenkins
  $ sudo su - jenkins
  $ id

2. copiar k3s.yaml cluster-to-jenkins .kube/config
  $ cat /etc/rancher/k3s/k3s.yaml

3. criar diretório .kube config p user jenkins
  $ mkdir ~/.kube
  $ vi ~/.kube/config (colar conteúdo config e editar o IP para IP do Cluster)

## Tag de versionamento no Git
1. git tag -a v1.0.0 -m "messagem de commit"
2. git push origin v1.0.0