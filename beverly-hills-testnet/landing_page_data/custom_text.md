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

You can optimise the `geth init` time by using our precompiled data found [here](https://condrieu.fra1.digitaloceanspaces.com/precomp). 
Just place it in the same location as the `genesis.json` file of geth and perform all the steps normally. 
