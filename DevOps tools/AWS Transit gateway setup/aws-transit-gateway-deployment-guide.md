
# Deploying AWS Transit Gateway: A Step-by-Step Guide

This guide provides a comprehensive walkthrough for deploying AWS Transit Gateway to centralize and simplify your AWS network architecture.

## Table of Contents

1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Step 1: Create VPCs](#step-1-create-vpcs)
4. [Step 2: Create a Transit Gateway](#step-2-create-a-transit-gateway)
5. [Step 3: Create Transit Gateway Subnets in VPC A](#step-3-create-transit-gateway-subnets-in-vpc-a)
6. [Step 4: Create Transit Gateway Attachments](#step-4-create-transit-gateway-attachments)
7. [Step 5: Update Route Tables](#step-5-update-route-tables)
8. [Conclusion](#conclusion)

## Introduction

AWS Transit Gateway acts as a central hub to interconnect multiple Virtual Private Clouds (VPCs) and on-premises networks, simplifying network management and reducing the complexity associated with VPC peering and VPN connections.

A well-structured network infrastructure is paramount for seamless operations. Among the many options at your disposal, Transit Gateway has emerged as a game-changer, providing a scalable and efficient solution for interconnecting Virtual Private Clouds (VPCs). Say goodbye to the complexities of VPC peering and hello to a more streamlined approach. In this blog, we’ll explore the setting up of a Transit Gateway and shed light on how this innovative tool can simplify your AWS network architecture and enhance your cloud experience. Join us as we delve into the world of Transit Gateway and unlock the potential of hassle-free VPC connectivity.

**The Challenge Before Transit Gateway**
Before the introduction of AWS Transit Gateway, interconnecting multiple VPCs and remote networks required a lot of effort:

- ***VPC Peering:*** You had to establish VPC peering connections between each pair of VPCs, which was manageable for a few VPCs but became extremely cumbersome as the number grew.
- ***VPN Connections:*** Each remote network or on-premises location needed a separate VPN connection to each VPC, leading to a complex and difficult-to-manage network topology.

**Introducing AWS Transit Gateway**
AWS Transit Gateway simplifies this process by acting as a central hub that interconnects all your VPCs and remote networks through a single gateway. This hub-and-spoke model centralizes network management and reduces the number of connections needed.

### Key Benefits of AWS Transit Gateway
-***Centralized Management:*** Manage all your network connections through a single transit gateway.
Simplified Topology: Replace multiple VPC peering and VPN connections with a single connection to the transit gateway.
- ***Scalability:*** Easily scale to connect hundreds of VPCs and on-premises networks without exponentially increasing complexity.
- ***Cost-Effective:*** Reduce the overhead and costs associated with managing numerous individual connections.

### Example Use Case
Imagine you have a large-scale deployment with dozens or even hundreds of VPCs and multiple remote offices:

- ***Without Transit Gateway:*** You would need to create and manage peering connections between every pair of VPCs and establish VPN connections from each remote office to each VPC, leading to a highly complex and difficult-to-manage network.
- ***With Transit Gateway:*** You only need to create a single connection from each VPC and each remote office to the transit gateway. The transit gateway then routes traffic between all connected networks, significantly simplifying the network management.



## PreRequisites :

- An AWS account with necessary permissions.
- At least three VPCs with non-overlapping CIDR blocks:
  - **VPC A**: 10.0.0.0/16
  - **VPC B**: 172.16.0.0/16
  - **VPC C**: 192.168.0.0/16
- Each VPC should have subnets in at least two Availability Zones.

## Step 1: Create VPCs

### Create VPC A

1. Navigate to the **VPC Dashboard** in the AWS Console.
2. Click **"Create VPC"**.
3. Fill in the details:
   - **Name**: VPC A
   - **IPv4 CIDR block**: 10.0.0.0/16
   - **Tenancy**: Default
4. Click **"Create VPC"**.

### Create VPC B

1. Navigate back to the **VPC Dashboard**.
2. Click **"Create VPC"**.
3. Fill in the details:
   - **Name**: VPC B
   - **IPv4 CIDR block**: 172.16.0.0/16
   - **Tenancy**: Default
4. Click **"Create VPC"**.

### Create VPC C

1. Navigate back to the **VPC Dashboard**.
2. Click **"Create VPC"**.
3. Fill in the details:
   - **Name**: VPC C
   - **IPv4 CIDR block**: 192.168.0.0/16
   - **Tenancy**: Default
4. Click **"Create VPC"**.

## Step 2: Create a Transit Gateway

1. In the **VPC Dashboard**, select **"Transit Gateways"** from the left-hand pane.
2. Click on **"Create Transit Gateway"**.
3. Fill in the following details:
   - **Name**: e.g., Central-Transit-Gateway.
   - **Description**: Optional.
   - Leave other settings as default unless specific configurations are required.
4. Click **"Create Transit Gateway"**.
5. Wait for the Transit Gateway to become **available**.

## Step 3: Create Transit Gateway Subnets in VPC A

Transit Gateway attachments require a dedicated /28 subnet in each Availability Zone.
- ***Attach VPCs to Transit Gateway : ***
The best practice for connecting VPCs to Transit Gateway is to use a dedicated /28 subnet in each availability zone and the CloudFormation run earlier created these for VPC B and VPC C alongside two private and public /24 subnets for hosting workloads. Therefore before we create the transit gateway we need to add a dedicated /28 subnet in each availability zone in VPC A for the transit gateway attachments.

1. In the **VPC Dashboard**, select **"Subnets"**.
2. Click on **"Create Subnet"**.
3. For each Availability Zone in VPC A:
   - **Name**: e.g., VPC-A-TGW-Subnet-AZ1.
   - **VPC**: Select VPC A.
   - **Availability Zone**: Choose the desired AZ (e.g., us-east-1a).
   - **IPv4 CIDR block**: Assign a /28 block (e.g., 10.0.5.0/28).
4. Click **"Create Subnet"**.
5. Repeat for the second Availability Zone (e.g., 10.0.5.16/28 in us-east-1b).

### Create Subnets for VPC B

For **VPC B**, create two subnets in different Availability Zones.

1. Navigate to the **Subnets** section in the **VPC Dashboard**.
2. Click **"Create Subnet"**.
3. For **Availability Zone 1** (e.g., us-east-1a):
   - **Name**: VPC-B-TGW-Subnet-AZ1
   - **VPC**: Select **VPC B**
   - **Availability Zone**: Select **us-east-1a**
   - **IPv4 CIDR block**: 172.16.1.0/28
4. Click **"Create Subnet"**.
5. Repeat the process for **Availability Zone 2**:
   - **Name**: VPC-B-TGW-Subnet-AZ2
   - **VPC**: Select **VPC B**
   - **Availability Zone**: Select **us-east-1b**
   - **IPv4 CIDR block**: 172.16.1.16/28
6. Click **"Create Subnet"**.

### Create Subnets for VPC C

For **VPC C**, create two subnets in different Availability Zones.

1. Navigate to the **Subnets** section in the **VPC Dashboard**.
2. Click **"Create Subnet"**.
3. For **Availability Zone 1** (e.g., us-east-1a):
   - **Name**: VPC-C-TGW-Subnet-AZ1
   - **VPC**: Select **VPC C**
   - **Availability Zone**: Select **us-east-1a**
   - **IPv4 CIDR block**: 192.168.1.0/28
4. Click **"Create Subnet"**.
5. Repeat the process for **Availability Zone 2**:
   - **Name**: VPC-C-TGW-Subnet-AZ2
   - **VPC**: Select **VPC C**
   - **Availability Zone**: Select **us-east-1b**
   - **IPv4 CIDR block**: 192.168.1.16/28
6. Click **"Create Subnet"**.

## Step 4: Create Transit Gateway Attachments

1. In the **VPC Dashboard**, select **"Transit Gateway Attachments"**.
2. Click on **"Create Transit Gateway Attachment"**.
3. For **VPC A**:
   - **Name**: VPC-A-Attachment
   - **Transit Gateway ID**: Select the created Transit Gateway
   - **Attachment Type**: VPC
   - **VPC ID**: VPC A
   - **Subnets**: Select the two /28 subnets created for VPC A
   - Click **"Create Attachment"**.
4. For **VPC B**:
   - **Name**: VPC-B-Attachment
   - **Transit Gateway ID**: Select the created Transit Gateway
   - **Attachment Type**: VPC
   - **VPC ID**: VPC B
   - **Subnets**: Select the two /28 subnets created for VPC B
   - Click **"Create Attachment"**.
5. For **VPC C**:
   - **Name**: VPC-C-Attachment
   - **Transit Gateway ID**: Select the created Transit Gateway
   - **Attachment Type**: VPC
   - **VPC ID**: VPC C
   - **Subnets**: Select the two /28 subnets created for VPC C
   - Click **"Create Attachment"**.

## Step 5: Update Route Tables

### Add Routes to the Transit Gateway (TGW) to the VPC Route Tables

To enable communication between VPCs via the Transit Gateway, update the route tables in each VPC.

1. In the **VPC Dashboard**, select **"Route Tables"**.
2. For each VPC:
   - Select the route table associated with the relevant subnets.
   - Click on the **"Routes"** tab, then **"Edit routes"**.
   - Click **"Add route"**.
     - **Destination**: Enter the CIDR block of the other VPC (e.g., for VPC A, add routes to 172.16.0.0/16 and 192.168.0.0/16).
     - **Target**: Select the Transit Gateway.
   - Click **"Save routes"**.

## Conclusion

By following this guide, you've successfully deployed AWS Transit Gateway to centralize your VPC connectivity, simplifying your network architecture and enhancing scalability.

In summary, Transit Gateway is a better choice for connecting your cloud networks than VPC peering. It’s like a modern and user-friendly tool, while VPC peering is old and complicated. By following the steps in this blog, you can make your network work better and adapt to your needs. So, choose Transit Gateway and make your cloud network easier to manage and more flexible. Your cloud journey just got a whole lot smoother!

---

For a more in-depth understanding and additional insights, refer to the original article by Veerababu Narni: [Centralizing Cloud Networks: A Practical Guide to Deploying AWS Transit Gateway](https://medium.com/@veerababu.narni232/centralizing-secure-cloud-networks-hands-on-guide-to-deploying-aws-transit-gateway-1032221d4263).
