#/bin/sh
##########################################################################
#
# MONITORAMENTO - CLIENTE 
# Autor: Marcelo Junges - marcelo0363@hotmail.com
# Funcao: Monitorar funcoes vitais do servidor
# Data implatação: 28/07/2019
# IP SERVIDOR: 0.0.0.0
#
# Instrucoes de uso:
# implementar no crontab com o seguinte comando
#00 21 * * * /scripts/monitoramento.sh | mutt -s "Relatorio de monitoramento cliente" seuemail@suaempresa.com
#Com este comando o script rodará todo dia as 21h.
#########################################################################
#
#
echo "MONITORAMENTO SERVIDOR EASYTEC INFORMATICA"
#
echo ""
echo  "|--------------------------------------------------------------"
echo ""
echo "- Verificacao de rotina do estado do servidor"
echo ""
echo "* Data: `date +%d/%m/%Y-%H:%M:%S`"
echo ""
echo "* Máquina: `hostname`"
echo ""
echo "* Tempo ligado: `uptime | grep up`"
echo ""
echo " Ip Externo: `wget -qO- http://ipecho.net/plain`"
echo ""
#
#Estado do HD
echo "- Verificacao do estado dos HDs"
echo ""
#
echo "=> ESPAÇO OCUPADO"
echo ""
echo "`df -h | grep /dev/sd`"
echo ""
#
#
#OBS: descomentar as linhas de acordo a configuração do seu HD ou RAID no caso do mdadm.
#echo "=> HD SDA"
#echo ""
#echo "`smartctl -a /dev/sda | grep 'SMART overall-health self-assessment test result'`"
#echo "`smartctl -a /dev/sda | grep Reallocated_Sector_Ct`"
#echo "`smartctl -a /dev/sda | grep Current_Pending_Sector`"
#echo ""
#
#echo "=> HD SDB"
#echo "`smartctl -a /dev/sdb | grep 'SMART overall-health self-assessment test result'`"
#echo "`smartctl -a /dev/sdb | grep Reallocated_Sector_Ct`"
#echo "`smartctl -a /dev/sdb | grep Current_Pending_Sector`"
#echo ""
#
#echo "=> HD SDC"
#echo ""
#echo "`smartctl -a /dev/sdc | grep 'SMART overall-health self-assessment test result'`"
#echo "`smartctl -a /dev/sdc | grep Reallocated_Sector_Ct`"
#echo "`smartctl -a /dev/sdc | grep Current_Pending_Sector`"
#echo ""
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
#SENSORES
echo ""
echo "=> SENSORES:"
echo ""
echo "`sensors`"
echo ""
#
#RAM
echo "=> RAM:"
echo "`free -m`"
echo ""
#
#Backups
echo "=> BACKUPS REALIZADOS"
echo "`cat /var/log/backup.log`"
echo ""
#
echo "- Relatorio finalizado em `date +%d/%m/%Y-%H:%M:%S`"
echo ""
echo  "|--------------------------------------------"
echo ""
#
