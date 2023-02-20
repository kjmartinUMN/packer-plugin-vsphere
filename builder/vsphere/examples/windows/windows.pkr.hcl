# source blocks are generated from your builders; a source can be referenced in
# build blocks. Aabuild block runs provisioner and post-processors on a
# source. Read the documentation for source blocks here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/source
source "vsphere-iso" "example_windows" {
  CPUs                 = 1
  RAM                  = 4096
  RAM_reserve_all      = false
  firmware             = "efi"
  communicator         = "winrm"
  disk_controller_type = ["pvscsi"]
  floppy_files         = ["bootfiles/win2022/datacenter/autounattend.xml",
                          "scripts/common/install-vmtools64.cmd",
                          "scripts/common/initial-setup.ps1"]
  #floppy_img_path      = "[datastore1] ISO/VMware Tools/10.2.0/pvscsi-Windows8.flp"
  guest_os_type        = "windows9Server64Guest"
  cluster              = var.vcenter_cluster
  host                 = var.vcenter_host
  
  datastore            = var.vcenter_datastore
  insecure_connection  = "false"
  iso_paths            = ["[oit-test-001] ISOs/SW_DVD9_Win_Server_STD_CORE_2022_2108.1_64Bit_English_DC_STD_MLF_X22-82986.ISO"]
  network_adapters {
    network_card = "e1000e"
    network      =  var.vm_network
    mac_address          = "00:50:56:bf:1e:a3"
      }
  password = var.vcenter_password
  storage {
    disk_size             = 81920
    disk_thin_provisioned = true
  }
  username       = var.vcenter_username
  vcenter_server = var.vcenter_server
  vm_name        = "HEAT-Pack1"
  winrm_password = "jetbrains"
  winrm_username = "jetbrains"
  
}

# a build block invokes sources and runs provisioning steps on them. The
# documentation for build blocks can be found here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/build
build {
  sources = ["source.vsphere-iso.example_windows"]
  
  provisioner "powershell" {
    scripts = ["${path.root}/setup/setup.ps1"]
  }
}  