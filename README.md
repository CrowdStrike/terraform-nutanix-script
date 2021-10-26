# CrowdStrike Falcon Install for Nutanix Prism

### CrowdStrike Falcon Install - Nutanix Terraform Implementation

1. Clone the project
```
$ git clone https://github.com/crowdstrike/terraform-nutanix-script
```
2. Change directory into the project
```
$ cd
```
3. Create a file `<filename>.tfvars`

Add the following to the `<filename>.tfvars`file:

NOTE: You may also choose to use environment variables as `TF_VAR_<variable_name>`

```code
cluster_name  = "<Nutanix Cluster name>"
subnet_name   = "<Nutanix Network subnet for VM network connectivity>"
user          = "<Nutanix cluster login>"
password      = "<Nutanix cluster login password>"
endpoint      = "<Nutanix cluster IP address>"
cid           = "<Falcon Customer ID>"
client_id     = "<Falcon OAUTH CLIENT ID>"
client_secret = "<Falcon OAUTH SECRET>"

linux_image_name        = "Ubuntu (Bionic) 18.04"
linux_image_description = "Ubuntu 18.04"
linux_image_source_uri  = "https://cloud-images.ubuntu.com/bionic/20210928/bionic-server-cloudimg-amd64.img"

vm_name                 = "Ubuntu secured by CrowdStrike"
num_vcpus_per_socket    = "2"
num_cpu                 = "1"
ram                     = "4096"
disk_size_gb            = "10"
disk_type               = "DISK"
disk_adapter_type       = "SCSI"
disk_device_index       = "1"
```

4. Initialize the terraform template

```terraform
terraform init
```
Output
```text

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/template...
- Finding nutanix/nutanix versions matching "1.2.0"...
- Installing hashicorp/template v2.2.0...
- Installed hashicorp/template v2.2.0 (signed by HashiCorp)
- Installing nutanix/nutanix v1.2.0...
- Installed nutanix/nutanix v1.2.0 (signed by a HashiCorp partner, key ID BEA5F795571AD06E)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

5. Apply the Terraform template

```terraform
terraform apply
```
