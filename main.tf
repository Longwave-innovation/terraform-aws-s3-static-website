locals {
  bucket_id  = var.use_existing_bucket ? data.aws_s3_bucket.existing[0].id : aws_s3_bucket.new[0].id
  bucket_arn = var.use_existing_bucket ? data.aws_s3_bucket.existing[0].arn : aws_s3_bucket.new[0].arn
  content_type_map = {
    "html"  = "text/html"
    "css"   = "text/css"
    "js"    = "application/javascript"
    "json"  = "application/json"
    "xml"   = "application/xml"
    "txt"   = "text/plain"
    "md"    = "text/markdown"
    "png"   = "image/png"
    "jpg"   = "image/jpeg"
    "jpeg"  = "image/jpeg"
    "gif"   = "image/gif"
    "svg"   = "image/svg+xml"
    "ico"   = "image/x-icon"
    "pdf"   = "application/pdf"
    "woff"  = "font/woff"
    "woff2" = "font/woff2"
    "ttf"   = "font/ttf"
    "eot"   = "application/vnd.ms-fontobject"
    "otf"   = "font/otf"
  }
}

resource "aws_s3_bucket" "new" {
  count  = var.use_existing_bucket ? 0 : 1
  bucket = var.bucket_name
}

data "aws_s3_bucket" "existing" {
  count  = var.use_existing_bucket ? 1 : 0
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "enable_public" {
  bucket                  = local.bucket_id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "temporeale_website_s3" {
  bucket = local.bucket_id
  index_document {
    suffix = var.index_file
  }
  error_document {
    key = var.error_file
  }
  routing_rules = var.routing_rules
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  depends_on = [aws_s3_bucket_public_access_block.enable_public]
  bucket     = local.bucket_id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicRead"
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "${local.bucket_arn}",
          "${local.bucket_arn}/*"
        ]
      },
    ]
  })
}

resource "aws_s3_bucket_cors_configuration" "rules" {
  bucket = local.bucket_id
  dynamic "cors_rule" {
    for_each = var.cors_rules
    content {
      allowed_headers = cors_rule.value.allowed_headers
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      expose_headers  = cors_rule.value.expose_headers
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }
}

resource "aws_s3_object" "upload" {
  for_each = fileset(var.directory_to_upload, "**")
  bucket   = local.bucket_id
  key      = each.value
  source   = "${var.directory_to_upload}/${each.value}"
  etag     = filemd5("${var.directory_to_upload}/${each.value}")
  server_side_encryption = null
  # Determine content type based on file extension
  content_type = lookup(
    local.content_type_map,
    length(regexall("\\.([^.]+)$", each.value)) > 0 ? lower(replace(regexall("\\.([^.]+)$", each.value)[0][0], ".*\\.", "")) : "",
    "application/octet-stream"
  )
}

output "files_to_upload" {
  value = { for file in fileset(var.directory_to_upload, "**") : file => {
    type: lookup(
      local.content_type_map,
      length(regexall("\\.([^.]+)$", file)) > 0 ? lower(replace(regexall("\\.([^.]+)$", file)[0][0], ".*\\.", "")) : "",
      "application/octet-stream"
    ),
    ext: regexall("\\.([^.]+)$", file)
  }}
  description = "List of files to upload"
}