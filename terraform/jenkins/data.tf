data "terraform_remote_state" "trs" {
  backend = "s3"

  config {
    bucket = "${var.s3bucket}"
    key    = "trs/terraform.tfstate"
    region = "${var.region}"
  }
}


