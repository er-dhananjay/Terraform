output "webserver_pubip" {
  value = aws_instance.webserver.public_ip
}
output "webserver_inst_id" {
  value = aws_instance.webserver.id
}
output "webserver_privateip" {
  value = aws_instance.webserver.private_ip
}
output "webserver_sg_id" {
  value = aws_security_group.my-sg.id
}
