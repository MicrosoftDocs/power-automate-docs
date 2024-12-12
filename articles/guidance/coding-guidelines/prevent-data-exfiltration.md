---
title: Prevent data exfiltration
description: Learn how to prevent data exfiltration
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

## Prevent data exfiltration

## Use Data Loss Prevention Policies

Data Loss Prevention (DLP) policies are relevant for managing and controlling data sharing and movement across Power Apps, Power Automate, and other Power Platform components. These policies help organizations prevent data loss and ensure compliance with regulatory requirements and internal policies.

Some of the best practices to consider while creating DLP are- 
- Block/isolate non-business connectors, especially in default environments. 
- Consider blocking high risk operations such as HTTP, HTTP with AAD and SharePoint URL etc. in environments with many makers. 
- Use endpoint filtering to make sure only expected endpoints are reached.

Learn more: 
- [Manage data loss prevention (DLP) policies](/power-platform/admin/prevent-data-loss)
- [Establishing a DLP strategy](/power-platform/guidance/adoption/dlp-strategy)
- [Develop a tenant environment strategy to adopt Power Platform at scale](/power-platform/guidance/white-papers/environment-strategy)

# Configure Microsoft Entra conditional access policies

Power Automate conditional access policies can be created in addition to DLP, HTTP OAuth and IP-pinning to prevent data exfiltration. 

The minimum audience to include in conditional access policies would include:  

| Audience | Endpoint |
| --- | --- |
| Your unique Dataverse org audience | e.g. https://{your-org}.crm.dynamics.com/ |
| Power Platform | https://api.powerplatform.com |
| Power Automate |  https://service.flow.microsoft.com/ |
| Power Apps | https://service.powerapps.com/ |
| Connections | https://apihub.azure.com |

Learn more details about the impact of conditional access policies on flows: [Conditional access and multi-factor authentication in cloud flows](/troubleshoot/power-platform/power-automate/administration/conditional-access-and-multi-factor-authentication-in-flow)