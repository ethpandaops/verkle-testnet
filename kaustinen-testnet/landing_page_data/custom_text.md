## General information
Bootnode ENRs:
```yaml
{% for bootnode_enrs in bootnode_enrs %}
"{{ bootnode_enrs }}"
{% endfor %}
```
Execution Layer bootnode Enodes:
```yaml
{% for el_bootnode_enode in el_bootnode_enode %}
"{{ el_bootnode_enode }}"
{% endfor %}
```

## Genesis configuration
### Execution layer clients

```sh
https://github.com/ethpandaops/verkle-testnet/blob/main/kaustinen-testnet/custom_config_data/genesis.json
```

You can optimise the `geth init` time by using our precompiled data found [here](https://condrieu.fra1.digitaloceanspaces.com/precomp). 
Just place it in the same location as the `genesis.json` file of geth and perform all the steps normally. 
