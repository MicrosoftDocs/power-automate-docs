---
title: Support for guest users
description: Learn support scenarios for guest users, including how to create, share, and approve flows.
author: donums
ms.date: 06/30/2025
ms.custom: 
ms.topic: article
ms.author: derahonuorah
ms.reviewer: angieandrews
---

# Support for guest users

The Power Automate experience for guest users is the same as it is for nonguest users, with some stipulations. A guest user can be a vendor or customer in a tenant of their own organization who needs access to a tenant in another organization. Guest users have the same experience in both the Power Automate portal and the Power Automate mobile app. They're sometimes referred to as external users.

This article helps you understand the scenarios that are supported for guest users.

> [!NOTE]
> Guest users aren't currently supported in Process Mining.

## Prerequisites

A guest user must meet the following criteria:

- Have a Power Automate license assigned through either the tenant that hosts the flow, or the home tenant of the guest user. To learn more about licensing implications, go to [FAQs about licenses](/power-platform/admin/power-automate-licensing/faqs#do-guest-users-not-from-your-tenant-need-a-license-to-use-power-automate).  
- Sign in and consent to Power Automate.

## Licensing requirements

A user can become a guest user if both these criteria are met:

- They're invited to a tenant through the Microsoft Entra admin portal.
- An Office 365 plan, or any plan with a Power Automate license is assigned to the guest user.

## Supported capabilities

A guest user can create flows, run flows, and make changes to flow runs. The following sections provide details.

### Sharing

If a guest user needs to only run a flow, they need to have the **Sharing-Run Only** role assigned. If they need to edit flows and perform actions to flow runs such as canceling or resubmitting a flow run, they need a co-owner role assigned.

### Approvals

A guest user can be assigned an approval, receive an approval email, and be routed to the **Approvals** page in the guest tenant to approve or reject.

Guest users can't see the approvals from their guest tenant while they're in their original tenant, or from their original tenant while they're in their guest tenant. Furthermore, actionable approval mails in Outlook aren't supported for guest users in a tenant. Guest users need to go to the Power Automate portal in order to act on an approval.

### Widgets

A guest user can create, manage, or run flows using widgets in apps like SharePoint, Teams, Excel, Power BI, and more.

### Search for a guest user

A nonguest user can search for, find, and select a guest user in a trigger or action. As they start typing the name of the guest user, they see a list of names to choose from in the dropdown list. When they see the name of the guest user, they can select it. This saves the nonguest user time because they don't need to finish typing the entire name.

Some connectors don't support this capability.

## Set up Business to Business (B2B) collaboration

To set up B2B collaboration between tenants in different clouds, both guest user and nonguest user tenants need to configure their Microsoft cloud settings to enable collaboration with the other cloud. Then, each tenant must configure inbound and outbound cross-tenant access with the tenant in the other cloud. To learn more, go to [Configure Microsoft cloud settings for B2B collaboration](/azure/active-directory/external-identities/cross-cloud-settings).

## Related information

- [Microsoft Entra B2B in government and national clouds](/azure/active-directory/external-identities/b2b-government-national-clouds)
- [Assign Azure roles to external guest users using the Azure portal](/azure/role-based-access-control/role-assignments-external-users)
