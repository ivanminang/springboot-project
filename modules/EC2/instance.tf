
resource "aws_instance" "jenkins_master_sonar" {

  count                  = 2  
  ami                    = count.index == 0 ? data.aws_ami.ubuntu.id : data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name    
  subnet_id     = data.aws_subnet.springboot_subnet.id
  vpc_security_group_ids = [data.aws_security_group.existing_sg.id]  
  root_block_device {
    volume_size =  var.volume_size
  }
  user_data = count.index == 0 ? file("${path.module}/scripts/jenkins_master.sh") : file("${path.module}/scripts/sonarqube.sh")

  tags = {
    Name = count.index == 0 ? "jenkins-master" : "sonarqube"
  }
}


resource "aws_instance" "jenkins_slave" {

  # count                  = 2  
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name    
  subnet_id     = data.aws_subnet.springboot_subnet.id
  vpc_security_group_ids = [data.aws_security_group.existing_sg.id]  
  root_block_device {
    volume_size =  var.volume_size
  }
  user_data = file("${path.module}/scripts/jenkins_slave.sh")

  tags = {
    Name = "jenkins-slave"
  }
}

