
resource "aws_s3_bucket" "podcast_bucket" {
  bucket = "${local.bucket_name}"

  tags = {
    Name        = "Podcast Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "podcast_bucket" {
  bucket = aws_s3_bucket.podcast_bucket.id
  acl    = "public-read-write"
}


#this triggers the lifecycle policy of the arquitecture
resource "aws_s3_bucket_lifecycle_configuration" "podcast_bucket" {
  bucket = aws_s3_bucket.podcast_bucket.bucket

  rule {
    id = "podcasts"


    # filter {
    #   and {
    #     prefix = "podcasts/"
    #   }
    # }

    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }
}