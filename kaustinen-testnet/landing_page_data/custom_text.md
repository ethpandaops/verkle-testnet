## General information
Bootnodes:
```sh
cl_bootnode_enrs:
  - "enr:-Ly4QJeoz6UeL2JL2h54iUU0IU2XFi8TnRFHZAIrzGCOuOS_ZG5d6w0w-hMJF00nzsT6i5Pu1v2qHMKDudQUZhvpzp0Bh2F0dG5ldHOIAAAAAAAAAACEZXRoMpAqejCCAAaUIv__________gmlkgnY0gmlwhLI-49qJc2VjcDI1NmsxoQMKd2_x7QQbLg4VT0hWjPO_xrH8C0U1lTCqCE0lsO9fzohzeW5jbmV0cwCDdGNwgiMog3VkcIIjKA"

el_bootnode_enode:
  - "enode://3da5fa6fb683a747a7258f93880ec5a28128e0c9a6272d9b0fa5aa27d182a6088b0d53f5fed214d5922d75220a6f31b56232273d48ded990db69e027fae8acfd@178.62.227.218:30303"
```

## Genesis configuration
### Execution layer clients

```sh
https://github.com/ethpandaops/verkle-testnet/blob/main/kaustinen-testnet/custom_config_data/genesis.json
```

You can optimise the `geth init` time by using our precompiled data found [here](https://condrieu.fra1.digitaloceanspaces.com/precomp). 
Just place it in the same location as the `genesis.json` file of geth and perform all the steps normally. 
