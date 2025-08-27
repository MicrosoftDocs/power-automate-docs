---
title: Understand platform limits and avoid throttling
description: Understand Power Automate and Power Platform limits and licensing to design scalable flows and avoid throttling.
#customer intent: As a Power Automate user, I want to understand Power Automate and Power Platform limits, including licensing capabilities, so that I can design scalable flows and avoid throttling.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 07/11/2025
ms.author: rachaudh
ms.reviewer: jhaskett-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Understand platform limits and avoid throttling

To design scalable flows, it helps to understand the limits that Power Automate and Power Platform licenses and APIs impose on your flows. Flows that violate them can be throttled, or slowed down, or even turned off altogether if they're throttled continuously for 14 days. Flows can be turned on again at any time, but if they continue to violate the limits, they continue to get turned off. This article describes the limits that can affect your flows and how to stay within them. Learn more in [Limits of automated, scheduled, and instant flows](/power-automate/limits-and-config) and [Requests limits and allocations](/power-platform/admin/api-request-limits-allocations).

## Check your license plan

Some platform and API limits depend on your license plan. In Power Automate, the easiest way to identify your licenses and capabilities is to select **Settings** > **View My Licenses**.

:::image type="content" source="media/view-my-license.png" alt-text="Screenshot of the View My Licenses option in Power Automate settings.":::

To dig deeper into the details of your license plan, press **Ctrl+Alt+A** in the Power Automate portal.

## API request limits

An API request is how Power Automate flows ask a service to do something, like connect to apps or send or return data. Every time your flow does something, it counts as a request, whether it succeeds or fails. Learn more in [What is a Microsoft Power Platform request?](/power-platform/admin/api-request-limits-allocations#what-is-a-microsoft-power-platform-request).

The limits to the number of actions a cloud flow can run in a day are based on your license plan. API limits at the platform level are based on the user license. Learn more in [Types of Power Automate licenses](/power-platform/admin/power-automate-licensing/types).

API request limits are different from [connector throttling limits](#api-throughput-limits-on-connectors). They apply to all runs across all your flows in a 24-hour period. To view the number of actions a flow runs, go to the flow details page, select **Analytics**, and then select the **Actions** tab.

Even when a flow makes few Power Platform requests, it can still reach the limits if it runs more frequently than you expect. For example, you might create a cloud flow that sends you a push notification whenever your manager sends you an email. The flow runs every time you get an email from anyone, because it must check whether the email came from your manager.

Use the following guidelines to estimate the request usage of a flow:

- A simple flow with one trigger and one action results in two actions each time the flow runs, consuming two requests.

- Every trigger and action in the flow generates Power Platform requests. Actions include connector actions, HTTP actions, and built-in actions like initializing variables, creating scopes, and simple compose actions.

- Both successful and failed actions count toward limits, but not skipped actions.

- Each action generates one request. If the action is in an "apply to each" loop, it generates as many requests as there are items for the loop to process.

- An action can have multiple expressions but it counts as one API request.

- Retries and extra requests from pagination count as actions.

## API throughput limits on connectors

In addition to the limits the platform imposes, each connector service has its own limits. Connector throttling in Power Automate refers to the mechanism by which connectors enforce rate limits or usage quotas to prevent abuse and ensure fair resource allocation. When a connector is throttled, it restricts the number of requests or operations that can be made in a specific timeframe. Every connector has its own throttling limit.

When a flow runs into connector-level throttling limits, the service returns error code *429 (Too Many Requests)* with error text like *Rate limit is exceeded. Try again in 27 seconds*.

## Dataverse API limits

Dataverse as a connector service defines its own service protection limits. These limits are evaluated per user, where the user is whoever is associated with the action. Usually, the user is the flow owner, but it can be the invoking user if the flow invokes user context in the action. Learn more in [Service protection API limits](/power-apps/developer/data-platform/api-limits).

## Flow concurrency limits

Limits apply to the number of runs that can execute at the same time, items that can be processed in a loop, and chunks that a large dataset can be split into for more efficient processing. Learn more in [Concurrency, looping, and debatching limits](/power-automate/limits-and-config#concurrency-looping-and-debatching-limits).

## Action burst limits

Action burst limits refer to the maximum number of actions that can be triggered in a specific period, typically measured in a rolling window of time. Currently, the cap is 100,000 actions in five minutes.

To stay under this limit, distribute the load between multiple flows using child flows or add trigger conditions. Learn more in [Create child flows](/power-automate/create-child-flows) and [Optimize Power Automate triggers](optimize-power-automate-triggers.md).

## Flow design limits

You might encounter limits on the complexity of a flow that are defined at the design and definition level. Consider redesigning your flow if you encounter them. Learn more in [Flow definition limits](/power-automate/limits-and-config#flow-definition-limits).

## Related information

- [List of all Power Automate connectors](/connectors/connector-reference/connector-reference-powerautomate-connectors)
