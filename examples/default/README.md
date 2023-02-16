# Default

Run this module with default settings.

## Prepare

### Create network

```shell
docker network create cassandra
```

Please start the required containers.

### Vault

```shell
docker run \
  --name vault \
  --network cassandra \
  --publish 8200:8200 \
  --env "VAULT_DEV_ROOT_TOKEN_ID=simple" \
  --detach \
  vault
```

### Cassandra

```shell
docker run \
  --name cassandra \
  --network cassandra \
  --detach \
  robertdebock/cassandra
```

> Note: This container takes a minute or two to start. Please check the `STATUS` using `docker ps --latest`.

### Terraform settings

Please set these variable that Terraform will use.

```shell
export VAULT_ADDR="http://localhost:8200"
export VAULT_TOKEN="simple"
# export TF_VAR_vault_cassandra_hosts="[\"cassandra\"]"
```

## Test

```shell
terraform apply
```

## Cleanup

```shell
docker network rm cassandra
```
