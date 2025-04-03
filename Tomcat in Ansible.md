# Apache Tomcat installing  Ansibe
## Overview

Apache Tomcat is an open-source implementation of Java Servlet, JavaServer Pages (JSP), and WebSocket technologies. It is developed by the Apache Software Foundation and is widely used to deploy Java-based web applications. Tomcat acts as a lightweight application server, providing a reliable environment for running Java applications.

### Features of Apache Tomcat:

- **Lightweight and Fast:** Optimized for Java web applications.
- **Servlet & JSP Support:** Implements the latest Java EE specifications.
- **Security Features:** Provides role-based access control, SSL, and authentication mechanisms.
- **Integration with Web Servers:** Can be used alongside Apache HTTP Server for scalability.
- **Cross-Platform:** Runs on Windows, Linux, and macOS.

---


<table>
  <tr>
    <td align="center" style="background-color:#f0f8ff; padding:10px;">
      <img src="https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/56bb8c65d8f7ed903db71475984347c1c86c201a/Pictures/installing%20tomcat%20with%20Ansible-1.png" width="90%">
      <br><b style="color:#1f75fe;">🔵 Install Apache Tomcat in Ansible - 1</b>
    </td>
    <td align="center" style="background-color:#fff0f5; padding:10px;">
      <img src="https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/d0977558ba5174254e55c0cad5de5e71f672b501/Pictures/installing%20tomcat%20with%20Ansible.png" width="90%">
      <br><b style="color:#e60000;">🔴 Install Apache Tomcat in Ansible - 2</b>
    </td>
  </tr>
</table>
## Ansible Playbook: `tomcat.yml`

```yaml
- hosts: dev
  tasks:
    - name: download tomcat from dlcdn
      get_url:
        url: "https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.102/bin/apache-tomcat-9.0.102.tar.gz"
        dest: "/root/"

    - name: untar the apache file
      command: tar -zxvf apache-tomcat-9.0.102.tar.gz


    - name: rename the tomcat
      command: mv apache-tomcat-9.0.102 tomcat
      tags: abc

    - name: install java
      command: yum install java-1.8.0-openjdk -y

    - name: setting the roles in tomcat-user.xml file
      template:
        src: tomcat-users.xml
        dest: /root/tomcat/conf/tomcat-users.xml

    - name: delete two lines in context.xml
      template:
        src: context.xml
        dest: /root/tomcat/webapps/manager/META-INF/context.xml

    - name: start the tomcat
      shell: nohup /root/tomcat/bin/startup.sh
```

---

## Tomcat Users Configuration: `tomcat-users.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0">
<!--
  By default, no user is included in the "manager-gui" role required
  to operate the "/manager/html" web application.  If you wish to use this app,
  you must define such a user - the username and password are arbitrary.

  Built-in Tomcat manager roles:
    - manager-gui    - allows access to the HTML GUI and the status pages
    - manager-script - allows access to the HTTP API and the status pages
    - manager-jmx    - allows access to the JMX proxy and the status pages
    - manager-status - allows access to the status pages only

  The users below are wrapped in a comment and are therefore ignored. If you
  wish to configure one or more of these users for use with the manager web
  application, do not forget to remove the <!.. ..> that surrounds them. You
  will also need to set the passwords to something appropriate.
-->
<!--
  <user username="admin" password="<must-be-changed>" roles="manager-gui"/>
  <user username="robot" password="<must-be-changed>" roles="manager-script"/>
-->
<!--
  The sample user and role entries below are intended for use with the
  examples web application. They are wrapped in a comment and thus are ignored
  when reading this file. If you wish to configure these users for use with the
  examples web application, do not forget to remove the <!.. ..> that surrounds
  them. You will also need to set the passwords to something appropriate.
-->
<!--
  <role rolename="tomcat"/>
  <role rolename="role1"/>
  <user username="tomcat" password="<must-be-changed>" roles="tomcat"/>
  <user username="both" password="<must-be-changed>" roles="tomcat,role1"/>
  <user username="role1" password="<must-be-changed>" roles="role1"/>
-->
  <role rolename="manager-gui"/>
  <role rolename="manager-script"/>
  <user username="tomcat" password="523182" roles="manager-gui, manager-script"/>
</tomcat-users>
```

---

## Context Configuration: `context.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<Context antiResourceLocking="false" privileged="true" >
  <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor"
                   sameSiteCookies="strict" />
  <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/>
</Context>
```

---

## How to Use
1. Save the above files (`tomcat.yml`, `tomcat-users.xml`, `context.xml`) in your Ansible directory.
2. Run the playbook using:
   ```sh
   vim tomcat.yml
   ```
   ```sh
   vim tomcat-users.xml
   ```
   ```sh
   vim context.xml
   ```
   ```sh
   ansible-playbook tomcat.yml
   ```
3. Access Tomcat via `http://your-server-ip:8080/`.
4. Log in to the Tomcat Manager using the credentials from `tomcat-users.xml`.

---

## Notes
- Ensure you have Ansible installed on your system before running the playbook.
- Modify the `tomcat-users.xml` file to set a more secure password before deploying in production.
- The playbook assumes a root directory `/root/` for simplicity; adjust paths if necessary.

