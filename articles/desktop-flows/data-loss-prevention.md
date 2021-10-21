---
title: Data loss prevention (DLP) policies  | Microsoft Docs
description: Data loss prevention (DLP) policies 
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 10/26/2021
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Data loss prevention (DLP) policies 
[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Power Automate offers to administrators the option to create and enforce policies that classify desktop flows action groups as business or non-business and mark actions or action groups as blocked. That way a non-business action can't be combined with an action that has been marked as business so that to avoid a data breach. For more details on how to form a data loss prevention (DLP) policy policy, visit the [respective topic](https://docs.microsoft.com/power-platform/admin/create-dlp-policy) under the Administer Power Platform documentation.
 

## Troubleshoot data loss prevention (DLP) policies violations

While saving a desktop flow you will be notified about the data loss prevention violations the flow includes. The same will occur while running the flow from the designer and from the designer or the console. A desktop flow that violates a data loss prevention (DLP) policy will be marked as suspended.

To resolve a violation navigate to the designer and delete or disable the actions causing this error.

For cases that a desktop flow is used in a cloud flow, navigate to the cloud flows tab and ensure the cloud flows are turned-on.
>[!NOTE]
>If the suspended desktop flow was used in a cloud flow, this cloud flow will be also marked as suspended. Once you have fixed the violations on your desktop flow, make sure that all your cloud flows appear on again.

>[!IMPORTANT]
>For cases that a desktop flow is suspended, it won't be able to run it. Similarly, a cloud flow using a suspend desktop flow won't be able to run either.

 

 

 