# EC2 Monitoring with Prometheus and Grafana

## 📌 Project Title: Centralized EC2 Monitoring using Prometheus and Grafana

This project demonstrates how to monitor two Amazon Linux EC2 instances using Prometheus and Grafana running on a third Ubuntu-based EC2 instance.


# 🧩 Step 1: Launch EC2 Instances for Monitoring

We will monitor **two EC2 instances (Amazon Linux)** using a **third server** that runs Prometheus and Grafana.

---

## 🖥️ EC2 Server 1 (server-1)

### 🔧 Launch Configuration:
1. Navigate to: **EC2 → Instances → Launch an instance**
2. **Name and Tags**:  
   `EC2_server-1`
3. **Amazon Machine Image (AMI)**:  
   `Amazon Linux 2023 AMI`
4. **Instance Type**:  
   `t2.micro`
5. **Network Settings**:
   - **VPC**: `myvpc`
   - **Subnet**: `my subnet`
6. **Security Groups**:
   - Add or create security group allowing **port 22 (SSH)** and **port 9100 (for Node Exporter)**.
7. **Configure Storage**: Default settings (e.g., 8 GiB gp2)
8. Click **Launch Instance**

---

## 🖥️ EC2 Server 2 (server-2)

### 🔧 Launch Configuration:
1. Navigate to: **EC2 → Instances → Launch an instance**
2. **Name and Tags**:  
   `EC2_server-2`
3. **Amazon Machine Image (AMI)**:  
   `Amazon Linux 2023 AMI`
4. **Instance Type**:  
   `t2.micro`
5. **Network Settings**:
   - **VPC**: `myvpc`
   - **Subnet**: `my subnet`
6. **Security Groups**:
   - Same as above, allow **port 22** and **port 9100**
7. **Configure Storage**: Default settings
8. Click **Launch Instance**

---

✅ You now have two EC2 Amazon Linux instances ready to be monitored.



# 🧩 Step 2: Launch Monitoring Server (Ubuntu)

We use an **Ubuntu EC2 instance** for the monitoring server to avoid package/repo issues on Amazon Linux.

### 🖥️ Monitoring Server (monitoring-server)

### 🔧 Launch Configuration:
1. Navigate to: **EC2 → Instances → Launch an instance**
2. **Name and Tags**:  
   `monitoring-server`
3. **Amazon Machine Image (AMI)**:  
   `Ubuntu Server 24.04 LTS (HVM)`
4. **Instance Type**:  
   `t2.micro`
5. **Network Settings**:
   - **VPC**: `myvpc`
   - **Subnet**: `my subnet`
6. **Security Groups**:
   - Allow **ports 22 (SSH)**, **9090 (Prometheus)**, and **3000 (Grafana)**
7. **Configure Storage**: Default settings
8. Click **Launch Instance**

---

# 🧩 Step 3: Identify Public IPs

- `server1`: `3.208.22.226` (Amazon Linux EC2 - Node Exporter)
- `server2`: `204.236.214.236` (Amazon Linux EC2 - Node Exporter)
- `monitoring-server`: `54.210.181.64` (Ubuntu EC2 - Prometheus + Grafana)

✅ Ensure SSH access to all instances is working.

---

# 🧩 Step 4: Install Prometheus on Monitoring Server

### 🔗 Connect to your monitoring-server via SSH

```bash
ssh -i <your-key.pem> ubuntu@54.210.181.64
```

### 🛠️ Install Prometheus

```bash
sudo apt update -y
sudo apt upgrade -y
sudo -i

wget https://github.com/prometheus/prometheus/releases/download/v2.48.0/prometheus-2.48.0.linux-amd64.tar.gz
tar xvf prometheus-2.48.0.linux-amd64.tar.gz
sudo mv prometheus-2.48.0.linux-amd64 /opt/prometheus
```

---

# 🧩 Step 5: Configure Prometheus

### 📝 Create Configuration File

```bash
sudo nano /opt/prometheus/prometheus.yml
```

### ✏️ Paste this Configuration

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

alerting:
  alertmanagers:
    - static_configs:
        - targets:
          # - alertmanager:9093

rule_files:
  # - "first_rules.yml"
  # - "second_rules.yml"

scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]

  - job_name: "ec2_servers"
    static_configs:
      - targets: ["3.208.22.226:9100"]
        labels:
          instance: "server1"
      - targets: ["204.236.214.236:9100"]
        labels:
          instance: "server2"
