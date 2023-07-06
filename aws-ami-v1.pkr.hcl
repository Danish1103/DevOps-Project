packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.6"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "amazon-linux" {
  region          = "ap-southeast-2"
  ami_name        = "ami-jen-version-1.0.1-{{timestamp}}"
  instance_type   = "t2.micro"
  source_ami      = "ami-0d6294dcaac5546e4"
  ssh_username    = "ec2-user"
  ami_regions     = [
    "ap-southeast-2"
  ]
}

build {
  name = "hq-packer"
  sources = [
    "source.amazon-ebs.amazon-linux"
  ]

  provisioner "file" {
    source      = "provisioner.sh"
    destination = "/tmp/provisioner.sh"
  }

  provisioner "shell" {
    inline = [
      "chmod +x /tmp/provisioner.sh",
      "ls -la /tmp",
      "pwd",
      "/tmp/provisioner.sh"
    ]
  }
}
