# README #

This repository contains an example set of [Terraform](https://terraform.io) manifests for building a basic Drupal 9 at AWS.

### Prerequisites ###
To Test in local environments
* AWS Account 
* AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) 
* Terraform (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### What does it do? ###

* Provisions AWS security groups
* Provisions a VPC (private network at AWS)
* Provisions an RDS instance with a Drupal database
* Provisions an EC2 instance (for your Drupal app)
* Installs Drupal 9 and relevant dependencies on the EC2 instance

At the end you should have a vanilla Drupal 9.x instance up and running at the endpoint provided in the output.

### How do I get set up? ###

* Install Terraform
* Clone this repo
* Adjust variables.tf if you wish (e.g to change the SSH key, EC2 size, or region to deploy in)
* Create a terraform.tfvars file inside the repo, containing your AWS credentials like so:

```
access_key = "XXXXXXXXXXXXXXXXXXX"
secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```
* Run 'terraform apply'

### Terraform Commands ###
* terraform init
* terraform validate
* terraform plan
* terraform apply
* terraform destroy

### What else can I do with Terraform? ###

A lot more. See the [Terraform docs](https://terraform.io/docs/).
