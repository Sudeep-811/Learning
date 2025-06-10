# 📘 Kubernetes Basics & Definitions

## What is Kubernetes?

**Kubernetes (K8s)** is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications.

---

## 🔑 Key Features

- **Automatic Binpacking**: Places containers based on resource requirements and constraints.
- **Self-Healing**: Restarts failed containers and replaces them when needed.
- **Horizontal Scaling**: Automatically scales apps up or down based on load.
- **Service Discovery & Load Balancing**: Exposes containers using DNS or IP and distributes traffic.
- **Automated Rollouts & Rollbacks**: Gradually rolls out changes and rolls back if something goes wrong.
- **Secret & Configuration Management**: Manages sensitive information and configuration without rebuilding images.

---

## 🧱 Basic Concepts & Definitions


### 📊 Visual Diagram

![Kubernetes Architecture](./k8s.png)


### 1. **Node**
A single machine/server *worker machine*, either physical or virtual, that runs workloads (pods).

## ⚙️ Master Node vs Worker Node in Kubernetes

### 🧠 Master Node (aka Control Plane)
- Manages the **entire cluster**.
- Makes **decisions** (scheduling, scaling, health checks).
- **Does not run user apps directly**.

#### Main Components:
- `kube-apiserver`: API entry point for K8s to communicate with other services.
- `etcd`: Key-value database to store cluster data.
- `kube-scheduler`: Assigns pods to nodes.
- `controller-manager`: Maintains cluster state (controls and manage everything).

---

### 🧰 Worker Node
- Runs **application workloads**.
- Each node runs **pods** (which hold containers).

#### Main Components:
- `kubelet`: Talks to the master, ensures pod containers are running.
- `container runtime`: Runs containers (Docker, containerd, etc.).
- `kube-proxy/service proxy`: Manages networking for pods.

---

### 🔁 Summary Table

| Feature             | Master Node (Control Plane)      | Worker Node                 |
|---------------------|----------------------------------|-----------------------------|
| Purpose             | Manages the cluster              | Runs workloads (pods)       |
| Runs applications?  | ❌ No                            | ✅ Yes                      |
| Key Components      | API server, etcd, scheduler      | Kubelet, kube-proxy, runtime |
| Quantity            | Usually 1–3 (HA setup)           | Many, depends on scale      |


### 2. **Pod**
The smallest deployable unit in Kubernetes. A pod can run one or more containers that share storage and network.

🔹 Usually, **one container per pod** is the best practice.

🔁 Pods are **ephemeral** — if a pod dies, Kubernetes may replace it with a new one.

👉 Think of a pod as a **wrapper** around containers to manage them as a single unit.


### 3. **Cluster**
A group of nodes (machines/server) that run containerized applications.


### 4. **Container**
A lightweight, portable unit that includes everything needed to run a piece of software.

### 5. **Deployment**
A controller that manages replicas of pods and ensures the desired number of pods are running.

### 6. **Service**
A logical abstraction to expose a set of pods as a network service with a stable IP.

### 7. **Namespace**
A way to divide cluster resources between multiple users or environments or Groups (e.g., dev, test, prod).

### 8. **ConfigMap**
Used to store non-sensitive configuration data in key-value pairs.

### 9. **Secret**
Used to store sensitive data (e.g., passwords, tokens) securely in base64-encoded format.

### 10. **Volume**
Provides persistent or temporary storage for containers in a pod.

### 11. **Kubelet**
An agent that runs on each node and communicates with the control plane.

### 12. **Control Plane**
The brain of the Kubernetes cluster. It manages the cluster's overall state.

### 13. **API Server**
The entry point to the Kubernetes control plane. It validates and processes REST API requests.

### 14. **etcd**
A distributed key-value store used for storing all cluster configuration and state.

### 15. **Scheduler**
Assigns pods to suitable nodes based on resource availability and requirements.

