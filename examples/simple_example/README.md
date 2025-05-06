# Simple Example <!-- omit in toc -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Intro](#intro)
- [Requirements](#requirements)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Intro

This example shows the creation of a pipeline of `type V1`, that listen to every change on the branch `main`.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>5.80.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.67.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_github_codepipeline"></a> [github\_codepipeline](#module\_github\_codepipeline) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_codestarconnections_connection.github_connection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codestarconnections_connection) | resource |
| [aws_ssm_parameter.test_parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_iam_policy_document.example_extra](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_profile"></a> [profile](#input\_profile) | Aws provider profile | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Aws provider region | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codebuild_role_arn"></a> [codebuild\_role\_arn](#output\_codebuild\_role\_arn) | The Amazon Resource Name (ARN) specifying the role for Codebuild. |
| <a name="output_codepipeline_arn"></a> [codepipeline\_arn](#output\_codepipeline\_arn) | The Amazon Resource Name (ARN) of the CodePipeline. |
| <a name="output_codepipeline_role_arn"></a> [codepipeline\_role\_arn](#output\_codepipeline\_role\_arn) | The Amazon Resource Name (ARN) specifying the role for CodePipeline. |
| <a name="output_ecr_arn"></a> [ecr\_arn](#output\_ecr\_arn) | The Amazon Resource Name (ARN) of the ECR repository. |
| <a name="output_ecr_registry_name"></a> [ecr\_registry\_name](#output\_ecr\_registry\_name) | The name of the ECR repository. |
| <a name="output_ecr_registry_uri"></a> [ecr\_registry\_uri](#output\_ecr\_registry\_uri) | The URL of the ECR repository. |
| <a name="output_parameters_to_read"></a> [parameters\_to\_read](#output\_parameters\_to\_read) | The parameters that were read from SSM. |
<!-- END_TF_DOCS -->