---
title: Get started with Power Automate approvals. | Microsoft Docs
description: Learn about the permissions and general details about Power Automate approvals.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/29/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Get started with approvals

Approval flows can help you automate sign-off requests, and combine human decision making with background automation, to help your business users focus on creative and important work.

Here's what you need to get started with approvals

- Permissions to create a project oakdale database.
- A license to create flows.


## Permissions to create a project oakdale database

Approvals are created and stored in a project oakdale database. Initially, when you use the approvals connector in a flow that’s located in a non-default environment, the system automatically provisions a database in the background. For this step to succeed, the user who runs the first approval flow must have an administrator role in the environment. Users other than the administrator who attempt to run the first flow in a non-default environment receive an error.

It can take a few minutes for the database provisioning to complete, and you’ll notice this delay the first time that you run the flow. Subsequently, other users who create approval flows do not need any elevated permissions in the environment.

>[!NOTE]
>Default environments do not need to have this requirement, and any user can get started.

## License to create flows

Since the approvals connector is a standard connector, any license that grants access to Power Automate and the ability to use standard connectors is sufficient to create approval flows. This could be a Power Automate, an Office 365, or a Dynamics 365 license with built-in Power Automate capabilities. You can find a list of these Office 365 and Dynamics 365 licenses in the [Microsoft Power Apps and Power Automate licensing guide](https://go.microsoft.com/fwlink/?linkid=2085130).


## Assign approvals to any user in your tenant

You can assign approvals to users in your current project oakdale environment as well as any users in your Azure Active Directory (Azure AD) tenant, including guest users. When you assign an approval to users who are not in your environment, they are automatically added so that we can process their responses and persist them for approvals history. The following tenant configurations do not allow this:

- When the AllowAdHocSubscriptions setting in Azure Active Directory (Azure AD) is disabled. In this case, you can request your tenant administrator to enable it. You can find more information about this in the self-service signup.
- If a security group has been used to control which users have access to the project oakdale environment.
- Power Automate [US Government plans](https://docs.microsoft.com/power-automate/us-govt).


Once you assign an approval to a user, they can respond directly from an Outlook email, a Teams adaptive card, or the Power Automate action center, as long as they have a Power Automate, an Office 365, or a Dynamics 365 license with built-in Power Automate capabilities. You can find a list of these Office 365 and Dynamics 365 licenses in the Microsoft Power Apps and Power Automate licensing guide.

## Next steps

- Create [single approval flows](modern-approvals.md)






 
