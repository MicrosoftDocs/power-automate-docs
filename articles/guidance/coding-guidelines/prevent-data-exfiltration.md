---
title: Prevent data exfiltration
description: Learn how to prevent data exfiltration
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 01/30/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Prevent data exfiltration

## Use data loss prevention policies

Data Loss Prevention (DLP) policies are relevant for managing and controlling data sharing and movement across Power Apps, Power Automate, and other Power Platform components. These policies help organizations prevent data loss and ensure compliance with regulatory requirements and internal policies.

Some of the best practices to consider while creating DLP are- 
- Block/isolate non-business connectors, especially in default environments. 
- Consider blocking high risk operations such as HTTP, HTTP with Microsoft Entra ID and SharePoint URL etc. in environments with many makers. 
- Use endpoint filtering to make sure only expected endpoints can be reached.

Learn more: 
- [Manage data loss prevention (DLP) policies](/power-platform/admin/prevent-data-loss)
- [Establishing a DLP strategy](/power-platform/guidance/adoption/dlp-strategy)
- [Develop a tenant environment strategy to adopt Power Platform at scale](/power-platform/guidance/white-papers/environment-strategy)

## Configure IP firewall in Power Platform environments

Environment admins can configure a set or range of IP addresses that are allowed to interact with Power Platform resources. Configuring this feature ensures that only requests from specified IP addresses can trigger the workflow.

- Set up IP restrictions in your Power Platform environment.
- Define the allowed IP addresses or ranges that can access the HTTP request trigger.

Learn more: [IP firewall in Power Platform environments](/power-platform/admin/ip-firewall)

## Configure tenant isolation

Microsoft Power Platform has a rich ecosystem of connectors based on Microsoft Entra that allow authorized Microsoft Entra users to build compelling apps and flows establishing connections to the business data available through these data stores. Tenant isolation makes it easy for administrators to ensure that these connectors can beused in a secure way within the tenant while minimizing the risk of data exfiltration outside the tenant. Tenant isolation allows Power Platform administrators to effectively govern the movement of tenant data from Microsoft Entra authorized data sources to and from their tenant.

Learn more: [Cross-tenant inbound and outbound restrictions](/power-platform/admin/cross-tenant-restrictions)

# Configure Microsoft entra conditional access policies

Power Automate conditional access policies can be created in addition to DLP, HTTP OAuth, and IP-pinning to prevent data exfiltration. 

The minimum audience to include in conditional access policies would include:  

| Audience | Endpoint |
| --- | --- |
| Your unique Dataverse org audience | For example,  https://{your-org}.crm.dynamics.com/ |
| Power Platform | https://api.powerplatform.com |
| Power Automate |  https://service.flow.microsoft.com/ |
| Power Apps | https://service.powerapps.com/ |
| Connections | https://apihub.azure.com |

Learn more details about the effect of conditional access policies on flows: [Conditional access and multifactor authentication in cloud flows](/troubleshoot/power-platform/power-automate/administration/conditional-access-and-multi-factor-authentication-in-flow)