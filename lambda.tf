
# ---------------------------------------------------------------------------
# AWS Lambda resources
# ---------------------------------------------------------------------------

# Lambda



resource "aws_lambda_permission" "apigw_lambda" {
  provider = aws.aws

  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.this.id}/*/${aws_api_gateway_method.this.http_method}${aws_api_gateway_resource.this.path}"
}

resource "aws_lambda_function" "this" {
  provider = aws.aws

  filename      = "${local.path}/lambda/upload.zip"
  function_name = "AWSLambdaHandler-${replace(local.bucket_name, "-", "")}"
  role          = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/LabRole"
  handler       = "uploadMP3.main"
  runtime       = "python3.9"
  lifecycle {
    create_before_destroy = true
  }

    environment {
    variables = {
      bucket_name = "${local.bucket_name}"
    }
  }
}


# resource "aws_lambda_layer_version" "lambda_layer_1" {
#   arn="arn:aws:lambda:us-east-1:336392948345:layer:AWSDataWrangler-Python39:1"
#   layer_name = "lambda_layer_1"

#   compatible_runtimes = ["python3.9"]
# }