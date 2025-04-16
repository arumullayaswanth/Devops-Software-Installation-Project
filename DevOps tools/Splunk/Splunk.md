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

Paste the following into `Splunk.sh`:

```bash
wget -O splunk-9.3.1.rpm "https://download.splunk.com/products/splunk/releases/9.3.1/linux/splunk-9.3.1-0b8d769cb912.x86_64.rpm"
yum install splunk-9.3.1.rpm -y
cd /opt/splunk/bin/
./splunk start --accept-license --answer-yes
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

## ✅ Step 4: Access Splunk UI

Open browser:
```
http://<your-ec2-public-ip>:8000
```

---

## ✅ Step 5: Configure Splunk Disk Settings

- Go to **Settings → Server Settings → General Settings**
- Set: Pause indexing if disk space falls below: `500` MB

---

## ✅ Step 6: install Splunk Forwarder
go to Splunk instance


---

## ✅ Step 7: Install Splunk Forwarder

```bash
sudo su -
vim splunkforwader.sh
```

Paste into `splunkforwader.sh`:

```bash
wget -O splunkforwarder-9.3.1.rpm "https://download.splunk.com/products/universalforwarder/releases/9.3.1/linux/splunkforwarder-9.3.1-0b8d769cb912.x86_64.rpm"
yum install splunkforwarder-9.3.1.rpm -y
cd /opt/splunkforwarder/bin/
./splunk start --accept-license --answer-yes
```

Run:
```bash
sh splunkforwader.sh
```

Set credentials when prompted.

---

## ✅ Step 8: Configure Forwarder

```bash
cd /opt/splunkforwarder/bin/
./splunk add forward-server <splunk-ec2-ip>:9997
./splunk add monitor /var/log
./splunk restart
```

---

## ✅ Step 9: Enable Receiving on Splunk EC2

```bash
cd /opt/splunk/bin
./splunk enable listen 9997
./splunk restart
```

---

# 🧪 Testing Methods

## 🔹 Method 1: Apache HTTPD

```bash
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "✅ Splunk forwarder is now configured to forward data" > /var/www/html/index.html
```

In Splunk UI:
- Go to **Search & Reporting → Data Summary → Sources**
- Select: `httpd/accesslog`

---

## 🔹 Method 2: Python Logging

### test.py

```python
import logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler("/var/log/my_python_app.log"),
        logging.StreamHandler()
    ]
)
logging.info("This is a success log message.")
logging.error("This is an error log message.")
```

Run:
```bash
python3 test.py
```

### app.py

```python
import logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler("/var/log/my_python_app.log"),
        logging.StreamHandler()
    ]
)
logging.info("This is a success log message.")
try:
    result = 10 / 0
except ZeroDivisionError as e:
    logging.error("An error occurred: %s", e, exc_info=True)
logging.info("This message will still log after the error.")
```

Run:
```bash
python3 app.py
```

In Splunk UI: View `my_python_app.log` in Data Summary.

---

## 🌐 Useful Link

[Splunk Overview Medium Article](https://medium.com/@veerababu.narni232/what-is-splunk-04a79a2272c1)

