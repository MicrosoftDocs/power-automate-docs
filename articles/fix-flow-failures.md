---
title: Troubleshooting a cloud flow | Microsoft Docs
description: Resolve some of the most common reasons why flows fail
services: ''
suite: flow
documentationcenter: na
author: v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/12/2022
ms.author: angieandrews
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---
# Troubleshooting a cloud flow

Here are some tips and tricks for troubleshooting cloud flows.

## Identify specific flow runs

Once you build and deploy your flows, you might need to debug specific flow runs to confirm that your flow ran as expected. By default, the flow owner can look at the **Start**, **Duration**, and **Status** columns in the run history view in Power Automate to help them identify the flow run they are interested in debugging. The owner can also expand the troubleshooting section to identify the specific run in which they are interested, however, for flows that run frequently, this can be time-consuming.

To make it more efficient to identify flow runs when debugging, Power Automate provides the ability for flow owners to configure the list of columns that's displayed on the run history page for each flow run. These columns map to the trigger outputs for your flow. When you display the columns you want, you save time since you will see the relevant columns by default on the run history view.

Follow these steps to add one or more columns to your run history view.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Select **My flows** from the left side of the screen.
1. Select the flow for which you want to get more details.
1. Select **Edit columns** on the flow details page.

   ![A screenshot that shows the edit columns link on the details view for a flow.](./media/triggers-introduction/edit-columns.png)

1. Select the columns that you want to add to your run history view for the flow that you've selected, and then select **Save**.

   ![A screenshot that displays some of the columns available as trigger output for the flow you've selected](./media/triggers-introduction/select-flow-columns.png).

1. View the list of columns that displays on the run history view for the flow you've selected.

   Note that **hasAttachments** and **isHTML** columns are now visible for the flow so that you can quickly see those values to help you debug the flow.

   ![A screenshot that displays the list of columns that displays on the run history view for the flow you've selected ](./media/triggers-introduction/new-columns-run-history-view.png)

>[!TIP]
>You can also configure the list of columns that's displayed via the **All runs** view.

## Repair tips in email

Repair tips are sent to flow owners via email whenever a cloud flow fails. These repair tips emails contain specific, actionable feedback about certain errors. For example, one common error is setting up a cloud flow that attempts to get a person’s manager in Office 365—but there is no manager configured in Microsoft Entra ID. If this or several other conditions cause your flow to fail, you get a repair tips email like this:

![Repair tips.](media/fix-flow-failures/repair-tips-email-2.png)

The repair tips email contains the following sections:

Name|Description
---|---
Time|Displays the time the flow first failed.
What happened|Provides a description of the problem that caused the failure in the flow.
How do I fix|Provides tips for resolving the issue that cause the failure in the flow.
Troubleshooting Tips|Provides details including the number of times the flow failed, and a link to retry the flow with the same input data.

To fix the reported errors, select **Fix my flow** and follow the steps in the repair tips email.

Repair tips emails are optional. If you don't want to receive them, just turn them off from the properties menu for the specific flow.

If your flow fails, you can also troubleshoot it directly in Power Automate.  Here are a few common failure scenarios and tips on how to fix them.

## Identify the error

1. Select **My flows**.
1. Select the flow that failed.
1. In the **28-day run history** section, select the **date** of the failed run.
   
   Details about the flow appear, and at least one step shows a red exclamation icon.
1. Open that failed step, and then review the error message.

   On the right pane, you can see the **details** of the error and **How to fix** the error.

   ![Error message for a failed flow run.](./media/fix-flow-failures/identify-error.png)


## Authentication failures
In many cases, flows fail because of an authentication error. If you have this type of error, the error message contains **Unauthorized** or an error code of **401** or **403** appears. You can usually fix an authentication error by updating the connection:

1. In the right pane, click on **View Connections** below **How to fix**.
1. Scroll to the connection for which you saw the **Unauthorized** error message.
1. Next to the connection, click or tap the **Fix connection** link in the message about the connection not being authenticated.
1. Verify your credentials by following the instructions that appear, return to your flow-run failure, and then click or tap **Resubmit**.

   ![A screenshot that displays the resubmit button.](./media/fix-flow-failures/resubmit.png)
   
 The flow should now run as expected.

## Action configuration
Flows also fail if a setting in an action of the flow doesn't function as expected. In this case, the error message contains **Bad request** or **Not found**, or an error code of **400** or **404** appears.

The error details should specify how to correct the failure. You'll need to click or tap the **Edit** button and then correct the problem inside the flow definition. Save the updated flow, and then click or tap **Resubmit** to try the run again with the updated configuration.

## Other failures
If the error code **500** or **502** appears, the failure is temporary or transient. Click or tap **Resubmit** to try the flow again.

## Getting help from support or the community

When you need help, you can use our **Self Help** options, or you can **Ask for help** from others.

### Self help 

1. Go to the [support site](https://make.powerautomate.com/support/).
1. Go to the **Self Help** category and select one of the self-help options.

    ![A screenshot that displays the self-help option.](media/fix-flow-failures/self-help-section.png)

### Ask for help from others

1. Go to the [support site](https://make.powerautomate.com/support/).
1. Select **Contact Support** in the **Ask for help** section.
    
    ![Ask for help section. Contact support.](media/fix-flow-failures/ask-for-help.png)

1. Complete the **Problem type**, **Category**, and the **Tell us what you need help with** fields, and then select **See solutions**. 

1. Notice that the **Solutions** section displays after you select **See solutions**. It contains a list of results that you can use to help address the issue you're facing. 

    ![Integrated helper details.](media/fix-flow-failures/support-request.png)

If you need help with an issue, help is available from our [community](https://go.microsoft.com/fwlink/?LinkID=787467) and Microsoft. 



[!INCLUDE[footer-include](includes/footer-banner.md)]