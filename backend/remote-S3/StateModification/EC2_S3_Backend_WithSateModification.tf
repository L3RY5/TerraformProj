module "BackendModuleWindows" {
  source = "./modules/backenWithModulesWindows"
}

module "BackendModuleRHEL"{
    source = "./modules/backenWithModulesRHEL"
}
