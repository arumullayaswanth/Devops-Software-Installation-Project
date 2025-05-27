# Installing CloudWatch Agent Through Ansible - Step by Step Guide

<table style="width: 100%; margin-bottom: 20px;">
  <tr>
    <td align="center" style="padding: 10px; background-color: #e9f7f5; border-radius: 8px;">
      <img src="https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/13885500c69460a373d5eaf5bbc69f11c181932d/Pictures/Ansible%20cloudwatch%20architecture.png" width="100%" style="border: 2px solid #ddd; border-radius: 10px;">
      <br><b>Centralised Log Management with Ansible and CloudWatch </b>
    </td>
  </tr>
</table>

## ✅ Step 1: Create an IAM Role for Ansible Worked Nodes
1. Open the **IAM Console**.
2. Click on **Roles** → **Create Role**.
3. Select **Trusted entity type**: AWS service.
4. Choose **Use case**: EC2.
5. Click **Next**.
6. Attach the following permission policy: `AdministratorAccess`.
7. Click **Next**.
8. Enter Role name: `ec2-admin`.
9. Click **Create role**.

---

## ✅ Step 2: Create IAM User for Ansible CloudWatch Access
1. Go to the **IAM Console** → **Users** → Click **Create User**.
2. Enter user name: `ansible-cloudwatch-user`.
3. Click **Next**.
4. Choose **Attach policies directly**.
5. Select the following policies:
   - `CloudWatchFullAccess`
   - `AmazonEC2ReadOnlyAccess`
6. Click **Next** and then **Create User**.
7. Open the user profile `ansible-cloudwatch-user`.
8. Go to **Security Credentials** → **Access Keys** → Click **Create Access Key**.
9. Choose **Use Case**: CLI.
10. Confirm: "I understand the recommendation and want to proceed".
11. Click **Next** → **Create Access Key**.
12. **Download** the `.csv` file for access and secret keys.

---

## ✅ Step 3: Launch Ansible Server EC2 Instance
1. Go to the **EC2 Console** → Click **Launch Instance**.
2. Set **Name**: `Ansible server`.
3. Choose AMI: **Amazon Linux 2 AMI (HVM), Kernel 5.10**.
4. Instance type: `t2.micro`.
5. Choose your key pair: `my-key-pair`.
6. Network Settings → **Allow all traffic**.
7. IAM role: `ec2-admin`.
8. Storage: Leave default (8 GiB).
9. Click **Launch Instance**.

---

## ✅ Step 4: Launch EC2 Instance - dev-1
1. Go to **EC2 Console** → Click on **Launch Instance**.
2. Name: `dev-1`
3. AMI: **Amazon Linux 2 AMI (HVM) – Kernel 5.10, SSD Volume Type**
4. Instance Type: `t2.micro`
5. Key Pair: `my-key-pair`
6. Network Settings: **Allow all traffic**
7. Storage: Default (8 GiB SSD)
8. IAM Role: `ec2-admin`
9. Click **Launch Instance**

---

## ✅ Step 5: Launch EC2 Instance - dev-2
1. Go to **EC2 Console** → Click on **Launch Instance**.
2. Name: `dev-2`
3. AMI: **Amazon Linux 2 AMI (HVM) – Kernel 5.10, SSD Volume Type**
4. Instance Type: `t2.micro`
5. Key Pair: `my-key-pair`
6. Network Settings: **Allow all traffic**
7. Storage: Default (8 GiB SSD)
8. IAM Role: `ec2-admin`
9. Click **Launch Instance**

---

## ✅ Step 6: Launch EC2 Instance - dev-3
1. Go to **EC2 Console** → Click on **Launch Instance**.
2. Name: `dev-3`
3. AMI: **Amazon Linux 2 AMI (HVM) – Kernel 5.10, SSD Volume Type**
4. Instance Type: `t2.micro`
5. Key Pair: `my-key-pair`
6. Network Settings: **Allow all traffic**
7. Storage: Default (8 GiB SSD)
8. IAM Role: `ec2-admin`
9. Click **Launch Instance**

---

