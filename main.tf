resource aws_security_group "this" {
  
    name    = var.name
    description = var.description
    
    vpc_id  = var.vpc_id

    revoke_rules_on_delete = var.revoke_rules_on_delete
  
    tags = merge( {"Name" = var.name}, var.tags )
}

## Self Rule
resource aws_security_group_rule "self" {
    
    for_each = merge(local.self_ingress_rules, local.self_egress_rules)

    security_group_id = aws_security_group.this.id
    type = each.value.type
  
    from_port = each.value.from_port
    to_port   = each.value.to_port
    protocol = each.value.protocol

    self = true

    description = lookup(each.value, "description", "")
}

## Ingress Rule for Source Security Groups
resource aws_security_group_rule "sourced_sg" {
    
    for_each = merge(local.sourced_sg_ingress_rules, local.sourced_sg_egress_rules)

    security_group_id = aws_security_group.this.id
    type = each.value.type
  
    from_port = each.value.from_port
    to_port   = each.value.to_port
    protocol = each.value.protocol

    source_security_group_id = each.value.source_security_group_id

    description = lookup(each.value, "description", "")
}

## Ingress Rule for IPv4 CIDRs
resource aws_security_group_rule "ipv4" {
    
    for_each = merge(local.ipv4_sg_ingress_rules, local.ipv4_sg_egress_rules)

    security_group_id = aws_security_group.this.id
    type = each.value.type
  
    from_port = each.value.from_port
    to_port   = each.value.to_port
    protocol = each.value.protocol

    cidr_blocks = each.value.cidr_blocks

    description = lookup(each.value, "description", "")
}

## Ingress Rule for IPv6 CIDRs
resource aws_security_group_rule "ipv6" {
    
    for_each = merge(local.ipv6_sg_ingress_rules, local.ipv6_sg_egress_rules)

    security_group_id = aws_security_group.this.id
    type = each.value.type
  
    from_port = each.value.from_port
    to_port   = each.value.to_port
    protocol = each.value.protocol

    ipv6_cidr_blocks = each.value.ipv6_cidr_blocks

    description = lookup(each.value, "description", "")
}