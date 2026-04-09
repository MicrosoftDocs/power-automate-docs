---
title: Troubleshoot cloud flow errors - Power Automate
description: Learn how to diagnose why your flow doesn't save, doesn't run, or produces wrong results with this step-by-step troubleshooting guide.
author: matow
ms.author: matow
ms.reviewer: angieandrews
ms.topic: troubleshooting
ms.date: 04/09/2026
ms.subservice: cloud-flow
---

# Troubleshoot cloud flow errors

Something went wrong with your flow. Start here to find the fix fast.

## Start here: What happened?

| Symptom | Go to |
|---|---|
| My flow doesn't save | [Save errors](#save-errors) |
| My flow saved but doesn't run | [Trigger issues](#trigger-issues) |
| My flow run but an action fails | [Action errors](#action-errors) |
| My flow runs but produces wrong results | [Logic issues](#logic-issues) |
| I don't understand the error message | [Common error messages](#common-error-messages) |

## Save errors

Your flow doesn't save in the designer.

**Most common cause**: An expression has a syntax error, or a required field is empty.

**Quick check**: Look for red outlines on actions in the designer. Expand any action with a warning icon and read the validation message.

**How to fix**:

1. Check every action for red-highlighted fields. Fill in required fields that are blank.
1. If you recently edited an expression, open it and look for mismatched parentheses, missing quotes, or incorrect function names.
1. If the save button shows **Saving...** indefinitely, refresh the page and try again. Your unsaved changes might be lost. Use **Ctrl** + **s** frequently.

> [!TIP]
> Copy complex expression text to a separate text file before saving. If the save fails, you can paste it back instead of rewriting from memory.

**Still stuck**? Copy the exact validation error text and search it on [Power Automate Community Forums](https://powerusers.microsoft.com/t5/Building-Flows/bd-p/BuildingFlows) or paste it into an AI assistant for interpretation.

## Trigger issues

Your flow saved successfully, but no runs appear in run history.

**Most common cause**: The trigger event didn't occur, or the trigger has a filter condition that excludes your test events.

**Quick check**: Open run history. If it's empty (no runs at all), the trigger never fired.

**How to fix**:

1. **Scheduled triggers**: Verify the start date is in the past, the recurrence is correct, and the timezone matches your expectation. A flow set to "Every 1 day" starting "tomorrow" doesn't run until tomorrow.
1. **Event-based triggers (When an item is created, When a file is modified, and similar)**: Create a new test item or file. Wait 5-10 minutes. Triggers aren't instant. There's a polling interval.
1. **Trigger conditions**: If your trigger has a condition expression, temporarily remove it and test. If the flow runs without the condition, the condition is filtering out your events.
1. **Flow is off or suspended**: Check the flow status on the details page. Suspended flows stop triggering until you fix the underlying issue and turn them back on.

> [!NOTE]
> Event-based triggers in Power Automate use polling intervals, not real-time push notifications. The default polling interval varies by connector (typically 1-5 minutes). You can configure the interval in the trigger's settings.

**Still stuck**? Take a detailed tutorial in [Fix connection failures in cloud flows](fix-connection-failures.md).

## Action errors

Your flow runs, but one or more actions fail (red in run history).

**Most common cause**: A connection expired, or the target resource changed (renamed, deleted, or permissions removed).

**Quick check**: Open the failed run. Find the red action. Expand it and read the status code and error message.

### Fix by error code

| Code | Meaning | What to do |
|---|---|---|
| 401 | Authentication failed | Re-authenticate the connection. Go to **Connections** in the left nav, find the broken one, select **Fix connection**. |
| 403 | Permission denied | You lost access to the resource, or a DLP policy is blocking the connector. Check your permissions first; then check with your admin about DLP. |
| 404 | Resource not found | The SharePoint list, file, mailbox, or endpoint was renamed, moved, or deleted. Update the action to point to the correct resource. |
| 429 | Rate limited | Add a Delay action before this step, or enable retry with backoff in the action's settings. |
| 500 | Server error | The target service is having issues. Wait and retry. Check the service's health page. |

### Fix for expression errors

If the error says "Invalid template" or "Unable to process template language expressions," open the action and check each expression. The most common mistakes are:

- Referencing dynamic content from a step that didn't run (inside a condition branch that wasn't taken).
- Using the wrong data type (passing a string where a number is expected).
- Null values. Add a `coalesce()` or `if(empty(...))` check.

> [!TIP]
> Learn about the ready-to-use expression patterns with common-mistake warnings in [Expression cookbook for cloud flows](expression-cookbook.md).

**Still stuck?** Take a detailed tutorial by connector in [Fix connection failures in cloud flows](fix-connection-failures.md), or get an in-depth explanation of each error code in [Cloud flow error code reference](error-reference.md).

## Logic issues

Your flow runs successfully (all green checkmarks), but the output is wrong.

**Most common cause**: A condition evaluates differently than expected, or dynamic content references the wrong field.

**Quick check**: Open a completed run and step through each action. Expand each one and compare its **inputs** and **outputs** to what you expect.

**How to fix**:

1. **Wrong condition result**: Expand the condition action in run history. Check the actual values that were compared. Common issues: trailing spaces in strings, case sensitivity (`"Approved"` vs `"approved"`), comparing a number to its string representation (`1` vs `"1"`).
1. **Wrong data in actions**: Select the action and check its inputs. If a field shows an unexpected value, select the expression or dynamic content token to learn where it comes from. You might be referencing a field from the wrong step or the wrong item in a loop.
1. **Apply to Each processing wrong items**: Check the `Select an output from previous steps` input. If the array contains more or fewer items than expected, the upstream **Get Items** or **List Rows** action might need a filter.
1. **Timing issues**: If your flow updates a record and then immediately reads it back, the read mihjt return stale data. Add a short Delay action (5-30 seconds) between the write and the read.

> [!TIP]
> Add **Compose** actions at key points in your flow to inspect intermediate values. Set the Compose input to the dynamic content you want to check. Run the flow, then check each **Compose** output in run history to trace where the value goes wrong.

## Common error messages

The following table contains quick references for error messages you might encounter.

| Error message | Translation | Fix |
|---|---|---|
| "The requested operation is prohibited because it exceeds the list view threshold." | SharePoint Get Items is returning more than 5,000 items. | Add an OData filter or use `$top=5000` with pagination. Filter on an indexed column. |
| "Invalid type. Expected String but got Null." | A field you're referencing is empty (null) and the action expects text. | Wrap the reference in `coalesce(field, '')` or add a condition to check for null first. |
| "ActionFailed. An action failed. No dependent actions succeeded." | A Scope block failed, which cancelled all subsequent actions inside it. | Find the specific action inside the Scope that failed first. Fix that action. |
| "Flow run timed out." | The flow exceeded the 30-day maximum duration. | Long-running flows need to be redesigned. Use a child flow for the long-running part, or split into multiple flows with a status flag. |
| "ExpressionEvaluationFailed." | An expression has a syntax error or references a value that doesn't exist at runtime. | Open the action, check each expression. Look for misspelled function names, wrong parameter counts, or references to steps that might not have executed. |
| "The connection is not valid." | The connection was deleted or the credentials expired. | Select **Connections**, find the connection, and re-authenticate or create a new one. |
| "Nested flows are not supported in this context." | You're calling a child flow from inside an `Apply to Each` or a context that doesn't support it. | Move the child flow call outside the loop, or restructure to pass the full array to the child flow and loop inside it. |

> [!IMPORTANT]
> When you encounter an error not listed here, copy the exact error message text. Searching for the exact message in the [Power Automate Community Forums](https://powerusers.microsoft.com/t5/Building-Flows/bd-p/BuildingFlows) or the [Cloud flow error code reference](error-reference.md) is the fastest path to a solution.

## Related information

- [Fix connection failures in cloud flows](fix-connection-failures.md)
- [Cloud flow error code reference](error-reference.md)
- [Get the most from Copilot in Power Automate designer](copilot-cloud-flows-tips.md)
- [Expression cookbook for cloud flows](expression-cookbook.md)
- [Power Automate Community Forums](https://powerusers.microsoft.com/t5/Building-Flows/bd-p/BuildingFlows)
