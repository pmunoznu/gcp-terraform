provider "google" {
  credentials = file("./proyectofinal-410115-7e02386d7a1f.json")
  project     = var.project
  region      = var.location 
}

resource "google_container_cluster" "mi_cluster" {
  name     = var.name
  location = var.location 

  remove_default_node_pool = true
  deletion_protection = false 

  node_pool {
    name       = "default-pool"
    initial_node_count = var.initial_node_count

    node_config {
       machine_type = var.machine_type
       disk_size_gb = 200 
    }
  }

}
