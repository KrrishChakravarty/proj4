provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_user" "reader" {
  name          = var.user_name
  force_destroy = true
}

resource "aws_iam_policy" "s3_read" {
  name   = "proj4-s3-read-only"
  policy = var.s3_read_policy
}

resource "aws_iam_user_policy_attachment" "attach" {
  user       = aws_iam_user.reader.name
  policy_arn = aws_iam_policy.s3_read.arn
}

output "user_arn" {
  value = aws_iam_user.reader.arn
}
