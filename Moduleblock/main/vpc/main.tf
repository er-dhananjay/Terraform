resource "aws_vpc" "vpc_web" {
    cidr_block = var.vpc_web_cidr
}

resource "aws_subnet" "vpc_web_subnetA" {
    vpc_id = aws_vpc_web.vpc.id
    cidr_block = var.vpc_web_subnetA
    map_public_ip_on_launch = var.vpc_web_public_ip
}

resource "aws_security_group" "vpc_web_sg" {
    vpc_id = aws_vpc.vpc_web.id
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_block = [ "0.0.0.0/0" ]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_block = [ "0.0.0.0/0" ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_block = [ "0.0.0.0/0" ]
    }
}