# Ansible Docker Image for CI/CD

This repository contains a Dockerfile and a Python script designed to create a Docker image optimized for running Ansible playbooks in a CI/CD pipeline. 
The image is configured to install necessary dependencies and Ansible collections required for various automation tasks.

## Dockerfile

The Dockerfile creates a lightweight Docker image based on `python:3.10-slim`. It installs essential tools and libraries required for Ansible and some commonly used Ansible collections.

### Dockerfile Contents
- Installs necessary system packages: `ca-certificates`, `git`, `ssh`, `gcc`, `openssh-client`, `libc6-dev`, `build-essential`, `libldap2-dev`, `libsasl2-dev`.
- Upgrades `pip` and installs Ansible and other Python libraries (`bs4`, `requests`, `python-ldap`, `hvac`).
- Sets the working directory to `/ansible`.
- Copies a Python script (`collection.py`) into the image and runs it.
- Sets the default entrypoint to `ansible-playbook`.

### Build the Docker Image
To build the Docker image, use the following command:

```sh
docker build -t ansible-ci-cd:latest .
```

### Python Script (collection.py)
The collection.py script installs specified Ansible collections using ansible-galaxy. 
These collections are necessary for various Ansible automation tasks.

## Python Script Contents
- A list of Ansible collections to be installed.
- Iterates through the list and installs each collection using ansible-galaxy.
