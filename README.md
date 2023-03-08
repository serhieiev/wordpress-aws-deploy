# Codica task

## Required package(s) for the host machine:
```
Terraform v1.3.6
ansible core 2.12.5
```

Generate shared ssh key you are going to use with AWS cloud provider. Use `ssh-keygen` or similar tools for it [How to Use ssh-keygen to Generate a New SSH Key?](https://www.ssh.com/academy/ssh/keygen)

## AWS Setup

Via AWS Console create a new IAM user and add the `AdministratorAccess` Managed Policy to your IAM user. After user is created save _Access Key ID_ and a _Secret Access Key_, these credentials give access to your AWS account.

For Terraform to be able to make changes in your AWS account, you will need to set the AWS credentials for the IAM user you created above as the environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`. For example, here is how you can do it in a Unix/Linux/macOS terminal:

```
$ export AWS_ACCESS_KEY_ID=(your access key id)
$ export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

Create password/username pair in AWS Secret Manager that will be used during RDS Database instance creation.

## Remote backend setup

- Create S3 bucket with unique name
- Create DynamoDB table (use any table name of your choice but set the partition key to `LockID`. Leave the remaining settings as default and click create table)
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

Execute `wget https://raw.githubusercontent.com/serhieiev/codica/main/compose.yaml` to download `compose.yaml`

Adjust `compose.yaml` according to your RDS DB settings.

Execute `sudo docker compose up -d`

Grab `ip` from the `Outputs:` section and open it in your browser, after that finish WordPress setup. 
