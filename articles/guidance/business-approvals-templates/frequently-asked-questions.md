---
title: Business approvals templates frequently asked questions | Microsoft Docs
description: Frequently asked questions for the Business approvals templates.
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: faq
ms.date: 11/15/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Frequently asked questions

This article provides you with answers to frequently asked questions and tips on setting up and using the Business Approvals Kit.

## Why is this feature in preview?

The underlying components that the Kit is created from are generally available. To help balance improvement with moving from preview to public usage, we're introducing this feature as a preview feature prior to general availability.

If you're an early adopter and think this feature could be useful to you, try it out and help test the feature. We recommend that you don't depend on it yet, and first try it out in a dedicated test environment. Users evaluating features and providing feedback helps us validate that the kit meets your needs. The preview process allows you to ensure that we're not introducing unintended side effects and we can then progress to removing the preview label for the kit.

Your feedback is critical to this process. Post your feedback by raising an issue on GitHub.

## What are the license requirements and costs for using the Approvals Kit?

License costs depend on, the number of environments that you install the Approvals Kit to and the different personas involved with the kit in your [user journey](./user-journey.md).

## What permissions are required for the Approvals Kit?

Refer to the [Setup guide](./setup.md) for user permissions and Microsoft Entra application permissions to set up and use the kit.

## Are there limitations in terms of how many stages can be created?

The main limit isn't on the stages of your workflow but at a request limit level. The [limitations](./limitations.md) guide provides more information on rate limits that could apply.

### What are the key elements I need to consider when setting up the kit?

The [user journey](./user-journey.md) outlines the Power Platform administrator persona and [setup guide](./setup.md) include information on dependencies and data loss prevention policies.

## Why is the kit not "free", and why does this kit require premium licenses?

We don't build any of our kits to drive licenses or avoid licenses. We look at what features of the platform best enables us to build our kits and run at the scale we anticipate customers using them in.

We invest in ongoing maintenance and support cost of building / maintaining the Approvals kit. The kit is open source, you're always welcome to use it as a reference implementation to build your own.

The kit is built with cloud flows that run independent of executing inside the context of a Power App. The approvals workflows are typically automated backend activities (not run manually by a person). As a result of automated backend activities requires a Power Automate process license that supports Premium connectors.

To author and publish Power Automate cloud flows using the Premium connectors, you need a Power Automate license that supports Premium connectors running as a user.

You can refer to our [Frequently asked questions about Power Automate licensing](/power-platform/admin/power-automate-licensing/faqs) with further licensing related questions.

## I would like to try the Approvals Kit for nonproduction usage. What options are there?

Some options that could be explored are the using the following licenses together with a Development environment:
- [Power Automate Trials](/power-platform/admin/power-automate-licensing/types#trials)
- [Power Apps Developer Plan](https://powerapps.microsoft.com/developerplan/)
