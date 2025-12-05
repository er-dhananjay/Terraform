variable "webserver_instance_type" {
    default = "t3.micro"
}
variable "webserver_ami" {
    default = "ami-0d176f79571d18a8f"
}
variable "webserver_key_name" {
    default = "dk"
}
variable "webserver_instance_vpc_security_group_ids" {
    default = "sg-0f2758b7b37e072cf"
}
variable "webserver_disable_api_termination" {
    default = false
}
#variable "webserver_count" {
 #   default = 1
#}
