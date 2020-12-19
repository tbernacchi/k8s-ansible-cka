# -*- mode: ruby -*-
# # vi: set ft=ruby :

$alias = <<SCRIPT
#!/bin/bash
cat > ~root.bashrc <<EOF
# .bashrc
# User specific aliases and functions

alias rm='rm'
alias cp='cp'
alias mv='mv'
alias ll='ls -lthr --color=auto'

# Source global definitions
 if [ -f /etc/bashrc ]; then
  . /etc/bashrc
 fi
EOF
SCRIPT

##Disable selinux, iptables e enable NTP
$node_script = <<SCRIPT
#!/bin/bash

Disable selinux:
sed -i 's/^\(SELINUX\s*=\s*\).*$/\1disabled/' /etc/selinux/config

##Setup NTP:
cp -pr /etc/localtime /etc/localtime.bkp
ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

apt install -y ntp ntpdate
systemctl enable ntpd

cat > /etc/ntpd.conf <<EOF
driftfile /var/lib/ntp/drift
restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery
restrict 127.0.0.1
restrict -6 ::1
server a.st1.ntp.br
server b.st1.ntp.br
server c.st1.ntp.br
server d.st1.ntp.br
server a.ntp.br
server b.ntp.br
server c.ntp.br
server gos.ntp.br
includefile /etc/ntp/crypto/pw
keys /etc/ntp/keys
EOF

ntpdate -b -v a.st1.ntp.br
systemctl start ntpd

##Disable Firewall:
apt remove --purge firewalld -y
iptables -F
systemctl stop iptables
systemctl disable iptables
SCRIPT

##HOSTS
$host = <<SCRIPT
#!/bin/bash
cat > /etc/hosts <<EOF
127.0.0.1 localhost
192.168.33.100 master13
192.168.33.101 worker02
192.168.33.102 worker03
EOF
SCRIPT

##Vagrant
Vagrant.configure("2") do |config|

##Box
config.vm.box = "bento/ubuntu-16.04"

 config.vm.define :master13 do |master13|
 master13.vm.provider :virtualbox do |v|
   v.name = "master13"
   v.cpus = 2
   v.customize ["modifyvm", :id, "--memory", "2048"]
 end
 master13.vm.network :private_network, ip: "192.168.33.100"
 master13.vm.hostname = "master13"
 master13.vm.provision :shell, :inline => $alias
 master13.vm.provision :shell, :inline => $host
 master13.vm.provision :hostmanager
 end

 config.vm.define :worker02 do |worker02|
 worker02.vm.provider :virtualbox do |v|
   v.name = "worker02"
   v.cpus = 2
   v.customize ["modifyvm", :id, "--memory", "1024"]
 end
 worker02.vm.network :private_network, ip: "192.168.33.101"
 worker02.vm.hostname = "worker02"
 worker02.vm.provision :shell, :inline => $alias
 worker02.vm.provision :shell, :inline => $host
 worker02.vm.provision :hostmanager
 end

# config.vm.define :worker03 do |worker03|
# worker03.vm.provider :virtualbox do |v|
#   v.name = "worker03"
#   v.cpus = 2
#   v.customize ["modifyvm", :id, "--memory", "1024"]
# end
# worker03.vm.network :private_network, ip: "192.168.33.102"
# worker03.vm.hostname = "worker03"
# worker03.vm.provision :shell, :inline => $alias
# worker03.vm.provision :shell, :inline => $host
# worker03.vm.provision :hostmanager
# end
#
end
