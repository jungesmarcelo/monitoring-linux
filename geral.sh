#!/bin/bash

DISCO=`df -h`
RAM=`free -m`
DATA=`date +%d-%m-%Y-%H.%M`
RAID=`mdadm --detail /dev/md2`

echo -e "">>/var/log/geral.log
echo -e "************************* INICIO DO BACKUP ************************">>/var/log/geral.log
echo -e "">>/var/log/geral.log
echo -e "Data:\n $DATA">>/var/log/geral.log
echo -e "">>/var/log/geral.log
echo -e "Uso do disco:\n $DISCO">>/var/log/geral.log
echo -e "">>/var/log/geral.log
echo -e "Uso da memoria:\n $RAM">>/var/log/geral.log
echo -e "">>/var/log/geral.log
echo -e "STATUS DO RAID:\n $RAID">>/var/log/geral.log
echo -e "">>/var/log/geral.log

mount /dev/sdc1 /backup
montado=`mount | grep /backup`

if [ -z "$montado" ]; then
	echo "Backup nao aconteceu em: $DATA" >> /var/log/geral.log
	echo "BACKUP NÃO REALIZADO EM $DATA" | mutt -s 'Controle backup Pauli Moveis' -a /var/log/geral.log -- contato@easytecinformatica.com
	echo "BACKUP NÃO REALIZADO EM $DATA" | mutt -s 'Controle backup Pauli Moveis' -a /var/log/geral.log -- barbarapaulidacunha@gmail.com
	exit 1
else

cp -r /dados/Administrativo /backup/backup_diario
cp -r /dados/Compras /backup/backup_diario
cp -r /dados/Estoque /backup/backup_diario
cp -r /dados/Financeiro /backup/backup_diario
cp -r /dados/Marketing /backup/backup_diario
cp -r /dados/PCP /backup/backup_diario
cp -r /dados/Producao /backup/backup_diario
cp -r /dados/RH /backup/backup_diario
cp -r /dados/Comercial/Bruno /backup/backup_diario/Comercial
cp -r /dados/Comercial/Documento\ padrão /backup/backup_diario/Comercial
cp -r /dados/Comercial/Programas /backup/backup_diario/Comercial
cp -r /dados/Comercial/Projetos /backup/backup_diario/Comercial

echo -e "">>/var/log/geral.log
echo "Backup realizado com sucesso em: $DATA" >> /var/log/geral.log
TAMANHO=`du -lhs /backup/backup_diario`
echo -e "">>/var/log/geral.log
echo -e "Tamanho do backup realizado: $TAMANHO">>/var/log/geral.log
echo -e "\n">>/var/log/geral.log

# DESMONTA O PONTO DE MONTAGEM /BACKUP
umount /backup

echo "Backup realizado com sucesso em $DATA" | mutt -s 'Controle de backup Pauli Moveis' -a /var/log/geral.log -- contato@easytecinformatica.com
echo "Backup realizado com sucesso em $DATA" | mutt -s 'Controle de backup Pauli Moveis' -a /var/log/geral.log -- barbarapaulidacunha@gmail.com

fi
