output "bucket_arn" {
  value       = local.bucket_arn
  description = "The ARN of the bucket"
}

output "bucket_id" {
  value       = local.bucket_id
  description = "The ID of the bucket, that is the name"
}

output "website_domain" {
  value       = aws_s3_bucket_website_configuration.temporeale_website_s3.website_domain
  description = "The domain of the website endpoint"
}

output "website_endpoint" {
  value       = aws_s3_bucket_website_configuration.temporeale_website_s3.website_endpoint
  description = "The endpoint URL of the bucket"
}