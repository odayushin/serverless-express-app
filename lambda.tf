data "archive_file" "your_function_name" {
  type        = "zip"
  source_dir  = "lambda"
  output_path = "./your_function_name.zip"
}

resource "aws_lambda_function" "your_function_name" {
  filename         = data.archive_file.your_function_name.output_path
  function_name    = "your_function_name"
  role             = aws_iam_role.your_lambda_role.arn
  handler          = "index.handler"
  source_code_hash = data.archive_file.your_function_name.output_base64sha256
  runtime          = "nodejs12.x"

  memory_size = 128
  timeout     = 60
}

resource "aws_iam_role" "your_lambda_role" {
  name = "your_lambda_role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.your_function_name.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_api_gateway_rest_api.your_api.execution_arn}/*/*/*"
}