resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "instance" {
  project = var.project_id

  name             = "anz-backend-app-${random_id.db_name_suffix.hex}"
  region           = var.region
  database_version = "POSTGRES_15"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "database" {
  name      = "backend-app-db"
  instance  = google_sql_database_instance.instance.name
  charset   = "UTF8"
  collation = "en_US.UTF8"
  project   = var.project_id
}

resource "google_sql_user" "user" {
  name     = "backend-app-user"
  instance = google_sql_database_instance.instance.name
  password = "changeme"
  project  = var.project_id
  lifecycle {
    ignore_changes = [password]
  }
}   