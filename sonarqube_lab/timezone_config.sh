#!/bin/bash

sudo ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# instalando ntpdate br
sudo yum install ntpdate -y
sudo ntpdate a.ntp.br
sudo systemctl enable ntpdate
sudo systemctl start ntpdate