---
title: Cloud flow error code reference - Power Automate
description: Troubleshoot the top Power Automate cloud flow errors with causes, fixes, and quick reference table.
author: radioblazer
ms.author: matow
ms.reviewer: angieandrews
ms.topic: reference
ms.date: 04/09/2026
ms.subservice: cloud-flow
---

# Cloud flow error code reference

Use this article to troubleshoot the most common errors in Power Automate cloud flows. Each entry explains what the error means, why it happens, and how to fix it.

> [!NOTE]
> This reference applies to all Power Automate cloud flow license tiers. Learn about errors specific to desktop flows in [Troubleshoot desktop flow errors](/power-automate/desktop-flows/troubleshoot).

## Design-time errors

These errors occur when you save, validate, or publish a flow.

### InvalidTemplate

**What it means**: The flow definition contains a syntax error in an expression or action configuration.

**Common causes**:

- Unmatched parentheses or quotes in an expression
- Referencing an action output that doesn't exist (typo in action name)
- Using a function with the wrong number of arguments (for example, `createArray()` with no arguments)
- Type mismatch in a constant expression (for example, `int('abc')` or `div(100, 0)`)&mdash;the engine validates these at save time
- Copy-pasting expressions from documentation that includes invisible Unicode characters

**How to fix**:

1. Open the action highlighted in red in the designer.
1. Check the expression in the formula bar. Look for unmatched `(` `)` or `'` characters.
1. Verify action names in expressions match exactly (case-sensitive): `outputs('Get_item')` not `outputs('Get Item')`.
1. If the expression looks correct, delete it and retype it manually to remove hidden characters.

> [!TIP]
> Action names in expressions use underscores instead of spaces. If your action is named "Get item", the expression reference is `outputs('Get_item')`.

