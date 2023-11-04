---
title: Limitations | Microsoft Docs
description: Limitations
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 9/29/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Limitations

Approvals Kit is created to address some of the most common approval patterns. However, there are limits to what a template can do to accommodate every scenario in the world for approvals. The kit is intended to act as a base solution to what you could use for approvals. Some requirements might not fit for your organization, and which you can optionally tailor to your needs by customizing the template.

There are some technical limitations this template, and the following sections describe limitations of the Approvals Kit

## Business Approval Management

The following limits apply to to the Business Approval Management application

- Conditions cannot be applied to the first stage of a workflow.

## Power Automate action request limits

To help ensure service levels, availability, and quality, there are entitlement limits to the number of requests users can make each day across Power Apps, Power Automate.

Approvals Kit consumes approximately 30 actions in Power Automate. These actions are an equivalent to:

- 160 approval actions per day per user for Power Apps per user plan

- 30 approval actions per day per user for Power Apps per app plan.

If you exceed this request amount, you can be restricted and need to investigate Add-on licenses. Learn more: [Requests limits and allocations](/power-platform/admin/api-request-limits-allocations)

## Supported languages

The Approvals Kit solutions aren't localized, and only support English. Add the English language pack to your environment to make sure all apps and flows work. More information: [Regional and language options for your environment](/power-platform/admin/enable-languages)