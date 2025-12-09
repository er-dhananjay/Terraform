module "ec2" {
    source = "/home/dk/Terraform/Moduleblock/main/ec2"
    webserver_instance_type = "t3.micro"
    web_ami = "ami-02b8269d5e85954ef"
    web_key_name = "dk"
    web_subnet_id = module.vpc.vpc_web_subnet_id
    web_vpc_security_group_ids = module.vpc.vpc_web_sg
    web_disable_api_termination = false
}

module "vpc" {
    source = "/home/dk/Terraform/Moduleblock/main/vpc"
    vpc_web_cidr = "10.0.0.0/16"
    vpc_web_subnetA = "10.0.1.0/24"
    public_ip = true
}