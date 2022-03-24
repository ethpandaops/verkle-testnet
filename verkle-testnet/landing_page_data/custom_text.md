## General information
enode for execution clients:
```sh
- "enode://0e2ff116f7b7af08ff8f388cdaee4897f78f069f0f943b07a4403cd1166098022dbeae49d114fd6092b4183890d03ad12f4af34e1bd1bff70d35ba6bb6f83966@206.189.52.190:30303"
- "enode://f58919bb5c61f9c2d02af13f5721ba135a861cb9c07898444a962e541474d27044a7a5fc5f030bcab9d6488aa1906e296fbc6c15e85c4c67f744d076ba4e8c40@164.90.239.233:30303"
```

## Genesis configuration
### Execution layer clients

```sh
https://github.com/parithosh/verkle-testnet/blob/main/verkle-testnet/custom_config_data/genesis.json
```

You can optimise the `geth init` time by using our precompiled data found [here](https://condrieu.fra1.digitaloceanspaces.com/precomp). 
Just place it in the same location as the `genesis.json` file of geth and perform all the steps normally. 
