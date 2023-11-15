---
title: Limitations 
description: Learn about the Approvals kit's limitations.
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 11/15/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Limitations

The approvals kit is created to address some of the most common approval patterns; however, there are limits to what a template can do to accommodate every possible approval scenario. The kit is intended to act as a base solution to what you could use for approvals. Some requirements might not fit for your organization, and which you can tailor to your needs by customizing the template.

There are some technical limitations this template, and the following sections describe limitations of the Approvals kit.

## Business approval management

The following limits apply to the business approval management application:

- Conditions can't be applied to the first stage of a workflow.

## Power Automate action request limits

To help ensure service levels, availability, and quality, there are entitlement limits for the number of requests users can make each day across Power Apps and Power Automate.

The Approvals kit consumes approximately 30 actions in Power Automate. These actions are an equivalent to:

- 160 approval actions per day per user for Power Apps per user plan
- 30 approval actions per day per user for Power Apps per app plan.

If you exceed this request amount, you might consider add-on licenses. More information: [Requests limits and allocations](/power-platform/admin/api-request-limits-allocations)

## Supported languages

The Approvals kit solutions aren't localized, and only support English. Add the English language pack to your environment to make sure all apps and flows work. More information: [Regional and language options for your environment](/power-platform/admin/enable-languages)