## ✅ Step 7: Launch EC2 Instance - test-1
1. Go to **EC2 Console** → Click on **Launch Instance**.
2. Name: `test-1`
3. AMI: **Amazon Linux 2 AMI (HVM) – Kernel 5.10, SSD Volume Type**
4. Instance Type: `t2.micro`
5. Key Pair: `my-key-pair`
6. Network Settings: **Allow all traffic**
7. Storage: Default (8 GiB SSD)
8. IAM Role: `ec2-admin`
9. Click **Launch Instance**

---

## ✅ Step 8: Launch EC2 Instance - test-2
1. Go to **EC2 Console** → Click on **Launch Instance**.
2. Name: `test-2`
3. AMI: **Amazon Linux 2 AMI (HVM) – Kernel 5.10, SSD Volume Type**
4. Instance Type: `t2.micro`
5. Key Pair: `my-key-pair`
6. Network Settings: **Allow all traffic**
7. Storage: Default (8 GiB SSD)
8. IAM Role: `ec2-admin`
9. Click **Launch Instance**
---

## ✅ Step 9: Launch EC2 Instance - test-3
1. Go to **EC2 Console** → Click on **Launch Instance**.
2. Name: `test-3`
3. AMI: **Amazon Linux 2 AMI (HVM) – Kernel 5.10, SSD Volume Type**
4. Instance Type: `t2.micro`
5. Key Pair: `my-key-pair`
6. Network Settings: **Allow all traffic**
7. Storage: Default (8 GiB SSD)
8. IAM Role: `ec2-admin`
9. Click **Launch Instance**

---

## ✅ Step 10: Connect to the Ansible Server Instance

1. Go to the **Instances** page in the EC2 dashboard.
2. Select the **Ansible server instance**.
3. Click **Connect** → Choose **EC2 Instance Connect (Browser-based SSH)** or use your preferred method (e.g., SSH with .pem key).

### Run the following commands:

```bash
sudo -i
```
```bash
hostnamectl set-hostname Ansible-server
```
```bash
sudo -i
```
```bash
passwd root     
```
***Set your password to: 523182***

```bash
vim /etc/ssh/sshd_config
```
 ***Go to line 38 and uncomment: like thiis ( PermitRootLogin yes )
 Go to line 63 and replace no with yes: like this (PasswordAuthentication yes )***

```bash
systemctl restart sshd
```
```bash
systemctl status sshd
```


---

## ✅ Step 11: Connect to the dev-1 Instance

### Run the following commands:

```bash
sudo -i
```
```bash
hostnamectl set-hostname dev-1
```
```bash
sudo -i
```
```bash
passwd root     
```
***Set your password to: 523182***

```bash
vim /etc/ssh/sshd_config
```
 ***Go to line 38 and uncomment: like thiis ( PermitRootLogin yes )                                          
   Go to line 63 and replace no with yes: like this (PasswordAuthentication yes )***

```bash
systemctl restart sshd
```
```bash
systemctl status sshd
```

---

## ✅ Step 12: Connect to the dev-2 Instance

### Run the following commands:

```bash
sudo -i
```
```bash
hostnamectl set-hostname dev-2
```
```bash
sudo -i
```
```bash
passwd root     
```
***Set your password to: 523182***

```bash
vim /etc/ssh/sshd_config
```
 ***Go to line 38 and uncomment: like thiis ( PermitRootLogin yes )                                          
    Go to line 63 and replace no with yes: like this (PasswordAuthentication yes )***

```bash
systemctl restart sshd
```
```bash
systemctl status sshd
```

---

## ✅ Step 13: Connect to the dev-3 Instance

### Run the following commands:

```bash
sudo -i
```
```bash
hostnamectl set-hostname dev-3
```
```bash
sudo -i
```
```bash
passwd root     
```
***Set your password to: 523182***

```bash
vim /etc/ssh/sshd_config
```
 ***Go to line 38 and uncomment: like thiis ( PermitRootLogin yes )                                          
     Go to line 63 and replace no with yes: like this (PasswordAuthentication yes )***

```bash
systemctl restart sshd
```
```bash
systemctl status sshd
```

---

## ✅ Step 14: Connect to the test-1 Instance

### Run the following commands:

```bash
sudo -i
```
```bash
hostnamectl set-hostname test-1
```
```bash
sudo -i
```
```bash
passwd root     
```
***Set your password to: 523182***

```bash
vim /etc/ssh/sshd_config
```
 ***Go to line 38 and uncomment: like thiis ( PermitRootLogin yes )                                          
   Go to line 63 and replace no with yes: like this (PasswordAuthentication yes )***

