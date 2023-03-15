# Terraform
This directory contains what is needed to deploy an infrastructure in azure with terraform

### Requirements

* A valid subscription in Azure
* Terraform installed
* Azure CLI installed.

### It deploys

* Virtual machine with ssh connectivity
* ACR Repository in azure
* Kubernetes cluster with one worker

### How to run it:

* login to azure
    * az login
* start terraform
    * terraform init
* optional
    * terraform fmt -- adapts to standard format
    * terraform validate
* executes terraform
    * terraform plan --out=loadbalancerplan -- optional
    * terraform apply [-auto-approve] ["loadbalancerplan"]
* refresh output [optional]
    * terraform refresh
* destroy it all [optional]
    * terraform destroy

### How has it been done:

* file create_a-[resource_name].tf
  * creates the resource in terraform
* file variables_a[resource_name].tf
  * holds the variables of previous files