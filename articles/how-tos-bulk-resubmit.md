---
title: Cancel or resubmit flow runs in bulk in Power Automate
description: Learn how to resubmit and cancel failed or successful flow runs in Power Automate.
suite: flow
author: DBEKI
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 11/19/2024
ms.author: dbekirop
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Cancel or resubmit flow runs in bulk

You can cancel or resubmit your flow runs in bulk instead of one at a time, which can be a huge time saver.

## Resubmit flow runs

You can resubmit previous runs of a flow in bulk. To do this, follow these steps:

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the left panel, select **My flows**.
1. On the right panel, select the cloud flow that you want to resubmit or cancel.
1. Select **All runs**.

    :::image type="content" source="./media/cancel-resubmit-how-to/all-runs.png" alt-text="Screenshot that displays all runs for the selected flow.":::

   > [!TIP]
   > - The flow must have runs to cancel or resubmit the flow runs.
   > - You can resubmit or cancel up to 20 flows at a time.

1. On the **Run history** page, select the flow runs that you want to resubmit or cancel.
1. Select **Resubmit flow run(s)**.

    :::image type="content" source="./media/cancel-resubmit-how-to/select-runs.png" alt-text="Screenshot that displays the selected runs for your flow.":::

   > [!IMPORTANT]
   > The number of flows that you can resubmit is limited based on the maximum number of API calls for the connectors in the flow.

## Cancel flow runs

You can cancel flow runs through the related flow's run history page, or by using a [template](https://make.powerautomate.com/galleries/public/templates/52c2eb66c0664b3b82480d1adcc6c1b4/cancel-//all-of-my-flow-runs). The bulk cancel feature available through the flow portal is most efficient when you cancel up to 20 flows at a time. We recommend that you use the template linked previously in this section for more than 20 runs when possible. This also applies to runs in the hundreds. Alternatively, you can use the bulk cancel feature for all flows in **Waiting** or **Running** status regardless of the count. To set an expectation of how this utility functions review the following details.

### Cancel flow runs in bulk through the flow run history pane

1. To cancel flows, navigate to the flow portal and select **My flows**.
1. Next to the flow, select the ellipses (&hellip;) > **Run history**.

    Alternatively, you can select the flow name > **All runs** from the 28-day run history list.

1. You can manually select up to 20 flows that are in **Waiting** or **Running** state.

    To initiate the bulk cancellation feature instead, select **Cancel all flow runs** in the run history option menu at the top of the screen.

    :::image type="content" source="./media/cancel-resubmit-how-to/flowrunlist.png" alt-text="Screenshot that displays the cancel all flow runs button.":::

1. After you select **Cancel all flows**, a message appears asking you to initiate the bulk utility. Select **Yes**. If you're concerned about further unwanted flow runs being initiated, you can turn off the flow.

    :::image type="content" source="./media/cancel-resubmit-how-to/cancelprompt.png" alt-text="Screenshot that displays the cancel all flow runs message window.":::

1. If there are more than 20 flows in **Waiting** or **Running** status, another message might appear to indicate that it might take several minutes for the flow run statuses to change to **Canceling**. This message means your flows are suspended, and no further actions are executed for flows that are already **Running**. Flows in **Waiting** status are also terminated without actions being executed.

    :::image type="content" source="./media/cancel-resubmit-how-to/workingonit.png" alt-text="Screenshot that displays the cancel all flow runs button.":::

1. Get the updated status changes in the run history list by periodically refreshing your browser screen.

    > [!NOTE]
    > - Flows in the **Running** state are suspended and change to a state of **Canceling** before eventually changing to **Canceled**.
    > - This process can sometimes take up to 24 hours more more.
    > - In this scenario, the flows are suspended, and no further actions are executed.
    > - If you select a flow run in the **Canceling** state, it might appear that the spinner near an action is in motion, but it's in a suspended state. When flows are actually running, a notification banner diplays to indicate your flow is running. This isn't the case for suspended flows in the **Canceling** state.

The following image shows the banner when a flow is running. A suspended flow in the **Canceling** status doesn't contain this banner.

    :::image type="content" source="media/cancel-resubmit-how-to/runningflow.png" alt-text="Screenshot that flow run that indicates it is running.":::

Flows that exceeded the [concurrency](limits-and-config.md#concurrency-looping-and-debatching-limits) setting might be visible in the **Waiting** state alongside other flow runs in the **Canceling** state. This is by design. The flows were suspended when the bulk cancel was submitted, unless they were triggered after the feature was used. The state changes to **Canceling** when their turn to be processed comes up in the queue. You can ensure that flows in the **Running** or **Waiting** state before submitting a bulk cancel request were suspended and eventually change to the **Canceled** state.  

    :::image type="content" source="./media/cancel-resubmit-how-to/wait_cancel.png" alt-text="Screenshot that flow run in state waiting and canceled.":::

    :::image type="content" source="./media/cancel-resubmit-how-to/cancelled.png" alt-text="Screenshot that flow run state is canceled.":::


[!INCLUDE[footer-include](includes/footer-banner.md)]
