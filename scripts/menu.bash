#!/bin/bash
##
##
server_name=$(hostname)
redis(){
	echo "Follow this manual:"
	echo "https://github.com/google/moodle-on-gcp/blob/main/docs/configuring-redis-cache-with-moodle.md"
}
##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'
##
# Color Functions
##
ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}
menu(){
echo -ne "
Moodle GCP - Setup Menu
$(ColorGreen '1)') Iniciar configurações.
$(ColorGreen '2)') Fazer a instalação de rede.
$(ColorGreen '3)') Iniciar Infraestrutura.
$(ColorGreen '4)') Configurar permissões.
$(ColorGreen '5)') Instalar GKE-Kubernet Cluster.
$(ColorGreen '6)') Instalar Cloud SQL - Mysql.
$(ColorGreen '7)') Instalar FILESTORE - NFS.
$(ColorGreen '8)') Instalar Artifact Registry e criar Moodle Image.
$(ColorGreen '9)') Instalação NS.
$(ColorGreen '10)') Instalação PV.
$(ColorGreen '11)') Instalação PVC.
$(ColorGreen '12)') Deploy Moodle With Helm.
$(ColorGreen '13)') Deploy backend configuration.
$(ColorGreen '14)') Provision a new certificate managed by Google Cloud.
$(ColorGreen '15)') Deploy Ingress - Cloud Load Balancer.
$(ColorGreen '16)') Enable horizontal scale for Pods.
$(ColorGreen '17)') Configure Redis.
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "

        read a
        case $a in
	        1) top ; menu ;;
	        2) cpu_check ; menu ;;
	        3) tcp_check ; menu ;;
	        4) kernel_check ; menu ;;
	        5) all_checks ; menu ;;
	        17) redis;;
		0) exit 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}
# Call the menu function
menu
