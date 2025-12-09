module "ec2" {
    source = "C:\Users\DHANANJAY\Desktop\Terraform"
    webserver_instance_type = "t3.micro"
    web_ami = "ami-02b8269d5e85954ef"
    web_key_name = "dk"
    web_subnet_id = 
    web_vpc_security_group_ids = 
    web_disable_api_termination = "false"