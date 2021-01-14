# Terraform configuration for bastion server infrastructure

Built on top of [Terraform](https://www.terraform.io).

## Usage

```
terraform init
```

```
terraform apply
```

## Generate SSH key

```
ssh-keygen -t rsa -N "" -f ~/.ssh/bastion -C "bastion"
```

## Installed packages

* [mc](https://midnight-commander.org)
* nginx
* git
* [certbot](https://certbot.eff.org)
* docker, docker-compose
* [s3cmd](https://github.com/s3tools/s3cmd)
* [jq](https://github.com/stedolan/jq)
