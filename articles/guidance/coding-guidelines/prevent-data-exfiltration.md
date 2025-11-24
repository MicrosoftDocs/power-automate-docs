---
title: Prevent unauthorized transfer of data
description: Learn how to prevent data in your Power Platform environments from being transferred to an external system without authorization.
#customer intent: As a Power Automate user, I want to prevent unauthorized access to data so that I can ensure the security of my Power Platform resources.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 07/11/2025
ms.author: rachaudh
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Prevent unauthorized transfer of data

Power Platform offers several ways to guard against unauthorized access to and transfer of data in your Power Platform environments. This article discusses how to use data loss prevention (DLP) policies, IP firewalls, tenant isolation, and conditional access policies to protect your Power Platform resources from data exfiltration.

## Use data loss prevention policies

Data loss prevention is a security solution that identifies and helps prevent unsafe or inappropriate sharing, transfer, or use of sensitive data. DLP policies are how organizations control the sharing and movement of data to prevent data loss and ensure compliance with regulatory requirements and internal policies.

Consider implementing the following DLP best practices to help protect sensitive data in your Power Platform environments:

- Block or isolate nonbusiness connectors, especially in default environments.

- Block high-risk operations such as HTTP, HTTP with Microsoft Entra ID, and SharePoint URLs to sites that contain sensitive and confidential data in environments with many makers.

- Using endpoint filtering to make sure that only expected endpoints can be reached.

Learn more in the following articles:

- [Manage data policies](/power-platform/admin/prevent-data-loss)
- [Establishing a DLP strategy](/power-platform/guidance/adoption/dlp-strategy)
- [Develop a tenant environment strategy to adopt Power Platform at scale](/power-platform/guidance/white-papers/environment-strategy)

## Set up IP firewalls in Power Platform environments

IP firewalls are a security feature that allows you to restrict access to your Power Platform resources based on the IP address of the incoming request. They help prevent unauthorized access and data exfiltration by ensuring that only requests from trusted IP addresses can interact with your resources.

Consider implementing the following IP firewall best practices:

- Set up IP restrictions in your Power Platform environment.

- Define the allowed IP addresses or ranges that can access the HTTP request trigger.

Learn more in [IP firewall in Power Platform environments](/power-platform/admin/ip-firewall).

## Set up tenant isolation

Tenant isolation is a security feature that allows you to restrict the movement of data between tenants in Power Platform. It helps prevent unauthorized access and data exfiltration by ensuring that only authorized users and applications can access your resources.

Power Platform has a rich ecosystem of connectors that use Microsoft Entra ID to allow only authorized users to build apps and flows that establish connections to external and internal data stores. You can use tenant isolation to ensure that connectors are used securely in the tenant and minimize the risk of data exfiltration outside the tenant. Learn more in [Cross-tenant inbound and outbound restrictions](/power-platform/admin/cross-tenant-restrictions).

## Set up conditional access policies

To protect sensitive data in your environments from unauthorized access from Power Automate flows, you can create Power Automate conditional access policies along with using HTTP OAuth and IP-pinning. HTTP OAuth and IP-pinning are used to restrict access to specific endpoints. Conditional access policies can be used to enforce more security measures, such as multifactor authentication and location-based access controls.

The following table lists the minimum audience to include in conditional access policies.

| Audience | Endpoint |
| --- | --- |
| Your unique Dataverse org audience | For example, `https://<your-org>.crm.dynamics.com`/ |
| Power Platform | `https://api.powerplatform.com` |
| Power Automate | `https://service.flow.microsoft.com/` |
| Power Apps | `https://service.powerapps.com/` |
| Connections | `https://apihub.azure.com` |

Learn more in [Recommendations for conditional access and multifactor authentication in Microsoft Power Automate](/troubleshoot/power-platform/power-automate/administration/conditional-access-and-multi-factor-authentication-in-flow).
