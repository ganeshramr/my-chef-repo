liferay Cookbook
================
Runs on  vagrant box "hashicorp/precise64"

Attributes
----------
node["liferay"].["crossContext"] - always set to true


Usage
-----
#### liferay::default

Just include `liferay` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[liferay]"
  ]
}
```

License and Authors
-------------------
Authors: ganeshramr
mailganesh@gmail.com
