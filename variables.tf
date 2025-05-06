variable "bucket_name" {
  type        = string
  description = "Name of the bucket"
}

variable "use_existing_bucket" {
  type        = bool
  description = "When using an existing Bucket, the bucket's name must be set via `bucket_name`"
  default     = false
}

variable "index_file" {
  type        = string
  description = "The first page loaded when the website is loaded"
  default     = "index.html"
}

variable "error_file" {
  type        = string
  description = "The page loaded when an error occurs"
  default     = "error.html"
}

variable "routing_rules" {
  type        = string
  default     = ""
  description = "Variable to define additional routig rules. See [documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration#with-routing_rules-configured)"
}

variable "cors_rules" {
  type = list(object({
    allowed_headers = list(string),
    allowed_methods = list(string),
    allowed_origins = list(string),
    expose_headers  = list(string),
    max_age_seconds = number 
  }))
  default = [
    {
      allowed_headers = ["*"]
      allowed_methods = ["GET"]
      allowed_origins = ["*"]
      expose_headers  = []
      max_age_seconds = 300
    }
  ]
  description = "Variable to define CORS rules. See [documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration#cors_rule)."
}

variable "directory_to_upload" {
  type        = string
  description = "The directory to upload to the bucket"
  default     = "./site"
}

variable "extra_content_type_map" {
  type = map(string)
  default = {}
  description = "You can define extra extension mapping for their content type, this map will override current defaults."
}