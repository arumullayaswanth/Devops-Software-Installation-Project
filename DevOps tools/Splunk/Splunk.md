# <span style="color: #FF5733;">Splunk</span>

A successful Splunk implementation involves deploying the software, onboarding data sources, configuring use cases, and optimizing the environment, ultimately enabling organizations to gain insights from their data

Here's a more detailed breakdown of key aspects of a Splunk implementation:

## <span style="color: #3498DB; font-style: italic;">1. Planning and Preparation:</span>
**Define Scope and Objectives:** Clearly outline what you want to achieve with Splunk (e.g., security monitoring, IT operations, business analytics).  
**Assess Data Sources:** Identify the logs, events, and other data sources you need to ingest into Splunk.  
**Determine Architecture:** Choose the appropriate Splunk deployment architecture (e.g., on-premises, cloud, hybrid) and scale it to meet your needs.  
**Define Use Cases:** Identify specific use cases that Splunk will address, such as threat detection, performance monitoring, or compliance reporting.  
**Plan for Data Collection:** Determine how data will be ingested into Splunk, including the use of forwarders, UDP, or other methods.  
**Configure Indexing and Retention:** Set up indexing rules and retention policies to manage data storage and performance.  
**Set up Monitoring Console:** Configure the monitoring console for single or distributed environments.  

## <span style="color: #2ECC71; text-decoration: underline;">2. Deployment and Configuration:</span>  
**Install Splunk Enterprise:** Deploy Splunk Enterprise on your chosen infrastructure.  
**Configure Forwarders:** Install and configure Splunk forwarders to collect data from various sources.  
**Onboard Data Sources:** Configure Splunk to ingest data from your identified sources.  
**Configure Indexing:** Set up indexes, buckets, and retention policies.  
**Configure Users and Roles:** Implement user authentication and access control policies.  
**Configure Search Head and Search:** Configure search head and search settings for efficient data analysis.  
**Set up Splunk Enterprise Security (ES):** If you are using Splunk ES, configure it to enable security use cases.  

## <span style="color: #9B59B6; font-weight: bold;">3. Optimization and Training:</span>  
**Optimize Performance:** Tune Splunk's performance for efficient indexing and searching.  
**Optimize Data Collection:** Ensure efficient data collection and processing.  
**Train Users:** Provide training to Splunk administrators and users on how to use the platform effectively.  
**Implement Best Practices:** Follow Splunk's best practices for deployment, configuration, and use.  
**Monitor and Maintain:** Continuously monitor Splunk's performance and maintain the system to ensure optimal operation.  
**Expand Use Cases:** Explore new use cases and expand Splunk's capabilities to derive more value from your data.  

# <span style="color: #FF5733;">Interview Question: Knowledge on Datadog or Splunk</span>

### <span style="color: #3498DB;">Q: Do you have knowledge of Datadog or Splunk?</span>  

**Answer:**  
> *"I haven't had the opportunity to work directly with Datadog or Splunk, but I have experience working with similar monitoring tools. From my understanding, all monitoring solutions, whether it's Datadog, Splunk, or others, generally operate on the same core principles. They rely on:*  
> - *Installing **agents** or **forwarders** to collect data*  
> - *Transmitting logs, metrics, and traces to a central system*  
> - *Aggregating and analyzing data for monitoring and troubleshooting*  
> - *Providing dashboards and visualizations for system health and performance insights.*  

> *While I haven’t used Datadog or Splunk professionally, I am confident that my experience with other monitoring tools would allow me to quickly adapt to these platforms."*  

---

# <span style="color: #2ECC71;">Splunk: A Log Monitoring Tool</span>  

### <span style="color: #9B59B6;">Key Features of Splunk:</span>  
- **Log Collection & Aggregation:**  
  - Uses **forwarders** (Universal/Heavy) to collect logs from servers, apps, and devices.  
- **Indexing & Storage:**  
  - Data is stored in **indexes** with configurable retention policies.  
- **Search & Analysis:**  
  - Powerful **SPL (Splunk Processing Language)** for querying logs.  
- **Dashboards & Alerts:**  
  - Customizable visualizations and real-time alerting.  
- **Security & Compliance:**  
  - Used in **SIEM (Security Information & Event Management)** for threat detection.  

### <span style="color: #E74C3C;">Comparison with Other Tools:</span>  
| Feature       | Splunk          | Datadog         | Other Monitoring Tools |  
|--------------|----------------|----------------|----------------------|  
| **Primary Use** | Log Management | APM & Metrics  | Varies (Logs/Metrics) |  
| **Agent**     | Universal Forwarder | Datadog Agent | Depends on Tool |  
| **Query Language** | SPL | DQL (Datadog Query) | SQL/PromQL/etc. |  
| **Scalability** | Enterprise-grade | Cloud-native | Depends on Deployment |  

