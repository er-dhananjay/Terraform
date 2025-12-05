resource "aws_instance" "webserver" {
    ami = var.webserver_ami
    instance_type = var.webserver_instance_type
    key_name = var.webserver_key_name
    vpc_security_group_ids = [ var.webserver_instance_vpc_security_group_ids , aws_security_group.my-sg.id , data.aws_security_group.data_webserver_sg.id]
    disable_api_termination = var.webserver_disable_api_termination
    tags = {
      Name = "MyWebServer"
    }
  #  count = var.webserver_count

    user_data = <<-EOF
      #!/bin/sh
      sudo -i
      systemctl start nginx
      systemctl enable nginx
      systemctl start mariadb
      systemctl enable mariadb
      bash /root/apache-tomcat-8.5.97/bin/catalina.sh start
      EOF
}

resource "aws_security_group" "my-sg" {
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}


data "aws_security_group" "data_webserver_sg" {
    name = "launch-wizard-1"  
}
data "aws_ami" "ami" {
  most_recent = true


  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners      = ["amazon"]
}


data "aws_instance" "data_webserver_instance" {
    instance_id = "i-038bc2fed0e40815a"  
}