#!/bin/bash

docker stop {{ nombre_instancia }}_test 2>&1 >/dev/null
docker rm {{ nombre_instancia }}_test 2>&1 >/dev/null
docker run -d -e "VIRTUAL_HOST={{ dominio }}" -e "VIRTUAL_PORT={{ test_container_odoo_port }}" -e "DB_PORT={{ odoo_config_db_port }}" -e "DB_HOST={{ odoo_config_db_host }}" -e "DB_PASSWORD={{ odoo_config_db_passwd }}" -e "DB_FILTER={{ test_container_db_filter }}" --name {{ nombre_instancia }}_test rubencabrera/praxya-docker:8.0test