### 16. **Controller Manager**
Runs controllers that regulate the state of the cluster (e.g., replicating pods, tracking node status).

---


# 🚀 Uses and Benefits of Kubernetes

## 🎯 What is Kubernetes Used For?

1. **Container Orchestration**
   - Manages deployment, scaling, and operation of containers (like Docker).

2. **Automated Deployment**
   - Automatically deploys applications based on configuration files (YAML).

3. **Scaling Applications**
   - Increases or decreases the number of running instances (pods) based on demand.

4. **Load Balancing**
   - Distributes incoming traffic evenly across multiple pods.

5. **Self-Healing**
   - Restarts crashed containers, replaces failed pods, and reschedules on healthy nodes.

6. **Rolling Updates and Rollbacks**
   - Gradually applies updates to the app without downtime and rolls back if needed.

7. **Service Discovery**
   - Assigns a stable IP and DNS name to services, making internal communication easy.

8. **Resource Management**
   - Efficiently manages CPU, memory, and storage resources across containers.

9. **Multi-cloud and Hybrid Deployments**
   - Runs across on-premises, public cloud, or hybrid environments.

10. **DevOps Automation**
    - Integrates with CI/CD pipelines to streamline development to production workflows.

---

## ✅ Benefits of Using Kubernetes

| Benefit                     | Description                                                                 |
|-----------------------------|-----------------------------------------------------------------------------|
| **Scalability**             | Automatically scales apps up or down based on demand.                      |
| **High Availability**       | Ensures apps are always running and can recover from failures.             |
| **Portability**             | Runs consistently on any cloud or on-prem environment.                     |
| **Efficiency**              | Better resource utilization through scheduling and binpacking.             |
| **Developer Productivity**  | Simplifies testing, deployment, and updates.                              |
| **Open-source & Community** | Large support ecosystem and vendor-neutral platform.                      |
| **Cost Optimization**       | Automates scaling and reduces resource waste.                              |
| **Security**                | Manages secrets and access controls for applications securely.             |
| **Infrastructure as Code**  | Uses YAML files to define the desired state of infrastructure and apps.    |
| **Rolling Updates**         | Updates applications without downtime or user impact.                      |

---


## 👨‍💻 Common `kubectl` Commands

```bash
kubectl get pods             # List all pods
kubectl get nodes            # List all nodes
kubectl apply -f file.yaml   # Create/update resources from a file
kubectl delete -f file.yaml  # Delete resources from a file
kubectl describe pod <name>  # Show details about a pod
kubectl logs <pod-name>      # Show logs of a pod

```
# 📦 Kubernetes Object Model

Kubernetes uses an **object-based model** to represent the desired state of the cluster.

---

## 🧱 What is a Kubernetes Object?

A **Kubernetes Object** is a persistent entity in the Kubernetes system.  
It represents a **record of intent** — what you want the system to do.

Each object has:
- **Spec**: What you want (e.g., 3 replicas of a pod)
- **Status**: What is actually happening now

---

## 🗂️ Key Parts of Every Object

| Field       | Description                                      |
|-------------|--------------------------------------------------|
| `apiVersion`| Which version of the K8s API you're using        |
| `kind`      | Type of object (Pod, Deployment, Service, etc.) |
| `metadata`  | Name, labels, namespace, annotations             |
| `spec`      | Desired state of the object                      |
| `status`    | Current state of the object (updated by K8s)     |

---

## 📘 Common Kubernetes Objects

| Object      | Purpose                                      |
|-------------|----------------------------------------------|
| `Pod`       | Runs one or more containers                  |
| `Service`   | Exposes pods to network traffic              |
| `Deployment`| Manages replicas of pods, handles updates    |
| `ReplicaSet`| Ensures a set number of pods are running     |
| `StatefulSet`| Like Deployment but with stable IDs/storage |
| `DaemonSet` | Runs a pod on every node                     |
| `Job`       | Runs a one-time task                         |
| `CronJob`   | Runs tasks on a schedule                     |
| `ConfigMap` | Stores non-sensitive configuration data      |
| `Secret`    | Stores sensitive data securely               |
| `Namespace` | Isolates objects in the cluster              |
| `Ingress`   | Manages external HTTP(S) access              |
| `Volume`    | Provides persistent or shared storage        |