Related information: [ExpressionEvaluationFailed](#expressionevaluationfailed), [FlowCheckerError](#flowcheckererror)

### FlowCheckerError

**What it means**: The flow checker found one or more validation issues that prevent saving.

**Common causes**:

- A required field is empty in one or more actions
- A connection isn't selected for a connector action
- An expression references a dynamic content value from a parallel branch (not guaranteed to exist)
- Trigger inputs are incomplete

**How to fix**:

1. Select the error banner at the top of the designer to display the full list of issues.
1. Select each error to navigate to the affected action.
1. Fill in required fields, fix broken expressions, and select connections.
1. Save again. The checker runs automatically on save.

Related information: [InvalidTemplate](#invalidtemplate), [MissingRequiredProperty](#missingrequiredproperty)

### DuplicateActionName

**What it means**: Two or more actions in the flow have the same internal name.

**Common causes**:

- Copy-pasting an action without renaming it
- Importing a flow definition that was manually edited with duplicate keys
- Renaming an action to a name already used by another action in the same scope

**How to fix**:

1. Search the flow for actions with identical names (check inside `Apply to Each` and `Scope` containers too).
1. Rename one of the duplicates. Select the **...** menu on the action, then select **Rename**.
1. Update any expressions that reference the renamed action: `outputs('Old_Name')` to `outputs('New_Name')`.

Related information: [InvalidTemplate](#invalidtemplate)

### MissingRequiredProperty

**What it means**: A required input field on an action or trigger is empty.

**Common causes**:

- Adding a connector action but not completing the configuration
- Dynamic content token that resolved to empty was used in a required field
- Flow imported from a solution where environment variables aren't set

**How to fix**:

1. Open the action flagged with the error.
1. Look for fields marked with a red asterisk (*) that are blank.
1. Fill in the required value, either with static text or a dynamic content token.
1. For solution flows, check that all environment variables have values in the target environment.

Related information: [FlowCheckerError](#flowcheckererror)

## Runtime expression errors

These errors occur when a flow runs and an expression can't be evaluated.

### ExpressionEvaluationFailed

**What it means**:

 An expression failed to evaluate at runtime because the actual data didn't match what the expression expected. This error only occurs when the expression uses **dynamic values** (variables, trigger body, action outputs) that can't be checked at save time.

> [!NOTE]
> If an expression uses only constant values (like `int('abc')` or `div(100, 0)`), the flow engine catches the error at save time as [InvalidTemplate](#invalidtemplate) instead.

**Common causes**:

- Calling `int()` on a variable that contains a non-numeric string at runtime
- Accessing a property on a null object (`outputs('Get_item')?['body/title']` when Get_item returned nothing)
- Date format mismatch in `formatDateTime()` or `parseDateTime()` when the format comes from a variable
- Division by zero when the divisor is a dynamic value that happens to be 0

**How to fix**:

1. Open the failed run and select the failed action to display the expression and input values.
1. Wrap risky expressions with null checks: `if(empty(triggerBody()?['value']), 'default', triggerBody()?['value'])`.
1. Use `coalesce()` to provide fallback values: `coalesce(outputs('Get_item')?['body/title'], 'Untitled')`.
1. Validate data types before conversion: `if(isInt(variables('input')), int(variables('input')), 0)`.

> [!TIP]
> Learn about a library of ready-to-use expression patterns with null-safe handling in [Expression cookbook for cloud flows](expression-cookbook.md).

Related information: [InvalidTemplate](#invalidtemplate), [ContentConversionFailed](#contentconversionfailed)

### ContentConversionFailed

**What it means**: The flow couldn't convert data from one type to another between actions.

**Common causes**:

- Passing a string where an integer or boolean is expected
- Sending an array to an action that expects a single object
- Date string in an unexpected format (for example, `DD/MM/YYYY` when `MM/DD/YYYY` is expected)
- Binary content (file) passed to a text input

**How to fix**:

1. Check the failed action's inputs in the run history. Compare the actual value type to what the action expects.
1. Use explicit conversion functions: `int()`, `float()`, `string()`, `bool()`, `json()`.
1. For dates, use `parseDateTime()` with an explicit locale or `formatDateTime()` to normalize before passing.
1. For arrays, use `first()` to extract a single item if the downstream action expects one value.

Related information: [ExpressionEvaluationFailed](#expressionevaluationfailed)

## Connection and authentication errors

These errors occur when the flow can't authenticate to a connected service.

### InvalidConnection

**What it means**: A connection reference in the flow points to a connection that is broken, deleted, or expired.

**Common causes**:

- The user who created the connection changed their password or had MFA reset
- The connection was deleted from the Connections page
- An admin removed the connection via Power Platform admin center
- The flow was imported into an environment where the connection doesn't exist

**How to fix**:

1. Open the flow in edit mode. Actions with broken connections show a warning icon.
1. Select the action and select **Change connection** or **Add new connection**.
1. Sign in with the appropriate credentials to create a fresh connection.
1. Save and test the flow.

> [!IMPORTANT]
> For production flows, consider using service principal connections instead of personal user connections. Service principal connections don't expire when a user changes their password or leaves the organization.

Related information: [ConnectionNotConfigured](#connectionnotconfigured), [ConnectionAuthorizationFailed](#connectionauthorizationfailed)

### ConnectionNotConfigured

**What it means**: An action requires a connection but none was selected.

**Common causes**:

- Flow was imported from a solution and connection references weren't mapped
- A new action was added, but the connection step was skipped
- The connection reference points to an environment variable with no value

**How to fix**:

1. Open the flow in edit mode and find the action with the connection warning.
1. Select an existing connection from the dropdown, or create a new one.
1. For solution flows, go to **Solutions** > **Default Solution** > **Connection References**.
1. Set the connection for each reference.

Related information: [InvalidConnection](#invalidconnection)

### Unauthorized (401)

**What it means**: The API rejected the request because the authentication token is invalid or expired.

**Common causes**:

- OAuth token expired and the connection couldn't auto-refresh
- The user's account was disabled or password changed
- Service principal secret or certificate expired
- Conditional Access policy blocked the sign-in (geo, device compliance)

**How to fix**:

1. Go to **Power Automate** > **Connections** and find the connection used by the failed action.
1. If the connection shows a warning, select **Fix connection** and re-authenticate.
1. For service principal connections, rotate the secret in Microsoft Entra ID and update the connection.
1. Check Microsoft Entra ID sign-in logs for Conditional Access blocks: **Azure portal** > **Microsoft Entra ID** > **Sign-in logs**, filter by the app name.

Related information: [Forbidden (403)](#forbidden-403), [ConnectionAuthorizationFailed](#connectionauthorizationfailed)

### Forbidden (403)

**What it means**: The authenticated user or app doesn't have permission to perform the requested operation.

**Common causes**:

- A DLP (Data Loss Prevention) policy blocks the connector or connector action in this environment
- The user lacks permissions on the target resource (for example, no write access to a SharePoint list)
- An admin restricted the connector via tenant-level settings
- The connector requires a premium license and the user is on a seeded plan

**How to fix**:

1. Check DLP policies: **Power Platform admin center** > **Data policies**. Look for policies that block the connector in your environment's group.
1. Verify the connection user has the right permissions on the target service (SharePoint site permissions, Dataverse security roles, and similar).
1. If it's a premium connector issue, verify the flow owner or caller has a Power Automate Premium license.
1. Contact your admin if a DLP policy needs to be modified.

Related information: [Unauthorized (401)](#unauthorized-401), [DirectApiAuthorizationRequired](#directapiauthorizationrequired)

### ConnectionAuthorizationFailed

**What it means**: The connection exists but its stored credentials are no longer valid.

**Common causes**:

- User's password changed or MFA method was reset
- OAuth refresh token expired (common with connections unused for 90+ days)
- Admin revoked consent for the app in Microsoft Entra ID
- Shared connection was unshared by the owner

**How to fix**:

1. Open **Power Automate** > **Connections**.
1. Find the affected connection.
1. Select the connection, and then select **Fix connection** to re-authenticate.
1. If using a shared connection, ask the connection owner to re-share it.
1. For service accounts, set a calendar reminder to rotate credentials before they expire.

> [!TIP]
> Find a detailed tutorial of connection issues by connector (SharePoint, Outlook, SQL Server, Dataverse, HTTP) in [Fix connection failures in cloud flows](fix-connection-failures.md).

Related information: [InvalidConnection](#invalidconnection), [Unauthorized (401)](#unauthorized-401)

## Connector and API errors

These errors come from the downstream service the flow is calling.

### ActionFailed

**What it means**: An action returned a failure status. This is a generic wrapper. The actual error details are in the action's output body.

**Common causes**:

- The downstream API returned a 4xx or 5xx error
- A child flow (called via "Run a Child Flow") failed
- A custom connector returned an unexpected response format
- The action's configure-run-after settings caused it to execute after a prior failure

**How to fix**:

1. Open the failed run and select the failed action.
1. Expand **Outputs** to display the actual error message and status code from the API.
1. Fix the underlying issue based on the specific API error (review the 400, 401, 403, and 404 entries in this reference).
1. If the action should run even when prior actions fail, check its **Configure run after** settings.

Related information: [BadRequest (400)](#badrequest-400), [NotFound (404)](#notfound-404)

### BadRequest (400)

**What it means**: The connector API rejected the request because the input data is malformed or invalid.

**Common causes**:

- Sending a field with the wrong data type (string instead of number, or vice versa)
- Required fields missing from the request body
- Invalid characters in file names or list item titles
- Exceeding a field length limit (for example, SharePoint single-line text = 255 chars)

**How to fix**:

1. Open the failed action in run history and look at the **Inputs** section to display exactly what was sent.
1. Compare the inputs to the API's expected schema (check the connector documentation).
1. Sanitize user input with `replace()` to strip invalid characters before passing to the action.
1. Use `substring()` or `take()` to truncate long values to the field's max length.

Related information: [ActionFailed](#actionfailed), [ContentConversionFailed](#contentconversionfailed)

### NotFound (404)

**What it means**: The resource the action is trying to access doesn't exist.

**Common causes**:

- A SharePoint list, library, or site was renamed or deleted
- An Outlook folder or Teams channel was removed
- The flow references a hardcoded ID for a resource that no longer exists
- The Dataverse table or row was deleted by another process

**How to fix**:

1. Check that the resource still exists in the target service.
1. If it was renamed, update the action to use the new name or ID.
1. Replace hardcoded IDs with dynamic lookups where possible (for example, "Get items" with a filter instead of "Get item" with a static ID).
1. Add error handling: configure the next action to **Run after** > **has failed** and handle the 404 gracefully.

Related information: [ActionFailed](#actionfailed)

## Trigger errors

These errors relate to flow triggers not firing or failing.

### TriggerConditionNotMet

**What it means**: The trigger evaluated its condition and determined the event shouldn't start a flow run.

**Common causes**:

- A trigger condition expression always evaluates to false (logic error)
- The trigger condition references a field that doesn't exist in the trigger payload
- The event occurred but the data didn't match the filter (for example, "When an item is created" with a condition on Status, but Status was blank)

**How to fix**:

1. Go to the trigger's **Settings** and review the trigger condition expression.
1. Test the condition against a known event payload. Use **Peek code** on the trigger to display the raw schema.
1. Temporarily remove the condition, trigger the flow manually, and inspect the trigger output to verify field names and values.
1. Fix the expression and re-enable the condition.

Related information: [ExpressionEvaluationFailed](#expressionevaluationfailed)

## Timeout and throttling errors

These errors occur when the flow or an action exceeds time or rate limits.

### ActionTimedOut

**What it means**: A single action exceeded its configured timeout and was canceled.

**Common causes**:

- HTTP action calling a slow external API with default 100-second timeout
- "Wait for an approval" with an expiration that passed
- Large file upload or download over a slow connection
- Dataverse query returning too many rows without pagination

**How to fix**:

1. Open the action's **Settings** and increase the **Timeout** value (ISO 8601 duration, for example, `PT5M` for 5 minutes).
1. For HTTP actions, check if the external API has a long-running operation pattern (poll with retry-after).
1. For Dataverse, add `$filter` and `$top` to reduce the result set.
1. For approvals, set a reasonable expiration and add a timeout branch to handle non-responses.

Related information: [OperationTimedOut](#operationtimedout)

### OperationTimedOut

**What it means**: A long-running operation (webhook wait, approval, HTTP polling) exceeded the maximum wait time.

**Common causes**:

- HTTP webhook action waiting for a callback that never came
- Approval action without an expiration, hitting the 30-day flow run limit
- "Delay until" action set to a date beyond the 30-day run duration limit
- External service went down and never sent the expected response

**How to fix**:

1. Always set explicit timeouts on webhook and approval actions.
1. For HTTP webhook actions, implement a timeout branch with **Configure run after** > **has timed out**.
1. Break long waits into shorter segments using a loop with daily checks.
1. For the 30-day run limit, redesign long-running processes to use a "relay" pattern: End the current run and start a new one with state passed via Dataverse or a file.

> [!IMPORTANT]
> Cloud flows have a maximum run duration of 30 days. For processes that take longer, split them into multiple flow runs with shared state.

Related information: [ActionTimedOut](#actiontimedout)

### WorkflowRunActionRepetitionQuotaExceeded

**What it means**: An Apply to Each loop exceeded the maximum number of iterations (default: 100,000 for premium, 5,000 for performance profiles).

**Common causes**:

- Processing a large SharePoint list or Dataverse table without filtering first
- Nested `Apply to Each` loops multiplying iteration counts (100 x 100 = 10,000)
- A `Get items` action returning all rows instead of a filtered subset

**How to fix**:

1. Add filters to the data source action to reduce the number of items before the loop.
1. Use OData `$filter` and `$top` on **Get items** actions instead of filtering inside the loop.
1. For large datasets, batch the work across multiple flow runs using pagination tokens or date ranges.
1. Consider using `Select` or `Filter array` actions instead of `Apply to Each` when you only need to transform or filter data.

Related information: [FlowRunQuotaExceeded](#flowrunquotaexceeded)

### FlowRunQuotaExceeded

**What it means**: The flow or tenant exceeded its daily action execution limit.

**Common causes**:

- Seeded/free license: 6,000 actions per day per user
- Premium license: 40,000 actions per day per user
- Process license: 250,000 actions per day per flow
- A loop-heavy flow consuming thousands of actions per run

**How to fix**:

1. Check current usage in **Power Platform admin center** > **Analytics** > **Power Automate**.
1. Optimize flows to use fewer actions: replace Apply to Each with Select/Filter, batch operations, reduce polling frequency.
1. Upgrade license tier if the workload legitimately needs more capacity.
1. Spread workloads across multiple flows or schedule high-volume runs during off-peak hours.

> [!NOTE]
> Learn more about daily action limits by license tier in [Power Automate limits and configuration](/power-automate/limits-and-config).

Related information: [WorkflowRunActionRepetitionQuotaExceeded](#workflowrunactionrepetitionquotaexceeded), [DirectApiAuthorizationRequired](#directapiauthorizationrequired)

## Licensing errors

### DirectApiAuthorizationRequired

**What it means**: The flow uses a premium connector but the caller doesn't have a premium license.

**Common causes**:

- A flow with premium connectors (HTTP, SQL Server, Dataverse, custom connectors) is run by a user on a seeded Microsoft 365 license
- The flow owner has premium but the triggering user doesn't (the caller's license matters, not the owner's)
- A scheduled flow's owner lost their premium license
- An in-context flow was disassociated from its Power App, making it out-of-context

**How to fix**:

1. Identify which connector requires premium. The error message usually names it.
1. Assign a Power Automate Premium license to the user who triggers or runs the flow.
1. For scheduled or automated flows, ensure the flow owner has a premium license.
1. Consider whether a Process license (per-flow) is more cost-effective for high-volume shared flows.

Related information: [Forbidden (403)](#forbidden-403), [FlowRunQuotaExceeded](#flowrunquotaexceeded)

## Quick reference table

| Error | Category | Most likely fix |
|---|---|---|
| InvalidTemplate | Design-time | Fix expression syntax |
| ExpressionEvaluationFailed | Runtime | Add null checks, validate types |
| ActionFailed | Runtime | Check action outputs for API error |
| FlowCheckerError | Design-time | Fill required fields, fix connections |
| InvalidConnection | Connection | Re-authenticate the connection |
| ConnectionNotConfigured | Connection | Select or create a connection |
| Unauthorized (401) | Auth | Fix connection, rotate credentials |
| Forbidden (403) | Auth | Check DLP policies, permissions |
| BadRequest (400) | API | Validate input data format |
| NotFound (404) | API | Verify resource exists, update references |
| TriggerConditionNotMet | Trigger | Review trigger condition expression |
| ActionTimedOut | Timeout | Increase timeout in action settings |
| DuplicateActionName | Design-time | Rename one of the duplicate actions |
| MissingRequiredProperty | Design-time | Fill in required fields |
| ContentConversionFailed | Runtime | Use explicit type conversions |
| WorkflowRunActionRepetitionQuotaExceeded | Throttling | Filter data before looping |
| DirectApiAuthorizationRequired | Licensing | Assign premium license to caller |
| FlowRunQuotaExceeded | Throttling | Optimize action count, upgrade license |
| ConnectionAuthorizationFailed | Connection | Fix connection, re-authenticate |
| OperationTimedOut | Timeout | Set explicit timeouts, use relay pattern |

## Related information

- [Expression cookbook for cloud flows](expression-cookbook.md)
- [Fix connection failures in cloud flows](fix-connection-failures.md)
- [Troubleshoot cloud flow errors](troubleshoot-flow-errors.md)
- [Power Automate limits and configuration](/power-automate/limits-and-config)
- [Power Automate licensing guide](/power-platform/admin/power-automate-licensing/types)

 **Note**: The author created this article with assistance from AI. [Learn more](/principles-for-ai-generated-content)