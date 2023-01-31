#!/bin/bash
##
##
server_name=$(hostname)
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
echo "#########################################################"
echo "# Artifact Registry and Moodle Image"
echo "#########################################################"
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
	        1) ./Deploy/variables_envs.sh ; menu ;;
	        2) ./Deploy/initial.sh ; menu ;;
	        3) ./Deploy/network.sh ; menu ;;
	        4) ./Deploy/deploy-server.sh ; menu ;;
	        5) ./Deploy/permissions.sh ; menu ;;
			6) ./Deploy/gke-kubernets.sh ; menu ;;
			7) ./Deploy/cloud-sql.sh ; menu ;;
			8) ./Deploy/filestore-nfs.sh ; menu ;;
			9) ./Deploy/artifact-registry.sh ; menu ;;
			10) ./Deploy/deploy-ns.sh ; menu ;;
			11) ./Deploy/deploy-pv.sh ; menu ;;
			12) ./Deploy/deploy-pvc.sh ; menu ;;
			13) ./Deploy/deploy-moodle-helm.sh ; menu ;;
			14) ./Deploy/deploy-backend ; menu ;;
			15) ./Deploy/deploy-ssl-redirect.sh ; menu ;;
			16) ./Deploy/deploy-cloud-lb.sh ; menu ;;
			17) ./Deploy/deploy_hpa.sh ; menu ;;
			18) ./Deploy/redis.sh ; menu ;;
			#19) ./Deploy/ ; menu ;;
			20) ./Deploy/hurry_up.sh ; menu ;;
		0) exit 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}
# Call the menu function
menu
