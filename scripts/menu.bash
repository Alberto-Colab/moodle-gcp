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
$(ColorGreen '1)') Edit Variables ENVS.
$(ColorGreen '2)') Initial Setup.
$(ColorGreen '3)') Deploy network resources.
$(ColorGreen '4)') Deploy linux server.
$(ColorGreen '5)') Setup permissions.
$(ColorGreen '6)') Deploy GKE-Kubernet Cluster.
$(ColorGreen '7)') Deploy Cloud SQL - Mysql.
$(ColorGreen '8)') Deploy FILESTORE - NFS.
$(ColorGreen '9)') Deploy Artifact Registry and Moodle Image.
$(ColorGreen '10)') Deploy NameSpace NS .
$(ColorGreen '11)') Deploy PV.
$(ColorGreen '12)') Deploy PVC.
$(ColorGreen '13)') Deploy Moodle With Helm.
$(ColorGreen '14)') Deploy backend configuration.
$(ColorGreen '15)') Provision a new certificate managed by Google Cloud.
$(ColorGreen '16)') Deploy Ingress - Cloud Load Balancer.
$(ColorGreen '17)') Enable horizontal scale for Pods.
$(ColorGreen '18)') Configure Redis.
$(ColorGreen '20)') I'm in a hurry (Do all process together).
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "

        read a
        case $a in
	        1) top ; menu ;;
	        2) cpu_check ; menu ;;
	        3) tcp_check ; menu ;;
	        4) kernel_check ; menu ;;
	        5) all_checks ; menu ;;
	        18) redis;;
		0) exit 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}
# Call the menu function
menu
