---
title: Support for guest users
description: Learn about the experience for guest users to create and share flows, including how to grant access and more.
author: lali
ms.date: 07/06/2023
ms.custom: 
ms.topic: article
ms.author: lali
ms.reviewer: angieandrews
---

# Support for guest users

The Power Automate experience for guest users is the same as for non-guest users, with some stipulations. Guest users can be a vendor or customer in a tenant of their own organization who need access to a tenant in another organization. They're sometimes referred to as an external users. Guest users have the same experience in both the Power Automate portal and the Power Automate mobile app.

Read this article to help you understand the scenarios that are supported for guest users.

## Prerequesites

A guest user must meet the following criteeria:

- Have a Power Automate license assigned through either the tenant that hosts the flow, or the home tenant of the guest user. To learn more about licensing implications, go to [FAQs about licenses](/power-platform/admin/power-automate-licensing/faqs#do-guest-users-not-from-your-tenant-need-a-license-to-use-power-automate).  
- Sign in and consent to Power Automate.

## Licensing requirements

A user can become a guest user if both these criteria are met:

- They're invited to a tenant through the Azure Active Directory (Azure AD) admin portal.
- An Office 365 plan or any plan with a Power Automate license is assigned to the guest user.

## Supported capabilities

A guest user can create flows, run flows, and make changes to flow runs. The following sections provide details.

### Sharing

If a guest user needs to only run a flow, they need to have the **Sharing-Run Only** role assigned. If they need to edit flows and perform actions to flow runs such as cancelling or resubmitting a flow run, they need a co-owner role assigned.

### Approvals

A guest user can be assigned an approval, receive an approval email, and be routed to the **Approvals** page in the guest tenant to approve or reject. They can also view and interact with the approval email body in the same way as a non-guest user.

Guest users can't see the approvals from their guest tenant in their original tenant or from their original tenant to their guest tenant.  

### Widgets

A guest user can create, manage, or run flows using widgets in apps like SharePoint, Teams, Excel, Power BI, and more.

### Search for a guest user

A non-guest user can search, find, and select a guest user in a trigger or action. While they’re typing the name of the guest user, they'll see the full name of the guest user as an option and won’t need to type the full name.

## Grant access to a guest user

To provide access to a guest user, go to [Assign Azure roles to external guest users using the Azure portal](/azure/role-based-access-control/role-assignments-external-users).