# Suricata

Install script for Suricata with logging via Filebeat to Elasticsearch.

Elasticsearch stack is provided for demonstration purposes via `docker-compose.yaml`.

## Requirements

Suricata:
- Debian linux with accessible network interface

ElasticSearch:
- Docker
- Docker Compose

## Usage

filebeat.yml:
- Set ElasticSearch connection settings under `output.elasticsearch`.

suricata.yaml:
- Set `HOME_NET` to local network CIDR under `address-groups`.
- Set `interface` to monitored network interface under `af-packet`.
- Set `interface` to monitored network interface under `pcap`.

Bring up demo ElasticSearch stack with `docker-compose up`.

Install Suricata and Filebeat on monitoring machine via `sudo sh install.sh`.

Access Kibana at http://localhost:5601 and create index pattern `suricata-*`.
