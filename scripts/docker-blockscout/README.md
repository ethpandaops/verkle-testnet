# Docker compose: Blockscout

This stack will allow you to bring up Blockscout and PostgresDB.

You can configure which RPC endpoint you want to target by editing the ENV vars within the  the [`docker-compose.yml`](docker-compose.yml) file.

## Example commands

Run the following to get the stack up and running

```sh
$ docker-compose up -d
```

Checking logs can be done like

```
$ docker-compose logs -f --tail=100 blockscout
```


To stop and destroy all the containers you can simply:

```
$ docker-compose down
```
