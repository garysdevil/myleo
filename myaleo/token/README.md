# token.aleo

## Build 介绍

```bash
# 创建A账户
aleo account new

# 创建B账户
aleo account new

# A账户部署mint 100个token
# aleo run mint_token A账户地址 100u64 3634422524977942384127113436866104517282080062207687912678345956934082270693field
aleo run mint_token aleo1ehzqv5492sa5n57nfjwfj3xfgdws9wakalgh3hswepwngw0huvxs4ch0wl 100u64 3634422524977942384127113436866104517282080062207687912678345956934082270693field

# A账户部署mint 100个token
# aleo run transfer "mint_token时的输出" B账户地址 10u64
aleo run transfer_token "{
  owner: aleo1ehzqv5492sa5n57nfjwfj3xfgdws9wakalgh3hswepwngw0huvxs4ch0wl.private,
  gates: 0u64.private,
  amount: 100u64.private,
  _nonce: 2194724258274330443850855416755687110264100078263799894385771807119806316633group.public
}" aleo1ck8n80597cfhx6yq4sq40xvghkxn30qnljlqdm3z4mjcm42ajyyqjqelrn 10u64
```



