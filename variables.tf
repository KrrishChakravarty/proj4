variable "user_name" {
  type    = string
  default = "proj4-s3-reader"
}

variable "s3_read_policy" {
  description = "IAM policy JSON giving read-only access to S3"
  type        = string
  default     = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListAllMyBuckets",
        "s3:ListBucket",
        "s3:GetObject"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}
