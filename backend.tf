terraform{
  backend "s3"{
    bucked = "bucked name"
    key = ""
    region = "eu-west-2"
    dynamodb_table = "terraform_state_lock"
  }
}
