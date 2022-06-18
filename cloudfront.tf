# ---------------------------------------------------------------------------
# S3 bucket for CloudFront distribution
# ---------------------------------------------------------------------------

resource "aws_s3_bucket" "cloudfront_bucket" {      #TODO mover esto a un s3.tf para todos los buckets
  bucket = "${local.cloudfront_bucket_name}"

  tags = {
    Name = "Cloudfront bucket"
  }
}

resource "aws_s3_bucket_acl" "b_acl" {
  bucket = aws_s3_bucket.cloudfront_bucket.id
  acl    = "private"
}

# ---------------------------------------------------------------------------
# CloudFront distribution
# ---------------------------------------------------------------------------
resource "aws_cloudfront_distribution" "this" {
  origin {
    domain_name = replace(aws_api_gateway_deployment.this.invoke_url, "/^https?://([^/]*).*/", "$1")
    origin_id   = "apigw"
    origin_path = "/podcast"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Cloudfront"
  default_root_object = "index.html"

  logging_config {
    include_cookies = false
    bucket          = "cflogs.s3.amazonaws.com"
    prefix          = "cloudfront"
  }

  aliases = ["podcastupload.com"]

  # Cache behavior with precedence 0
  ordered_cache_behavior {
    path_pattern     = "/api/*"
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "apigw"

    forwarded_values {
      query_string = true

      cookies {
        forward = "all"
      }
    }

    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_200"

  tags = {
    Environment = "production"
  }
}