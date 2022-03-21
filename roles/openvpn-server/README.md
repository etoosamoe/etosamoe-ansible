# Setup OpenVPN server

| 🔥  | Works only with Ubuntu, tested on 20.04 |
| --- | --------------------------------------- |

## Requirements

- Create `user` variable with your user, e.g. in inventory:
```
    group2:
      hosts:
        host1:
          user: user1
```          

## TO-DO

- firewall rules

You need to enable forwarding and allow 1994 port to INPUT.