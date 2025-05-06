output "bucket_arn" {
  value       = module.s3_static_website.bucket_arn
  description = "ARN of the S3 bucket"
}

output "bucket_id" {
  value       = module.s3_static_website.bucket_id
  description = "ID of the S3 bucket"
}

output "website_domain" {
  value       = module.s3_static_website.website_domain
  description = "Domain of the S3 bucket"
}

output "website_endpoint" {
  value       = module.s3_static_website.website_endpoint
  description = "Endpoint of the S3 bucket"
}

output "file_uploaded" {
  value = module.s3_static_website.files_to_upload
}