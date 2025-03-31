# Install Apache Tomcat in Jenkins

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
sed -i '56  a\<role rolename="manager-gui"/>' apache-tomcat-9.0.98/conf/tomcat-users.xml
sed -i '57  a\<role rolename="manager-script"/>' apache-tomcat-9.0.98/conf/tomcat-users.xml
sed -i '58  a\<user username="tomcat" password="523182" roles="manager-gui, manager-script"/>' apache-tomcat-9.0.98/conf/tomcat-users.xml
```

---

## Step 4: Modify Context.xml
To allow remote access to Tomcat Manager:
```sh
sed -i '21d' apache-tomcat-9.0.98/webapps/manager/META-INF/context.xml
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

---

## Conclusion
You have successfully installed and configured Apache Tomcat with Jenkins. 🚀

