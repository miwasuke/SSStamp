data "aws_iam_policy_document" "s3_policy" {
  statement {
    effect = "Allow"
    principals {
      identifiers = ["arn:aws:iam::996996176221:role/terraform-role"]
      type        = "AWS"
    }
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:putObject",
    ]
    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*",
    ]
  }
  statement {
    effect = "Allow"
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "${aws_s3_bucket.this.arn}/*",
    ]
  }
}

