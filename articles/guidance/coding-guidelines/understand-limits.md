---
title: Understand platform limits and avoid throttling
description: Understand Power Automate and Power Platform limits and licensing to design scalable flows and avoid throttling.
#customer intent: As a Power Automate user, I want to understand Power Automate and Power Platform limits, including licensing capabilities, so that I can design scalable flows and avoid throttling.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/18/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
search.audienceType: 
  - admin
  - flowmaker
---

# Understand platform limits and avoid throttling

Understanding Power Automate and Power Platform limits can help users design scalable Power Automate flows. 

These limits can impact a flow's performance and help avoid throttling (slowing down) or turning off of flows due to request limit violations. Any flows that get throttled continuously for 14 days get turned off. These flows can be turned on again anytime; however, if their performance doesn't improve, the flow continues to get disabled.

Learn more: 

- [Limits of automated, scheduled, and instant flows](/power-automate/limits-and-config)
- [API requests limits and allocations](/power-platform/admin/api-request-limits-allocations)

## How to check your license plan

Some platform and API limits depend on your license plan. From Power Automate, the easiest way to identify your licenses and capabilities is to select **Settings** > **View My Licenses**.

:::image type="content" source="media/view-my-license.png" alt-text="Screenshot of the View My Licenses option in Settings." lightbox="media/view-my-license.png":::

Alternatively, select <kbd>Ctrl</kbd> + <kbd>Alt</kbd>+ <kbd>A</kbd> from the Power Automate portal to get deeper plan level details. 

## API request limits

Requests in Microsoft Power Platform consist of various actions that a user makes across products. At a high level, an API request is a request to connectors, process advisor analysis, HTTP actions, and built-in actions like initializing variables or using Compose. Both succeeded and failed actions count towards API request limits. Additionally, retries and other requests from pagination count as action executions too. Learn more: [What counts as Power Platform request?](/power-platform/admin/power-automate-licensing/types)

Based on your license plan, there are limits to the number of actions a cloud flow can run in a day. These limits are different from connector throttling limits. You can see the number of actions your flow runs by selecting **Analytics** from the flow details page and accessing the **Actions** tab.

Even when the flow uses fewer Power Platform requests, you can still reach your limits if the flow runs more frequently than you expect. For example, you might create a cloud flow that sends you a push notification whenever your manager sends you an email. That flow runs every time you get an email (from anyone) because the flow must check whether the email came from your manager. The limit applies to all runs across all your flows in a 24-hour period. 

Here are some guidelines to estimate the request usage of a flow:

- One or more actions run as part of a flow run. A simple flow with one trigger and one action results in two actions each time the flow runs, consuming two requests.
- Every trigger/action in the flow generates Power Platform requests. All types of actions like connector actions, HTTP actions, built-in actions (from initializing variables, creating scopes, to a simple compose action) generate Power Platform requests. 
- Both succeeded and failed actions count towards these limits. Skipped actions aren't counted towards these limits.
- Each action generates one request. If the action is in an apply to each loop, it generates as many requests as there are items the loop processes.
- An action can have multiple expressions but it counts as one API request only.
- Retries and extra requests from pagination count as action executions too.

API limits at the platform level are based on the user license. Learn more: [Power Automate licensing types](/power-platform/admin/power-automate-licensing/types)

## API throughput limits on connectors

In addition to platform limits, each connector service has its own limits. Connector throttling in Power Automate refers to the mechanism by which connectors enforce rate limits or usage quotas to prevent abuse and ensure fair resource allocation. When a connector is throttled, it restricts the number of requests or operations that can be made within a specific timeframe.

When a flow runs into connector-level throttling limits, the service returns a *429 (Too Many Requests)* error code with an error text like *Rate limit is exceeded. Try again in 27 seconds*.

Each [connector](/connectors/connector-reference/connector-reference-powerautomate-connectors) has its own throttling limit. 

## Dataverse API limits

Dataverse as a connector service defines its own [service protection limits](/power-apps/developer/data-platform/api-limits). The service protection API limits are evaluated per user. When called by a flow the *user* is whomever is associated with the action. Usually, this user is the flow owner, but it can be the invoking user if the flow is invoking user context in the action.

## Flow concurrency limits

Designing scalable, efficient flows includes understanding concurrency, looping, and debatching limits to help avoid unnecessary delays. Learn more: [Concurrency, looping, and debatching limits](/power-automate/limits-and-config#concurrency-looping-and-debatching-limits).

## Action burst limits

Action burst limits refer to the maximum number of actions that can be triggered within a specific period, typically measured in a rolling window of time. Currently, there's a per-flow cap of 100,000 actions per 5 minutes. 

Any bursts of triggering or loops can exceed this limit, causing flows to slow down or throttle.

To address this limit, distribute the load between multiple flows,  for example, by using [child flows](/power-automate/create-child-flows) or by using [trigger conditions](optimize-power-automate-triggers.md).

## Flow design limits

When designing flows, you might encounter limits defined at the design/definition level. Consider redesigning your flows if you encounter these limits.

Learn more: [Flow definition limits](/power-automate/limits-and-config#flow-definition-limits)