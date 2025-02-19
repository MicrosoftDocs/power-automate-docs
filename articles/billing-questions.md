---
title: Billing and metering questions | Microsoft Docs
description: Answers to frequently asked questions regarding billing and metering in Power Automate
services: ''
author: kenseongtan
suite: flow
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 03/30/2022
ms.author: kenseongtan
ms.reviewer: angieandrews
search.audienceType: 
  - admin
---
# Billing and metering questions

This article answers frequently asked questions regarding billing and metering in Power Automate.

## Where can I find out what pricing plans are available?

See the [pricing page](https://make.powerautomate.com/pricing/).

## Where can I find out what my plan is?

See this [subscription page](https://portal.office.com/account/#subscriptions).

## How do I switch plans?

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the top right of the screen, select **?** > **Pricing**, and then select the plan to which you want to switch.

## What happens if my usage exceeds the limits?

Power Automate throttles your flow runs.

## Where can I find more information regarding the usage limits?

- On the [pricing page](https://make.powerautomate.com/pricing/).
- On the [limits and config page](limits-and-config.md).

## What happens if I try to run flows too frequently?

Your plan determines how often your flows run. For example, your flows may run every 15 minutes if you're on the free plan. If a cloud flow is triggered less than 15 minutes after its last run, it's queued until 15 minutes elapses.

## What counts as a run?

Whenever a cloud flow is triggered, whether by an automatic trigger or manually, this is considered a run. Checks for new data don't count as runs.

## Are there differences between Microsoft Accounts and work or school accounts for billing?

Yes. If you sign in with a Microsoft Account (such as an account that ends with @outlook.com or @gmail.com), you can use only the free plan. To take advantage of the features in the paid plan, sign in with a work or school email address.

## I'm trying to upgrade, but I'm told my account isn't eligible

To upgrade, use a work or school account, or create a [Microsoft 365 trial account](https://powerbi.microsoft.com/documentation/powerbi-admin-signing-up-for-power-bi-with-a-new-office-365-trial/).

## Why did I run out of runs when my flow only ran a few times?

Certain flows may run more frequently than you expect. For example, you might create a cloud flow that sends you a push notification whenever your manager sends you an email. That flow must run every time you get an email (from anyone) because the flow must check whether the email came from your manager. This action counts as a run.

You can work around this issue by putting all the filtering you need into the trigger. In the push notification example, expand the **Advanced Options** menu, and then provide your manager's email address in the **From** field.

## Other limits and caveats

* Each account may have as many as:
  * 15 custom connectors.
  * 20 connections per API and 100 connections total.
* Certain external connectors, such as Twitter, implement connection throttling to control quality of service. Your flows fail when throttling is in effect. If your flows are failing, review the details of the run that failed in the flow's run history.

## Licenses that can submit support tickets in Power Automate

If you have one of the following licenses, you can [submit a support ticket in Power Automate](https://make.powerautomate.com/support/)
* Power Automate Process plan (previously Power Automate per flow)
* Power Automate Premium plan (previously Power Automate per user and Power Automate per user with attended RPA) 
* PowerApps per user plan
* Dynamics Enterprise plan
* Dynamics Professional plan

[!INCLUDE[footer-include](includes/footer-banner.md)]
