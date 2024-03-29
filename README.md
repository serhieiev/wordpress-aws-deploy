# WordPress Deployment with Terraform, Ansible, and Docker 🚀

This project provides a template for deploying a WordPress application on AWS using Terraform, Ansible, and Docker.

## Technologies Used 💻

### AWS Services ☁️

- ![EC2](https://img.shields.io/badge/AWS-EC2-orange)
- ![VPC](https://img.shields.io/badge/AWS-VPC-orange)
- ![RDS](https://img.shields.io/badge/AWS-RDS-orange)
- ![Secrets Manager](https://img.shields.io/badge/AWS-Secrets_Manager-orange)

### Remote Backend for Terraform 🗄️

- ![S3](https://img.shields.io/badge/AWS-S3-orange)
- ![DynamoDB](https://img.shields.io/badge/AWS-DynamoDB-orange)

### Infrastructure as Code 🏗️

- ![Terraform](https://img.shields.io/badge/-Terraform-blueviolet)
- ![Ansible](https://img.shields.io/badge/-Ansible-yellow)

### Containerization 📦

- ![Docker](https://img.shields.io/badge/-Docker-blue)


## Prerequisites
```
Terraform v1.3.6
Ansible Core 2.12.5
```

Generate shared ssh key you are going to use with AWS and Azure cloud providers. Use `ssh-keygen` or similar tools for it [How to Use ssh-keygen to Generate a New SSH Key?](https://www.ssh.com/academy/ssh/keygen)

## AWS Setup

1. Create a new IAM user via the AWS Console and add the AdministratorAccess Managed Policy to your IAM user.

2. After the user is created, save the Access Key ID and Secret Access Key. These credentials give access to your AWS account.

3. Set the AWS credentials for the IAM user as the environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY. For example, here is how you can do it in a Unix/Linux/macOS terminal:

```
$ export AWS_ACCESS_KEY_ID=(your access key id)
$ export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

4. Create a password/username pair in AWS Secret Manager that will be used during RDS Database instance creation.

## Remote backend setup

- Create S3 bucket with unique name
- Create DynamoDB table (use any table name of your choice but set the partition key to LockID. Leave the remaining settings as default and click create table)
- Configure Terraform to point to this backend

## Deployment
To deploy modules, copy the `terraform.tfvars.example` using the following command:

```
cp terraform.tfvars.example terraform.tfvars
```

And then edit `terraform.tfvars` as appropriate for your configurations.

Execute the following commands in the root directory:
```
terraform init
terraform apply
```

Review `Outputs:` section and connect to EC2 instance using `aws_ssh_connection_string`.

Execute `wget https://raw.githubusercontent.com/serhieiev/codica/main/compose.yaml` to download `compose.yaml`.

Adjust `compose.yaml` according to your RDS DB settings.

Execute `sudo docker compose up -d`.

Grab the `ip` from the `Outputs:` section and open it in your browser. Finish the WordPress setup.

Enjoy your WordPress application deployed on AWS! 🎉

## Credits

Icons made by [Shields.io](https://shields.io)
