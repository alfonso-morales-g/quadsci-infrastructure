terraform {
  backend "gcs" {
    # bucket = "terraform-state-bucket-alfonsomorales"
    bucket = "quadsci-terraform-bucket"
  }
}