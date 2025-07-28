# Demo WebServer Docker Project - Trev

This project demonstrates how to build and run a simple Docker container that serves a static `index.html` file using Apache on Ubuntu.

## 🛠️ Prerequisites

- Docker installed on your system

## 📁 Project Structure

```
.
├── Dockerfile
└── index.html
```

## 🚀 Build the Docker Image

```bash
docker build -t trevwebserver .
```

## 🧱 Run the Container with a Custom Name

To avoid Docker assigning a random name like `funky_morse`, use the `--name` flag:

```bash
docker run -d -p 8080:80 --name trevwebserver_container trevwebserver
```

- `-d`: Detached mode
- `-p 8080:80`: Maps port 8080 on your host to port 80 in the container
- `--name trevwebserver_container`: Assigns a readable name to your container

## 🌐 Access the Web Page

Open your browser and go to:

```
http://localhost:8080
```

You should see your "Hello, World!" page.

## 🐚 Access the Container Shell

To enter the container shell:

```bash
docker exec -it trevwebserver_container /bin/bash
```

If Bash isn't available, try:

```bash
docker exec -it trevwebserver_container /bin/sh
```

## 🧹 Stop and Remove the Container

```bash
docker stop trevwebserver_container
docker rm trevwebserver_container
```
