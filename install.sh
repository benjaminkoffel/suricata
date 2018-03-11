#!/bin/bash

# configure sources
apt-get update
apt-get install -y software-properties-common wget apt-transport-https
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
apt-get update

# install filebeat
apt-get install -y filebeat
cp filebeat.yml /etc/filebeat/filebeat.yml
service filebeat start

# install suricata
apt-get install -y suricata
echo "url = http://rules.emergingthreats.net/open/suricata/emerging.rules.tar.gz" >> /etc/oinkmaster.conf
oinkmaster -C /etc/oinkmaster.conf -o /etc/suricata/rules
cp suricata.yaml /etc/suricata/suricata.yaml
service suricata start
