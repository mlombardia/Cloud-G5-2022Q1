variable "bucket_name" {
  description = "Bucket name"
  type        = string
}

variable "region" {
  description = "region"
  type        = string
}

variable "account_id" {
  description = "region"
  type        = string
}

variable "rest_api" {
  description = "rest api"
  type        = string
}

variable "http_method" {
  description = "http method"
  type        = string
}

variable "api_path" {
  description = "api path"
  type        = string
}


variable "podcast_table" {
  description = "podcasts table name"
  type        = string
}

variable "lambda_file_name" {
  description = "File name for Lambda"
  type        = string
}

variable "handler" {
  description = "Handler for Lambda"
  type        = string
}

variable "runtime" {
  description = "Runtime for Lambda"
  type        = string
}

variable "role" {
  description = "Role for Lambda"
  type        = string
}

variable "function_name" {
  description = "Bucket name for Lambda"
  type        = string 
}