# 🚀 GitLab CI/CD for Terraform Project (Step-by-Step Guide)


<table style="width: 100%; margin-bottom: 20px;">
  <tr>
    <td align="center" style="padding: 10px; background-color: #f4f4f9; border-radius: 8px;">
      <img src="https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/f83c8ab47e6fa9fc20ea3ef427c0600d7157bc38/Pictures/Gitlab%20architecture.png?raw=true" width="80%" style="border: 2px solid #ddd; border-radius: 10px;">
      <br><b>GitLab Architecture</b>
    </td>
  </tr>
</table>

<table style="width: 100%; margin-bottom: 20px;">
  <tr>
    <td align="center" style="padding: 10px; background-color: #e9f7f5; border-radius: 8px;">
      <img src="https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/f83c8ab47e6fa9fc20ea3ef427c0600d7157bc38/Pictures/Gitlab%20architecture-1.png?raw=true" width="80%" style="border: 2px solid #ddd; border-radius: 10px;">
      <br><b>GitLab Architecture (Part 2)</b>
    </td>
  </tr>
</table>



---

## ✅ Step 1: Sign into GitLab using GitHub

1. Go to: [https://gitlab.com](https://gitlab.com)
2. Click **“Sign in with GitHub”**
3. Authorize GitLab to access your GitHub account
4. GitLab account will be created automatically (if first time)

---

## 🔹 Step 2: Create a New GitLab Project

1. On the left sidebar, click **“+” → “New project”**
2. Choose **“Create blank project”**
3. Set your project name (e.g., `gitlabcicd`)
4. Click **“Create project”**

---

## 🔐 Step 3: Setup SSH Key on Your Laptop

### ✅ Generate SSH Key

Open Command Prompt or Git Bash and run:

```bash
ssh-keygen
```

- Press Enter three times to accept the default options.

### 📁 Locate Your SSH Key

Navigate to:

```txt
C:\Users\Yaswanth Reddy\.ssh\
```

Open the `id_ed25519.pub` file and **copy the entire contents** (starts with `ssh-ed25519`).

---

## 🔐 Step 4: Add SSH Key to GitLab

1. In GitLab, click your profile icon (top right) → **Preferences**
2. Go to the **SSH Keys** tab
3. Paste the copied key
4. Add a title (e.g., "My Laptop") and click **Add key**

---

## 🔹 Step 5: Push Terraform Code to GitLab from VS Code

### 🖥️ Open VS Code Terminal:

```bash
cd
ls
cd Downloads
mkdir gitlabcicd
cd gitlabcicd

git clone git@gitlab.com:arumullayaswanth/gitlabcicd.git
cd gitlabcicd
ls
```

### 📦 Add Terraform Files:

Inside `gitlabcicd`, create:

- `main.tf`
- `variables.tf`
- `outputs.tf`

#### Example `main.tf`:
```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-example-bucket-12345"
}
```

### ✅ Git Commands to Push Your Code:
```bash
git status
git init
git add .
git status
git commit -m "cicdproject"
git push
```

---

## 🔹 Step 6: Confirm Code in GitLab

1. Go to: [https://gitlab.com](https://gitlab.com)
2. Open your project: `gitlabcicd`
3. Go to the **Repository** tab
4. Your Terraform files should be visible 🎉

---


<table style="width: 100%; margin-bottom: 20px;">
  <tr>
    <td align="center" style="padding: 10px; background-color: #f9f9f9; border-radius: 8px;">
      <img src="https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/f83c8ab47e6fa9fc20ea3ef427c0600d7157bc38/Pictures/gitlav%20vs%20jenkins.png?raw=true" width="80%" style="border: 2px solid #ddd; border-radius: 10px;">
      <br><b>GitLab vs Jenkins</b>
    </td>
  </tr>
</table>

## ✅ Step-by-Step GitLab CI/CD for Terraform Project

---

## 🔹 Step 7: Create `.gitlab-ci.yml` for CI/CD Pipeline

In your `gitlabcicd` project folder:

```bash
touch .gitlab-ci.yml
```

### 🧩 Example `.gitlab-ci.yml`:

```yaml
stages:
  - validate
  - plan
  - apply
  - destroy

image:
  name: registry.gitlab.com/gitlab-org/terraform-images/stable:latest

variables:
  AWS_ACCESS_KEY_ID: "${AWS_ACCESS_KEY_ID}"
  AWS_SECRET_ACCESS_KEY: "${AWS_SECRET_ACCESS_KEY}"
  AWS_REGION: "us-east-1"

before_script:
  - terraform --version
  - terraform init

validate:
  stage: validate
  script:
    - terraform validate

plan:
  stage: plan
  script:
    - terraform plan

apply:
  stage: apply
  script:
    - terraform apply -auto-approve

destroy:
  stage: destroy
  script:
    - terraform destroy -auto-approve
  when: manual
```

### 💻 Push the `.gitlab-ci.yml` file:

```bash
git status
git add .
git status
git commit -m "modified"
git push
```

---

## 🔐 Step 8: Configure AWS Keys Inside GitLab CI/CD

1. Go to your project → ⚙️ **Settings** → **CI / CD**
2. Scroll to the **Variables** section
3. Click **Expand**

### Add Variables:

- **Key**: `AWS_ACCESS_KEY_ID`
  - **Value**: your actual AWS access key ID
- **Key**: `AWS_SECRET_ACCESS_KEY`
  - **Value**: your actual AWS secret access key

Click **Add variable** for each.

---

## 📦 Step 9: Monitor Your Pipeline

1. Go to your GitLab project
2. Navigate to **Build → Pipelines**
3. View pipeline stages: **validate → plan → apply**
4. Click on job names to view logs
5. Click **Play** on the apply step (manual trigger) to deploy

---

