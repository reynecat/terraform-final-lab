#asg.tfdata 

data "ubuntu_ami" " " {
  most_recent = true
  filter {
    name   = "owner-alias"
    values = ["ubuntu"]
  }