# Installing CloudWatch Agent Through Ansible - Step by Step Guide

## ✅ Step 1: Create an IAM Role for Ansible Worked Nodes
- Go to IAM Console
- Select **Trusted entity**: AWS Service
- Use Case: **EC2**
- Click **Next: Permissions**
- Attach Permission Policies: **AdministratorAccess**
- Click **Next**
- Set Role Name: `ec2-admin`
- Click **Create Role**

---

## ✅ Step 2: Grant Permissions to ansible-cloudwatch-user
1. Navigate to IAM Console
2. Go to **Users** → Click **Create User**
3. Set User Name: `ansible-cloudwatch-user`
4. Click **Next** → Set Permissions → Permission Options
5. Select **Attach Policies Directly**
6. Choose:
   - `CloudWatchFullAccess`
   - `AmazonEC2ReadOnlyAccess`
7. Click **Next** → Click **Create User**
8. Open the user profile: `ansible-cloudwatch-user`
9. Go to **Security Credentials** → **Access Keys** → **Create Access Key**
10. Use Case: **CLI**
11. Confirm "I understand the recommendation and want to proceed"
12. Click **Next** → **Create Access Key**
13. **Download** the `.csv` file

---
