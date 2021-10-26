terraform {
  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = "1.2.0"
    }
  }
}

data "nutanix_cluster" "cluster" {
  name = var.cluster_name
}
data "nutanix_subnet" "subnet" {
  subnet_name = var.subnet_name
}

provider "nutanix" {
  username     = var.user
  password     = var.password
  endpoint     = var.endpoint
  insecure     = true
  wait_timeout = 60
}

resource "nutanix_image" "linux_image" {
  count       = var.linux_count
  name        = var.linux_image_name
  description = var.linux_image_description
  source_uri  = var.linux_image_source_uri
}

data "template_file" "linux_cloud_init" {
  count    = var.linux_count
  template = file("cloud-init")
  vars = {
    cid           = var.falcon_cid
    client_id     = var.falcon_client_id
    client_secret = var.falcon_client_secret
    falcon_cloud  = var.falcon_cloud
    image_pass    = var.linux_image_password
  }
}

resource "nutanix_virtual_machine" "linux_vm" {
  count                                    = var.linux_count
  name                                     = var.vm_name
  cluster_uuid                             = data.nutanix_cluster.cluster.id
  num_vcpus_per_socket                     = var.num_vcpus_per_socket
  num_sockets                              = var.num_cpu
  memory_size_mib                          = var.ram
  guest_customization_cloud_init_user_data = base64encode("${element(data.template_file.linux_cloud_init.*.rendered, count.index)}")

  disk_list {
    data_source_reference = {
      kind = "image"
      uuid = nutanix_image.linux_image[count.index].id
    }
  }

  disk_list {
    disk_size_mib = (var.disk_size_gb * 1024)
    device_properties {
      device_type = var.disk_type
      disk_address = {
        adapter_type = var.disk_adapter_type
        device_index = var.disk_device_index
      }
    }
  }

  nic_list {
    subnet_uuid = data.nutanix_subnet.subnet.id
  }
}