```

### 💾 Save and Exit in nano
- Press `Ctrl + O` → then `Enter` to save.
- Press `Ctrl + X` to exit.

### 📁 View contents (optional)
```bash
cat /opt/prometheus/prometheus.yml
```

### 🚀 Start Prometheus
```bash
sudo /opt/prometheus/prometheus --config.file=/opt/prometheus/prometheus.yml &
```

---

# 🧩 Step 6: Verify Prometheus UI

Open your browser and go to http://monitor-serverpublicip:9090. //You should see the Prometheus web interface.

```
http://54.210.181.64:9090
```

✅ You should see the **Prometheus web interface**.



---

## ✅ Step 7: Connect to EC2 Server-1 and Install Node Exporter

1. **Connect to EC2 Server-1**
   ```bash
   ssh -i your-key.pem ubuntu@<EC2-Server-1-Public-IP>
   ```

2. **Switch to root**
   ```bash
   sudo -i
   ```

3. **Download and install Node Exporter**
   ```bash
   wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
   tar xvf node_exporter-1.7.0.linux-amd64.tar.gz
   sudo mv node_exporter-1.7.0.linux-amd64/node_exporter /usr/local/bin/
   ```

4. **Start Node Exporter**
   ```bash
   sudo /usr/local/bin/node_exporter &
   ```

5. **Verify**
   - Open a browser and go to:
     ```
     http://3.208.22.226:9100/metrics
     ```
   - You should see system metrics in text format.

---

## ✅ Step 8: Connect to EC2 Server-2 and Install Node Exporter

1. **Connect to EC2 Server-2**
   ```bash
   ssh -i your-key.pem ubuntu@<EC2-Server-2-Public-IP>
   ```

2. **Switch to root**
   ```bash
   sudo -i
   ```

3. **Download and install Node Exporter**
   ```bash
   wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
   tar xvf node_exporter-1.7.0.linux-amd64.tar.gz
   sudo mv node_exporter-1.7.0.linux-amd64/node_exporter /usr/local/bin/
   ```

4. **Start Node Exporter**
   ```bash
   sudo /usr/local/bin/node_exporter &
   ```

5. **Verify**
   - Open a browser and go to:
     ```
     http://204.236.214.236:9100/metrics
     ```
   - You should see system metrics in text format.

---

## ✅ Step 9: Install Grafana on Monitoring Server (Ubuntu)

1. **Connect to your monitoring server**
   ```bash
   ssh -i your-key.pem ubuntu@<Monitoring-Server-Public-IP>
   ```

2. **Install required dependencies and Grafana**
   ```bash
   sudo apt-get update
   sudo apt-get install -y software-properties-common
   sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
   wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
   sudo apt-get update
   sudo apt-get install grafana -y
   ```

3. **Start and enable Grafana service**
   ```bash
   sudo systemctl start grafana-server
   sudo systemctl enable grafana-server
   ```

4. **Access Grafana**
   - Open a browser and go to:
     ```
     http://<Monitoring-Server-Public-IP>:3000
     ```
   - Default login:
     - **Username**: `admin`
     - **Password**: `admin` (you will be prompted to change it)

---

🎉 Done! Node Exporter is running on both EC2 servers and Grafana is set up on your monitoring server.















### ✅ Access Grafana Web Interface
1. Open your browser and go to http://monitor-server public-ip3000. You should see the Grafana login page. 

2. Open your browser and go to:  
   `http://192.168.1.30:3000`

3. Login with default credentials:  
   - Username: `admin`  
   - Password: `admin`

4. Change the default password when prompted.

---
## Step 10:
### ⚙️ Configure Grafana Add Prometheus as a Data Source
1. In Grafana sidebar, click the **Gear icon (⚙)** → **Data Sources**
2. Click **Add data source**
3. Select **Prometheus**
4. In the **HTTP URL** field, enter:  
   `http://192.168.1.30:9090`
5. Click **Save & Test**
6. ✅ You should see: **“Data source is working”**

---
## Step 11:
## 🧩 Create a Dashboard in Grafana

### 📊 Create Your First Dashboard
1. In the left sidebar, click the **“+” icon → Dashboard**
2. Click **“Add new panel”**

### 🔍 Add PromQL Query
3. At the bottom, select **Prometheus** as the data source
4. In the query box, enter PromQL like:
   - `node_cpu_seconds_total`
   - `node_memory_MemAvailable_bytes`
   - `node_filesystem_avail_bytes`

### 📝 Customize Panel
5. Set a **Panel Title** like: `CPU Usage`, `Memory`, `Disk Space`
6. Choose visualization type (Graph, Gauge, Table, etc.)

### 💾 Save Dashboard
7. Click **Apply**
8. Click the **Save icon** (top-right)
9. Name it: `EC2 Monitoring`
10. Click **Save**

---

## 📌 Outcome

✅ You now have:
- **Centralized Monitoring** via Prometheus scraping EC2 metrics  
- **Grafana Dashboard** displaying those metrics  
- **Node Exporter** exposing EC2 server performance data
