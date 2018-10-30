# Project Title

Terraform scripts

## Getting Started

These scripts will prepare AWS infrustructure for Jenkins deployment

### Prerequisites

```
aws credentials with admin permissions
DNS zone managed by Route53
```

### Configuring

All configurations can be done in vars.tf

```
s3bucket - name of bucket to store terraform state
vpc_cidr_block - VPC network
subnet_cidr_block - VPC subnet
public_key - key to deploy Jenkins EC2 instance with
ami - Jenkins EC2 instance AMI
instance_type - Jenkins EC2 instance type
region - AWS region
zone_id - zone id of domain managed by Route53 
dns_name - Jenkins FQDN
```

### Installing

```
cd jenkins
terraform init
terraform apply
```
