locals {
  bucket_name = "itba-tp-podcasts-bucket2"
  path        = "./resources"
  cloudfront_bucket_name = "itba-tp-podcasts-cloudfront-bucket"
  s3_origin_id = "podcastS3Origin"
  bucket_ia_transition = 30
  bucket_glacier_transition = 60
}