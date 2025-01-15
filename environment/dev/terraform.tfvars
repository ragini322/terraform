rg ={
    rg1 = {
        name = "ragini"
        location ="centralindia"
    }
} 
vnet = {
  vnet1 = {
    name = "childvnet"
    location = "centralindia"
    resource_group_name = "ragini"
    address_space = ["10.0.0.0/16"]
  }
}
subnet = {
    subnet = {
        name = "childsubnet"
         resource_group_name  = "ragini"
         virtual_network_name = "childvnet" 
         address_prefixes     = ["10.0.0.0/24"]
        
    }
}
nic = {
    nic1 = {
        name = "childnic"
        location = "centralindia"
        resource_group_name = "ragini"
        virtual_network_name = "childvnet"
        subnetname = "subnet"
    }
}
parentvm = {
    vm1 = {
        nicname = "childnic"
        name = "childvm"
         resource_group_name = "ragini"
         location = "centralindia"
         


    }
  
}