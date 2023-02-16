resource "vault_database_secrets_mount" "default" {
  path  = var.vault_cassandra_path
  local = false
  cassandra {
    allowed_roles    = [var.vault_cassandra_name]
    name             = var.vault_cassandra_name
    hosts            = var.vault_cassandra_hosts
    username         = var.vault_cassandra_username
    password         = var.vault_cassandra_password
    port             = var.vault_cassandra_port
    plugin_name      = "cassandra-database-plugin"
    tls              = var.vault_cassandra_tls
    insecure_tls     = var.vault_cassandra_tls ? var.vault_cassandra_insecure_tls : null
    pem_bundle       = var.vault_cassandra_pem_bundle == "" ? null : var.vault_cassandra_pem_bundle
    protocol_version = var.vault_cassandra_protocol_version
    connect_timeout  = var.vault_cassandra_connect_timeout
  }
}

resource "vault_database_secret_backend_role" "default" {
  name    = var.vault_cassandra_name
  backend = vault_database_secrets_mount.default.path
  db_name = vault_database_secrets_mount.default.cassandra[0].name
  creation_statements = [
    "CREATE USER '{{username}}' WITH PASSWORD '{{password}}' NOSUPERUSER;",
    "GRANT SELECT ON ALL KEYSPACES TO {{username}};"
  ]
}
