#/bin/sh
##########################################################################
#
# MONITORAMENTO - CLIENTE 
# Autor: Easytec Infomática - CNPJ 21.326.457/0001-60 - contato@easytecinformatica.com
# Funcao: Monitorar funcoes vitais do servidor
# Data implatação: 28/07/2019
# IP SERVIDOR: 0.0.0.0
#
# Instrucoes de uso:
# implementar no crontab com o seguinte comando
#00 05 * * 7 root /home/suporte/script/estado_servidor | mutt -s "Relatorio de monitoramento cliente" suporteasytec@gmail.com
#########################################################################
#
#
echo "To:contato@easytecinformatica.com"
echo "Subject:Relatorio de monitoramento Cliente"
#
echo ""
echo  "|--------------------------------------------------------------"
echo ""
echo "- Verificacao de rotina do estado do servidor"
echo "Data: `date +%d/%m/%Y-%H:%M:%S`"
echo "Máquina: `hostname`"
echo "Tempo ligado: `uptime`"
echo ""
#
#Estado do HD
echo "- Verificacao do estado dos HDs"
echo ""
#
echo "- Espaco Ocupado"
echo "`df -h`"
echo ""
#
echo "- HD SDA"
echo "`smartctl -a /dev/sda | grep 'SMART overall-health self-assessment test result'`"
echo "`smartctl -a /dev/sda | grep Reallocated_Sector_Ct`"
echo "`smartctl -a /dev/sda | grep Current_Pending_Sector`"
echo ""
#
#echo "- HD SDB"
#echo "`smartctl -a /dev/sdb | grep 'SMART overall-health self-assessment test result'`"
#echo "`smartctl -a /dev/sdb | grep Reallocated_Sector_Ct`"
#echo "`smartctl -a /dev/sdb | grep Current_Pending_Sector`"
#echo ""
#
echo "- HD SDC"
echo "`smartctl -a /dev/sdc | grep 'SMART overall-health self-assessment test result'`"
echo "`smartctl -a /dev/sdc | grep Reallocated_Sector_Ct`"
echo "`smartctl -a /dev/sdc | grep Current_Pending_Sector`"
echo ""
#
#Estado do RAID
#echo "- MDADM /dev/md0"
#echo "`mdadm --detail /dev/md0 2>/dev/null | grep 'State :'`"
#echo "`mdadm --detail /dev/md0 2>/dev/null | grep 'Number'`"
#echo "`mdadm --detail /dev/md0 2>/dev/null | grep '/dev/s'`"
#echo ""
#
#echo "- MDADM /dev/md1"
#echo "`mdadm --detail /dev/md1 2>/dev/null | grep 'State :'`"
#echo "`mdadm --detail /dev/md1 2>/dev/null | grep 'Number'`"
#echo "`mdadm --detail /dev/md1 2>/dev/null | grep '/dev/s'`"
#echo ""
#
#echo "- MDADM /dev/md2"
#echo "`mdadm --detail /dev/md2 2>/dev/null | grep 'State :'`"
#echo "`mdadm --detail /dev/md2 2>/dev/null | grep 'Number'`"
#echo "`mdadm --detail /dev/md2 2>/dev/null | grep '/dev/s'`"
#echo ""
#
#echo "- MDADM /dev/md3"
#echo "`mdadm --detail /dev/md3 2>/dev/null | grep 'State :'`"
#echo "`mdadm --detail /dev/md3 2>/dev/null | grep 'Number'`"
#echo "`mdadm --detail /dev/md3 2>/dev/null | grep '/dev/s'`"
#echo ""
#
#Temperatura
echo "- Temperatura:"
echo "`sensors | grep temp`"
echo ""
#
#RAM
echo "- RAM:"
echo "`free -m`"
echo ""
#
#Backups
echo "- Backups realizados"
echo "`cat /var/log/backup.log`"
echo ""
#
echo "- Relatorio finalizado em `date +%d/%m/%Y-%H:%M:%S`"
echo ""
echo  "|--------------------------------------------"
echo ""
#