variable "region" {
  default = "westeurope"
}

variable "name" {}

variable "worker_count" {
  default = 1
}

variable "tshirt_size" {
  default = "s"
}

locals {
  vm_tshirt_size = {
    s = "Standard_F1s"
    m = "Standard_F2s"
    l = "Standard_F4s"
  }
}
