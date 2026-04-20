module "networks" {
  source = "git::https://github.com/alfonso-morales-g/quadsci-terraform-modules.git//networks?ref=master"

  project_id     = var.project_id
  region         = var.region
  vpc_name       = var.vpc_name
  subnetworks    = var.subnetworks
  firewall_rules = var.firewall_rules
}

module "instances" {
  source = "git::https://github.com/alfonso-morales-g/quadsci-terraform-modules.git//instances?ref=master"

  vpc_name       = var.vpc_name
  instance_configuration = var.instance_configuration

  depends_on = [ module.networks ]
}