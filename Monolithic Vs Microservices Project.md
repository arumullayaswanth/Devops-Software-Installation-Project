# Monolithic vs. Microservice Deployment Workflow Architecture Screenshot
![Monolithic vs. Microservice Deployment Workflow](https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/dce5648d723a521c18a45f5d78b59589896740f9/Pictures/Monolithic%20vs.%20Microservice%20Deployment%20Workflow.png)

# Monolithic Architecture Project

## 1. Architecture Planning
   - The architecture provides a structured plan for our project.

## 2. Infrastructure Setup (Terraform + Jenkins)
   - Using Terraform, we create the necessary infrastructure components:
     - **VPC (Virtual Private Cloud)**
     - **S3 Bucket** for storage  
     - **Elastic Load Balancer (ELB)** for traffic management  
     - **Web Server**  
     - **Application Server**  
     - **Database Cluster** (e.g., MySQL)  
   - The Terraform code is integrated with **Jenkins**, and when triggered, it automatically provisions the infrastructure.

## 3. Configuration Management (Ansible)
   - Once the infrastructure is set up, we use **Ansible** to configure the servers.
   - **Playbooks** are written to install and configure software on different servers:
     - **Web Server:** Installs **NGINX**  
     - **App Server:** Installs **Tomcat**  
     - **Database Server:** Installs **MySQL**  

## 4. CI/CD Pipeline (Jenkins, Git, Maven)
   - **Jenkins Pipeline** is created for continuous integration and deployment.
   - Steps in the pipeline:
     - **Fetch source code** from Git  
     - **Build with Maven** to generate a WAR file  
     - **Deploy to Tomcat on the Application Server**  

## 5. SSL Certificate Installation
   - After deployment, SSL certificates are installed to secure the application.

## Monolithic Architecture project Screenshot
<style>
  table {
    width: 100%;
    border-collapse: collapse;
  }
  td {
    padding: 10px;
    text-align: center;
  }
  img {
    border-radius: 10px;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
    width: 90%; /* Adjust width as needed */
  }
</style>

<table>
  <tr>
    <td><img src="https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/f2ad6eb19e398ceb753d49fa59b87e40127e12cb/Pictures/Microservice%20Architecture%20Project-1.png"></td>
    <td><img src="https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/f2ad6eb19e398ceb753d49fa59b87e40127e12cb/Pictures/Microservice%20Architecture%20Project-2.png"></td>
  </tr>
</table>


<p align="center">
    <img src="https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/f2ad6eb19e398ceb753d49fa59b87e40127e12cb/Pictures/Microservice%20Architecture%20Project-1.png" width="45%">
    <img src="https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/f2ad6eb19e398ceb753d49fa59b87e40127e12cb/Pictures/Microservice%20Architecture%20Project-2.png" width="45%">
</p>

---

# Microservice Architecture Project

## 1. Architecture Planning
   - Defines how microservices will interact and communicate.

## 2. Infrastructure Setup (Kops)
   - Infrastructure is set up using **Kops** (Kubernetes Operations).

## 3. Code to Image & DockerHub
   - The application code is containerized into a Docker image.
   - The image is pushed to **DockerHub** for deployment.

## 4. Deployment to Kubernetes Cluster
   - The application is deployed to a **Kubernetes (K8s) Cluster**.

## 5. SSL Certificate Installation
   - SSL certificates are installed for secure communication.

#### Monolithic vs. Microservice Deployment Workflow Architecture Screenshot
![Monolithic vs. Microservice Deployment Workflow](https://github.com/arumullayaswanth/Devops-Software-Installation-Project/blob/dce5648d723a521c18a45f5d78b59589896740f9/Pictures/Monolithic%20vs.%20Microservice%20Deployment%20Workflow.png)
