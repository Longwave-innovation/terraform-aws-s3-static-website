<!-- BEGIN_TF_DOCS -->
# My Terraform Module

Description of the Terraform Module

## Using this as Git Template

**IMPORTANT!!!**

IF you are using this repo as a template to create a new one, for a Terraform module, there are some changes to apply before proceeding to commit on the new Repo:

1. Delete completely the `CHANGELOG.md` file, to avoid wrong versions or description.
2. Update the file `package.json` with the correct info about the starting version, or author or anything else.

## Actions

### On Pull Requests

When a `Pull Request` is opened or updated, an action to create or update the module's README is triggered.

Upon termination the action pushes the updated code the the same `Pull Request`, with a commed that doesn't trigger a new one.

After the git push is done the code markdown linting is checked to check the syntax correctness.

### On Push

When a `Push` is made to the `main` branch, an action to create a `tag`, a `release` and a `changelog` udpate is triggered.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.67.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->