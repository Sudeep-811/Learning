# 🐳 Containers and Their Benefits

## 🚢 What Are Containers?

Containers are lightweight, portable, and self-contained units that package an application along with:
- Its code
- Dependencies
- Libraries
- Configuration files

They ensure the application runs **consistently across different environments** (e.g., dev, test, prod).

> 💡 Most common container platform: **Docker**

Containers use the host OS's kernel but stay isolated using:
- **Namespaces**
- **Control groups (cgroups)**

---

# 📦 What is a Docker Image?

A **Docker Image** is a **read-only template** used to create containers.

It contains:
- Application code
- Runtime (e.g., Python, Node.js)
- System libraries & dependencies
- Configuration files

---

## 🧱 Key Points:
- Acts as a **blueprint** for containers
- Created using a **Dockerfile**
- Stored in **Docker Hub** or private registries
- Immutable (doesn’t change once built)

## ✅ Benefits of Containers

| Benefit | Description |
|--------|-------------|
| 🏗️ **Portability** | Runs consistently on any environment (laptop, server, cloud) |
| 🧱 **Isolation** | Prevents software conflicts by running apps in separate environments |
| ⚡ **Lightweight** | Faster and smaller than VMs since they share the host OS kernel |
| 🔄 **Consistency** | Same runtime environment across development, staging, and production |
| 📦 **Scalability** | Easy to scale apps up/down using orchestration tools |
| 🔁 **Faster CI/CD** | Speeds up build, test, and deployment pipelines |
| 🛠️ **Microservices Support** | Perfect for deploying apps as independent services |
| 💰 **Resource Efficiency** | Uses less CPU, memory, and storage than VMs |

---

## 🛠️ Tools You Should Know

- **Docker** – Build and run containers
- **Kubernetes** – Manage and orchestrate container clusters
- **Podman** – Docker alternative (daemonless and rootless)
- **containerd** – Lightweight runtime used by Docker & Kubernetes


# ⚔️ Containers vs Virtual Machines (VMs) – Short Notes

## 🔧 Architecture
- **Containers**: Share host OS kernel, lightweight
- **VMs**: Run full OS on hypervisor, heavy

## ⚡ Performance
- **Containers**: Fast startup, low resource use
- **VMs**: Slow startup, high resource use

## 🔐 Isolation
- **Containers**: Process-level (less secure)
- **VMs**: Full OS-level (more secure)

## 📦 Use Cases
- **Containers**: Microservices, CI/CD, cloud-native apps
- **VMs**: Legacy apps, OS-level isolation, multi-OS testing

## 🛠️ Tools
- **Containers**: Docker, Kubernetes
- **VMs**: VMware, VirtualBox, Hyper-V

## ✅ Summary
| Feature     | Containers | VMs         |
|-------------|------------|-------------|
| Speed       | Fast       | Slow        |
| Size        | MBs        | GBs         |
| Isolation   | Moderate   | Strong      |
| Portability | High       | Medium      |


# 🐳 Docker Architecture Overview

Docker uses a client-server architecture with the following core components:

- **Docker Client**: The user interface to interact with Docker via the CLI or REST API.
- **Docker Daemon (`dockerd`)**: The background service that manages Docker objects like images, containers, networks, and volumes.
- **Docker REST API**: The interface through which the client and other applications communicate with the daemon.
- **Docker Objects**:
  - **Images**: Read-only templates used to create containers.
  - **Containers**: Executable instances of Docker images.
  - **Volumes**: Persistent data storage for containers.
  - **Networks**: Enable communication between containers.
- **Docker Registries**: Repositories for Docker images, such as Docker Hub.

## 🐳 Docker Architecture Diagram

