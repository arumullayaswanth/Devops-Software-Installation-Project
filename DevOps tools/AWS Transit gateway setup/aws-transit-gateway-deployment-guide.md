
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

## Prerequisites

- An AWS account with necessary permissions.
- At least three VPCs with non-overlapping CIDR blocks:
  - **VPC A**: 10.0.0.0/16
  - **VPC B**: 172.16.0.0/16
  - **VPC C**: 192.168.0.0/16
- Each VPC should have subnets in at least two Availability Zones.

## Step 1: Create VPCs

1. Navigate to the **VPC Dashboard** in the AWS Management Console.
2. Click on **"Create VPC"**.
3. For each VPC:
   - **Name**: Assign a unique name (e.g., VPC A).
   - **IPv4 CIDR block**: Enter the respective CIDR block.
   - **Tenancy**: Default.
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

1. In the **VPC Dashboard**, select **"Subnets"**.
2. Click on **"Create Subnet"**.
3. For each Availability Zone in VPC A:
   - **Name**: e.g., VPC-A-TGW-Subnet-AZ1.
   - **VPC**: Select VPC A.
   - **Availability Zone**: Choose the desired AZ (e.g., us-east-1a).
   - **IPv4 CIDR block**: Assign a /28 block (e.g., 10.0.5.0/28).
4. Click **"Create Subnet"**.
5. Repeat for the second Availability Zone (e.g., 10.0.5.16/28 in us-east-1b).

## Step 4: Create Transit Gateway Attachments

1. In the **VPC Dashboard**, select **"Transit Gateway Attachments"**.
2. Click on **"Create Transit Gateway Attachment"**.
3. Fill in the following details:
   - **Name**: e.g., VPC-A-Attachment.
   - **Transit Gateway ID**: Select the Transit Gateway created earlier.
   - **Attachment Type**: VPC.
   - **VPC ID**: Select VPC A.
   - **Subnets**: Select the two /28 subnets created in Step 3.
4. Click **"Create Attachment"**.
5. Repeat the process for VPC B and VPC C, ensuring each has dedicated /28 subnets in two Availability Zones.

## Step 5: Update Route Tables

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

---

For a more in-depth understanding and additional insights, refer to the original article by Veerababu Narni: [Centralizing Cloud Networks: A Practical Guide to Deploying AWS Transit Gateway](https://medium.com/@veerababu.narni232/centralizing-secure-cloud-networks-hands-on-guide-to-deploying-aws-transit-gateway-1032221d4263).