---

### <span style="color: #F39C12;">Final Thoughts:</span>  
While I haven’t worked directly with **Datadog** or **Splunk**, my experience with monitoring tools follows similar workflows. I am eager to learn and apply my skills to these platforms if given the opportunity.  



# 🚀 Splunk Enterprise Setup on AWS EC2

## ✅ Step 1: Launch EC2 Instance for Splunk Enterprise

1. **Name and Tags:** Name = `Splunk`
2. **AMI:** Amazon Linux 2 AMI (HVM), Kernel 5.10, SSD Volume Type
3. **Instance Type:** t2.medium
4. **Key Pair (Login):** `my-Key pair`
5. **Network Settings (Firewall):** Allow **All Traffic** (sg-0b2a45ed3aad43c2a)
6. **Click:** Launch Instance

---

## ✅ Step 2: Connect to EC2 Using SSH

```bash
ssh -i "my-Key pair.pem" ec2-user@<your-public-ip>
```

---

## ✅ Step 3: Install Splunk Enterprise

```bash
sudo su -
vim Splunk.sh
```
```bash
vim Splunk.sh
```

Paste the following into `Splunk.sh`:

```bash
#!/bin/bash

# Splunk Enterprise Installation Script
# Version: 1.0
# Description: Automates Splunk Enterprise installation on Linux

# Download the Splunk RPM package
echo "Downloading Splunk package..."
wget -O splunk-9.3.1-0b8d769cb912.x86_64.rpm "https://download.splunk.com/products/splunk/releases/9.3.1/linux/splunk-9.3.1-0b8d769cb912.x86_64.rpm"

# Verify download
echo "Verifying download..."
ls -lh splunk-9.3.1-0b8d769cb912.x86_64.rpm

# Install the Splunk RPM package
echo "Installing Splunk..."
sudo yum install splunk-9.3.1-0b8d769cb912.x86_64.rpm -y

# Navigate to Splunk binary directory
cd /opt/splunk/bin/

# Start Splunk and accept license
echo "Starting Splunk service..."
sudo ./splunk start --accept-license --answer-yes

# Set admin credentials
echo "Setting admin credentials..."
# Create password seed file for admin user
#Create credentials for the administrator account.
#Characters do not appear on the screen when you type in credentials.
#Please enter an administrator username: admin
#Password must contain at least:
  # * 8 total printable ASCII character(s).
#Please enter a new password: yaswanth
#Please confirm new password: Yaswanth

echo "✅ Splunk installation and setup complete!"
echo "Login at http://localhost:8000 with username: $SPLUNK_USER and password: $SPLUNK_PASSWORD"

# Enable Splunk to start automatically on system boot
./splunk enable boot-start

```

Then run:

```bash
sh Splunk.sh
```
Set credentials:
- Username: `admin`
- Password: `yaswanth`

---


# <span style="color: #FF5733;">🔌 Splunk Port Summary</span>

## <span style="color: #3498DB; font-weight: bold;">Port 8089 (Management Port)</span>
- **Purpose**: Splunk's internal management and remote communication
- **Used for**:
  - CLI operations
  - API communications
  - Distributed search management
- **Security Note**: Should be firewalled in production environments

## <span style="color: #2ECC71; text-decoration: underline;">Port 8000 (Web Port)</span>
- **Purpose**: Web interface access
- **Used for**:
  - Splunk Web UI
  - Dashboards and visualizations
  - Search head functionality
- **Default URL**: `http://<splunk_server>:8000`
- **Security Note**: Should use HTTPS in production

## <span style="color: #9B59B6; font-style: italic;">Port 9997 (Receiving Port)</span>
- **Purpose**: Data ingestion from forwarders
- **Used for**:
  - Universal Forwarder communications
  - Heavy Forwarder connections
  - Data collection from remote sources
