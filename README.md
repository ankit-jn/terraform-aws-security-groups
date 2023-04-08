## ARJ-Stack: AWS Security Group Terraform module

A Terraform module for configuring Security Groups

### Resources
This module features the following components to be provisioned with different combinations:

- Security Group [[aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)]
- Security Group Rule [[aws_security_group_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)]
    - Ingress
    - Egress

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.22.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.22.0 |

### Examples

Refer [Configuration Examples](https://github.com/ankit-jn/terraform-aws-examples/tree/main/aws-security-groups) for effectively utilizing this module.

### Inputs
| Name | Description | Type | Default | Required | Example|
|:------|:------|:------|:------|:------:|:------|
| <a name="vpc_id"></a> [vpc_id](#input\_vpc\_id) | The ID of the VPC | `string` |  | yes | |
| <a name="name"></a> [name](#input\_name) | Name of the security group | `string` |  | yes | |
| <a name="description"></a> [description](#input\_description) | Security group description | `string` | `Managed by Terraform` | no | |
| <a name="revoke_rules_on_delete"></a> [revoke_rules_on_delete](#input\_revoke\_rules\_on\_delete) | To revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. | `bool` | `false` | no | |
| <a name="ingress_rules"></a> [ingress_rules](#rules) | Configuration List of Map for Security Group Ingress Rules | `list` | `[]` | no | <pre>[<br>   {<br>     rule_name = "Self Ingress Rule"<br>     description = "Self Ingress Rule"<br>     from_port =0<br>     to_port = 0<br>     protocol = "-1"<br>     self = true<br>   },<br>   {<br>     rule_name = "Ingress from IPv4 CIDR"<br>     description = "IPv4 Rule"<br>     from_port = 443<br>     to_port = 443<br>     protocol = "tcp"<br>     cidr_blocks = ["xx.xx.xx.xx/xx", "yy.yy.yy.yy/yy"]<br>   }<br>]<br><pre> |
| <a name="egress_rules"></a> [egress_rules](#_rules) | Configuration List of Map for Security Group Egress Rules | `list` | `[]` | no | |

### Nested Configuration Maps:  

#### Security Group Rule [ Ingress / Egress ]

- `cidr_blocks` Cannot be specified with `source_security_group_id` or `self`.
- `ipv6_cidr_blocks` Cannot be specified with `source_security_group_id` or `self`.
- `source_security_group_id` Cannot be specified with `cidr_blocks`, `ipv6_cidr_blocks` or `self`.
- `self` Cannot be specified with `cidr_blocks`, `ipv6_cidr_blocks` or `source_security_group_id`.

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="rule_name"></a> [rule_name](#input\_rule\_name) | The name of the Rule (Used for terraform perspective to maintain unicity) | `string` |  | yes |
| <a name="description"></a> [description](#input\_description) | Description of the rule. | `string` |  | yes |
| <a name="from_port"></a> [from_port](#input\_from\_port) | Start port (or ICMP type number if protocol is "icmp" or "icmpv6"). | `number` |  | yes |
| <a name="to_port"></a> [to_port](#input\_to\_port) | End port (or ICMP code if protocol is "icmp"). | `number` |  | yes |
| <a name="protocol"></a> [protocol](#input\_protocol) | Protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number | `string \| number` |  | yes |
| <a name="self"></a> [self](#input\_self) | Whether the security group itself will be added as a source to this ingress rule.  | `bool` |  | no |
| <a name="cidr_blocks"></a> [cidr_blocks](#input\_cidr\_blocks) | List of IPv4 CIDR blocks | `list(string)` |  | no |
| <a name="ipv6_cidr_blocks"></a> [ipv6_cidr_blocks](#input\_ipv6\_cidr\_blocks) | List of IPv6 CIDR blocks. | `list(string)` |  | no |
| <a name="source_security_group_id"></a> [source_security_group_id](#input\_source\_security\_group\_id) | Security group id to allow access to/from | `string` |  | no |

### Outputs

| Name | Type | Description |
|:------|:------|:------|
| <a name="security_group_id"></a> [security_group_id](#output\_security\_group\_id) | Security group ID | `string` | 

### Authors

Module is maintained by [Ankit Jain](https://github.com/ankit-jn) with help from [these professional](https://github.com/ankit-jn/terraform-aws-security-groups/graphs/contributors).

