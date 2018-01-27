variable "docker_version" {
  type        = "string"
  default     = "17.03.0~ce-0~ubuntu-xenial"
  description = "Use 17.12.0~ce-0~ubuntu for arm64"
}

variable "k8s_version" {
  type    = "string"
  default = "stable-1.9"
}

variable "weave_passwd" {
  type    = "string"
  default = "ChangeMe"
}

variable "arch" {
  type        = "string"
  default     = "arm"
  description = "Values: arm arm64 x86_64"
}

variable "region" {
  type        = "string"
  default     = "par1"
  description = "Values: par1 ams1"
}

variable "server_type" {
  type        = "string"
  default     = "C1"
  description = "Use C1 for arm, ARM64-2GB for arm64 and C2S for x86_64"
}

variable "server_type_node" {
  type        = "string"
  default     = "C1"
  description = "Use C1 for arm, ARM64-2GB for arm64 and C2S for x86_64"
}

variable "nodes" {
  type    = "string"
  default = 2
}

variable "ip_admin" {
  type        = "list"
  default     = ["0.0.0.0/0"]
  description = "IP access to services"
}
