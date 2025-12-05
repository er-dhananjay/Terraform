resource "aws_instance" "webserver" {
    ami = "ami-0f00d706c4a80fd93"
    instance_type = "t3.micro"
    key_name = "mykey"
    vpc_security_group_ids = ["sg-0b4ace81d68dd0b6d"]
}
