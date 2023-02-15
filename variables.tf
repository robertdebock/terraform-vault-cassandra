variable "vault_cassandra_name" {
  description = "The name of the backend role."
  default     = "my_role"
  type        = string
}

variable "vault_cassandra_path" {
  description = "The path where to mount this engine."
  default     = "db"
}

variable "vault_cassandra_hosts" {
  description = "The hosts to connect to."
  default     = ["cassandra"]
  type        = list(string)
}

variable "vault_cassandra_username" {
  description = "The username to authenticate with."
  default     = "vaultuser"
  type        = string
}

variable "vault_cassandra_password" {
  description = "The password to authenticate with."
  default     = "vaultpass"
  type        = string
}

variable "vault_cassandra_port" {
  description = "The default port to connect to if no port is specified as part of the host."
  default     = 7000
  type        = number
  validation {
    condition = var.vault_cassandra_port > 0 && var.vault_cassandra_port < 65537
    error_message = "Please use a TCP port between 0 and 65536."
  }
}

variable "vault_cassandra_tls" {
  description = "Whether to use TLS when connecting to Cassandra."
  default     = false
  type        = bool
}

variable "vault_cassandra_insecure_tls" {
  description = "Whether to skip verification of the server certificate when using TLS."
  default     = true
  type        = bool
}

variable "vault_cassandra_pem_bundle" {
  description = "Concatenated PEM blocks configuring the certificate chain."
  default     = ""
  type        = string
}

variable "vault_cassandra_protocol_version" {
  description = "The CQL protocol version to use."
  default     = 4
  type        = number
  /* validation {
    # TODO: Fix this validation.
    condition = false # CHECK IF CERTAIN PROTOCOLS ARE USED."
    error_message = "Please use a value of FILL IN ALL OPTIONS."
  } */
}

variable "vault_cassandra_connect_timeout" {
  description = "The number of seconds to use as a connection timeout."
  default     = 10
  type        = number
  validation {
    condition = var.vault_cassandra_connect_timeout >= 0 && var.vault_cassandra_connect_timeout <= 600
    error_message = "Please use a value of 0 to 600."
  }
}
