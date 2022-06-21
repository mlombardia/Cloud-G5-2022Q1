module "s3" {

  source = "./modules/s3"

  providers = {
    aws = aws.aws
  }

  bucket_name = "${data.aws_caller_identity.current.account_id}-itba-tp-podcasts-bucket2"
  cloudfront_bucket_name = "${data.aws_caller_identity.current.account_id}-itba-tp-podcasts-cloudfront-bucket"
  
}