locals {

    ## Ingress Rules Segregation
    self_ingress_rules = { for rule in var.ingress_rules : format("%s.%s", "Ingress", rule.rule_name) => merge(rule, {type = "ingress"}) if lookup(rule, "self", false) }
    sourced_sg_ingress_rules = { for rule in var.ingress_rules : format("%s.%s", "Ingress", rule.rule_name) => merge(rule, {type = "ingress"}) if (lookup(rule, "source_security_group_id", "") != "") }
    ipv4_sg_ingress_rules = { for rule in var.ingress_rules : format("%s.%s", "Ingress", rule.rule_name) => merge(rule, {type = "ingress"}) if (lookup(rule, "cidr_blocks", "") != "") }
    ipv6_sg_ingress_rules = { for rule in var.ingress_rules : format("%s.%s", "Ingress", rule.rule_name) => merge(rule, {type = "ingress"}) if (lookup(rule, "ipv6_cidr_blocks", "") != "") }

    ## Egress Rules Segregation
    self_egress_rules = { for rule in var.egress_rules : format("%s.%s", "Egress", rule.rule_name) => merge(rule, {type = "egress"}) if lookup(rule, "self", false) }
    sourced_sg_egress_rules = { for rule in var.egress_rules : format("%s.%s", "Egress", rule.rule_name) => merge(rule, {type = "egress"}) if (lookup(rule, "source_security_group_id", "") != "") }
    ipv4_sg_egress_rules = { for rule in var.egress_rules : format("%s.%s", "Egress", rule.rule_name) => merge(rule, {type = "egress"}) if (lookup(rule, "cidr_blocks", "") != "") }
    ipv6_sg_egress_rules = { for rule in var.egress_rules : format("%s.%s", "Egress", rule.rule_name) => merge(rule, {type = "egress"}) if (lookup(rule, "ipv6_cidr_blocks", "") != "") }

}