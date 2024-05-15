resource "google_artifact_registry_repository" "anz-demo-registry" {
  project       = var.project_id
  location      = "australia-southeast2" # Melbourne
  repository_id = "anz-demo-registry"
  description   = "anz-demo-registry"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}
