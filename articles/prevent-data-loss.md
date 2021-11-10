---
title: Introduction to data loss prevention (DLP) policies. | Microsoft Docs
description: Introduction to data loss prevention policies for Power Automate.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/10/2021
ms.author: deonhe
search.app: 
  - Flow
  - Powerplatform
search.audienceType: 
  - admin
---
# Data loss prevention (DLP) policies


This document introduces you to data loss prevention policies, which help protect your organizational data from being shared with a list of connectors that you define.

## What's a data loss prevention policy?

An organization's data is critical to its success. Its data needs to be readily available for decision-making, but it needs to be protected so that it isn't shared with audiences that shouldn't have access to it. To protect this data, Power Automate provides you with the ability to create and enforce policies that define which connectors can access and share business data. The policies that define how data can be shared are referred to as data loss prevention (DLP) policies.

To learn more about protecting your data, see [Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention) in the Microsoft Power Platform admin guide.

>[!IMPORTANT]
>Administrators control data loss prevention policies. Contact your administrator if a data loss prevention policy is blocking your flows from running.

## Data loss prevention for desktop flows (preview)

>[!IMPORTANT]
>Data loss prevention for desktop flows is a preview feature and it's subject to change.

Power Automate provides the ability to create and enforce policies that classify desktop flows modules (or individual module actions) as business, non-business, or blocked categories. This categorization prevents makers from combining modules and actions from different categories into a desktop flow, or between a cloud flow and the desktop flows it uses.

>[!NOTE]
>This feature becomes available in specific regions based on following schedule.

Region|Date available
------|---------------
Canada| 2021/11/1	
Switzerland, Brazil|2021/12/09
Asia, UK, Australia, Japan| 2021/12/13
Europe| 2021/12/16
US(NAM)| 2021/12/20
Government Community Cloud (GCC), Government Community Cloud - High (GCC High), Department of Defense (DoD), China regions| 2021/12/22	

>[!IMPORTANT]
>This capability is available in preview at no cost. When this feature becomes generally available in 2022, it will be available for environments with premium accounts only.

>[!NOTE]
>Data loss prevention for desktop flows is available for versions of Power Automate Desktop 2.14.173.21294 or newer. If you are using an older version, uninstall and update to the latest version.
 
>[!Note]
>If your users don't have the latest Power Automate Desktop, they will experience limited data loss prevention policy enforcements. The users will not see the design time error messages when they are trying to run, debug from Power Automate Desktop, or save desktop flows that violate data loss prevention policies. We will have background jobs that will periodically scan desktop flows in the environment, and automatically suspend those desktop flows that violate data loss prevention policies. Users won't be able to run desktop flows from a cloud flow if the desktop flow violates any data loss prevention policy. 

### Create a data loss prevention policy with desktop flows restrictions 

Admins can create data loss prevention policies from https://admin.powerplatform.microsoft.com. They can manage data loss prevention policy for desktop flows in the same way they manage cloud flow connectors and actions. Desktop flows modules are groups of similar actions as displayed in the Power Automate Desktop user interface. A module is similar to connectors that are used in cloud flows. You can define a data loss prevention policy that manages both desktop flows modules and cloud flows connectors. There are also basic modules such as “Variables” which aren't manageable in the scope of data loss prevention policy because almost all desktop flows need to use those modules.

### After the policy is enabled
-	Makers with the latest Power Automate Desktop will not be able to debug, run, or save desktop flows that have data loss prevention policy violations.
- Makers will not be able to select a desktop flow that is in violation of a data loss prevention policy from a cloud flow step.

 
### Background jobs
- Every time a data loss prevention policy changes in your environment, a background job scans all existing flows in the environment, and then suspends the flows that violate the updated policy.
- After a data loss prevention policy changes, the background job automatically turns on all the desktop flows that no longer violate any policies. However, the background job will not automatically turn on cloud flows. Makers have to turn them on manually.

### Known limitations
1. There's no support for cross checking the categories between a cloud flow and the desktop flows it calls. That function is planned to be available after 12/7/2021.
1. There's no support for cross checking the modules that are used between a desktop flow and all its child desktop flows. This feature is planned for general availability.
1. We do not run background jobs if the data loss prevention policy doesn't change. So, there's a potential that makers may have edited some desktop flows where there are existing cloud flows that have referenced those desktop flows, causing new violations. We plan to run the background job more frequently in general availability.

## Next steps

* [Learn more about environments](environments-overview-admin.md)
* [Learn more about Power Automate](getting-started.md)
* [Learn more about the admin center](admin-center-introduction.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]
