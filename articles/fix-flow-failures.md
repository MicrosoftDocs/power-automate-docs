---
title: Troubleshoot a cloud flow
description: Learn how to resolve some of the most common reasons why flows fail.
suite: flow
author: DBEKI
contributors:
  - HeaterOrt
  - DBEKI
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: troubleshooting-general
ms.date: 04/16/2025
ms.update-cycle: 180-days
ms.author: heortaol
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
ms.collection: bap-ai-copilot
ms.custom: DevRelAdv
---

# Troubleshoot a cloud flow

This article contains tips and tricks for troubleshooting cloud flows. With the new designer, you can easily find and fix errors using Copilot. Check out the video in this article in the [Troubleshoot in Copilot](#troubleshoot-in-copilot) section.

## Identify specific flow runs

Once you build and deploy your flows, you might need to debug specific flow runs to confirm that your flow ran as expected. By default, the flow owner can look at the **Start**, **Duration**, and **Status** columns in the run history view in Power Automate to help them identify the flow run they're interested in debugging. The owner can also expand the troubleshooting section to identify the specific run in which they're interested, however, for flows that run frequently, this can be time-consuming.

To make it more efficient to identify flow runs when debugging, Power Automate provides the ability for flow owners to configure the list of columns that displays on the run history page for each flow run. These columns map to the trigger outputs for your flow. When you display the columns you want, you save time since you see the relevant columns by default on the run history view.

Follow these steps to add one or more columns to your run history view.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the left side of the screen, select **My flows**.
1. Select the flow for which you want to get more details.
1. On the flow details page, select **Edit columns**.
1. Select the columns that you want to add to your run history view for the flow that you selected, and then select **Save**.
1. View the list of columns that displays on the run history view for the flow you selected.

   The **hasAttachments** and **isHTML** columns are now visible for the flow so that you can quickly see those values to help you debug the flow.

    :::image type="content" source="./media/triggers-introduction/new-columns-run-history-view.png" alt-text="Screenshot of the columns that display on the run history view for the flow you selected.":::

> [!TIP]
> You can also configure the list of columns that displays with the **All runs** view.

## Repair tips in email

Repair tips are sent to flow owners via email whenever a cloud flow fails. These repair tips emails contain specific, actionable feedback about certain errors. For example, one common error is setting up a cloud flow that attempts to get a person’s manager in Office 365&mdash;but there's no manager configured in Microsoft Entra ID. If this or several other conditions cause your flow to fail, you get a repair tips email.

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

Follow these steps to find the error and learn how to fix it,

1. Select **My flows**.
1. Select the flow that failed.
1. In the **28-day run history** section, select the date of the failed run.

   Details about the flow appear, and at least one step shows a red exclamation icon.

1. Open that failed step, and then review the error message.

   On the right pane, you can see the details of the error and how to fix it.

   ![Error message for a failed flow run.](./media/fix-flow-failures/identify-error.png)

## Authentication failures

In many cases, flows fail because of an authentication error. If you have this type of error, the error message contains **Unauthorized** or an error code of **401** or **403** appears. You can usually fix an authentication error by updating the connection:

1. On the right pane below **How to fix**, select **View Connections**.
1. Scroll to the connection for which you saw the **Unauthorized** error message.
1. Next to the connection, select the **Fix connection** link in the message about the connection not being authenticated.
1. Verify your credentials by following the instructions that appear.
1. Return to your flow-run failure, and then select **Resubmit**.

    The flow should now run as expected.

## Troubleshoot in Copilot

The troubleshoot in Copilot feature in Power Automate can assist you in identifying and resolving errors that might occur during the testing of cloud flows or when reviewing flow run history. You can use this Copilot feature when the new designer experience is enabled.

Learn how to troubleshoot cloud flow errors with Copilot in this quick video:</br>
</br>

> [!VIDEO 040bad79-4775-4fd7-90d9-bc13368d0473]

The troubleshoot in Copilot feature provides a human-readable summary of the error and, when possible, attempts to provide a solution to correct the error. This can greatly enhance your experience by reducing the time and effort required to troubleshoot and resolve issues.

> [!NOTE]
> The troubleshoot in Copilot feature might not work in all scenarios. It’s continuously learning and improving over time, which means its ability to assist users and resolve issues only gets better. This is a great example of how AI and machine learning can be leveraged to improve your experience and productivity.

:::image type="content" source="./media/fix-flow-failures/troubleshoot-copilot.png" alt-text="Screenshot of a troubleshooting in Copilot suggestion for fixing a failed flow run.":::

## Action configuration

Flows also fail if a setting in an action of the flow doesn't function as expected. In this case, the error message contains **Bad request** or **Not found**, or an error code of **400** or **404** appears.

The error details should specify how to correct the failure. To update the configuration:

1. Select **Edit** and then correct the problem inside the flow definition.
1. Save the updated flow.
1. Select **Resubmit** to try the run again with the updated configuration.

## Other failures

If the error code **500** or **502** appears, the failure is temporary or transient. To try the flow again, select **Resubmit**.

## Related information

[Training: Best practices for error handling in Power Automate flows (module)](/training/modules/error-handling/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
