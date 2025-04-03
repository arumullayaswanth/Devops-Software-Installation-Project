# Portainer Setup Guide ( Docker GUI )

## 📌 Introduction

Portainer is a **GUI-based container management tool** designed to simplify Docker container operations. It helps in managing multiple clusters, accessing containers, and migrating stacks between clusters. Portainer is mainly used for **production environments** in large enterprises.

### 🏗️ Components

Portainer consists of two main components:

- **Portainer Server**
- **Portainer Agent**

Both run as lightweight Docker containers on a Docker engine.

---

## ✅ Prerequisites

Before setting up Portainer, ensure the following:

- Docker Engine is installed and running ✅
- Swarm mode is enabled ✅
- All necessary ports are open ✅

---

## 🚀 Installation Steps

### 1️⃣ Enable Swarm Mode

```bash
docker swarm init
```

### 2️⃣ Download Portainer Agent Stack File

```bash
curl -L https://downloads.portainer.io/ce2-16/portainer-agent-stack.yml -o portainer-agent-stack.yml
```

### 3️⃣ Deploy the Stack

```bash
docker stack deploy -c portainer-agent-stack.yml portainer
```

### 4️⃣ Verify Stack Deployment

```bash
docker stack ps portainer
```

### 5️⃣ Access Portainer UI

- Copy the **public IP address** of the Docker Swarm Manager.
- Open a web browser and enter:
  ```
  http://<public-ip>:9000
  ```
  Example:
  ```
  http://56.864.575.123:9000
  ```

### 6️⃣ Login to Portainer

- **Username:** `admin`
- **Password:** `*************`

### 7️⃣ Verify Running Services

```bash
docker services ls
```

### 8️⃣ Check Running Containers

```bash
docker ps -a
```

```bash
docker ps
```

### 9️⃣ View Portainer Logs

```bash
docker logs -f $(docker ps -q --filter "name=portainer")
```

### 🔟 Remove Portainer Stack

```bash
docker stack rm portainer
```

### 1️⃣1️⃣ Restart Portainer Container

```bash
docker restart $(docker ps -q --filter "name=portainer")
```

---

## 🎯 Conclusion

By following these steps, you have successfully set up **Portainer** to manage Docker containers with an easy-to-use web interface. Now you can monitor and control your containerized applications efficiently! 🚢✨

