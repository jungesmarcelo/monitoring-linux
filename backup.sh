#!/bin/bash
##########################################################################
#
# BACKUP - CLIENTE
# Autor: Marcelo Junges - marcelo0363@hotmail.com
# Funcao: Fazer o backup diario de todos os dados compartilhados em hd externo
# Data implatação: 28/07/2019
# IP SERVIDOR: 0.0.0.0
#
# Instrucoes de uso:
# implementar no crontab com o seguinte comando
# 00 20 * * * /caminho/do/script.sh
#com este comando o script será executado todo dia as 20h. 
#########################################################################
#
#
# Montando Mapeamento da rede
# 
mount -t ntfs /dev/sdc1 /mnt/backup
#
# Testando se foi montado e entao sincronizando com rsync
#
montado=`mount | grep /backup`
#
if [ -z "$montado" ]; then
	echo "Backup nao aconteceu em: $DATA" >> /var/log/backup.log
	echo "BACKUP NÃO REALIZADO EM $DATA" | mutt -s 'Controle de backup diario' -a /var/log/backup.log -- contato@easytecinformatica.com
	echo "BACKUP NÃO REALIZADO EM $DATA" | mutt -s 'Controle de backup diario' -a /var/log/backup.log -- email@cliente.com.br
	exit 1
else
    rsync -Cravzp  /mnt/rede/pasta1/ /mnt/backup/pasta1
    du -lhs /backup/pasta1 >> /var/log/backup.log
	du -lhs /mnt/rede/pasta1 >> /var/log/backup.log
#
# Desmontando Dispositivo
#
umount /mnt/backup
#
# Arquivo de LOG
#
echo "BKP FINALIZADO - $(date +"%d-%m-%Y %T")" >> /var/log/backup.log
#
#
##########################################################################
