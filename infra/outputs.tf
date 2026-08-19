output "application_ip" {
  value = module.compute.app_ip
}
output "storage_bucket" {
  value = module.storage.bucket_name
}
