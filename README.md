# Odoo

Ansible role to run an odoo docker as a test container.

# Inventario

Inventory files are not inclueded here, please configure your hosts before
trying this role. See ansible documentation to configure your inventory.

## Systems supported

- Ubuntu Xenial (16.04)

## Variables

Importante:

`odoo_config_db_host` debe configurarse con la ip de la máquina que ejecuta
postgresql, de lo contrario odoo no funcionará.
La variable `odoo_config_db_passwd` se corresponde con la contraseña del ROL
odoo en postgres.
El puerto también debe especificarse si no es el estándar 5432.

También conviene revisar el dbfilter. Por defecto, muestra cualquier db que
empiece con alfanuméricos seguidos de "_test". Un caso típico es el dei
filtrar por dominio, en cuyo caso el valor de test_container_db_filter sería:
`"^%d_test"` 

```yaml
odoo_config_db_host: False
odoo_config_db_port: 5432
odoo_config_db_user: odoo
apps_dir: /opt
nombre_instancia: odoo-server
odoo_user: odoo
test_container_odoo_port: 18069
odoo_config_db_passwd: odoo
test_container_db_filter: "(\\w+)_test$"
dominio: "{{ nombre_instancia }}"

```


## Example (Playbook)

TODO: modificar este apartado, que es del rol de odoo.

TODO: modificar este apartado, que es del rol de odoo.

```yaml
- name: Odoo Server
  hosts: odoo_server
  sudo: yes
  roles:
    - odoo
  vars:
    - odoo_config_db_host: pg_server
    - odoo_config_db_user: odoo
    - odoo_repo_type: git
    - odoo_repo_url: https://github.com/odoo/odoo.git
    - odoo_repo_dest: /home/odoo/odoo/server
    - odoo_repo_rev: 8.0
```

When deploying, you can set the passwords with the `--extra-vars` option:

```sh
$ ansible-playbook -i servers servers.yml -l odoo_server --extra-vars "odoo_user_passwd=pAssWorD odoo_config_admin_passwd=SuPerPassWorD odoo_config_db_passwd=PaSswOrd"
```
