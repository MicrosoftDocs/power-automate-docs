---
title: Understand platform limits and avoid throttling
description: Understand Power Automate and Power Platform limits and licensing to design scalable flows and avoid throttling.
#customer intent: As a Power Automate user, I want to understand Power Automate and Power Platform limits, including licensing capabilities, so that I can design scalable flows and avoid throttling.
author: manuelap-msft
ms.service: power-automate
ms.subservice: guidance
ms.topic: best-practice
ms.date: 09/18/2026
ms.author: rachaudh
ms.reviewer: edoyle
search.audienceType: 
  - admin
  - flowmaker
---

# Understand platform limits and avoid throttling

To design scalable flows, it helps to understand the limits that Power Automate and Power Platform licenses and APIs impose on your flows. Flows that violate these limits can be throttled, slowed down, or even turned off. If flows are continuously throttled for 14 days, they turn off automatically. You can turn flows on again at any time. If they continue to violate the limits, they get turned off again. This article describes the limits that can affect your flows and how to stay within them. Learn more in [Limits of automated, scheduled, and instant flows](/power-automate/limits-and-config) and [Requests limits and allocations](/power-platform/admin/api-request-limits-allocations).

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

## What to do when your flow is throttled

You can resolve throttling in two ways: 

- Give the flow more capacity.
- Reduce the number of requests it makes.

### Give the flow its own capacity

Assign a [Process license](/power-platform/admin/power-automate-licensing/types#capacity-licenses) to the flow. Unlike a user license, a Process license is allocated to the flow itself, so the flow's entitlement doesn't depend on who owns or runs it. A Process license entitles the flow to 250,000 actions per 24 hours (shown as Power Platform requests in admin center reports).

The flow must be in a [solution](/power-automate/create-flow-solution). You then have two ways to allocate the capacity:

- **Assign the license directly to the flow**: If one flow needs more than 250,000 actions per 24 hours, [stack up to 10 Process licenses](/power-platform/admin/power-automate-licensing/faqs#can-i-assign-multiple-process-licenses-to-a-single-cloud-flow) on it rather than splitting the work across flows. Each license adds another 250,000 actions per 24 hours.
- **Assign the license to a [flow group](/power-automate/flow-groups)**: Up to 25 solution-aware cloud flows share the group's 250,000 actions per 24 hours. Every parent and child flow needs to be added explicitly, and you can't stack licenses on a flow group.

If you save the flow after the license is assigned, the flow picks up the new entitlement immediately. Otherwise, flows refresh their plan in the background within a week.

If you need capacity before a purchase can go through, ask a global admin to start a free 30-day Process trial from the Microsoft 365 admin center. Trial licenses carry the same entitlements as paid ones, so they resolve throttling straight away. Learn more in [Admin-managed trial licenses](/power-platform/admin/power-automate-licensing/deep-dive-on-specific-license#admin-managed-trial-licenses).

The Power Platform requests add-on doesn't help here either. The add-on raises a user's daily request limit, not a flow's, and it can't be assigned to a flow.

> [!NOTE]
> The Power Automate Per-flow plan is a legacy license that the Process license replaces. A flow that already has a Per-flow license keeps its 250,000 actions per 24 hours, but you can allocate only one Per-flow license to a flow. The limits can't be stacked, and can't be assigned to a flow group. Use Process licenses for new capacity.

### Make the flow use fewer requests

Every trigger and action counts as a request, including built-in actions like initializing variables and compose actions. Common reductions:

- Add [trigger conditions](/power-automate/triggers-introduction) so the flow runs only when the incoming item is one it actually needs to handle. A flow that starts on every email and then checks the sender consumes requests on every email.
- Filter at the data source with an OData filter query instead of retrieving all rows and testing them inside an **Apply to each** loop. Each iteration of a loop generates its own requests.
- Use the [Select](/power-automate/data-operations) and [Filter array](/power-automate/data-operations) data operations instead of loops where you're reshaping data rather than acting on each item.
- Remove retries you don't need. Retries and pagination both count as actions.

### Check which limit you exceeded

Not every throttled flow hits the daily action limit. Different remedies apply:

| Symptom | Limit | What helps |
|---|---|---|
| Actions delayed across the whole flow, high daily action count in admin center reports | [Daily action limit](#api-request-limits) | A Process license, or fewer requests |
| HTTP 429 from one connector, error text like _Rate limit is exceeded_ | [Connector limit](#api-throughput-limits-on-connectors) | Spread calls over time, batch them, or use a different connection |
| Errors calling Dataverse under load | [Dataverse service protection limits](#dataverse-api-limits) | Reduce request rate; a Process license doesn't raise these |

Moving the environment to pay-as-you-go changes how usage above the daily action limit is billed. It doesn't raise connector limits or Dataverse service protection limits, so it isn't a general fix for a throttled flow.

### If the flow is suspended

A flow that stays above the limits for 14 consecutive days is suspended and its owner is notified. Assign a Process license and turn the flow back on.

Learn more in [What happens when my flow runs too many actions?](/power-platform/admin/power-automate-licensing/faqs#what-happens-when-my-flow-runs-too-many-actions).

## API throughput limits on connectors

In addition to the limits the platform imposes, each connector service has its own limits. Connector throttling in Power Automate refers to the mechanism by which connectors enforce rate limits or usage quotas to prevent abuse and ensure fair resource allocation. When a connector is throttled, it restricts the number of requests or operations that can be made in a specific timeframe. Every connector has its own throttling limit.

When a flow runs into connector-level throttling limits, the service returns error code _429 (Too Many Requests)_ with error text like _Rate limit is exceeded. Try again in 27 seconds_.

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
