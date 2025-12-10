output "vpc_web_subnet_id" {
  value = aws_subnet.vpc_web_subnetA.id
}

output "vpc_web_vpc_id" {
  value = aws_vpc.vpc_web.id
}

output "vpc_web_sg" {
  value = aws_security_group.vpc_web_sg.id
}

output "vpc_web_sg_arn" {
  value = aws_security_group.vpc_web_sg.arn
}
