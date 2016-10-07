<properties
    pageTitle="Billing and Metering Questions | Microsoft Flow"
    description="Answers to frequently asked questions regarding billing and metering in Microsoft Flow"
    services=""
    suite="flow"
    documentationCenter="na"
    authors="camsoper"
    manager="aftowen"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="10/04/2016"
   ms.author="casoper"/>

# Billing and metering questions
test test
This article answers frequently asked questions regarding billing and metering in Microsoft Flow.

## Where can I find out what pricing plans are available?

Pricing information for Microsoft Flow can be found [here](#tbd).

## Where can I find out what my plan is?

Information about your current plan can be found by clicking `<whatever>` and then `<something else>`.

![Screenshot](#tbd)

## How do I switch plans?

You can switch plans by clicking `<whatever>` and then `<something else>`.

![Screenshot](#tbd)

## How do I know how much I've used?

Logs of your runs, along with notifications and failures, can be found by clicking **Activity**.

![Screenshot](./media/billing-questions/activity-link.png)

Additionally, your current usage against your plan can be found by clicking `<whatever>` and then `<something else>`.   

![Screenshot](#tbd)

## What happens if my usage exceeds the limits?

Any runs triggered after your usage exceeds the limits of your plan will `<fail or queue?>`.

## What happens if I try to execute runs too frequently? 

Runs are queued until they are able to be executed according to your plan.  For example, if you are on the free plan, your flows may only be run every 15 minutes.  Flows triggered more frequently than that will queue until the current 15-minute period expires, at which time all queued flows will run.  

## What counts as a run?

Whenever a flow is triggered, whether by an automatic trigger or by manually starting it, this is considered a run. 

## Other limits and caveats

- Microsoft Flow accounts may have up to 50 flows each.
- Certain external connectors, such as Twitter, implement connection throttling to control quality of service.  When throttling is in effect, your flows will `<some kind of description of the experience>`.