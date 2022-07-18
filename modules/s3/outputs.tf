output "s3_domain" {
  description = "Domain for S3"
  value       = aws_s3_bucket.cloudfront_bucket.bucket_regional_domain_name
}

output "bucket_name" {
  description = "Podcast bucket"
  value       = aws_s3_bucket.podcast_bucket.bucket
}

output "bucket_id" {
  description = "ID for Podcast bucket"
  value       = aws_s3_bucket.podcast_bucket.id
}

output "bucket_arn" {
  description = "ARN for Podcast bucket"
  value       = aws_s3_bucket.podcast_bucket.arn
}