```
                   +---------------------+
                   |   Docker Client     |
                   |   (CLI / REST API)  |
                   +----------+----------+
                              |
                              v
                   +----------+----------+
                   |      Docker Daemon   |
                   |       (dockerd)      |
                   +----------+----------+
                              |
       +----------+----------+----------+----------+
       |          |                     |          |
       v          v                     v          v
   +--------+  +-----------+        +--------+  +----------+
   | Images |  | Containers|        | Volumes|  | Networks |
   +--------+  +-----------+        +--------+  +----------+

                              ^
                              |
                   +----------+----------+
                   |  Docker Registries  |
                   | (e.g., Docker Hub)  |
                   +---------------------+
```
# 🐳 `docker run -it` Notes

## 🔹 What it does
- `-i`: Keep STDIN open (interactive)
- `-t`: Allocate a pseudo-TTY (terminal)
- Combined: Run a container with interactive terminal access

## 🔹 Syntax
```bash
docker run -it <image> [command]
```

## 🔹 Examples

```bash
# Run Ubuntu with bash
docker run -it ubuntu bash

# 🐳 Docker Basic Commands

## 🔹 Pull an image
```bash
docker pull <image_name>:<version>
```
Example:
```bash
docker pull nginx:latest
docker pull mysql:8.0
```

## 🔹 Run Container in Detached Mode

### Command:
```bash
docker run -d <image_name>
```

### ✅ What it does:
- Runs the container **in the background** (detached).
- You don't see the output in the terminal.
- Returns the **container ID**.

### 🔄 Why use it:
- Useful for running services like web servers, databases, etc.
- Lets you keep using your terminal while the container runs.

### 📌 Example:
```bash
docker run -d nginx
```
- Runs an Nginx web server in the background.

## 🔹 Run with custom container name
```bash
docker run --name <container_name> -d <image_name>
```
Example:
```bash
docker run --name mynginx -d nginx
```
# 🐳 Docker Image Layers

## What are Image Layers?
- Docker images are made up of multiple **read-only layers** stacked on top of each other.
- Each layer represents a set of filesystem changes (e.g., adding files, installing packages).
- Layers are **cached** and **reused** to speed up builds and reduce image size.

## How Layers Work
- When you build an image, each command in the Dockerfile creates a new layer.
- Layers are stacked to form the final image.
- When running a container, Docker adds a **read-write layer** on top of these image layers.

## Benefits
- Efficient storage: Shared layers between images save disk space.
- Faster builds: Only changed layers are rebuilt.
- Easier updates: Modify only the affected layers.

## Docker Image Layers Diagram

```
           +----------------------+
           |      Container       |  <-- Read-Write Layer
           +----------------------+
                     ▲
           +----------------------+
           |    Layer 4: COPY     |  <-- Add app files
           +----------------------+
                     ▲
           +----------------------+
           | Layer 3: RUN install  |  <-- Install curl
           +----------------------+
                     ▲
           +----------------------+
           | Layer 2: RUN update   |  <-- apt-get update
           +----------------------+
                     ▲
           +----------------------+
           |    Layer 1: FROM      |  <-- Ubuntu base image
           +----------------------+
```

- Each block represents a layer.
- Changes build on top of previous layers.
- The container adds a read-write layer on top during runtime.
- Except container layer rest of the layers are read-only and immutable(can't change). Only container can be changed.


# Docker Compose Notes

## 🧩 What is Docker Compose?
- Tool to run multi-container Docker apps.
- Configured using a `docker-compose.yml` file. (Yaml- yet another markup language)
- Manages services, networks, and volumes.

---

## 🛠️ Basic Example

```yaml
version: '3.8'
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
  app:
    build: .
    ports:
      - "3000:3000"
    depends_on:
      - db
  db:
    image: postgres:14
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: mydb


# Docker Compose Commands


# Docker Compose: Using a Custom File

