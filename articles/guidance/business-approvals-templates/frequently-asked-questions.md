---
title: Business approvals templates frequently asked questions | Microsoft Docs
description: Frequently asked questions for the Business approvals templates.
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 11/15/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Frequently asked questions

This article will provide you with answers to frequently asked questions and tips on setting up and using the Business Approvals Kit.

## Frequently asked questions

### Why is this feature in preview?

The underlying components that the Kit is created from are generally available. To help balance improvement with moving from private preview to public usage, we're introducing this feature as a preview feature.

If you're an early adopter and think this feature could be useful to you, try it out and help test the feature. We recommend that you don't depend on it yet, and first try it out in a dedicated test environment. Trying out this feature helps us validate that the feature meets your needs and that we're not introducing unintended side effects and we can then progress to removing the preview label for the kit.

Your feedback is critical to this process. Post your feedback by raising an issue on GitHub.

### What are the license requirements and costs for using the Approval Kit?

This will depend on the number of environments that you install the Approvals Kit to and the different personas involved with the kit in your [user journey](./user-journey.md) related to you end to end approval process.

### What permissions are required for the Approvals Kit?

Refer to the [Setup guide](./setup.md) for user permissions and Microsoft Entra application permissions to setup and use the kit.

### Are there limitations in terms of how many stages can be created?

The main limit is not on the stages of your workflow but at a request limit level. The [limitations](./limitations.md) guide provides more information on rate limits that could apply.

### What are the key elements I need to consider when setting up the kit?

The [user journey](./user-journey.md) outlines the Power Platform administrator persona and [setup guide](./setup.md) include information on dependencies and data loss prevention policies that will need to be considered.

### Why is the kit not "free" and why does this kit require premium licenses?

We don't build any of our kits to drive licenses or avoid licenses. We look at what features of the platform best enable us to build our kits and run at the scale we anticipate customers using them in.

As well as our ongoing maintenance and support cost of building / maintaining any given kit. The kit is open source, you are always welcome to use it as a reference implementation to build your own.

The kit is built with Cloud flows that run independent of executing inside the context of a Power App. The approvals workflows are typically automated backend activities (not run manually by a person). As a result this requires a Power Automate process license that supports Premium connectors.

To author and publish Power Automate Cloud flow using the Premium connectors you will need a Power Automate License that supports Premium connectors running as a user.

You can refer to our [Frequently asked questions about Power Automate licensing](/power-platform/admin/power-automate-licensing/faqs) with further licensing related questions.

### I would like to try the Approvals Kit for non production usage what options are there?

Some options that could be explored are the using the following licences together with a Development environment:
- [Power Automate Trials](/power-platform/admin/power-automate-licensing/types#trials)
- [Power Apps Developer Plan](https://powerapps.microsoft.com/developerplan/)
