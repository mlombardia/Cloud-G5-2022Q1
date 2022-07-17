variable "bucket_name" {
  description = "Bucket name"
  type        = string
}

variable "cloudfront_bucket_name" {
  description = "Cloudfront Bucket name"
  type        = string
}

variable "bucket_ia_transition" {
  description = "Number of days for IA Transition"
  type        = number
}

variable "bucket_glacier_transition" {
  description = "Number of days for Glacier transition"
  type        = number
}