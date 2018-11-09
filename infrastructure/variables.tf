/*
 * Common
 */

variable "INSTANCE" {
  description = "DNS-compatible Instance Name"
}

variable "ENVIRONMENT" {
  description = "DNS-compatible Environment Name (dev, stag, prod)"
}

variable "REGION" {
  description = "Azure Region"
}

/*
 * AKS
 */

variable "AKS_SSH_ADMIN_KEY" {
  description = "Admin SSH Public Key for AKS Agent VMs"
}

/*
 * K8S
 */

variable "K8S_KUBE_CONFIG" {
  description = "Path to Kube Config File"
}

variable "K8S_HELM_HOME" {
  description = "Path to Helm Home Directory"
}
