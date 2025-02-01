provider "ibm" {
  ibmcloud_api_key = "your-ibm-cloud-api-key"
}

resource "ibm_container_vpc_cluster" "my_cluster" {
  name     = "my-cluster"
  region   = "us-south"
  worker_pools {
    name    = "default"
    flavor  = "bx2.4x16"
  }
}