```bash
systemctl restart sshd
```
```bash
systemctl status sshd
```

---

## ✅ Step 15: Connect to the test-2 Instance

### Run the following commands:

```bash
sudo -i
```
```bash
hostnamectl set-hostname test-2
```
```bash
sudo -i
```
```bash
passwd root     
```
***Set your password to: 523182***

```bash
vim /etc/ssh/sshd_config
```
 ***Go to line 38 and uncomment: like thiis ( PermitRootLogin yes )                                          
 Go to line 63 and replace no with yes: like this (PasswordAuthentication yes )***

```bash
systemctl restart sshd
```
```bash
systemctl status sshd
```

---

## ✅ Step 16: Connect to the test-3 Instance

### Run the following commands:

```bash
sudo -i
```
```bash
hostnamectl set-hostname test-3
```
```bash
sudo -i
```
```bash
passwd root     
```
***Set your password to: 523182***

```bash
vim /etc/ssh/sshd_config
```
 ***Go to line 38 and uncomment: like thiis ( PermitRootLogin yes )                                          
  Go to line 63 and replace no with yes: like this (PasswordAuthentication yes )***

```bash
systemctl restart sshd
```
```bash
systemctl status sshd
```

---


# ✅ Step 17: Connect to the Ansible Server Instance and Set Up Ansible

## 🔧 Install Ansible on Amazon Linux 2

```bash
sudo amazon-linux-extras enable ansible2
```
```bash
sudo yum install ansible -y
```
```bash
amazon-linux-extras install ansible2 -y
```
```bash
yum install python python-pip python-devel -y
```

## 📝 Configure Ansible Inventory

Edit the Ansible hosts file:

```bash
vim /etc/ansible/hosts
```

Go to line number 12 and add the following:

```ini
# Ex 1: Ungrouped hosts, specify before any group headers.
[dev]
#dev-1
172.31.87.237
#dev-2
172.31.92.155
#dev-3
172.31.88.185

[test]
#test-1
172.31.82.201
#test-2
172.31.91.131
#test-3
172.31.93.147
```

## 🔑 Generate SSH Key

```bash
ssh-keygen
```
> Press Enter 4 times to accept the default options.

## 📤 Copy SSH Key to All Nodes

***dev-1***
```bash
ssh-copy-id root@172.31.87.237
# type: yes, password: 523182
ssh 172.31.87.237
# logout
ctrl+d
```
***dev-2***
```bash
ssh-copy-id root@172.31.88.185
# type: yes, password: 523182
ssh 172.31.88.185
# logout
ctrl+d
```
***dev-3***
```bash
ssh-copy-id root@172.31.92.155
# type: yes, password: 523182
ssh 172.31.92.155
# logout
ctrl+d
```
***test-1***
```bash
ssh-copy-id root@172.31.82.201
# type: yes, password: 523182
ssh 172.31.82.201
# logout
ctrl+d
```
***test-2***
```bash
ssh-copy-id root@172.31.91.131
# type: yes, password: 523182
ssh 172.31.91.131
# logout
ctrl+d
```
***test-3***
```bash
ssh-copy-id root@172.31.93.147
# type: yes, password: 523182
ssh 172.31.93.147
# logout
ctrl+d
```

## ✅ Verify Ansible Setup

Run the following command:

```bash
ansible all -m ping
```

If everything is set up correctly, you should see a success message (pong) from all your nodes.

---

# 🛠️ Project: CloudWatch Agent Setup via Ansible
 This project demonstrates how to install and configure the Amazon CloudWatch Agent across multiple EC2 instances using Ansible.


## ✅ Step 18: Deploy CloudWatch Agent Using Ansible

# ✅ Step 18: Create and Run Ansible Playbook for CloudWatch

```bash
vim cloudwatch_ansible.yml
```
Then run the playbook:

```bash
ansible-playbook cloudwatch_ansible.yml
```

---

# ✅ Step 19: Verify CloudWatch Logs in AWS Console

1. Go to the **AWS Console**.
2. Search for **CloudWatch** (Monitor Resources and Applications).
3. Navigate to **Logs** → **Log groups**.
4. Search for your log group (e.g., `LOG-FROM-EC2`) to verify logs are being received.

---


