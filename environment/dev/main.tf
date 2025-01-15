module "rgmod" {
    source = "../../module/azurerm_resource_gruop"
    rg = var.rg
}  
module "vnetmod" {
    source = "../../module/azurerm_vnet"
    vnet = var.vnet
    depends_on = [module.rgmod]
}
module "subnetmod" {
    source = "../../module/azurem-subnet"
    subnet = var.subnet
    depends_on = [ module.vnetmod ]
} 
module "nicmod" {
    source = "../../module/azurerm_network_interface"
    nic = var.nic
    depends_on = [ module.subnetmod ]
}
module "vmmod" {
    source ="../../module/virtualmachine"
    childvm = var.parentvm
    depends_on = [ module.nicmod ]
} 