- **Protocol**: TCP
- **Configuration**:
  ```bash
  ./splunk enable listen 9997

## ✅ Step 4:Access the Splunk Web Interface

# Splunk Web Interface Access & Configuration Guide

1. Open a web browser (Chrome, Firefox, Edge, etc.).
2. In the address bar, type the following URL:

   ```
   http://<your-public-server-ip>:8000
   ```

   **Example:**
   ```
   http://18.207.227.21:8000
   ```

3. You will be redirected to the Splunk Dashboard:
   ```
   http://18.207.227.21:8000/en-US/app/launcher/home
   ```

---

## ✅ Step 5: Configure Splunk Disk Settings

1. From the Splunk dashboard, click on **Settings** in the top navigation.
2. Under the **Server settings** section, click **General settings**.
3. Find the field:
   ```
   Pause indexing if free disk space (in MB) falls below
   ```
4. Enter `500` into the field.
5. Click **Save** to apply the changes.

---

**Note:** Make sure you have the proper permissions to change server settings in Splunk.




---

## ✅ Step 6: install Splunk Forwarder

# Installing Splunk Forwarder on EC2 Instance

## What is a Splunk Forwarder?
A **Splunk Forwarder** is a lightweight agent used to collect and send data to a Splunk indexer. It is commonly deployed on servers, devices, or endpoints to gather logs and metrics.

---

## Required Port
**Port 9997** is used for data ingestion from Universal Forwarders.

---

## Step-by-Step Installation Guide

1. SSH into your EC2 instance.

2. Create a setup script file:
   ```bash
   cd
   vim splunkforwader.sh
   ```

3. Inside `splunkforwader.sh`, add the following content:

   ```bash
   # Download Splunk Forwarder RPM package
   wget -O splunkforwarder-9.3.1-0b8d769cb912.x86_64.rpm "https://download.splunk.com/products/universalforwarder/releases/9.3.1/linux/splunkforwarder-9.3.1-0b8d769cb912.x86_64.rpm"

   # Install downloaded rpm package
   sudo yum install splunkforwarder-9.3.1-0b8d769cb912.x86_64.rpm -y

   # Switch to Splunk Forwarder bin directory
   cd /opt/splunkforwarder/bin/

   # Start Splunk Forwarder with license agreement
   sudo ./splunk start --accept-license --answer-yes

   echo "Creating password seed file..."
   # You will be prompted to enter credentials manually:
   # - Administrator username: admin
   # - Password (must meet criteria): yaswanth
   # - Confirm Password: Yaswanth
   # - would you like to change ports? y
   # - enter a new mgmt. port: 8091

   echo "✅ Splunk Forwarder setup complete!"
   echo "✅ Splunk Forwarder is successfully started!"
   ```

4. Save the script and run it:
   ```bash
   cd /opt/splunkforwarder/bin/
   ```

   ```bash
   sh splunkforwader.sh
   ```

---

## Final Notes
- Ensure port **9997** is open in your security groups and firewall.
- Confirm that the Splunk Indexer is ready to receive data.


---

## ✅ Step 7: Splunk Universal Forwarder Setup Guide

#### 1. Navigate to Splunk's bin Directory

```bash
cd /opt/splunk/bin
```

---

#### 2. Configure Forward Server

Forward logs to a Splunk indexer by running:

```bash
./splunk add forward-server <SPLUNK_INDEXER_IP>:9997
```

#### Example:

```bash
[root@ip-172-31-84-123 bin]# ./splunk add forward-server 18.207.227.21:9997
Warning: Attempting to revert the SPLUNK_HOME ownership  
Warning: Executing "chown -R splunkfwd:splunkfwd /opt/splunkforwarder"  
Splunk username: admin  
Password:  
Added forwarding to: 18.207.227.21:9997.
```

---

## 3. Restart Splunk Forwarder

```bash
./splunk restart
```

---

## 4. Add Log Path to Monitor

```bash
./splunk add monitor /var/log
```

### Example Output:

```bash
[root@ip-172-31-84-123 bin]# ./splunk add monitor /var/log  
Warning: Attempting to revert the SPLUNK_HOME ownership  
Warning: Executing "chown -R splunkfwd:splunkfwd /opt/splunkforwarder"  
Your session is invalid. Please login.  
Splunk username: admin  
Password:  
Added monitor of '/var/log'.
```

---

## 5. Restart Splunk Again

```bash
./splunk restart
```

⚠️ **Important:** Always restart Splunk after configuration changes.

---

## 6. Enable Listening on Port 9997

```bash
./splunk enable listen 9997
```

### Example Output:

```bash
[root@ip-172-31-84-123 bin]# ./splunk enable listen 9997  
Warning: Attempting to revert the SPLUNK_HOME ownership  
Warning: Executing "chown -R splunkfwd:splunkfwd /opt/splunkforwarder"  
Listening for Splunk data on TCP port 9997.
```

---

## 7. Final Restart

```bash
./splunk restart
```

---

---

## 8. Login to Splunk Web Dashboard

Open your browser and navigate to:

👉 http://18.207.227.21:8000/en-US/app/launcher/home

This takes you to the Splunk Dashboard.

### Navigation Steps:

- Go to ➡️ Splunk Dashboard  
- Click on ➡️ Search & Reporting  
- Then ➡️ Data Summary  
- Choose ➡️ Source  
- Select the desired log source to view logs


# Splunk Universal Forwarder Setup Guide

## 1. Navigate to Splunk's bin Directory

```bash
cd /opt/splunk/bin
```

---

## 2. Configure Forward Server

Forward logs to a Splunk indexer by running:

```bash
./splunk add forward-server <SPLUNK_INDEXER_IP>:9997
```

### Example:

```bash
[root@ip-172-31-84-123 bin]# ./splunk add forward-server 18.207.227.21:9997
Warning: Attempting to revert the SPLUNK_HOME ownership  
Warning: Executing "chown -R splunkfwd:splunkfwd /opt/splunkforwarder"  
Splunk username: admin  
Password:  
Added forwarding to: 18.207.227.21:9997.
```

---

## 3. Restart Splunk Forwarder

```bash
./splunk restart
```

---

## 4. Add Log Path to Monitor

```bash
./splunk add monitor /var/log
```

### Example Output:

```bash
[root@ip-172-31-84-123 bin]# ./splunk add monitor /var/log  
Warning: Attempting to revert the SPLUNK_HOME ownership  
Warning: Executing "chown -R splunkfwd:splunkfwd /opt/splunkforwarder"  
Your session is invalid. Please login.  
Splunk username: admin  
Password:  
Added monitor of '/var/log'.
```

---

## 5. Restart Splunk Again

```bash
./splunk restart
```

⚠️ **Important:** Always restart Splunk after configuration changes.

---

## 6. Enable Listening on Port 9997

```bash
./splunk enable listen 9997
```

### Example Output:

```bash
[root@ip-172-31-84-123 bin]# ./splunk enable listen 9997  
Warning: Attempting to revert the SPLUNK_HOME ownership  
Warning: Executing "chown -R splunkfwd:splunkfwd /opt/splunkforwarder"  
Listening for Splunk data on TCP port 9997.
```

---

## 7. Final Restart

```bash
./splunk restart
```


---

## 8. Login to Splunk Web Dashboard

Open your browser and navigate to:

👉 http://18.207.227.21:8000/en-US/app/launcher/home

This takes you to the Splunk Dashboard.

### Navigation Steps:

- Go to ➡️ Splunk Dashboard  
- Click on ➡️ Search & Reporting  
- Then ➡️ Data Summary  
- Choose ➡️ Source  
- Select the desired log source to view logs


---

## ✅ Step 9. Testing Method 1 – Using Apache httpd Logs

### Step 1: SSH into the Splunk EC2 Instance

```bash
cd ~
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "✅ Splunk forwarder is now configured to forward data" | sudo tee /var/www/html/index.html
```

### Step 2: Verify in Splunk

- Open your browser and navigate to:  
  👉 http://18.207.227.21:8000/en-US/app/launcher/home
- Go to ➡️ Search & Reporting  
- Click ➡️ Data Summary → Source → Click on `httpd/accesslog`

📘 You’ll now see the Apache HTTPD access logs.

---

## 10. Testing Method 2 – Using Python Logging

### Step 1: Create a Python Script

Create a file named `test.py`:

```python
import logging

# Configure logging settings
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler("/var/log/my_python_app.log"),
        logging.StreamHandler()
    ]
)

# Example usage
logging.info("This is a success log message.")
logging.error("This is an error log message.")
```

Run the script:

```bash
python3 test.py
```

### Step 2: View in Splunk

- Go to ➡️ Splunk Dashboard  
- Click ➡️ Search & Reporting → Data Summary → Source → `python_app.log`

📘 These are the Python application logs.

---

## 11. Additional Python Log Test – Error Handling

### Step 1: Create another Python Script

Create `app.py` with the following:

```python
import logging

# Configure logging settings
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler("/var/log/my_python_app.log"),
        logging.StreamHandler()
    ]
)

# Success log
logging.info("This is a success log message.")

try:
    result = 10 / 0
except ZeroDivisionError as e:
    logging.error("An error occurred: %s", e, exc_info=True)

# Additional success log
logging.info("This message will still log after the error.")
```

Run it:

```bash
python3 app.py
```

### Step 2: View Logs in Splunk

- Go to ➡️ Splunk Dashboard  
- Click ➡️ Search & Reporting → Data Summary → Source → `python_app.log`

📘 You’ll now see the Python application logs including error traces.

