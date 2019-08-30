resource "aws_s3_bucket" "bkaq1" {
  acl            = "private"
  arn            = "arn:aws:s3:::bkaq1"
  bucket         = "bkaq1"
  force_destroy  = false
  hosted_zone_id = "Z3AQBSTGFYJSTF"

  lifecycle_rule {
    abort_incomplete_multipart_upload_days = "0"
    enabled                                = true

    expiration {
      days                         = "90"
      expired_object_delete_marker = false
    }

    id = "serverdata"

    noncurrent_version_expiration {
      days = "180"
    }

    tags {}
  }

  region        = "us-east-1"
  request_payer = "BucketOwner"
  tags          {}

  versioning {
    enabled    = false
    mfa_delete = false
  }
}

resource "aws_s3_bucket_public_access_block" "bkaq1" {
  bucket = "${aws_s3_bucket.bkaq1.id}"

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true

}

resource "aws_s3_bucket" "bkaq2" {
  acl            = "public-read"
  arn            = "arn:aws:s3:::bkaq2"
  bucket         = "bkaq2"
  force_destroy  = false
  region         = "us-east-1"

  versioning {
    enabled    = false
    mfa_delete = false
  }

  website {
    index_document = "index.html"
  }

  website_domain   = "s3-website-us-east-1.amazonaws.com"
  website_endpoint = "bkaq2.s3-website-us-east-1.amazonaws.com"
}
