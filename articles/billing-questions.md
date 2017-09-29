<properties
    pageTitle="Billing and metering questions | Microsoft Flow"
    description="Answers to frequently asked questions regarding billing and metering in Microsoft Flow"
    services=""
    suite="flow"
    documentationCenter="na"
    authors="msftman"
    manager="aftowen"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="10/21/2016"
   ms.author="deonhe"/>

# Billing and metering questions #
This article answers frequently asked questions regarding billing and metering in Microsoft Flow.

## Where can I find out what pricing plans are available? ##
See the [pricing page](https://flow.microsoft.com/pricing/).

## Where can I find out what my plan is? ##
See the [pricing page](https://flow.microsoft.com/pricing/).

## How do I switch plans?
In the top navigation menu, click or tap **Learn**, and then click or tap **Pricing**.

![Learn > Pricing](./media/billing-questions/learn-pricing.png)

## How do I know how much I've used?
Click or tap **Activity** to show logs of your runs, along with notifications and failures.

![Activity link](./media/billing-questions/activity-link.png)

If you're on a free plan or a trial plan, click or tap the gear icon in the top navigation bar to show your current usage against your plan.   

![Settings button](./media/billing-questions/settings.png)

If you're not on a free plan or a trial plan, runs are pooled across all users in your organization. We're working on features to expose available quota and usage across an organization.

## What happens if my usage exceeds the limits?
Microsoft Flow may start to throttle runs.

## Where can I find more information regarding the usage limits?
On the [pricing page](https://flow.microsoft.com/pricing/), see the **FAQ** section.

## What happens if I try to execute runs too frequently?
Your plan determines how often your flows run. For example, your flows may run every 15 minutes if you're on the free plan. If a flow is triggered less than 15 minutes after it ran most recently, it's queued until the 15 minutes have elapsed. Checks for new data don't count as runs.

## What counts as a run?
Whenever a flow is triggered, whether by an automatic trigger or by manually starting it, this is considered a run.

## Are there differences between Microsoft Accounts and work or school accounts for billing?
Yes. If you sign in with a Microsoft Account (such as an account that ends in @outlook.com or @gmail.com), you can use only the free plan. To take advantage of the features of the paid plan, sign in with a work or school email ID.

## I'm trying to upgrade, but I'm told my account isn't eligible.

To upgrade, use a work or school account, or create an Office 365 trial by following the instructions in this [Power BI article](https://powerbi.microsoft.com/documentation/powerbi-admin-signing-up-for-power-bi-with-a-new-office-365-trial/).

## Why did I run out of runs when my flow only ran a few times?
Certain flows may run more frequently than you expect. For example, you might create a flow that sends you a push notification whenever your manager sends you an email. That flow must run every time you get an email (from anyone) because the flow must check whether the email came from your manager. This action counts as a run.

You can work around this issue by putting all the filtering you need into the trigger. In the example above, expand the **Advanced Options** menu, and specify your manager's email address in the **From** field.

## Other limits and caveats
- Each account may have as many as:
	- 50 flows
	- 15 Custom Connectors
	- 20 connections per API and 100 connections total.
- You can install a gateway only in the default environment.   
- Certain external connectors, such as Twitter, implement connection throttling to control quality of service. When throttling is in effect, your flows will fail. You can review details of this throttling by viewing the run that failed in the flow's run history.
