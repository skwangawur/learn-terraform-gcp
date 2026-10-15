variable "firewall_name" {
  description = "The name of the firewall rule"
  type        = string
}

variable "network" {
  description = "The network to which the firewall rule applies"
  type        = string
}

variable "priority" {
  description = "The priority of the firewall rule"
  type        = number
  default     = 1000
}

variable "direction" {
  description = "The direction of the firewall rule (INGRESS or EGRESS)"
  type        = string
  default     = "INGRESS"
}

variable "source_ranges" {
  description = "The source IP ranges for the firewall rule"
  type        = list(string)
}

variable "protocol" {
  description = "The protocol for the firewall rule"
  type        = string
  default     = "tcp"
}

variable "ports" {
  description = "The ports for the firewall rule"
  type        = list(string)
}

variable "target_tags" {
  description = "The target tags for the firewall rule"
  type        = list(string)
}
