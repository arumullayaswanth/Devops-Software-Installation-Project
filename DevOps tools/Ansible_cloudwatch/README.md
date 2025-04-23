# Installing CloudWatch Agent Through Ansible - Step by Step Guide

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





