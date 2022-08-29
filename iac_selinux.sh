#!/bin/bash

#Script para criar um módulo de permissão para o selinux.

echo "Colocando linux no modo Permissivo"
#Coloca o linux em modo Permissive.
setenforce 0

#Comando para ver o log e verificar os denied, vou deixar como comentário por não haver necessidade de visualizar os log no script.
# cat /var/log/audit/audit.log | grep denied

echo 'Criando módulo de permissão'
#Comando que cria o modulo de permissão
cat /var/log/audit/audit.log | grep denied | audit2allow -M zabbix_perm_selinux

#Caso queira visualizar o módulo use o comando abaixo.
#cat zabbix_perm_selinux

echo 'Habilitando módulo'
#Para habilitar o módulo vamos usar esse comando.
semodule -i zabbix_perm_selinux.pp


