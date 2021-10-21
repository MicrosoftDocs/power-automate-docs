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

Power Automate offers to administrators the option to create and enforce policies that classify desktop flows action groups as business or non-business and mark actions or action groups as blocked. That way a non-business action can't be combined with an action that has been marked as business so that to avoid data exposure outside the organization. For more details on how to form a data loss prevention (DLP) policy policy, visit the [respective topic](https://docs.microsoft.com/power-platform/admin/create-dlp-policy) under the Administer Power Platform documentation.
 

## Troubleshoot data loss prevention (DLP) policies violations

While saving a desktop flow you will be notified about the data loss prevention violations the flow includes. The same will occur while attempting to run the flow from the designer and the console. A desktop flow that violates a data loss prevention (DLP) policy will be marked as suspended and the run option will be disabled.

   ![Console with a suspended flow](./media/dlp/dlpsuspended.png)

To resolve a violation navigate to the designer and delete or disable the actions causing this error.

## Business vs non-business data loss prevention policy

The business vs non-business data loss prevention policy, prevents users to use actions from the two categories on the same flow. 

For example, the user below receives an error as the Database group of actions are marked as business while the Excel group is marked as non-business.

   ![DLP business - non business](./media/dlp/dlpbusiness-nonbusiness.png)

## Blocked actions and action groups data loss prevention policy

Apart from marking action groups as business and non-business, the administrator can mark action groups or particular actions as blocked. In this case these actions can't be used at all in the flow. 

In the example shown below the Email group of actions and the Send email through Outlook actions are marked as blocked.

   ![DLP blocked](./media/dlp/dlpblocked.png)

For cases that a desktop flow is used in a cloud flow, navigate to the cloud flows tab and ensure the cloud flows are turned-on.

>[!NOTE]
>- The desktop flow dependencies are not being reviewed during the flow run.
>- If the suspended desktop flow was used in a cloud flow, this cloud flow will be also marked as suspended. Once you have fixed the violations on your desktop flow, make sure that all your cloud flows appear on again.

>[!IMPORTANT]
>For cases that a desktop flow is suspended, it won't be able to run it. Similarly, a cloud flow using a suspend desktop flow won't be able to run either.
