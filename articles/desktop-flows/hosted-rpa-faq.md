---
title: Hosted RPA Best Practices and FAQ
description: Best practices and Frequently asked questions for hosted RPA solution
author: kenseongtan
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 07/04/2024
ms.author: kenseongtan
ms.reviewer: 
contributors:
---

# Hosted RPA Best Practices and FAQ

This section provides an overview of the best practices and frequently asked questions related to hosted RPA (Robotic Process Automation). It covers various aspects such as hosted machines and hosted machine groups configuration, maintenance and management, custom VM images, access, and security.

## Capability Summary

| Feature                                  | Hosted Machine                                                                                                                      | Hosted Machine Group                                                                                                                                                                |
|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Description**                          | Hosted machines offer developers an easy setup to build, test, and deploy desktop flows, enabling both attended and unattended modes, with scalability through machine groups for robust automation. | Hosted machine groups provide scalable, unattended automation by dynamically provisioning virtual machines to handle spikes in demand, optimizing resource allocation, and reducing costs by balancing bot capacity across multiple processes based on real-time needs. |
| **Custom VM image via Azure Compute Gallery** | Supported                                                                                                                           | Supported                                                                                                                                                                          |
| **Custom VNET via Azure Virtual Network** | Supported                                                                                                                           | Supported (preview)                                                                                                                                                               |
| **Device join types**                    | • Entra Join<br> • Entra Hybrid join                                                                                                | • Entra Join                                                                                                                                                                       |
| **User accounts**                        | • Work or school account                                                                                                            | • Work or school account<br> • Local account                                                                                                                                       |
| **Device management**                    | • Intune<br> • Active Directory (AD)-based Group Policy (GPO) is using Entra Hybrid join<br> • Conditional access policy             | • Conditional access policy                                                                                                                                                        |
| **Additional Features**                  | Not supported. Can configure multiple hosted machines in a machine group                                                            | Auto-scaling & dynamic load balancing of hosted machine group bots built in                                                                                                        |


## Licensing

The hosted RPA capability requires the purchase of the **Power Automate Hosted Process** license ([Power Automate Pricing | Microsoft Power Platform](https://powerautomate.microsoft.com/pricing)) (previously known as the Power Automate hosted RPA add-on). Each Power Automate Hosted Process capacity assigned to a Power Automate environment can be used to provision one hosted machine or as a shared capacity across hosted machine groups.

For example, an environment with 20 Power Automate Hosted Process capacity could be utilized as such:
- 10 Hosted Machines
- 3 Hosted Machine Groups sharing 10 bots. Refer to [load balancing hosted machine groups](hosted-machine-groups.md#load-balance-hosted-machine-group).

For more information, refer to the [Power Automate licensing page](/power-platform/admin/power-automate-licensing/types?tabs=power-automate-premium%2Cpower-automate-hosted-process%2Cconnector-types#capacity-licenses).

## Governance

A Center of Excellence (COE) Administrator has full control over which users can access specific resources within the hosted RPA solution. This is managed through **Microsoft Dataverse**, which employs a robust security model using security roles, teams, and business units to control access to tables, fields, and records with permission and row-level access control. 

For more information, refer to the [permissions based on security roles](hosted-machines.md#permissions-based-on-security-roles) relevant to the hosted RPA solution.

COE Administrators can also monitor and govern the usage of the hosted RPA solution within an environment using the [Hosted Process capacity utilization dashboard](capacity-utilization-hosted.md).

## Custom VM Images

Using a custom VM image for your hosted virtual machines allows you to create a consistent and tailored environment, pre-configured with specific applications, security settings, and performance optimizations to support your automation and compliance needs.

- **Creating Custom VM Images**: Find instructions and requirements for creating custom VM images for [hosted machines](hosted-machines.md#use-custom-vm-images-for-your-hosted-machine) and [hosted machine groups](hosted-machine-groups.md#use-custom-vm-images-for-your-hosted-machine-groups).

- **Updating VM Images**: Since hosted machines are persistent virtual machines, it’s recommended to perform regular patching and updates after provisioning. For hosted machine groups, you can update the custom VM image by following these [update instructions](hosted-machine-groups.md#update-vm-image-used-by-the-hosted-machine-group). Refer to the [Maintenance and Management](#maintenance-and-management) section for more information on keeping your hosted VMs up-to-date.

- **Deleting VM Images**: Power Automate prevents users from deleting VM images from the Power Automate Portal if they are currently in use by a hosted machine or hosted machine group. However, a VM image can still be deleted directly from the Azure Compute Gallery, which will cause failure if a hosted virtual machine is being provisioned.

## Custom Network Connection

Using a custom network connection allows you to connect your hosted machines to your own virtual network, enabling secure communication among hosted machines, the Internet, and on-premises networks. This setup also provides organizations full control over traffic in and out of hosted virtual machines.

- **Creating Custom Network Connections**: Follow the instructions and requirements for creating custom network connections for [hosted machines](hosted-machines.md#use-a-custom-virtual-network-for-your-hosted-machines) and [hosted machine groups](hosted-machine-groups.md#use-a-custom-virtual-network-for-your-hosted-machine-groups-preview).

> [!NOTE]
> Ensure access to the required service endpoints:
> - Power Automate [service endpoints](/power-automate/ip-address-configuration)
> - For hosted machines, refer to specific requirements for [Windows 365 service, Azure Virtual Desktop session host virtual machine, Microsoft Intune service, and physical devices network connectivity](windows-365/enterprise/requirements-network?tabs=enterprise%2Cent#allow-network-connectivity).


## Maintenance and Management

Proper maintenance and management of hosted virtual machines are essential for ensuring smooth operations.

