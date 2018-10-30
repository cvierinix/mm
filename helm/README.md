# Project Title

Configuration of K8S cluster

## Getting Started

These scripts and charts deploy mongodb, ingress controller and TLS certs for it

### Prerequisites

```
k8s credentials
kubectl (minimum 1.9)
certbot
```

### Configuring

All configuration can be done in environment directory for each env

### Installing

Each environment (dev or prod) MUST be installed in different kubernetes namespace (dev or prod)!

```
kubectl create ns dev
kubectl create ns prod
```

Configure TLS

```
certbot -d *.mmnix.pp.ua --manual --preferred-challenges dns certonly
kubectl create secret tls mm-app-tls --key /etc/letsencrypt/live/mmnix.pp.ua/privkey.pem --cert /etc/letsencrypt/live/mmnix.pp.ua/fullchain.pem -n dev
kubectl create secret tls mm-app-tls --key /etc/letsencrypt/live/mmnix.pp.ua/privkey.pem --cert /etc/letsencrypt/live/mmnix.pp.ua/fullchain.pem -n prod
```

Install ingress controller

```
cd helm
helm upgrade --install nginx-ingress charts/nginx-ingress/
```

Set CNAME for *.mmnix.pp.ua to LB IP

```
kubectl get svc nginx-ingress-controller
```

Install mongodb

```
helm upgrade --install -f environment/dev/mongodb.yaml mongodb-dev charts/mongodb
helm upgrade --install -f environment/prod/mongodb.yaml mongodb-prod charts/mongodb
```

Install application using Jenkins job 'app'.
