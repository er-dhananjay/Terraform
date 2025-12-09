resource "aws_instance" "example" {
    instance_type = "t3.micro"
    ami = "ami-0fa3fe0fa7920f68e "
    key_name = "dk"
    vpc_security_group_ids = [ "sg-0b4ace81d68dd0b6d" ]
}