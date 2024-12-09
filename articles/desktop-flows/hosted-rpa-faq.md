---
title: Hosted RPA Best Practices and FAQ
description: Discover best practices and FAQs for hosted RPA solutions. Learn about configuration, maintenance, custom VM images, access, and security.
author: kenseongtan
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 10/29/2024
ms.author: kenseongtan
ms.reviewer: 
contributors:
ms.custom:
- ai-gen-docs-bap
- ai-gen-description
- ai-seo-date:10/29/2024
---

# Hosted RPA Best Practices and FAQ

This section provides an overview of the best practices and frequently asked questions related to hosted RPA (Robotic Process Automation). It covers various aspects such as hosted machines and hosted machine groups configuration, maintenance and management, custom virtual machine (VM) images, access, and security.

## Capability summary

| Feature                                  | Hosted Machine                                                                                                                      | Hosted Machine Group                                                                                                                                                                |
|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Description**                          | Hosted machines offer developers an easy setup to build, test, and deploy desktop flows, enabling both attended and unattended modes, with scalability through machine groups for robust automation. | Hosted machine groups provide scalable, unattended automation by dynamically provisioning virtual machines to handle spikes in demand, optimizing resource allocation, and reducing costs by balancing bot capacity across multiple processes based on real-time needs. |
| **Custom VM image via Azure Compute Gallery** | Supported                                                                                                                           | Supported                                                                                                                                                                          |
| **Custom VNET via Azure Virtual Network** | Supported                                                                                                                           | Supported (preview)                                                                                                                                                               |
| **Device join types**                    | • Microsoft Entra Join<br> • Microsoft Entra Hybrid join                                                                                                | • Microsoft Entra Join                                                                                                                                                                       |
| **User accounts**                        | • Work or school account                                                                                                            | • Work or school account<br> • Local account                                                                                                                                       |
| **Device management**                    | • Intune<br> • Active Directory (AD)-based Group Policy (GPO) is using Microsoft Entra Hybrid join<br> • Conditional access policy             | • Conditional access policy                                                                                                                                                        |

## Licensing

Hosted RPA requires the **Power Automate Hosted Process** license ([Power Automate Pricing](https://www.microsoft.com/power-platform/products/power-automate/pricing)) (previously known as the Power Automate hosted RPA add-on). Each Power Automate Hosted Process capacity can provision one hosted machine or be used as shared capacity across hosted machine groups.

For example, an environment with 20 Power Automate Hosted Process capacity could be utilized as such:

- 10 hosted machines
- Three hosted machine groups sharing 10 bots. Refer to [load balancing hosted machine groups](hosted-machine-groups.md#load-balance-hosted-machine-group).

Learn more about licensing in the [Power Automate licensing page](/power-platform/admin/power-automate-licensing/types?tabs=power-automate-premium%2Cpower-automate-hosted-process%2Cconnector-types#capacity-licenses).


## Implementation checklist

|Steps | Checklist |  Description |
|--------|--------| --------|
|**Setup**|- Cloud flow <br>- Standard machine|Bla|
|**Allocated automation**|- Cloud flow <br>- Standard machine||


## Governance

A Center of Excellence (COE) Administrator controls user access to specific resources within the hosted RPA solution. Microsoft Dataverse enforces governance using security roles, teams, and business units to control access to tables, fields, and records with permission and row-level access control.

Learn more about the [permissions based on security roles](hosted-machines.md#permissions-based-on-security-roles) relevant to the hosted RPA solution.

COE Administrators can also monitor and govern the usage of the hosted RPA solution within an environment using the [Hosted Process capacity utilization dashboard](capacity-utilization-hosted.md).

## Custom VM images

Use a custom VM image for hosted virtual machines to create a consistent and tailored environment. Custom VM images include preconfigured applications, security settings, and performance optimizations to support automation and compliance needs.

- **Create custom VM images**: Find instructions and requirements for creating custom VM images for [hosted machines](hosted-machines.md#use-custom-vm-images-for-your-hosted-machine) and [hosted machine groups](hosted-machine-groups.md#use-custom-vm-images-for-your-hosted-machine-groups).

- **Update VM images**: Since hosted machines are persistent virtual machines, regular patching and updates after provisioning is recommended. For hosted machine groups, you can update the custom VM image by following these [update instructions](hosted-machine-groups.md#update-vm-image-used-by-the-hosted-machine-group). Learn more about keeping your hosted VMs up-to-date by reviewing [Maintenance and Management](#maintenance-and-management) guidance.

- **Delete VM images**: Power Automate prevents users from deleting VM images from the Power Automate Portal if they're currently in use by a hosted machine or hosted machine group. However, a VM image can still be deleted directly from the Azure Compute Gallery, which fails if a hosted virtual machine is being provisioned.

## Custom network connection

A custom network connection connects hosted virtual machines to your virtual network. It enables secure communication among hosted machines, the Internet, and on-premises networks, providing full control over traffic.

- **Create custom network connections**: Follow the instructions and requirements for creating custom network connections for [hosted machines](hosted-machines.md#use-a-custom-virtual-network-for-your-hosted-machines) and [hosted machine groups](hosted-machine-groups.md#use-a-custom-virtual-network-for-your-hosted-machine-groups-preview).

> [!NOTE]
> Ensure access to the required service endpoints:
> - Power Automate [service endpoints](/power-automate/ip-address-configuration)
> - For hosted machines, refer to specific requirements for [Windows 365 service, Azure Virtual Desktop session host virtual machine, Microsoft Intune service, and physical devices network connectivity](/windows-365/enterprise/requirements-network?tabs=enterprise%2Cent#allow-network-connectivity).

## Maintenance and management

Proper maintenance and management of hosted virtual machines ensure smooth operations. When provisioning hosted machines or hosted machine groups using the default VM image provided by Microsoft, these images are automatically updated monthly following the Windows Servicing & Delivery security patch release schedule.

### Options for managing hosted virtual machines

- **Hosted machines**. Use **Intune** to manage devices by applying policies that ensure compliance with your organization's requirements. For example, ensure devices are regularly updated with the latest security patches.

- **Hosted machine groups**. Since hosted machine groups are considered stateless, they're provisioned based on the specified VM images. When you use custom VM images, use tools such as the [Azure VM Image Builder](/azure/virtual-machines/image-builder-overview) to integrate the image-building process with your existing DevOps pipeline.

## Miscellaneous

Additional information on hosted RPA:

- **Common registry customization settings for Microsoft Edge**. As web-based automation using Microsoft Edge is a common automation scenario, it might be useful to define Microsoft Edge behavior in areas such as startup behavior, password management, and pop-up handling. Use the [Microsoft Edge Browser Policy](/deployedge/microsoft-edge-policies) for configuration, which can be enforced via registry settings applied to a custom VM image.
