---
title: Prevent data exfiltration
description: Learn how to prevent data exfiltration in Power Platform environments to ensure compliance and secure your data.
#customer intent: As an admin, I want to prevent data exfiltration in Power Platform environments so that I can ensure compliance and secure my data.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/07/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Prevent data exfiltration

By implementing data loss prevention (DLP) policies, configuring IP firewalls, and setting up tenant isolation, you guard against unauthorized access to data and enhance the security of your Power Platform resources. 

## Use data loss prevention policies

Data loss prevention (DLP) is a security solution that identifies and helps prevent unsafe or inappropriate sharing, transfer, or use of sensitive data.

Data loss prevention (DLP) policies help manage and control data sharing and movement across Power Apps, Power Automate, and other Power Platform components. These policies help organizations prevent data loss and ensure compliance with regulatory requirements and internal policies.

DLP best practices to consider include:

- Blocking/isolating nonbusiness connectors, especially in default environments.
- Blocking high risk operations such as HTTP, HTTP with Microsoft Entra ID and SharePoint URLs in environments with many makers.
- Using endpoint filtering to make sure only expected endpoints can be reached.

Learn more:

- [Manage data policies](/power-platform/admin/prevent-data-loss)
- [Establishing a DLP strategy](/power-platform/guidance/adoption/dlp-strategy)
- [Develop a tenant environment strategy to adopt Power Platform at scale](/power-platform/guidance/white-papers/environment-strategy)

## Configure IP firewall in Power Platform environments

Environment admins can set up a range of IP addresses that can interact with Power Platform resources. Setting up IP firewalls ensures that only requests from specified IP addresses can trigger a workflow.

- Set up IP restrictions in your Power Platform environment.
- Define the allowed IP addresses or ranges that can access the HTTP request trigger.

Learn more: [IP firewall in Power Platform environments](/power-platform/admin/ip-firewall)

## Configure tenant isolation

Power Platform has a rich ecosystem of connectors based on Microsoft Entra that allow authorized Microsoft Entra users to build compelling apps and flows establishing connections to the business data available through these data stores. 

Tenant isolation makes it easy for administrators to ensure that these connectors are used securely within the tenant while minimizing the risk of data exfiltration outside the tenant. Tenant isolation lets Power Platform administrators effectively govern the movement of tenant data from Microsoft Entra authorized data sources to and from their tenant.

Learn more: [Cross-tenant inbound and outbound restrictions](/power-platform/admin/cross-tenant-restrictions)

## Configure Microsoft Entra conditional access policies

You can create Power Automate conditional access policies in addition to DLP, HTTP OAuth, and IP-pinning to prevent data exfiltration.

The minimum audience to include in conditional access policies includes:

| Audience | Endpoint |
| --- | --- |
| Your unique Dataverse org audience | For example, `https://{your-org}.crm.dynamics.com`/ |
| Power Platform | `https://api.powerplatform.com` |
| Power Automate | `https://service.flow.microsoft.com/` |
| Power Apps | `https://service.powerapps.com/` |
| Connections | `https://apihub.azure.com` |

Learn more about the effect of conditional access policies on flows: [Recommendations for conditional access and multifactor authentication in Microsoft Power Automate (Flow)](/troubleshoot/power-platform/power-automate/administration/conditional-access-and-multi-factor-authentication-in-flow)