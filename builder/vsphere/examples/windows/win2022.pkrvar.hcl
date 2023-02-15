
vcenter_username = "easkjmartin"
 vcenter_password = ""

# vCenter details
vcenter_server = "vc-test01.oit.umn.edu"
vcenter_sslconnection = true
vcenter_datacenter = "TEST01"
vcenter_cluster = "TST"
vcenter_datastore = "oit-test-001"
vcenter_folder = "Packer"

# VM Hardware Configuration
vm_os_type = "windows9Server64Guest"
vm_firmware = "efi"
vm_hardware_version = 17
vm_cpu_sockets = 2
vm_cpu_cores = 1
vm_ram = 4096
vm_nic_type = "vmxnet3"
vm_network = "TEST2_DC05-WG015_10.32.114.0_25_v840"
vm_disk_controller = ["pvscsi"]
vm_disk_size = 20480
vm_disk_thin = true
config_parameters = {
        "devices.hotplug" = "FALSE",
        "guestInfo.svga.wddm.modeset" = "FALSE",
        "guestInfo.svga.wddm.modesetCCD" = "FALSE",
        "guestInfo.svga.wddm.modesetLegacySingle" = "FALSE",
        "guestInfo.svga.wddm.modesetLegacyMulti" = "FALSE"
}

# Removable Media Configuration
vcenter_iso_datastore = "oit-test-001"
os_iso_path = "/ISOs/"
os_iso_file = "SW_DVD9_Win_Server_STD_CORE_2022_2108.1_64Bit_English_DC_STD_MLF_X22-82986.ISO"
vmtools_iso_path = "/ISOs"
vmtools_iso_file = "vmware Tools.iso"
vm_cdrom_remove = true

# Build Settings
build_repo = "https://github.com/cwestwater/packer-vsphere-iso"
vm_convert_template = false
winrm_username = "Administrator"
winrm_password = "VMware1!"

# Provisioner Settings
powershell_scripts = [
    "../../scripts/win2022/disable-tls.ps1",
    "../../scripts/win2022/disable-services.ps1",
    "../../scripts/win2022/remove-features.ps1",
    "../../scripts/win2022/config-os.ps1",
]