---

## 🧠 Summary

- Kubernetes objects declare the **desired state** of your system.
- You define objects using **YAML or JSON** files.
- The **Kubernetes Control Plane** works to maintain this state automatically.


# 📡 Kubernetes API Resource Types

Kubernetes exposes **objects** through an **HTTP REST API**.  
Each **object** is a **resource type** you can create, read, update, or delete.

---

## 📁 API Resource vs Kind

- **Kind**: The type of object you define in your YAML (`kind: Pod`, `kind: Deployment`, etc.)
- **Resource Type**: The plural name used in the API (e.g., `pods`, `deployments`)

---

## 🧾 Common API Resource Types

| Kind         | Resource Type (Plural) | Description                            |
|--------------|-------------------------|----------------------------------------|
| `Pod`        | `pods`                  | Run containers                         |
| `Service`    | `services`              | Expose pods as network service         |
| `Deployment` | `deployments`           | Manage stateless pods                  |
| `ReplicaSet` | `replicasets`           | Ensure desired number of pods          |
| `StatefulSet`| `statefulsets`          | Manage stateful pods                   |
| `DaemonSet`  | `daemonsets`            | Run a pod on all nodes                 |
| `Job`        | `jobs`                  | Run a one-time task                    |
| `CronJob`    | `cronjobs`              | Schedule recurring jobs                |
| `Namespace`  | `namespaces`            | Divide cluster into logical sections   |
| `Node`       | `nodes`                 | Cluster worker machines                |
| `ConfigMap`  | `configmaps`            | Store non-secret config data           |
| `Secret`     | `secrets`               | Store sensitive config data            |
| `Ingress`    | `ingresses`             | Manage external access to services     |
| `PersistentVolume` | `persistentvolumes` | Provisioned storage unit             |
| `PersistentVolumeClaim` | `persistentvolumeclaims` | Request storage            |

---

## 🔧 How to View API Resources

```bash
kubectl api-resources
```

# 📦 Kubernetes Pod: Concept & Use Cases

## ✅ What is a Pod?

A **Pod** is the **smallest deployable unit** in Kubernetes.

- Represents **a single instance** of a running process.
- Usually contains **one container**, but can contain **multiple containers** that share:
  - Network (IP, port)
  - Storage (volumes)
  - Configuration (environment variables)

---

## 🧠 Key Concepts

| Feature             | Description                                                |
|---------------------|------------------------------------------------------------|
| **Single IP Address**| All containers in a pod share the same IP                 |
| **Shared Volumes**   | Used for communication between containers                 |
| **Tightly Coupled**  | Multiple containers in a pod work as one unit             |
| **Ephemeral**        | Pods are temporary; they can be replaced when needed      |
| **Managed by Controllers** | E.g., Deployments or ReplicaSets for stability     |

---

## 💡 Use Cases of Pods

| Use Case                             | Description                                                                 |
|--------------------------------------|-----------------------------------------------------------------------------|
| **Single Container Pod**             | Typical use — one app per pod (e.g., Nginx server)                          |
| **Sidecar Pattern**                  | Add helper containers (e.g., logging, monitoring) to the main app container |
| **Adapter Pattern**                  | Add a translator container for compatibility (e.g., data format conversion) |
| **Ambassador Pattern**               | Add a proxy container to handle external communication                      |
| **Batch Jobs**                       | Run one-off tasks that complete and exit                                    |
| **Daemon Pods**                      | Pods that run on every node for monitoring or logging (via DaemonSet)       |

---

## 🔁 Pod Lifecycle

