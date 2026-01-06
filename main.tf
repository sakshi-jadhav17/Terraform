resource "aws_instance" "example" {
  ami           = "ami-02b8269d5e85954ef"
  instance_type = "t3.micro"
  key_name = "project"
  user_data = <<-EOF
   #!/bin/bash
   sudo -i
   apt update -y
   apt install apache2 -y
   systemctl start apache2
   echo "Update script" > /var/www/html/index.html   
  EOF

  tags = {
    Name = "HelloWorld"
  }
}

