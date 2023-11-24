resource "aws_s3_bucket" "this" {
  bucket = "miwasuke-${local.project_name}"
}

resource "aws_s3_bucket_accelerate_configuration" "this" {
  bucket = aws_s3_bucket.this.id
  status = "Enabled"
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = "top.html"
  }
  # TODO: error page
  #  error_document {
  #    key = "error.html"
  #  }

  # TODO: ルーティングルールやるかも
  # https://docs.aws.amazon.com/ja_jp/AmazonS3/latest/userguide/how-to-page-redirect.html
  #  routing_rule {
  #    condition {
  #      key_prefix_equals = "docs/"
  #    }
  #    redirect {
  #      replace_key_prefix_with = "documents/"
  #    }
  #  }
}