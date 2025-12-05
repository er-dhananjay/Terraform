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
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl enable httpd
              sudo systemctl start httpd
              cat <<HTML > /var/www/html/index.html
              <!DOCTYPE html>
              <html>
              <head>
                  <title>Welcome to My EC2 httpd Server</title>
                  <style>
                      body {
                          background-color: #f4f4f9;
                          font-family: Arial, sans-serif;
                          text-align: center;
                          padding: 50px;
                      }
                      h1 {
                          color: #2e86c1;
                      }
                      p {
                          font-size: 18px;
                          color: #555;
                      }
                  </style>
              </head>
              <body>
                  <h1>🚀 Welcome DK + Nginx!</h1>
                  <p>This page is served by <b>Nginx</b> running on an Amazon EC2 instance.</p>
              </body>
              </html>
              HTML
          EOF

}

resource "aws_security_group" "my-sg" {
  ingress {
    from_port = 80
    to_port = 80
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
    instance_id = "i-0dcade0a318891491"  
}