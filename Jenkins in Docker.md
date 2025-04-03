# Setting Up installing Jenkins in Docker

## Step 1: Install Docker

Ensure Docker is installed on your system. If not, install it with:

### **For Ubuntu/Linux**

```bash
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
```

### Verify installation:

```bash
docker --version
```

## Step 2: Run Jenkins in a Docker Container

### **Pull the Official Jenkins Image**

```bash
docker pull jenkins/jenkins:lts
```

### **Create and Run the Jenkins Container**

```bash
docker run -d \
  --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts
```

### **Check if Jenkins is Running**

```bash
docker ps
```

## Step 3: Setup Jenkins

1. Open your browser and go to: `http://localhost:8080`
2. Retrieve the admin password:
   ```bash
   docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
   ```
3. Copy and paste the password into the Jenkins setup page.
4. Install suggested plugins.
5. Create an admin user.
6. Click **Start using Jenkins**.

## Step 4: Configure Docker Inside Jenkins

To allow Jenkins to run Docker commands inside jobs:

```bash
docker exec -u root -it jenkins bash
apt-get update && apt-get install -y docker.io
usermod -aG docker jenkins
exit
```

Restart Jenkins:

```bash
docker restart jenkins
```

## Step 5: Verify Jenkins Setup

- Go to `http://localhost:8080`
- Log in with your credentials
- Navigate to `Manage Jenkins > Manage Plugins`
- Install required plugins (e.g., **Docker Pipeline**, **Git**, **Pipeline**)

---

Your Jenkins setup in Docker is now complete! 🚀


---
---
---


# Setup Jenkins in Docker

## Step 1: Run Jenkins Container

```bash
docker run -it --name cont1 -p 8080:8080 jenkins/jenkins:lts
```

## Step 2: Access Jenkins

1. Open a web browser and go to `http://localhost:8080/`.
2. Follow the on-screen instructions to set up Jenkins.

Your Apache Tomcat server is now installed and linked to Jenkins! 🚀