## 📄 Command
```bash
docker-compose -f filename.yaml up -d


-f filename.yaml: Use a specific Compose file.

up: Create and start containers.

-d: Detached mode (background).


| Command                             | Description                                      |
|-------------------------------------|--------------------------------------------------|
| `docker-compose up`                | Create and start all containers                  |
| `docker-compose up -d`             | Start containers in the background (detached)    |
| `docker-compose down`              | Stop and remove containers, networks, volumes    |
| `docker-compose build`             | Build or rebuild services from Dockerfile        |
| `docker-compose start`             | Start existing stopped services                  |
| `docker-compose stop`              | Stop running services without removing them      |
| `docker-compose restart`           | Restart services                                 |
| `docker-compose ps`                | List containers managed by Compose               |
| `docker-compose logs`              | View output (logs) from services                 |
| `docker-compose exec <service> sh` | Run command (like shell) inside a container      |
| `docker-compose run <service>`     | Run a one-off command for a service              |
| `docker-compose config`            | Validate and view the final Compose config       |


# Dockerizing an Application

---

## What is Dockerizing?

Dockerizing means **packaging your application and its environment** (dependencies, runtime, libraries) inside a Docker container so it can run reliably anywhere — on any machine or cloud.

---

## Why Dockerize?

- Ensures **consistency** across development, testing, and production.
- Simplifies deployment and scaling.
- Removes "works on my machine" issues.

---

## Basic Steps to Dockerize an App

1. Write your application code.
2. Create a `Dockerfile` to specify how to build the app image.
3. Build the Docker image.
4. Run the app inside a Docker container.

---

# Important Dockerfile Instructions

- **FROM**  
  Specifies the base image for your Docker image.  
  Example: `FROM node:18`

- **WORKDIR**  
  Sets the working directory inside the container.  
  Example: `WORKDIR /app`

- **COPY**  
  Copies files/folders from host to container.  
  Example: `COPY package*.json ./`

- **RUN**  
  Runs commands inside the container during build (e.g., install dependencies).  
  Example: `RUN npm install`

- **EXPOSE**  
  Documents which port the container listens on at runtime.  
  Example: `EXPOSE 3000`

- **CMD**  
  Defines the default command to run when the container starts.  
  Example: `CMD ["npm", "start"]`

- **ENTRYPOINT**  
  Sets the container’s main executable (more rigid than CMD).  
  Example: `ENTRYPOINT ["python3"]`

- **ENV**  
  Sets environment variables inside the container.  
  Example: `ENV NODE_ENV=production`

- **ARG**  
  Defines build-time variables that can be passed during build.  
  Example: `ARG VERSION=1.0`

- **USER**  
  Specifies which user to run the container as.  
  Example: `USER node`

- **VOLUME**  
  Defines mount points for external volumes.  
  Example: `VOLUME ["/data"]`

---

> **Note:**  
> `CMD` and `ENTRYPOINT` can be used together for flexible command execution.
> We can have multiple RUN commands but only single CMD command in docker file.

# Docker Build Command

```bash
docker build -t testapp:1.0.

docker build: Builds a Docker image from a Dockerfile.

-t testapp:1.0000000: Tags the image with name testapp and version/tag 1.0000000.

.: Specifies the build context (current directory).

# Pushing Docker Image to Docker Repository

## Steps to Push a Docker Image

1. **Login to Docker Hub (or other Docker registry)**
   ```bash
   docker login
   Enter your username and password when prompted.

2. docker push your-username/your-image-name:tag
    This uploads the image to Docker Hub or the configured registry.

# Docker Volumes

## What are Docker Volumes?
- Docker volumes are used to **persist data** generated by and used by Docker containers.
- Volumes are stored outside the container filesystem on the host machine.
- They allow data to survive container restarts, removals, and upgrades.

## Why Use Volumes?
- Persist data beyond the lifecycle of a container.
- Share data between multiple containers.
- Manage storage more efficiently than bind mounts.
- Avoid storing data inside containers, which can be ephemeral.

## Creating and Using Volumes

### 1. Create a Volume
```bash
docker volume create my_volume
