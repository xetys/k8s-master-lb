# Kubernetes Master Load Balancer

This is a little wrap on the usual nginx container to setup a simple load balancer for kubernetes api servers.

## Usage

```
# docker run --restart=always -p 16443:16443 xetys/k8s-master-lb 10.0.1.1 10.0.1.2 10.0.1.3
```

Point kubernetes components to `127.0.0.1:16443` (and don't forget to mention this in SAN names during cluster setup) and it will be balanced between the three provided IPs. With basic nginx configuration a load balancer stops routing to not responding endpoints, so the components can operate during failure.