1. **Pending** – Pod is accepted but not running yet.
2. **Running** – All containers are up and running.
3. **Succeeded** – Containers completed successfully.
4. **Failed** – At least one container failed.
5. **Unknown** – Status can't be obtained.

---

## 🧪 Pod Example (YAML)

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-app-pod
spec:
  containers:
    - name: my-container
      image: nginx
```

# 🧰 Multi-Container Pods in Kubernetes

## 🧾 What is a Multi-Container Pod?

A **multi-container pod** has **two or more containers** running in a single pod.

- All containers **share the same network namespace**, IP, and storage volumes.
- Containers work **tightly together** and communicate via `localhost`.

---

## 🤝 Why Use Multi-Container Pods?

Use when containers need to:
- **Collaborate closely** within the same lifecycle.
- Share **logs, data, or configuration**.
- Be **deployed and scheduled together**.

---

## 🔧 Common Patterns

| Pattern            | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| **Sidecar**         | Helper container enhances the main app (e.g., log shipper, monitoring agent) |
| **Ambassador**      | Proxy container connects the main app to an external service                |
| **Adapter**         | Translates data formats or protocols between systems                        |

---

## 🧪 Example: Pod with 2 Containers

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: multi-container-pod
spec:
  containers:
    - name: main-app
      image: nginx
    - name: log-agent
      image: busybox
      command: ["sh", "-c", "while true; do echo Logging...; sleep 5; done"]
```

# 🚀 Deployment vs Pod Management in Kubernetes

## 🧾 What is a Pod?

- A **Pod** is the **basic unit** that runs containers.
- Created directly using `kubectl` or YAML.
- **Not ideal for production** because:
  - If a pod crashes, it won’t restart automatically.
  - No versioning or rolling updates.

---

## 🛠️ What is a Deployment?

A **Deployment** is a **higher-level object** that manages pods **automatically**.

- Ensures **desired number of replicas** are running.
- Handles **updates, rollbacks**, and **self-healing**.
- Ideal for **production environments**.

---

## 🔁 Key Differences

| Feature                 | Pod                            | Deployment                            |
|------------------------|---------------------------------|----------------------------------------|
| Purpose                | Run containers manually         | Manage pods declaratively              |
| Restart on failure     | ❌ No automatic restart         | ✅ Yes, auto-reschedules failed pods    |
| Replica management     | ❌ Manual                       | ✅ Automatic with ReplicaSet            |
| Rolling updates        | ❌ Not supported                | ✅ Supported                            |
| Rollbacks              | ❌ Not possible                 | ✅ Easy rollback to previous version    |
| Scaling                | ❌ Manual                       | ✅ Automatic (`kubectl scale`)          |
| Best for               | Testing, learning               | Production, real-world deployments     |

---

## 🧪 Example: Deployment YAML

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:1.25
```

# 📈 Scaling Applications in Kubernetes

**Scaling** means increasing or decreasing the number of pod replicas for better performance or efficiency.

---

## 🔁 Types of Scaling

| Type             | Description                                |
|------------------|--------------------------------------------|
| **Manual Scaling** | You set the number of replicas manually     |
| **Auto Scaling**   | Kubernetes adjusts replicas automatically  |

---

## ⚙️ Manual Scaling

### 🧪 Command:

```bash
kubectl scale deployment <deployment-name> --replicas=<number>

kubectl scale deployment my-nginx-deployment --replicas=5

```
## ⚙️ Horizontal Pod Autoscaler (HPA)

HPA automatically scales pods based on CPU/memory usage.

### Create HPA-
```bash
kubectl autoscale deployment my-nginx-deployment --cpu-percent=70 --min=2 --max=10
```
### Check HPA-

```bash
kubectl get hpa
```
## 🧠 Best Practices
Use manual scaling for testing or predictable workloads.

Use HPA for dynamic workloads (e.g., traffic spikes).

Make sure your application exposes resource requests/limits for autoscaling to work.