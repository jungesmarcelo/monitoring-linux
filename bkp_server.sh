#!/bin/bash
##########################################################################
#
# BACKUP - CLIENTE
# Autor: Marcelo Junges
# Data: 28/07/2019
# Funcao: Fazer o Backup de todos os dados importantes Servidor
#
# IPS SERVIDORES:
#
#  Servidor     192.168.1.250
#  
#
#########################################################################
#
# Montando Mapeamento da rede
# 
mount -t ntfs /dev/sdd1 /mnt/backup
#
# BKP Full - Servidor -> Arquivos - SSH NO PASSWORD
#
rsync -Cravzp --include=*exe /mnt/rede/dalma/ /mnt/backup/backup_server/dalma/
rsync -Cravzp --include=*exe /mnt/rede/escritorio/ /mnt/backup/backup_server/escritorio/
#
# Desmontando Dispositivo
#
umount /mnt/backup
#
# Arquivo de LOG
#
echo "BKP FINALIZADO - $(date +"%d-%m-%Y %T")" >> /home/suporte/script/BKP_LOG
#
#
##########################################################################
