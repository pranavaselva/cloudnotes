module "network" {
  source   = "./modules/network"
  vpc_name = "${var.project_name}-vpc"
}

module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
}

module "storage" {
  source      = "./modules/storage"
  bucket_name = "${var.project_name}-assets"
}

module "database" {
  source  = "./modules/database"
  vpc_id  = module.network.vpc_id
  db_name = "${var.project_name}-db"
}

module "compute" {
  source         = "./modules/compute"
  vpc_id         = module.network.vpc_id
  app_role_email = module.iam.app_sa_email
  db_endpoint    = module.database.db_endpoint
}
