
# ---------------------------------------------------------------------------
# AWS Lambda resources
# ---------------------------------------------------------------------------

# Lambda



resource "aws_lambda_permission" "apigw_lambda" {

  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:${var.region}:${var.account_id}:${var.rest_api}/*/${var.http_method}${var.api_path}"
}

resource "aws_lambda_function" "this" {

  filename         = var.lambda_file_name
  function_name    = var.function_name
  role             = var.role
  handler          = var.handler
  runtime          = var.runtime
  source_code_hash = filebase64sha256("${var.lambda_file_name}")

  lifecycle {
    create_before_destroy = true
  }

  environment {
    variables = {
      bucket_name       = "${var.bucket_name}"
      dynamo_table_name = "${var.podcast_table}"
    }
  }
}