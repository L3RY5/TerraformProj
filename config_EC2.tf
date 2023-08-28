
module "EC2ModuleAMZ" {
    source = "../modules/ModuleOfEC2/AMZ"
    instancetype = "t2.micro" # we added in the vartiazbler the default t12.smal. if not changed here during rubtime, then the default  will be used
    
}
module "EC2ModuleRHEL" {
    source = "../modules/ModuleOfEC2/RHEL9"
    
}

module "EC2ModuleWIND" {
    source = "../modules/ModuleOfEC2/Windows"
    
    
}