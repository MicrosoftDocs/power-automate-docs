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

# Hosted RPA Overview

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
- 3 Hosted Machine Groups sharing 10 bots. Refer to [load balancing hosted machine groups](/hosted-machine-groups#load-balance-hosted-machine-group).

For more information, refer to the [Power Automate licensing page](https://learn.microsoft.com/power-platform/admin/power-automate-licensing/types?tabs=power-automate-premium%2Cpower-automate-hosted-process%2Cconnector-types#capacity-licenses).



