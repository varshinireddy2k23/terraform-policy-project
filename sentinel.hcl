import "tfplan"

main = rule {
  all tfplan.resources.aws_s3_bucket as _, bucket {
    bucket.applied.tags["Environment"] is not null
  }
}
