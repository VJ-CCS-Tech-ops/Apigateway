variable "http" {

  default = "GET"

}
variable "authorization" {

  default = "NONE"

}

variable "end_point" {

  default = "https://gs-rest-service-v2-turbulent-duiker-ar.london.cloudapps.digital/greeting"

}

variable "integration_type" {
  default = "HTTP"
}

variable "integration_http_method" {

  default = "GET"

}
variable "environment_name" {
  default = "sandbox"
}

variable "region" {
  default = "us-east-1"
}

variable "ssh_port" {
  default = "22"
}
variable "http_port" {
  default = "22"
}