## ✅ Step 20: Create S3 Bucket for Logs

1. Go to **Amazon S3** → **Create bucket**.
2. Choose bucket type: General purpose.
3. Name: `cloudwatchlogsec2`.
4. Click **Create bucket**.

### 🔐 Add Bucket Policy

Go to `cloudwatchlogsec2` → **Permissions** → **Bucket Policy** → **Edit bucket policy**:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "logs.us-east-1.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::cloudwatchlogsec2"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "logs.us-east-1.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::cloudwatchlogsec2/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control",
                    "aws:SourceAccount": "421954350274"
                }
            }
        }
    ]
}
```

Click **Save changes**.

---

## ✅ Step 21: Export Logs from CloudWatch to S3

1. Go to **CloudWatch Console**.
2. Open `LOG-FROM-EC2` log group.
3. Click **Actions** → **View all exports to Amazon S3**.
4. Choose bucket: `cloudwatchlogsec2`.
5. Click **Export**.

---

## ✅ Step 21.1: Automate Export with Lambda

### Create Lambda Function

1. Go to **AWS Lambda** → **Create function**.
2. Choose: Basic information → Change default execution role.
3. Paste the code below:

```python
import boto3
import gzip
import json
import time
from datetime import datetime

logs_client = boto3.client('logs')
s3_client = boto3.client('s3')

S3_BUCKET_NAME = 'cloudwatchlogsec2'
LOG_GROUP = 'LOG-FROM-EC2'
LOG_STREAM = 'i-063e788f302fa4d8a'

def lambda_handler(event, context):
    timestamp = time.time()
    file_name = f'logs-{int(timestamp)}.json.gz'

    response = logs_client.get_log_events(
        logGroupName=LOG_GROUP,
        logStreamName=LOG_STREAM,
        startTime=int(time.time() - 86400) * 1000,
        endTime=int(time.time()) * 1000,
        limit=10000
    )

    log_events = [event for event in response['events']]
    log_data = json.dumps(log_events, default=str)
    compressed_log_data = gzip.compress(log_data.encode('utf-8'))

    s3_client.put_object(
        Bucket=S3_BUCKET_NAME,
        Key=f'cloudwatch-logs/{file_name}',
        Body=compressed_log_data,
        ContentType='application/gzip'
    )

    return {
        'statusCode': 200,
        'body': json.dumps('Logs exported successfully')
    }
```

4. Deploy the code and test.
5. Verify logs in the S3 bucket.

---

## ✅ Step 22: Schedule Lambda with EventBridge

1. Go to **Amazon EventBridge** → **Rules** → **Create rule**.
2. Set rule name: `lambda-s3`, rule type: `Schedule`.
3. Schedule pattern : >A fine-grained schedule that runs at a specific time, such as 8:00 a.m. PST on the first Monday of every month.
4. Schedule type : (Cron-based schedule)
5. Schedule pattern: `cron(0 18 * * ? *)`.
6. eg: Cron expression (cron(00),huurs(18),Day of month (\*),month(\*),Day of week(?),year(\*)).
7. Next
8. Select target(s) → target1 → Target types(AWS server) → Select a target(lambda funcation) 
9. Target: Lambda function `awsec2-logs`.
10. Complete rule creation.

---

## ✅ Step 22.1: Add Lambda Trigger

1. Add **Trigger** → **EventBridge (CloudWatch Events)**.
2. Choose existing rule: `lambda-s3`.
3. Click **Add**.

---

## ✅ Step 23: Amazon Simple Notification Service (SNS) Notification

1. Go to **Amazon SNS** → **Create topic**.
2. Type: Standard, Name: `cloudwatch-s3`.
3. Create subscription:

   * Protocol: Email
   * Enter your email and subscribe.
4. Confirm the subscription via your email.

---

## ✅ Step 23.1: Attach SNS to Lambda Failure

1. In Lambda, add destination:
2. Destination config:

   * Source: Asynchronous invocation
   * Condition: On failure
   * Destination type: SNS
   * Destination: `cloudwatch-s3`
3. Save configuration.

---

# 🎉 Project DONE!






# ✅ Step 24: Delete CloudWatch Configuration via Ansible

```bash
vim delete-cloudwatch_ansible.yml
```

Then run the playbook to delete:

```bash
ansible-playbook delete-cloudwatch_ansible.yml
```





