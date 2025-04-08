# Install Apache Tomcat in Jenkins
<table>
  <tr>
    <td align="center" style="background-color:#f0f8ff; padding:10px;">
      <img src="https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/d08f8ca936c18e489df753fc012e18adf80d8568/Pictures/Install%20Apache%20Tomcat%20in%20Jenkins-1.png" width="90%">
      <br><b style="color:#1f75fe;">🔵 Install Apache Tomcat in Jenkins - 1</b>
    </td>
    <td align="center" style="background-color:#fff0f5; padding:10px;">
      <img src="https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/d08f8ca936c18e489df753fc012e18adf80d8568/Pictures/Install%20Apache%20Tomcat%20in%20Jenkins-2.png" width="90%">
      <br><b style="color:#e60000;">🔴 Install Apache Tomcat in Jenkins - 2</b>
    </td>
  </tr>
</table>
## Prerequisites
- Jenkins is installed and running.
- Java 17 (Amazon Corretto) is installed.
- A Linux-based OS (Amazon Linux, CentOS, or Ubuntu).

---

## Step 1: Install Java 17
```sh
sudo yum install java-17-amazon-corretto -y
```

---

## Step 2: Download and Extract Apache Tomcat
```sh
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.98/bin/apache-tomcat-9.0.98.tar.gz
```
```sh
tar -zxvf apache-tomcat-9.0.98.tar.gz
```

---

## Step 3: Configure Tomcat Users
Edit the `tomcat-users.xml` file to add admin credentials.
```sh
sed -i '55  a\<role rolename="manager-gui"/>' apache-tomcat-9.0.98/conf/tomcat-users.xml
```
```sh
sed -i '56  a\<role rolename="manager-script"/>' apache-tomcat-9.0.98/conf/tomcat-users.xml
```
```sh
sed -i '57  a\<user username="tomcat" password="523182" roles="manager-gui, manager-script"/>' apache-tomcat-9.0.98/conf/tomcat-users.xml
```
add
```sh
  <role rolename="manager-gui"/>
  <role rolename="manager-script"/>
  <user username="tomcat" password="523182" roles="manager-gui, manager-script"/>
</tomcat-users>
```
---

## Step 4: Modify Context.xml
To allow remote access to Tomcat Manager:
```sh
sed -i '21d' apache-tomcat-9.0.98/webapps/manager/META-INF/context.xml
```
```sh
sed -i '22d' apache-tomcat-9.0.98/webapps/manager/META-INF/context.xml
```
---

## Step 5: Start Tomcat
```sh
sh apache-tomcat-9.0.98/bin/startup.sh
```

---

## Step 6: Verify Installation
Access Tomcat in the browser:
```
http://<your-server-ip>:8080
```
Log in using the configured username (`tomcat`) and password (`523182`).

---


## Step 7: Integrate Tomcat with Jenkins
1. Open Jenkins.
2. Go to **Manage Jenkins** > **Manage Plugins**.
3. Install **Deploy to Container Plugin**.
4. Configure Tomcat credentials in **Manage Credentials**.
5. Add a **Post-build action** to deploy artifacts to Tomcat.


## Configure Tomcat Credentials in Jenkins

## Step 7.1: Open Jenkins Dashboard

1. Log in to Jenkins.
2. Click on `Manage Jenkins`.
3. Navigate to `Credentials` > `System` > `Global credentials (unrestricted)`.

## Step 7.2: Add Tomcat Credentials

1. Click `Add Credentials`.
2. Enter the following details:
   - **Username:** `tomcat`
   - **Password:** `523182`
3. Click `Create`.

## Step 7.3: Copy Tomcat Credential ID

1. Go back to `Credentials`.
2. Find the newly created Tomcat credentials.
3. Copy the **Credential ID** for later use in Jenkins jobs.

---

Your Apache Tomcat server is now installed and linked to Jenkins! 🚀


## Step 8: Deploy Applications from Jenkins

1. Create a new **Jenkins Job**.
2. Configure it as a **Freestyle project** or **Pipeline**.
3. Add a build step **Deploy to Container**.
4. Provide the WAR file and target Tomcat URL.
5. Build and verify the deployment.

# Understanding Apache Tomcat

Apache Tomcat is an open-source Java Servlet Container developed by the Apache Software Foundation (ASF). It allows you to run Java web applications and supports technologies like:

- **Servlets**: Java programs that run on the server and handle requests.
- **JSP (JavaServer Pages)**: Used to create dynamic web content.
- **WebSockets**: Enables real-time communication.

### Key Features

- Lightweight and fast.
- Supports Java EE specifications.
- Secure and configurable.
- Easily integrates with Jenkins for CI/CD.

With these steps, Tomcat should be installed and ready for deployments via Jenkins. 🚀

## Conclusion
You have successfully installed and configured Apache Tomcat with Jenkins. 🚀



