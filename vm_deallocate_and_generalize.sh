#!/bin/bash

#Login to the newly created two machines and execute Step1 & Step2\
#-------------------------------------------------------------------#

#Step1:
#=====
#ls -lR
#sudo /usr/local/bin/pyenv install 3.7.9
#ls -lR ##---> confirm all symlinks are created properly
#Please create the below if not found
#-------------------------------------
#sudo ln -s /home/${USER_ID}/.pyenv/versions/3.7.9/bin/python3.7 /home/${USER_ID}/myagent/_work/_tool/Python/3.7.9/x64/python > /dev/null 2>&1

#Step2:
#======
#sudo waagent -deprovision+user -force 
#exit

#Step3:
#======
#Link: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/capture-image
#Mandatory: Run below Az Cli command from local machine
#---------------------------------------------------------#

az vm deallocate \
	    --resource-group devops_rg \
	        --name Devops_VM
sleep 3;
echo "VM deallocated successfully."

az vm generalize  \
	    --resource-group devops_rg \
	        --name Devops_VM
sleep 2;
echo "VM generalized successfully."

