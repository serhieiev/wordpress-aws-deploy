module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source = "./modules/ec2"
  
  ssh_pub_key_file  = var.ssh_pub_key_file
  ssh_priv_key_file = var.ssh_priv_key_file

  allocation_id          = module.vpc.eip_id
  subnet_id              = module.vpc.wp_private_subnet_id
  vpc_security_group_ids = module.vpc.wp_security_group_id
}

module "lb" {
  source = "./modules/lb"

  subnets         = module.vpc.lb_public_subnet_ids
  security_groups = module.vpc.lb_security_group_id

  vpc_id           = module.vpc.vpc_id
  target_group_arn = module.vpc.lb_target_group_arn
  target_id        = module.ec2.instance_id

}

data "aws_secretsmanager_secret_version" "rds_creds" {
  secret_id = "WP_MYSQL"
}

locals {
  mysql_creds = jsondecode(
    data.aws_secretsmanager_secret_version.rds_creds.secret_string
  )
}

module "rds" {
  source = "./modules/rds"

  username = local.mysql_creds.username
  password = local.mysql_creds.password

  db_subnet_group_name   = module.vpc.db_subnet_group_name
  vpc_security_group_ids = module.vpc.db_security_group_id

}

resource "time_sleep" "wait_30_seconds" {
  create_duration = "30s"
}

resource "null_resource" "instance" {
  depends_on = [module.ec2,
  time_sleep.wait_30_seconds]
  provisioner "local-exec" {
    command = <<EOT
      ansible-playbook  -i ${module.vpc.public_eip}, --become-user=root playbook.yaml
    EOT
  }
}

