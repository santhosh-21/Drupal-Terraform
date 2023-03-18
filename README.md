# README #

This repository contains an example set of [Terraform](https://terraform.io) manifests for building a basic Drupal at AWS.

### Prerequisites ###
To Test in local environments
* Setup AWS CLI in your local environment (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) 
* Setup Terraform in your local environment (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* Create an AWS Account (https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/)
* Create an access key from the security credentials (https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html)
* Configure access key and Secret keys using 'aws configure' (https://docs.aws.amazon.com/cli/latest/reference/configure/)
* Create an s3 bucket for storing your terraform state (https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-bucket.html)
* For CI/CD pipelines we are using Azure Devops (https://www.azuredevopslabs.com/labs/vstsextend/terraform/)
* Create an Service Connection to AWS in Azure Devops with the access key and secret keys and region under your repo "/repo_name/_settings/adminservices"
* Configure bucket name and backendServiceAWS (Service Connection Name) in the "provider.tf" file and also in the "azure-pipelines.yml"

### What does it do? ###

* Provisions AWS security groups
* Provisions a VPC (private network at AWS)
* Provisions an RDS instance with a Drupal database
* Provisions an EC2 instance (for your Drupal app)
* Installs Drupal and relevant dependencies on the EC2 instance

At the end you should have a vanilla latest Drupal instance up and running at the endpoint provided in the output.

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
