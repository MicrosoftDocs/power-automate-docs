---
title: Troubleshoot a cloud flow
description: Learn how to resolve some of the most common reasons why flows fail.
suite: flow
author: DBEKI
contributors:
  - radioblazer
  - HeaterOrt
  - DBEKI
  - v-aangie
  - cyrilanderson
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: troubleshooting-general
ms.date: 10/29/2026
ms.update-cycle: 180-days
ms.author: matow
ms.reviewer: cyanderson
search.audienceType: 
  - flowmaker
  - enduser
ms.collection: bap-ai-copilot
ms.custom:
  - DevRelAdv
  - sfi-image-nochange
---

# Troubleshoot a cloud flow

This article explains how to troubleshoot failed Power Automate cloud flows. It covers identifying specific flow runs, using repair tips emails, finding the error in run history, and fixing authentication, Conditional Access, action configuration, and transient failures. In the new designer, you can also find and fix errors by using Copilot. To learn more, see the video in the [Troubleshoot in Copilot](#troubleshoot-in-copilot) section.

## Identify specific flow runs

After you build and deploy your flows, you might need to debug specific flow runs to confirm that your flow ran as expected. By default, the flow owner can look at the **Start**, **Duration**, and **Status** columns in the run history view in Power Automate to help identify the flow run they're interested in debugging. The owner can also expand the troubleshooting section to identify the specific run they're interested in. However, for flows that run frequently, this process can be time-consuming.

To make it more efficient to identify flow runs when debugging, Power Automate provides the ability for flow owners to configure the list of columns that displays on the run history page for each flow run. These columns map to the trigger outputs for your flow. When you display the columns you want, you save time since you see the relevant columns by default on the run history view.

Follow these steps to add one or more columns to your run history view.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the left side of the screen, select **My flows**.
1. Select the flow for which you want to get more details.
1. On the flow details page, select **Edit columns**.
1. Select the columns that you want to add to your run history view for the flow that you selected, and then select **Save**.
1. View the list of columns that displays on the run history view for the flow you selected.

   The **hasAttachments** and **isHTML** columns are now visible for the flow so that you can quickly see those values to help you debug the flow.

    :::image type="content" source="./media/triggers-introduction/new-columns-run-history-view.png" alt-text="Screenshot of the 28-day run history view showing the added hasAttachments and isHtml columns for each flow run.":::

> [!TIP]
> You can also configure the list of columns that displays with the **All runs** view.

## Repair tips in email

Repair tips are sent to flow owners via email whenever a cloud flow fails. These repair tips emails contain specific, actionable feedback about certain errors. For example, one common error is setting up a cloud flow that attempts to get a person’s manager in Office 365&mdash;but there's no manager configured in Microsoft Entra ID. If this condition or several other conditions cause your flow to fail, you get a repair tips email.

The repair tips email contains the following sections:

|Name|Description|
|--- |---|
|Time |Displays the time the flow first failed.|
|What happened|Provides a description of the problem that caused the failure in the flow.|
|How do I fix |Provides tips for resolving the issue that caused the failure in the flow.|
|Troubleshooting tips |Provides details including the number of times the flow failed, and a link to retry the flow with the same input data.|

To fix the reported errors, select **Fix my flow** and follow the steps in the repair tips email.

Repair tips emails are optional. If you don't want to receive them, turn them off from the properties menu for the specific flow.

If your flow fails, you can also troubleshoot it directly in Power Automate. Here are some common failure scenarios and tips on how to fix them.

## Identify the error

Follow these steps to find the error and learn how to fix it:

1. Select **My flows**.
1. Select the flow that failed.
1. In the **28-day run history** section, select the date of the failed run.

   Details about the flow appear, and at least one step shows a red exclamation icon.

1. Open that failed step, and then review the error message.

   On the right pane, you can see the details of the error and how to fix it.

   :::image type="content" source="./media/fix-flow-failures/identify-error.png" alt-text="Screenshot of a failed flow step showing an Unauthorized 401 error and the Details pane with connection fix guidance.":::

## Authentication failures

In many cases, flows fail because of an authentication error. If you have this type of error, the error message contains **Unauthorized** or an error code of **401** (unauthenticated) or **403** (unauthorized) appears. You can usually fix an authentication error by updating the connection:

1. Under **Connections** for your flow, select **Edit**.
1. Select **Manage connections**, and find the connection for which you saw the **Unauthorized** error message.
1. Select **Reconnect**.
1. Select your credentials and resubmit as needed.

    The flow should now run as expected.

## Conditional Access and embedded flow authentication errors

If your flow works from the Power Automate portal but fails with an authentication error when users access it from SharePoint, Microsoft Teams, or Excel, the issue might be a Conditional Access (CA) policy mismatch.

### Symptoms

- Users see an authentication error when they try to view or run a flow from a SharePoint list, a Teams channel, or an Excel workbook.
- The same flow works correctly when accessed directly from [make.powerautomate.com](https://make.powerautomate.com).
- Your organization has Conditional Access policies that require multifactor authentication (MFA), Terms of Use acceptance, or device compliance.

### Cause

When a flow is embedded in another Microsoft 365 application, the host application performs a token exchange with **Microsoft Flow Service** to authenticate API calls. If your CA policies have different requirements (MFA, Terms of Use, or device compliance) for the host application and Power Automate, the token exchange fails.

This condition typically happens when CA policies target individual applications with different requirements, rather than using the **Office 365** app or **All cloud apps** target.

Additionally, if a CA policy includes a [Terms of Use](/entra/identity/conditional-access/terms-of-use) grant control, existing flow connections can break retroactively because the silent token refresh can't present the Terms of Use acceptance page.

### Resolution

1. In the [Microsoft Entra admin center](https://entra.microsoft.com/), go to **Protection** > **Conditional Access** > **Policies**.
2. Switch your policy to target the **Office 365** app or **All cloud apps**. This change ensures consistent requirements across Power Automate and the apps that embed it.
3. If you must target individual apps, verify that **Microsoft Flow Service** (Application ID: `7df0a125-d3be-4c96-aa54-591f83ff541c`) is included alongside the host applications (SharePoint, Teams, Excel) with matching requirements.
4. If your policy includes Terms of Use, [exclude service accounts and dedicated flow connection owners](/entra/identity/conditional-access/terms-of-use) from that policy. Flow connections refresh tokens silently and can't accept Terms of Use interactively.

After updating policies, affected users must sign out and sign back in for the changes to take effect.

For more information, see [Conditional Access and multifactor authentication in Power Automate](/troubleshoot/power-platform/power-automate/administration/conditional-access-and-multi-factor-authentication-in-flow).

## Troubleshoot in Copilot

The troubleshoot in Copilot feature in Power Automate helps you identify and resolve errors that might occur during the testing of cloud flows or when reviewing flow run history. Use this Copilot feature when the new designer experience is enabled.

Learn how to troubleshoot cloud flow errors with Copilot in this quick video:</br>
</br>

> [!VIDEO 040bad79-4775-4fd7-90d9-bc13368d0473]

The troubleshoot in Copilot feature provides a human-readable summary of the error and, when possible, suggests a solution to correct the error.

> [!NOTE]
> The troubleshoot in Copilot feature might not work in all scenarios. It’s continuously learning and improving over time, which means its ability to assist users and resolve issues only gets better. This feature is a great example of how AI and machine learning can be leveraged to improve your experience and productivity.

:::image type="content" source="./media/fix-flow-failures/troubleshoot-copilot.png" alt-text="Screenshot of Copilot explaining a BadRequest error in a failed Teams 'Post message in a chat or channel' action due to an invalid recipient.":::

## Action configuration

Flows also fail if a setting in an action of the flow doesn't function as expected. In this case, the error message contains **Bad request** or **Not found**, or an error code of **400** (bad request) or **404** (not found) appears.

The error details should specify how to correct the failure. If the cause isn't obvious, inspect the failed action:

1. In the failed run, select the failed action and expand **Inputs** to see exactly what was sent, such as the request URL or row ID for actions like **Update a row**.
1. Expand **Outputs** to read the downstream service's actual error message and status code.

If a flow that previously worked now returns a 400 error, the target data or schema might have changed. For example, a column might be renamed, or a value might exceed a field length limit or contain invalid characters. For more information, see [Cloud flow error code reference](error-reference.md).

To update the configuration:

1. Select **Edit** and then correct the problem inside the flow definition.
1. Save the updated flow.
1. Select **Resubmit** to try the run again with the updated configuration.

## Other failures

If the error code **500** (internal server error) or **502** (bad gateway) appears, the failure is temporary or transient. To try the flow again, select **Resubmit**.

If a desktop flow run from a cloud flow fails with a message that the flow was generated by a newer Power Automate version than the one currently installed, update Power Automate for desktop on the machine that runs the flow. For more information, see [Update Power Automate for desktop](desktop-flows/how-to/update_power_automate.md).

## Related information

[Training: Best practices for error handling in Power Automate flows (module)](/training/modules/error-handling/)

[Group actions into scopes for error handling](guidance/coding-guidelines/error-handling.md#group-actions-into-scopes-for-error-handling)

[Create an effective Power Automate support request](support-service-request.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
