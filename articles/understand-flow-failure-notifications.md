---
title: Understand flow failure notifications in Power Automate
description: Learn how Power Automate notifies you when a cloud flow fails, which failures trigger an email, the 28-day cooldown period, and how to monitor all failures.
author: matow
ms.author: matow
ms.reviewer: angieandrews
ms.topic: conceptual
ms.date: 04/03/2026
ms.subservice: cloud-flow
---

# Understand flow failure notifications

When a cloud flow fails, Power Automate can notify you by email so you can take action. This article explains how failure notifications work, which types of failures trigger an email, and how to monitor all failures, including those that don't generate an email.

## How failure notifications work

Power Automate uses two types of failure notification emails:

- **Per-run failure alert**: Sent shortly after a specific flow run fails, when the system identifies a known, fixable issue. Includes steps to help you resolve the problem.
- **Weekly failure digest**: A summary of all flow failures across your environments over the past week, sent regardless of the failure type.

### Per-run failure alerts

When a flow run fails, Power Automate analyzes the actions in the run to find the **root cause** of the failure. If the root cause matches a known issue with a specific fix, such as a broken connection or a throttled action, an alert email is sent to the flow owner and co-owners with steps to resolve it.

If the system can't identify a specific fix for the failure, no per-run alert email is sent. This is by design to ensure that alert emails are actionable and help you resolve the problem, rather than simply telling you something went wrong.

> [!NOTE]
> After a per-run alert email is sent for a flow, there's a *28-day cooldown period* before another per-run alert can be sent for the same flow. No other alerts are sent for that flow until the cooldown expires. This prevents repeated emails for recurring failures.

### Who receives failure alert emails

The recipients of a per-run failure alert email depend on how the flow is set up and whether it's shared.

| Flow type | Who receives the email |
|---|---|
| Personal flow (not shared) | The flow owner (creator) only. |
| Shared flow (with co-owners) | All co-owners of the flow, that is, everyone the flow is shared with as an owner or editor. *Run-only users aren't included.* If no co-owners are found, the email is sent to the flow creator. |
| Solution-aware flow | The current owner and co-owners of the flow in Dataverse. |

> [!NOTE]
> Failure alert emails are never sent to environment admins or tenant admins. Only users who own or co-own the flow receive per-run alerts. Admins can use the **Monitor** experience in the Power Platform admin center to track failures across flows and environments.

### What triggers a per-run alert email

| Failure type | Alert email sent? | Description |
|---|---|---|
| Broken or expired connection | Yes | A connection used by the flow needs to be re-authenticated or reauthorized. |
| Throttled action | Yes | An action exceeded the rate limits for its connector. |
| AI Builder error | Yes | An AI Builder action encountered an error during execution. |
| Desktop flow error | Yes | A desktop flow action failed during execution. |
| Known connector error | Yes | A recognized error for a specific connector and action, for example, invalid recipients in an Outlook action. |
| General action failure | No | An action failed but no specific fix is available. Check the run details for more information. |
| Cascade failure | No | An action was skipped because a previous action it depends on already failed. The root cause is the earlier action, not this one. |

### What is a cascade failure?

When an action in your flow fails, any later actions that depend on it are also marked as failed, even though they didn't run. These are called *cascade failures*. Power Automate filters these out when analyzing a failure because they aren't the root cause of the problem. To fix the issue, look at the first action that failed in the run history.

## Monitor all flow failures

Per-run alert emails cover failures only where a known fix is available. To see *all failures*, including general action failures that don't trigger an email, use one of the following options.

### Power Platform admin center (recommended for admins)

The **Monitor** experience in the Power Platform admin center shows every failed run with no exclusions:

- **Flow-level monitoring**: View the complete run history, failure counts, and error details for any individual flow.
- **Environment-level monitoring**: See failures across all flows in an environment in one place.
- **All failure types visible**: Every failed run appears regardless of whether an alert email was sent.

> [!TIP]
> If you need to track failures for flows that don't trigger alert emails, the Monitor experience in the admin center is the most complete view available today.

### Flow run history

You can also view failures directly from the flow details page:

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Select **My flows**, and then select the flow you want to check.
1. Review the **Run history** section.
1. Select any failed run to see the action that caused the failure and its error details.

### Weekly failure digest

In addition to per-run alerts, Power Automate sends a *weekly failure digest email* that summarizes all flow failures across your environments. This email includes general action failures that don't trigger a per-run alert, so you're still notified about problems even when no individual alert is sent.

## Troubleshoot missing alert emails

If you expected an alert email but didn't receive one, check the following:

| Possible reason | What to check |
|---|---|
| No specific fix was identified | The failure was a general action failure or cascade failure. Check the run history for details, or use the Monitor experience in the admin center for full visibility. |
| Cooldown period is active | An alert was already sent for this flow within the last 28 days. No more per-run alerts are sent for the same flow until the 28-day cooldown period expires. |
| Failure alerts aren't enabled | Per-run failure alerts might not be enabled for this flow. Check the flow settings to confirm alerts are turned on. |
| Flow was deleted | If the flow or its environment was deleted after the failure occurred, the notification isn't sent. |

> [!IMPORTANT]
> Per-run failure alerts aren't enabled for all flows by default. If you aren't receiving any failure alert emails for your flows, verify that failure alerts are turned on in the flow settings.

## Related information

- [Watch your flows in action](see-a-flow-run.md)
- [Fix connection failures in cloud flows](fix-connection-failures.md)
- [Troubleshoot cloud flow errors](troubleshoot-flow-errors.md)
