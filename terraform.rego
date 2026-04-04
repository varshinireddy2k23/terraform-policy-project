package main

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_s3_bucket"
  resource.change.after.acl == "public-read"
  msg = sprintf("S3 bucket %v has public-read ACL", [resource.change.after.bucket])
}

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_s3_bucket"
  not resource.change.after.server_side_encryption_configuration
  msg = sprintf("S3 bucket %v must have encryption enabled", [resource.change.after.bucket])
}

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  resource.change.after.instance_type == "m5.24xlarge"
  msg = sprintf("Instance type %v is not allowed due to cost", [resource.change.after.instance_type])
}

