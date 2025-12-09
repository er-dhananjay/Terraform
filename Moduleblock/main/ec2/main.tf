resource "aws_instance" "web" {
    instance_type = var.webserver_instance_type
    ami = var.web_ami
    key_name = var.web_key_name
    subnet_id = var.web_subnet_id
    vpc_security_group_ids = [ var.web_vpc_security_group_ids ]
    disable_api_termination = var.web_disable_api_termination
    user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install nginx -y
                sudo systemctl start nginx -y
                sudo systemctl enable nginx -y
                cat <<HTML > /var/www/html/index.html
                <html>
                <h1> Hello DK <h1>
                <h2> from terraform module block <h2>
                <html>
                HTML

                systemctl restart nginx
                systemctl enable nginx
                EOF
}