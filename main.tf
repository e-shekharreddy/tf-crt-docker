resource "aws_instance" "docker" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  security_groups = [var.sg-id]
  user_data = file("docker.sh")

  tags = {
    Name = "docker"
    Project = "docker-roboshop"

  }
}



