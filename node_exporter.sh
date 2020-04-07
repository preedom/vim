#!/bin/bash
curl -Lo /etc/yum.repos.d/_copr_ibotty-prometheus-exporters.repo https://copr.fedorainfracloud.org/coprs/ibotty/prometheus-exporters/repo/epel-7/ibotty-prometheus-exporters-epel-7.repo
yum install node_exporter -y
echo 'OPTIONS="--collector.textfile.directory /var/lib/node_exporter/textfile_collector --web.listen-address=:16001"' > /etc/sysconfig/node_exporter
netstat -ntulp|grep node_exporter
iptables -A INPUT -s 49.4.26.245 -p tcp --dport 16001 -j ACCEPT
iptables -A INPUT -p tcp --dport 16001 -j DROP
