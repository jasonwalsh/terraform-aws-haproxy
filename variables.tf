variable "allow_ssh" {
  default     = false
  description = "The user is allowed to use SSH to communicate with the instance"
}

variable "associate_public_ip_address" {
  default     = false
  description = "If specified a public IP address will be assigned to the new instance in a VPC"
}

variable "iam_instance_profile" {
  default     = ""
  description = "The IAM instance profile"
}

variable "image_id" {
  description = "The ID of the AMI, which you can get by calling DescribeImages"
}

variable "instance_type" {
  default     = "m1.small"
  description = "The instance type"
}

variable "key_name" {
  default     = ""
  description = "The name of the key pair"
}

variable "monitoring" {
  default     = true
  description = "Indicates whether detailed monitoring is enabled"
}

variable "security_group_ids" {
  default     = []
  description = "One or more security group IDs"
}

variable "subnet_id" {
  default     = ""
  description = "The ID of the subnet to launch the instance into"
}

variable "tags" {
  default     = {}
  description = "One or more tags for the specified Amazon EC2 resource"
}

variable "user_data" {
  default     = ""
  description = "The user data to make available to the instance"
}

variable "vpc_id" {
  default     = ""
  description = "The ID of the VPC"
}
