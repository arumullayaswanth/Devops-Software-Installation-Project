# Software Installation in DevOps (3-Tier Architecture) on EC2 Ubuntu

## 1️⃣ Frontend (Web Server) - Apache or Nginx

### Install Apache2
```sh
sudo apt update
sudo apt install apache2 -y
systemctl enable apache2
systemctl start apache2
```

### Install Nginx
```sh
sudo apt update
sudo apt install nginx -y
systemctl enable nginx
systemctl start nginx
```

## 2️⃣ Backend (Application Server) - Java, Python, or Node.js

### Install Java (JDK 11)
```sh
sudo apt update -y
apt-get install default-jre -y
apt-get install default-jdk -y
java -version
```

### Install Python
```sh
sudo apt-get update -y
sudo apt-get install python3 -y
sudo apt-get install python3.8 -y
apt install python3-pip -y
pip install NumPy Pandas
```

### Install Node.js
```sh
apt install nodejs -y
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
node -v
```

## 3️⃣ Database Server - MySQL, Percona, or ArangoDB

### Install Percona MySQL
```sh
wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb
sudo dpkg -i percona-release_latest.$(lsb_release -sc)_all.deb
percona-release setup ps80
sudo apt install percona-server-server
mysql -u root -p
```

### Install ArangoDB
```sh
echo 'deb https://download.arangodb.com/arangodb34/DEBIAN/ /' | sudo tee /etc/apt/sources.list.d/arangodb.list
wget -q https://download.arangodb.com/arangodb34/DEBIAN/Release.key -O- | sudo apt-key add -
sudo apt update -y
sudo apt -y install apt-transport-https
sudo apt -y install arangodb3
sudo systemctl start arangodb3
sudo systemctl status arangodb3
sudo arangosh
```
#### ArangoDB Installation Screenshot
![ArangoDB Installation](https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/4abe0b43ce9621ea4e67228d50d4fdfb55f2f58b/Pictures/ArangoDB-1.png)
![ArangoDB Installation](https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/4abe0b43ce9621ea4e67228d50d4fdfb55f2f58b/Pictures/ArangoDB-2.png)
![ArangoDB Installation](https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/4abe0b43ce9621ea4e67228d50d4fdfb55f2f58b/Pictures/ArangoDB-3.png)
![ArangoDB Installation](https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/4abe0b43ce9621ea4e67228d50d4fdfb55f2f58b/Pictures/ArangoDB-4.png)
![ArangoDB Installation](https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/4abe0b43ce9621ea4e67228d50d4fdfb55f2f58b/Pictures/ArangoDB-5.png)
![ArangoDB Installation](https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/4abe0b43ce9621ea4e67228d50d4fdfb55f2f58b/Pictures/ArangoDB-6.png)

## 4️⃣ Access ArangoDB GUI

### **Check ArangoDB Service Status**
```sh
sudo systemctl status arangodb3
```
If not running, start it with:
```sh
sudo systemctl start arangodb3
```

### **Enable Remote Access (Optional)**
1. Edit the ArangoDB config file:
   ```sh
   sudo nano /etc/arangodb3/arangod.conf
   ```
2. Update the **[server]** section:
   ```ini
   endpoint = tcp://0.0.0.0:8529
   ```
3. Restart ArangoDB:
   ```sh
   sudo systemctl restart arangodb3
   ```

### **Open Web Interface**
- Open your browser and enter:
  ```
  http://<EC2-Public-IP>:8529
  ```
  Example:
  ```
  http://54.123.45.67:8529
  ```
- Log in with the **root user** and password set during installation.

### **Allow Security Group Access**
If you can't access the UI, update AWS **Security Group** settings:
1. Go to **EC2 Dashboard** → **Security Groups**.
2. Edit inbound rules:
   - **Protocol:** TCP
   - **Port Range:** 8529
   - **Source:** Your IP (or 0.0.0.0/0 for open access)

### **Explore ArangoDB GUI**
Once logged in, you can:
- **Manage databases**
- **Run AQL queries**
- **Monitor system stats**
- **Import/export data**


![ArangoDB Installation](https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/4abe0b43ce9621ea4e67228d50d4fdfb55f2f58b/Pictures/ArangoDB-7.png)

## ✅ Summary of DevOps 3-Tier EC2 Architecture

| **Tier**      | **Software**               | **EC2 Setup**                 |
|--------------|---------------------------|------------------------------|
| **Frontend** | Apache2, Nginx             | Ubuntu, Security Group (80, 443) |
| **Backend**  | Node.js, Python, Java      | Ubuntu, Security Group (3000) |
| **Database** | Percona MySQL, ArangoDB    | Ubuntu, Security Group (3306, 8529) |
