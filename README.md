# terraform-aws-s3-static-website <!-- omit in toc -->

This modile creates a public S3 bucket and upload a website to it in order to host it.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>5.80.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.new](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_cors_configuration.rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.enable_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_website_configuration.temporeale_website_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_s3_object.upload](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_s3_bucket.existing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the bucket | `string` | n/a | yes |
| <a name="input_cors_rules"></a> [cors\_rules](#input\_cors\_rules) | Variable to define CORS rules. See [documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration#cors_rule). | <pre>list(object({<br>    allowed_headers = list(string),<br>    allowed_methods = list(string),<br>    allowed_origins = list(string),<br>    expose_headers  = list(string),<br>    max_age_seconds = number<br>  }))</pre> | <pre>[<br>  {<br>    "allowed_headers": [<br>      "*"<br>    ],<br>    "allowed_methods": [<br>      "GET"<br>    ],<br>    "allowed_origins": [<br>      "*"<br>    ],<br>    "expose_headers": [],<br>    "max_age_seconds": 300<br>  }<br>]</pre> | no |
| <a name="input_directory_to_upload"></a> [directory\_to\_upload](#input\_directory\_to\_upload) | The directory to upload to the bucket | `string` | `"./site"` | no |
| <a name="input_error_file"></a> [error\_file](#input\_error\_file) | The page loaded when an error occurs | `string` | `"error.html"` | no |
| <a name="input_extra_content_type_map"></a> [extra\_content\_type\_map](#input\_extra\_content\_type\_map) | You can define extra extension mapping for their content type, this map will override current defaults. | `map(string)` | `{}` | no |
| <a name="input_index_file"></a> [index\_file](#input\_index\_file) | The first page loaded when the website is loaded | `string` | `"index.html"` | no |
| <a name="input_routing_rules"></a> [routing\_rules](#input\_routing\_rules) | Variable to define additional routig rules. See [documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration#with-routing_rules-configured) | `string` | `""` | no |
| <a name="input_use_existing_bucket"></a> [use\_existing\_bucket](#input\_use\_existing\_bucket) | When using an existing Bucket, the bucket's name must be set via `bucket_name` | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | The ARN of the bucket |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | The ID of the bucket, that is the name |
| <a name="output_website_domain"></a> [website\_domain](#output\_website\_domain) | The domain of the website endpoint |
| <a name="output_website_endpoint"></a> [website\_endpoint](#output\_website\_endpoint) | The endpoint URL of the bucket |
<!-- END_TF_DOCS -->