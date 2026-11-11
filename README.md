
# Infrastructure as Code Using Terraform and Docker

## Project Overview

This project was created for my IT 293 quarter project at Bellevue College. The purpose is to demonstrate how Infrastructure as Code (IaC) can be used to create and manage infrastructure using Terraform.

I used Terraform with the Docker provider to deploy an Nginx web server container and configure a Docker network. The project runs in GitHub Codespaces, allowing me to practice Terraform without using AWS or Microsoft Azure.

## Project Objectives

- Learn how Terraform manages infrastructure through code.
- Configure a Docker provider and define infrastructure resources.
- Use Terraform commands to deploy and manage resources.
- Verify Docker networking and web server functionality.
- Document the deployment and testing process.

## Tools and Technologies

- Terraform
- Docker
- Nginx
- GitHub Codespaces
- Visual Studio Code
- Git and GitHub

## Project File Structure

```text
terraform-docker-project/
├── main.tf
├── versions.tf
├── variables.tf
├── outputs.tf
├── .terraform.lock.hcl
├── .gitignore
├── README.md
└── docs/
```

### File Descriptions

- `main.tf` — Defines the Docker image, network, and web server container.
- `versions.tf` — Configures Terraform and the Docker provider.
- `variables.tf` — Defines configurable values such as the container name and external port.
- `outputs.tf` — Displays useful deployment information.
- `.terraform.lock.hcl` — Records provider dependency selections.
- `.gitignore` — Excludes temporary and sensitive Terraform files.
- `docs/` — Stores project documentation and screenshots.

## Prerequisites

Before running this project, make sure you have:

1. Terraform installed.
2. Docker installed and running.
3. Git installed if cloning the repository.
4. A terminal or development environment such as GitHub Codespaces.

This project was tested using Docker in GitHub Codespaces. Docker Desktop is not required when using a Codespace with a working Docker engine.

## Deployment Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yassinahmed323/terraform-docker-project.git
cd terraform-docker-project
```

### 2. Initialize Terraform

```bash
terraform init
```

This downloads the required Terraform provider and initializes the project.

### 3. Format and Validate

```bash
terraform fmt
terraform validate
```

These commands format the Terraform configuration and check for errors.

### 4. Review the Infrastructure Plan

```bash
terraform plan
```

This previews the changes Terraform intends to make.

### 5. Deploy the Infrastructure

```bash
terraform apply
```

Review the proposed changes, type `yes`, and press Enter to approve the deployment.

Terraform creates and manages the Docker resources defined in the configuration.

## Verify the Deployment

Check that the Nginx container is running:

```bash
docker ps
```

Check that the Docker network exists:

```bash
docker network ls
```

Inspect the network:

```bash
docker network inspect terraform-web-network
```

Confirm the container is connected to the network:

```bash
docker inspect terraform-nginx-web --format '{{json .NetworkSettings.Networks}}'
```

## Access the Web Server

The Nginx web server uses port `8080` by default.

From inside the development environment, test the server:

```bash
curl -I http://localhost:8080
```

A successful response includes:

```text
HTTP/1.1 200 OK
```

For a local Docker installation, open:

http://localhost:8080

When using GitHub Codespaces, open the **Ports** tab in VS Code and select the forwarded address for port `8080`.

The browser should display the default Nginx welcome page.

## Terraform Outputs

After deployment, Terraform displays useful information, including:

- Container name: `terraform-nginx-web`
- Docker network: `terraform-web-network`
- External port: `8080`
- Web server URL: `http://localhost:8080`

You can view the outputs again using:

```bash
terraform output
```

## Making Infrastructure Changes

Terraform allows infrastructure changes to be managed through configuration files.

For example, the external port can be changed by updating the relevant variable.

After changing the configuration, run:

```bash
terraform plan
terraform apply
```

Terraform compares the desired configuration with the current infrastructure and determines the required changes.

## Remove the Infrastructure

To remove the resources managed by Terraform, run:

```bash
terraform destroy
```

Review the destruction plan and type `yes` to confirm.

**Warning:** This removes the Terraform-managed Docker resources. Run this command only when you are ready to clean up the deployment.

## Project Results

I successfully initialized, formatted, validated, planned, and applied my Terraform configuration.

I verified that:

- The Nginx Docker container was running.
- The Docker network was created.
- The container was connected to the correct network.
- The web server returned an HTTP 200 OK response.
- The Nginx welcome page loaded successfully in my browser.

## Conclusion

This project helped me understand how Terraform can be used to manage infrastructure through code instead of manually creating resources. I gained hands-on experience with Terraform commands, Docker containers, networking, and troubleshooting.

These skills are relevant to my goal of working in Cloud Engineering and DevOps.
