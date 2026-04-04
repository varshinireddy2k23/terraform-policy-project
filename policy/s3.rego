package main

# Deny public buckets
deny[msg] {
    some i
    resource := input.resource_changes[i]

    resource.type == "aws_s3_bucket"
    resource.change.after.acl == "public-read"

    msg = sprintf("S3 bucket %v cannot be public", [resource.name])
}

# Deny if encryption resource is NOT present
deny[msg] {
    some i
    bucket := input.resource_changes[i]

    bucket.type == "aws_s3_bucket"

    not has_encryption

    msg = sprintf("S3 bucket %v must have encryption enabled", [bucket.name])
}

# Check if encryption resource exists
has_encryption {
    input.resource_changes[_].type == "aws_s3_bucket_server_side_encryption_configuration"
}
