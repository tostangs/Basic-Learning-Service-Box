# Demo WebServer Docker Project - Trev

This project demonstrates how to build and run a simple Docker container that serves a static `index.html` file using Apache on Ubuntu.

## 🛠️ Prerequisites

- Docker installed on your system

## 📁 Project Structure

```
.
├── Dockerfile
├── index.html
├── README.md
└── vnc
    ├── Dockerfile
    ├── start.sh
    └── xstartup.sh
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

---

## 🖥️ Ubuntu Desktop with VNC in Docker

This project also includes a VNC-enabled Ubuntu desktop environment inside Docker, located in the `vnc/` directory.

### 📁 VNC Directory Structure

- `vnc/Dockerfile`: Sets up Ubuntu 16.04 with GUI components and installs a VNC server.
- `vnc/start.sh`: Starts SSH and VNC services and keeps the container running.
- `vnc/xstartup.sh`: Configures the VNC session to launch the GNOME desktop environment.

### 🏗️ Build the VNC Docker Image

```bash
cd vnc
docker build -t trevvncserver .
```

### ▶️ Run the VNC Container

```bash
docker run -d -p 2222:22 -p 5901:5901 --name trevubservercontainer trevvncserver
```

- `-p 2222:22`: Maps SSH to port 2222  
- `-p 5901:5901`: Maps VNC to port 5901

### 🔐 SSH Access

```bash
ssh dockeruser@localhost -p 2222
```

> Replace `dockeruser` and password as configured in your Dockerfile.

### 🖥️ Connect via VNC Viewer

1. Open your VNC client (e.g., RealVNC, TigerVNC).
2. Connect to `localhost:5901`.
3. Enter the VNC password you set during container setup.

You should now see the Ubuntu desktop environment running inside your Docker container.
