[![CircleCI](https://circleci.com/gh/jasonwalsh/terraform-aws-haproxy.svg?style=svg)](https://circleci.com/gh/jasonwalsh/terraform-aws-haproxy)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allow\_ssh | The user is allowed to use SSH to communicate with the instance | string | `"false"` | no |
| associate\_public\_ip\_address | If specified a public IP address will be assigned to the new instance in a VPC | string | `"false"` | no |
| iam\_instance\_profile | The IAM instance profile | string | `""` | no |
| image\_id | The ID of the AMI, which you can get by calling DescribeImages | string | n/a | yes |
| instance\_type | The instance type | string | `"m1.small"` | no |
| key\_name | The name of the key pair | string | `""` | no |
| monitoring | Indicates whether detailed monitoring is enabled | string | `"true"` | no |
| security\_group\_ids | One or more security group IDs | list | `<list>` | no |
| subnet\_id | The ID of the subnet to launch the instance into | string | `""` | no |
| tags | One or more tags for the specified Amazon EC2 resource | map | `<map>` | no |
| user\_data | The user data to make available to the instance | string | `""` | no |
| vpc\_id | The ID of the VPC | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| public\_dns\_name | The public DNS name assigned to the instance |
