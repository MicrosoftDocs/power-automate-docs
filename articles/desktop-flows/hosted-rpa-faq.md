---
title: Hosted RPA Best Practices and FAQ
description: Discover best practices and FAQs for hosted RPA solutions. Learn about configuration, maintenance, custom VM images, access, and security.
author: kenseongtan
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 01/03/2025
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
| **Custom VNET via Azure Virtual Network** | Supported                                                                                                                           | Supported                                                                                                                                                               |
| **Device join types**                    | • Microsoft Entra join<br> • Microsoft Entra Hybrid join                                                                                                | • Microsoft Entra join<br> • Microsoft Entra Hybrid join (preview)                                                                                                                                                                       |
| **User accounts**                        | • Work or school account                                                                                                            | • Work or school account<br> • Local account                                                                                                                                       |
| **Device management**                    | • Intune<br> • Active Directory (AD)-based Group Policy (GPO) if using Microsoft Entra Hybrid join<br> • Conditional access policy             | • Conditional access policy                                                                                                                                                        |

## Implementation checklist

|Phase | Checklist&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |  Description |
|--------|----------------| -----------------------------------------------------------------------|
|**Setup**|• Licensing <br>• VM image requirement  <br>• Network requirement  <br>• Device join requirement <br>• Environment requirement|• **Licensing:** Refer to the [licensing section](#licensing) to understand how hosted virtual machines are licensed and how many you need for your project. <br>• **VM image requirement:** If you're running Web automation, then the vanilla VM image provided by Microsoft might be sufficient. If you need specific desktop apps as part of your desktop flow automation, then you might consider using a [custom VM image](#custom-vm-images) or using device management tools such as Intune to install the required desktop apps via policies. <br>• **Network requirement:** If you need to access on-premises resources or want to manage inbound and outbound traffic of your hosted virtual machines using Azure Firewall or Network Security Groups (NSGs), you need to configure a [custom network connection](#custom-network-connection). <br>• **Device join requirement:** All hosted virtual machines are Microsoft Entra joined by default. If your automation requires a device joined to the Active Directory (AD) domain, you need to configure Microsoft Entra Hybrid join.   |
|**Governance**|• Permissions <br>• Device management  <br>• Security <br>• Capacity management| Refer to the [governance section](#governance) to understand how IT and Center of Excellence (COE) administrators can govern the use of hosted virtual machines. |
|**Maintenance**|• Updates <br>• Monitoring|Refer to the [maintenance and management section](#maintenance-and-updates) to understand how IT and Center of Excellence (COE) administrators can ensure hosted virtual machines stay up to date with the latest security patches and desktop automation requirements, and how to monitor them. |

## Licensing

Hosted RPA requires the **Power Automate Hosted Process** license ([Power Automate Pricing](https://www.microsoft.com/power-platform/products/power-automate/pricing)) (previously known as the Power Automate hosted RPA add-on). Each Power Automate Hosted Process capacity can provision one hosted machine or be used as shared capacity across hosted machine groups.

For example, an environment with 20 Power Automate Hosted Process capacity could be utilized as such:

- 10 hosted machines
- Three hosted machine groups sharing 10 bots. Refer to [load balancing hosted machine groups](hosted-machine-groups.md#load-balance-hosted-machine-group).

Learn more about licensing in the [Power Automate licensing page](/power-platform/admin/power-automate-licensing/types?tabs=power-automate-premium%2Cpower-automate-hosted-process%2Cconnector-types#capacity-licenses).

## Governance

A Center of Excellence (COE) Administrator controls user access to specific resources within the hosted RPA solution in Power Automate. Learn more about the [permissions based on security roles](hosted-machines.md#permissions-based-on-security-roles) relevant to the hosted RPA solution that leverages Microsoft Dataverse enforcement using security roles, teams, and business units to control access to tables, fields, and records with permission and row-level access control.

IT & COE Administrators have the necessary tools to manage hosted virtual machines:

| Tools   | Description | Supported scenarios |
|----------|-------------------------------------------------------------|-----------------------|
| **Microsoft Intune** |  With [Intune](/mem/intune/fundamentals/what-is-intune), you can create policies that applies to these devices to ensure that they are compliant based on your organization's policies.| • Hosted machines |
| **Active Directory (AD)-based Group Policy (GPO) if using Microsoft Entra Hybrid join** | Devices that are hybrid joined can utilize GPOs for configuration and policy management, allowing administrators to apply GPOs as they would with any other domain-joined device. | • Hosted machines |
| **Conditional access policy** | [Conditional Access policy](/entra/identity/conditional-access/overview) in Microsoft Entra ID (formerly Azure AD) is a security feature that enforces access requirements based on specific conditions. It is structured as an "if-then" statement, where assignments define the conditions (who, what, and where), and access controls specify the actions to be taken (e.g., grant or block access).| • Hosted machines <br>• hosted machine groups |

COE Administrators can also monitor and govern the usage of the hosted RPA solution within an environment using the [Hosted Process capacity utilization dashboard](capacity-utilization-hosted.md).

## Custom VM images

Use a custom VM image for hosted virtual machines to create a consistent and tailored environment. Custom VM images include preconfigured applications, security settings, and performance optimizations to support automation and compliance needs.

- **Create custom VM images**: Find instructions and requirements for creating custom VM images for [hosted machines](hosted-machines.md#use-custom-vm-images-for-your-hosted-machine) and [hosted machine groups](hosted-machine-groups.md#use-custom-vm-images-for-your-hosted-machine-groups).

- **Update VM images**: Since hosted machines are persistent virtual machines, regular patching and updates after provisioning is recommended. For hosted machine groups, you can update the custom VM image by following these [update instructions](hosted-machine-groups.md#update-vm-image-used-by-the-hosted-machine-group). Learn more about keeping your hosted VMs up-to-date by reviewing [Maintenance and Management](#maintenance-and-updates) guidance.

- **Delete VM images**: Power Automate prevents users from deleting VM images from the Power Automate Portal if they're currently in use by a hosted machine or hosted machine group. However, a VM image can still be deleted directly from the Azure Compute Gallery, which fails if a hosted virtual machine is being provisioned.

## Custom network connection

A custom network connection connects hosted virtual machines to your virtual network. It enables secure communication among hosted machines, the Internet, and on-premises networks, providing full control over traffic.

- **Create custom network connections**: Follow the instructions and requirements for creating custom network connections for [hosted machines](hosted-machines.md#use-a-custom-virtual-network-for-your-hosted-machines) and [hosted machine groups](hosted-machine-groups.md#use-a-custom-virtual-network-for-your-hosted-machine-groups-preview).

> [!NOTE]
> Ensure access to the required service endpoints:
> - Power Automate [service endpoints](/power-automate/ip-address-configuration)
> - For hosted machines, refer to specific requirements for [Windows 365 service, Azure Virtual Desktop session host virtual machine, Microsoft Intune service, and physical devices network connectivity](/windows-365/enterprise/requirements-network?tabs=enterprise%2Cent#allow-network-connectivity).

## Maintenance and updates

Proper maintenance and update of hosted virtual machines ensure smooth operations. When provisioning hosted machines or hosted machine groups using the default VM image provided by Microsoft, these images are automatically updated monthly following the Windows Servicing & Delivery security patch release schedule.

### Options for updating hosted virtual machines

- **Hosted machines**. Use **Intune** to manage devices by applying policies that ensure compliance with your organization's requirements. For example, ensure devices are regularly updated with the latest security patches.

- **Hosted machine groups**. Since hosted machine groups are considered stateless, they're provisioned based on the specified VM images. When you use custom VM images, use tools such as the [Azure VM Image Builder](/azure/virtual-machines/image-builder-overview) to integrate the image-building process with your existing DevOps pipeline.

## Miscellaneous

Additional information on hosted RPA:

- **Common registry customization settings for Microsoft Edge**. As web-based automation using Microsoft Edge is a common automation scenario, it might be useful to define Microsoft Edge behavior in areas such as startup behavior, password management, and pop-up handling. Use the [Microsoft Edge Browser Policy](/deployedge/microsoft-edge-policies) for configuration, which can be enforced via registry settings applied to a custom VM image.
