# ---------------------------------------------------------------------------
# CloudFront distribution
# ---------------------------------------------------------------------------
resource "aws_cloudfront_distribution" "cf_distro" {
 
 # ---------- aca cuando tengamos la layer de presentacion le sumamos un origin extra -----------------
  origin {
    
    domain_name = "${aws_s3_bucket.cloudfront_bucket.bucket_regional_domain_name}"
    origin_id   = "${local.s3_origin_id}"

    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Cloudfront"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${local.s3_origin_id}"

    forwarded_values {
      query_string = true

      cookies {
        forward = "all"
      }
    }

    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
    viewer_protocol_policy = "allow-all"
  }

  price_class = "PriceClass_200"

  tags = {
    Environment = "production"
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE"]
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}