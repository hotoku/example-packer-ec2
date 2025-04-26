packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "commit-hash" {
  type = string
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "learn-packer-linux-aws-${var.commit-hash}" 
  instance_type = "t2.micro"
  region        = "ap-northeast-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-*-24.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name = "learn-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  provisioner "shell" {
    inline = [
      "mkdir -p /packer",
    ]
  }

  provisioner "file" {
    source = "./packer/startup.bash"
    destination = "/packer/startup.bash"
  }

  provisioner "shell" {
    inline = [
      "chmod +x /packer/startup.bash",
      "/packer/startup.bash"
    ]
  }
}
