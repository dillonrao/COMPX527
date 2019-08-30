resource "aws_s3_bucket_policy" "bkaq2" {
  bucket = "bkaq2"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Resource": "arn:aws:s3:::bkaq2/*",
      "Sid": "PublicReadGetObject"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}
