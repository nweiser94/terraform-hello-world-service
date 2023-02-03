# Terraform Hello World Example

Small project to learn and understand the basic usage of terraform for kubernetes resource provisioning. 

The example uses the kubernetes provider to provision a deployment and service onto a k8s cluster.

## Prerequesites
- Terraform-cli
- Java 17
- k8s cluster configuration in your `~/.kube/config`


## How to run
```
# Build Spring Boot project
./gradlew build

# Build Docker Image
docker build . -t terraform-hello-world-service

# Initialize terraform
cd deploy && terraform init

# Show changes to be made by terraform
terraform plan

# Apply changes 
terraform apply

# Destroy resources provisioned by terraform
terraform destroy
```
