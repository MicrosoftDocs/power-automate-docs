---
title: Introduction to data loss prevention (DLP) policies. | Microsoft Docs
description: Introduction to data loss prevention policies for Power Automate.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: anneta
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/14/2020
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
[This topic is pre-release documentation and is subject to change.]
Power Automate provides you the ability to create and enforce policies that classify desktop flows module(or individual module actions) as business/non-business/blocked categories and prevent mix use of modules/actions from different categories in one single desktop flow, or between the cloud flow and the desktop flows it is using. 
>[!Note]
This feature will be rolling out to all cloud regions base on following schedule. Please check the table below to see when the feature will be fully enabled in your region.
Date	Available in regions

2021/11/1	Switzerland , Brazil, Canada
2021/11/8	Asia, UK, Australia, Japan
2021/11/16	Europe
2021/11/18	US(NAM)
2021/11/29	GCC, GCCH, Mooncake, DoD


>[!IMPORTANT]
This capability is currently in preview for free. When this feature becomes generally available in 2022, it will be available for environments with premium accounts only.
Note
Data loss prevention for desktop flows is only available for versions of Power Automate Desktop 2.14.173.21294 or newer. If you are using an older version, please uninstall and update to the latest.
 
>[!Note]
If your users don't have the latest PAD, they will experience limited DLP enforcements. The users will not see the design time error messages when they are trying to run, debug locally from PAD, or save desktop flows that violated DLP policy. We will have background jobs that will periodically scan desktop flows in the environment, and suspend those violated desktop flows automatically. The users will also not be able to run the violated desktop flows from a cloud flow. 

### Admin creates a DLP policy with desktop flows restrictions 
Read the documentation to create a DLP policy
Admin can create DLP policy from https://admin.powerplatform.microsoft.com You can manage DLP for desktop flows in the same way as managing cloud flow connectors/actions. Desktop flow modules are groups of a set of similar actions as you can see the grouping from PAD UI. Module is mapping to the concept of cloud flow connectors. You can define a DLP policy that manage both desktop flow modules and cloud flow connectors. There are also basic modules such as “Variables” which is not manageable in the scope of DLP because almost all the desktop flows need to use those modules.
 

 

### After the policy is enabled:
1.	Makers with the latest PAD will not be able to debug, run, or save desktop flows that have DLP violations
 
2.	Makers will not be able to select a desktop flow that is in violation state from a cloud flow step
 
3.	Makers will not be able to save a cloud flow with a desktop flow, if the cloud flow contains connectors that are in different category with the modules used in the desktop flow 
 
### Background jobs
1.	Every time there is a DLP policy change in your environment, we will kick off a background job to scan all existing cloud flows and desktop flows in the impacted environment, and suspend the ones who now have violation base on the latest policy.
2.	If policy has been updated and now previous violated flows are now in compliance, the background job will automatically turn on all the desktop flows that no longer in violation. However, background job will not automatically turn on the cloud flows and makers have to manually turn them on. (This is due to concerns of having many suspended flow starts running without notice)

### Known limitations
1.	We currently do not support cross check all modules used between a desktop flow and all its children desktop flows – This feature is coming in GA
2.	We do not run background job if there is no DLP policy changes. So there could be potential cases that makers edited some desktop flows where there are existing cloud flows that have referenced those desktop flows and cause new violations. – We will plan to add more periodically validation background job in GA.




## Next steps

* [Learn more about environments](environments-overview-admin.md)
* [Learn more about Power Automate](getting-started.md)
* [Learn more about the admin center](admin-center-introduction.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]
