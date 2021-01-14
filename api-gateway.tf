resource "aws_api_gateway_rest_api" "gpass1" {
  name        = "gpass1"
  description = "This is my API for demonstration purposes"
}

resource "aws_api_gateway_resource" "gpass1_resource" {
  rest_api_id = aws_api_gateway_rest_api.gpass1.id
  parent_id   = aws_api_gateway_rest_api.gpass1.root_resource_id
  path_part   = "*/"
}

resource "aws_api_gateway_method" "gpass1_method" {
  rest_api_id   = aws_api_gateway_rest_api.gpass1.id
  resource_id   = aws_api_gateway_resource.gpass1_resource.id
  http_method   = "${var.http}"
  authorization = "NONE"
}


resource "aws_api_gateway_integration" "main" {
  rest_api_id = "${aws_api_gateway_rest_api.gpass1.id}"
  resource_id = "${aws_api_gateway_resource.gpass1_resource.id}"
  http_method = "${aws_api_gateway_method.gpass1_method.http_method}"

  integration_http_method = "${var.integration_http_method}"
  type                    = "${var.integration_type}"
  uri                     = "${var.end_point}"
}


#resource "aws_api_gateway_integration" "MyDemoIntegration" {
#  rest_api_id          = aws_api_gateway_rest_api.MyDemoAPI.id
#  resource_id          = aws_api_gateway_resource.MyDemoResource.id
#  http_method          = aws_api_gateway_method.MyDemoMethod.http_method
#  type                 = "MOCK"
#  cache_key_parameters = ["method.request.path.param"]
#  cache_namespace      = "foobar"
#  timeout_milliseconds = 29000

#  request_parameters = {
#    "integration.request.header.X-Authorization" = "'static'"
#  }

# Transforms the incoming XML request to JSON
#  request_templates = {
#    "application/xml" = <<EOF
#{
# "body" : $input.json('$')
#}
#EOF
#  }
#}
