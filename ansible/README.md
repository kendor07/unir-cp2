# Ansible
This directory contains what is needed to config the infrastructure previously created with terraform.
It will automatize all the steps required to meet the expectations for caso practico 2

### Requirements

* A valid subscription in Azure
* Ansible installed
* Azure CLI installed.
* Some packages may be missed in pyton (pip and python3 may be required)
* Some ansible packages may need to be installed in your system (Please refer to the doc of the module if necessary)
* vars file contain passwords that need to be adapted (web project)
* hosts file needs to be edited for your own environment (web project)

## Structure
The project is split in two different projects (playbooks):
 * cp2_web_playbook.yaml 
    * deploys the web application following the specifications of the caso practico2
 * cp2_kube_playbook.yaml
    * deploys a kubernetes cluster following the specifications of the caso practico2, in this project, mongo will be isntalled
* vars directory
    * it contains to files with variables inside, one for each playbook
* webserver_v2_config
    * Config files necessary to run the web server playbook
* kubernetes_v2_config
    * Config files necessary to run the kubernetes playbook

## vars folder stores the variables for the two projects
 * cp2_web_vars for the web deployment
 * cp2_kube_vars for the kuberntes deployment

## The yaml files can be ran with:
 * ansible-playbook -i hosts [host_file] --private-key [key_file] --ask-vault-password 
    * --ask-vault-password is optional, we have used it to hide the acr password 

## About web deployment
Deploys a web application with autentication and ssl enabled with apache

* [Unir devops course](https://github.com/kendor07/devops)

## About Kubernetes
Create a kubernetes cluster with mongodb

* [Connector](https://github.com/mongodb/mongodb-kubernetes-operator)

The link above goes to the project to the connector that allow us to connect mongo with kubernets

* [Tutorial followed](https://antonputra.com/kubernetes/how-to-install-mongodb-on-kubernetes/)

The link above goes to the project to the connector that allow us to connect mongo with kubernets

### In this project we have linked all the pieces to configure the project in an azure environment using ansible