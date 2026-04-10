---
title: Fix connection failures in cloud flows - Power Automate
description: Learn how to diagnose and fix broken connections, expired tokens, and authentication errors in Power Automate cloud flows.
author: radioblazer
ms.author: matow
ms.reviewer: angieandrews
ms.topic: troubleshooting
ms.date: 04/09/2026
ms.subservice: cloud-flow
---

# Fix connection failures in cloud flows

Your flow was running fine, and now it isn't. This guide walks you through the most common causes in order of likelihood, so you can find the problem fast.

## Step 1: Is your flow turned on?

Open the flow details page. Check the status in the top-right corner.

- **On**: The flow is active. Move to Step 2.
- **Off**: Someone manually turned it off. Turn it back on. If it turns off again immediately, check for DLP policy violations ([Step 3b](#step-3b-dlp-policy-violations) later in this article).
- **Suspended**: Power Automate automatically suspended the flow due to repeated failures. Open the run history to find the failing action, fix the root cause, then turn the flow back on.

> [!TIP]
> If the flow is missing entirely, check that you're in the correct environment. Use the environment picker in the top-right of the Power Automate portal.

## Step 2: Did the trigger fire?

Open the flow's run history. Look at the list of runs.

### If there are no recent runs

- **Scheduled trigger**: Verify the recurrence settings. Check the timezone. A flow set to "9:00 AM" uses the timezone configured in the trigger, which might differ from your local time.
- **Automated trigger (When an item is created, When an email arrives, and similar)**: Confirm the triggering event actually occurred. Create a test item or send a test email and wait 5-10 minutes.
- **Trigger condition**: If your trigger has a condition expression, verify it evaluates to `true` for your test event. A common mistake is a condition that filters out every event.
- **Instant (manual) trigger**: These only run when you or another user explicitly starts the flow. Check if the button or app that triggers it is still configured.

### If runs appear, but all are marked "Cancelled"

The trigger fired but the run was cancelled before actions executed. This usually means a concurrency setting is rejecting new runs while another is in progress. Check the trigger's concurrency control settings.

## Step 3: Did a specific action fail?

Open a failed run. Scroll through the actions until you find the one highlighted in red. Expand it to see the error.

### Step 3a: Read the error code

| Error code | Meaning | Most likely fix |
|---|---|---|
| 401 Unauthorized | Your connection token expired, or your password changed. | Go to the Connections page, find the connection, and re-authenticate. See [Step 4: Connection health checks](#step-4-connection-health-checks). |
| 403 Forbidden | You don't have permission to access the resource, or a DLP policy is blocking the connector. | Check your permissions on the target resource (SharePoint site, mailbox, database). If permissions are correct, ask your admin if a DLP policy was recently changed. |
| 404 Not Found | The resource was deleted, renamed, or moved. | A SharePoint list was renamed, a file was moved, a mailbox was deprovisioned, or a Teams channel was deleted. Update the action to point to the new location. |
| 429 Too Many Requests | You hit the API rate limit for this connector. | Add a Delay action before the failing action, or enable retry policy with exponential backoff on the action's settings. For flows processing many items, add a delay inside Apply to Each. |
| 500 Internal Server Error | The target service is experiencing issues. | Wait 15-30 minutes and retry. If it persists, check the [Microsoft 365 Service Health dashboard](https://admin.microsoft.com/Adminportal/Home#/servicehealth) or the non-Microsoft service's status page. |
| 502 Bad Gateway | The connection between Power Automate and the target service failed. | Usually transient. Enable retry on the action. If it happens consistently, check network/firewall settings (especially for on-premises gateways). |

### Step 3b: DLP policy violations

If your flow was recently blocked or suspended and you didn't change anything:

1. Your admin might have updated a Data Loss Prevention (DLP) policy.
1. Go to **flow details** > **Properties**. If you see a DLP violation message, the flow uses connectors that are now in different policy groups.
1. Contact your Power Platform admin. They can tell you which policy changed and which connectors are affected.

> [!IMPORTANT]
> DLP policy changes take effect immediately and can block flows without warning. If multiple flows broke at the same time, a DLP change is the most likely cause.

## Step 4: Connection health checks

Connections are the most common reason a previously working flow breaks.

### Check connection status

1. Open your flow in edit mode.
1. Look at the connections panel (or check each action's connection reference).
1. Each connection should show a green checkmark or "Connected" status.
1. If any connection shows a warning or error icon, select it and select **Fix connection** or **Re-authenticate**.

### Why connections break

- **Password change**: You changed your password, or your organization enforces periodic password rotation. The stored OAuth token is now invalid.
- **MFA policy change**: Your admin enabled or changed Multi-Factor Authentication requirements. The existing token no longer satisfies the new policy.
- **Admin consent revoked**: An admin revoked the app consent that Power Automate uses to access a service on your behalf.
- **Token expiry**: OAuth refresh tokens expire after approximately 90 days of inactivity. If a flow hasn't run in 90 days, the connection might need re-authentication.
- **Service principal secret expiry**: If the connection uses a service principal, the client secret might be expired. Generate a new secret in Microsoft Entra ID and update the connection.

### Re-authenticate a connection

1. Go to **Power Automate** > **Connections** (left navigation).
1. Find the connection with the error.
1. Select the three dots (**...**) > **Fix connection** or **Edit**.
1. Sign in again with your credentials.
1. Return to your flow and verify the action now shows a green checkmark.

> [!NOTE]
> If the flow uses a shared connection (owned by someone else), you need that person to re-authenticate, or you can create your own connection and update the flow to use it.

## Step 5: Prevent silent failures

Flows can fail without anyone noticing. Set up these safeguards for any flow that matters.

### Add a failure notification

1. In the designer, add a parallel branch after the action most likely to fail.
1. Select the three dots on the new branch's first action > **Configure run after** > check only **has failed**.
1. Add a **Send an email** action (or post to Teams) with the subject "Flow failed: [flow name]" and include the error details from the failed action using dynamic content.

> [!TIP]
> This guarantees you get an alert within minutes of a failure, not days. For critical production flows, send failure notifications to a shared mailbox or Teams channel so the alert isn't missed.

### Weekly run history check

For production flows, check the run history page once a week. Look for:

- Runs with **Failed** status that your failure notification might have missed.
- Runs with **Cancelled** status, which can indicate concurrency or trigger issues.
- A sudden drop in run count, which might mean the trigger stopped firing.

### Use service principal connections

Service principal connections don't rely on a user's OAuth token. They don't expire when someone changes their password or leaves the organization. For production flows, ask your admin about setting up service principal connections for your key connectors.

## Top five (5) connection issues by connector

### SharePoint

| Issue | Symptom | Fix |
|---|---|---|
| Admin consent required | 403 on first use or after policy change | Admin must grant consent in Microsoft Entra ID > Enterprise Applications > Power Automate |
| Site permissions changed | 403 on actions targeting a specific site | Verify your account has at least Contribute access to the site |
| List view threshold | "The attempted operation is prohibited because it exceeds the list view threshold" | Add a filter query or OData filter to the Get Items action to return fewer than 5,000 items. Use `$top` and indexed column filters. |
| List or library renamed | 404 on all actions targeting that list | Update the action to reference the new list name or ID |
| Column name mismatch | Actions succeed but return empty or wrong data | SharePoint internal names differ from display names. Use the internal name (visible in the URL when you sort by that column). |

### Outlook/Office 365

| Issue | Symptom | Fix |
|---|---|---|
| Shared mailbox permissions | 403 when sending from or reading a shared mailbox | The connection owner needs Send As or Full Access permission on the shared mailbox in Exchange Admin Center |
| Delegate access removed | 401 on actions involving another user's mailbox | Re-grant delegate permissions or switch to a shared mailbox |
| MFA enforcement | 401 after admin enables MFA | Re-authenticate the connection. The new token includes the MFA claim. |
| Attachment size limit | 413 or action failure on large attachments | Outlook connector has a 25MB attachment limit. For larger files, upload to SharePoint/OneDrive and share a link. |

### SQL Server

| Issue | Symptom | Fix |
|---|---|---|
| On-premises gateway offline | Connection timeout or "gateway unreachable" | Check the gateway machine. Restart the On-premises Data Gateway service. Verify the machine has internet access. |
| Firewall rules | Connection timeout to Azure SQL | Add Power Automate IP ranges to your Azure SQL firewall rules, or enable "Allow Azure services" in the SQL server's networking settings. |
| Connection string changed | 404 or connection failure | Server renamed, database moved, or port changed. Update the connection with the new server/database details. |
| SQL login disabled | 401 on all queries | The SQL login might be disabled or the password expired. Re-enable in SQL Server Management Studio. |

### Dataverse

| Issue | Symptom | Fix |
|---|---|---|
| Environment permissions | 403 on Dataverse actions | Your user needs a security role in the target Dataverse environment. Ask your admin to assign one (for example, Basic User + custom table permissions). |
| Security role missing table access | 403 on specific tables | Your security role doesn't include read/write access to the table. Admin must update the security role. |
| Environment switched | Actions reference wrong environment | If the flow was imported or the environment changed, update the Dataverse connection to point to the correct environment. |

### HTTP/Custom connectors

| Issue | Symptom | Fix |
|---|---|---|
| API key rotated | 401 on all HTTP requests | Update the API key in the connection or action headers. |
| Certificate expired | SSL/TLS error | The target server's SSL certificate expired. Contact the API provider or update the certificate. |
| URL changed | 404 on all requests | The API endpoint URL was updated. Check the API provider's documentation for the new URL. |
| IP allowlisting | 403 or connection timeout | The target API only allows specific IP addresses. Add Power Automate's IP ranges for your region. For more information, see [IP address configuration](/power-automate/ip-address-configuration). |

## Related information

- [Troubleshoot cloud flow errors](troubleshoot-flow-errors.md)
- [Cloud flow error code reference](error-reference.md)
- [Get the most from Copilot in Power Automate designer](copilot-cloud-flows-tips.md)
- [Power Automate IP address configuration](/power-automate/ip-address-configuration)
