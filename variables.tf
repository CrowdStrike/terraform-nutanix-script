variable "cluster_name" {
  type        = string
  description = "Nutanix Prism cluster name"
}

variable "subnet_name" {
  type        = string
  description = "Nutanix Prism Subnet for VM network connectivity"
}

variable "password" {
  type        = string
  description = "Nutanix Prism cluster password"
}

variable "endpoint" {
  type        = string
  description = "Nutanix Prism cluster endpoint instance"
}

variable "user" {
  type        = string
  description = "Nutanix cluster login username"
}

variable "falcon_cid" {
  type        = string
  description = "Falcon Customer ID (CID)"
}

variable "falcon_client_id" {
  type        = string
  description = "Falcon OAUTH Client ID"
}

variable "falcon_client_secret" {
  type        = string
  description = "Falcon OAUTH Client Secret"
}

variable "falcon_cloud" {
  type        = string
  default     = ""
  description = "Falcon Cloud platform if not us-1"
}

variable "linux_count" {
  type        = string
  default     = "1"
  description = "Enable building and deploying a Linux VM with CrowdStrike Falcon installed"
}

variable "linux_image_name" {
  type        = string
  description = "Name of the Linux Image"
}

variable "linux_image_description" {
  type        = string
  description = "Description of the Linux Image"
}

variable "linux_image_source_uri" {
  type        = string
  description = "URI of the Source Linux Image"
}

variable "linux_image_password" {
  type        = string
  description = "Default Cloud Image password"
}

variable "vm_name" {
  type        = string
  description = "Nutanix VM name"
}

variable "num_vcpus_per_socket" {
  type        = string
  description = "Number of vCPUs per CPU socket"
}

variable "num_cpu" {
  type        = string
  description = "Number of CPUs"
}

variable "ram" {
  type        = string
  description = "VM Memory size in MiB"
}

variable "disk_size_gb" {
  type        = string
  description = "Disk size in GiB"
}

variable "disk_type" {
  type        = string
  description = "Nutanix Disk type"
}

variable "disk_adapter_type" {
  type        = string
  description = "Nutanix Disk Adapter type (e.g. SCSI)"
}

variable "disk_device_index" {
  type        = string
  description = "Index of Nutanix Disk"
}

