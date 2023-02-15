# Default

Run this module with default settings.

## Prepare

Please start the required containers.

### Vault

```shell
docker run --name vault --publish 8200:8200 --env "VAULT_DEV_ROOT_TOKEN_ID=simple" --detach vault
```

### Cassandra

```shell
docker run --name cassandra --publish 7000:7000 --detach cassandra
```

### Terraform settings

Please set these variable that Terraform will use.

```shell
export VAULT_ADDR="http://vault:8200"
export VAULT_TOKEN="simple"
```
