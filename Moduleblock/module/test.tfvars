#ec2
  web_instance_type           = "t3.small"
  web_ami                     = "ami-02b8269d5e85954ef"
  web_key_name                = "Oct30"
  web_subnet_id               = module.vpc.vpc_web_subnet_id
  web_vpc_security_group_ids  = module.vpc.vpc_web_sg
  web_disable_api_termination = false

#vpc
  vpc_web_cidr      = "10.0.0.0/16"
  vpc_web_subnetA   = "10.0.1.0/24"
  vpc_web_public_ip = true
