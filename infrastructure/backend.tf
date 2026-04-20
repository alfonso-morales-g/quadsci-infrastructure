terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket-alfonsomorales"
    prefix = "envs/dev"
  }
}