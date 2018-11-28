# My Infrastructure

In line with modern trends, I've hopped on the IaC (Infrastructure as code) bandwagon using [Terraform](https://www.terraform.io) to manage my VPS instance(s).

## My Machines

I'm hosting a few websites (including my own landing page [bjk.is](https://bjk.is)) on a very light Intel Atom C2750 server (2 CPU / 2 GiB) defined in `webserver.tf`.

Occasionally I like to run some compute heavy task in the cloud and in that case I can manually spin up a Intel Xeon D-1531 (6 CPU / 15 GiB) machine by changing the `count` variable to `1` in `compute.tf`. I only need to remember to shut it down as everything is billed by the hour.

## Provisioning

I don't check in the `.tfstate` nor `.terraform/` files to the repo. Instead I'll provide commands to generate these files.

### macOS

```bash
# Install terraform
brew install terraform

# Init Terraform in folder
terraform init

# Import exising state using IDs of running instances
terraform import scaleway_server.scw-abeef9 a4275e70-7404-491b-8843-f4daaa9f5923
terraform import scaleway_ip.scw-abeef9 2d38ad12-6de3-49ed-8acb-491c07240116
terraform import scaleway_security_group.scw-abeef9 e5669258-e523-4429-8a78-499fdc1e1f0d

# Check deployed state
terraform plan

# Deploy desired state
terraform apply
```