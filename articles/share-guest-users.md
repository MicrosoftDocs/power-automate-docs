---
title: Support for guest users
description: Learn support scenarios for guest users, including how to create, share, and approve flows.
author: natalie-pienkowska
ms.date: 07/06/2023
ms.custom: 
ms.topic: conceptual
ms.author: lali
ms.reviewer: angieandrews
---

# Support for guest users

The Power Automate experience for guest users is the same as it is for nonguest users, with some stipulations. A guest user can be a vendor or customer in a tenant of their own organization who needs access to a tenant in another organization. Guest users have the same experience in both the Power Automate portal and the Power Automate mobile app. They're sometimes referred to as external users.

Read this article to help you understand the scenarios that are supported for guest users.

## Prerequisites

A guest user must meet the following criteria:

- Have a Power Automate license assigned through either the tenant that hosts the flow, or the home tenant of the guest user. To learn more about licensing implications, go to [FAQs about licenses](/power-platform/admin/power-automate-licensing/faqs#do-guest-users-not-from-your-tenant-need-a-license-to-use-power-automate).  
- Sign in and consent to Power Automate.

## Licensing requirements

A user can become a guest user if both these criteria are met:

- They're invited to a tenant through the Azure Active Directory (Azure AD) admin portal.
- An Office 365 plan or any plan with a Power Automate license is assigned to the guest user.

## Supported capabilities

A guest user can create flows, run flows, and make changes to flow runs. The following sections provide details.

### Sharing

If a guest user needs to only run a flow, they need to have the **Sharing-Run Only** role assigned. If they need to edit flows and perform actions to flow runs such as canceling or resubmitting a flow run, they need a co-owner role assigned.

### Approvals

A guest user can be assigned an approval, receive an approval email, and be routed to the **Approvals** page in the guest tenant to approve or reject. They can also view and interact with the approval email body in the same way as a nonguest user.

Guest users can't see the approvals from their guest tenant while they're in their original tenant, or from their original tenant while they're in their guest tenant.  

### Widgets

A guest user can create, manage, or run flows using widgets in apps like SharePoint, Teams, Excel, Power BI, and more.

### Search for a guest user

A nonguest user can search for, find, and select a guest user in a trigger or action. While they’re typing the name of the guest user, they see the full name of the guest user as an option and don’t need to type the full name.

Some connectors don't support this capability.
