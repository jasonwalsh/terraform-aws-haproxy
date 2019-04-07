module "haproxy" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "1.20.0"

  ami                         = "${var.image_id}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  iam_instance_profile        = "${var.iam_instance_profile}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  monitoring                  = "${var.monitoring}"
  name                        = "HAProxy"
  subnet_id                   = "${var.subnet_id}"
  tags                        = "${var.tags}"
  user_data                   = "${var.user_data}"

  vpc_security_group_ids = [
    "${module.allow_ssh.this_security_group_id}",
    "${var.security_group_ids}",
  ]
}

module "allow_ssh" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "2.16.0"

  create = "${var.allow_ssh}"

  ingress_cidr_blocks = [
    "0.0.0.0/0",
  ]

  name   = "SSH"
  tags   = "${var.tags}"
  vpc_id = "${var.vpc_id}"
}
