variable "my-instance-ami_list" {
  default = ["ami-02b8269d5e85954ef", "ami-00ca570c1b6d79f36"]
}

variable "my-instance-inst-type" {
  default = "t3.micro"
}

variable "my-instance-key_name" {
  default = "dk"
}

variable "my-instance-security_groups" {
  default = "sg-0f2758b7b37e072cf"
}