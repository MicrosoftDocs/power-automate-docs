---
title: Cancel or resubmit flow runs in bulk in Power Automate
description: Learn how to resubmit and cancel failed or successful flow runs in Power Automate.
services: ''
suite: flow
documentationcenter: na
author: DBEKI
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 04/24/2024
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
1. On the right panel, select the cloud flow that you would like to resubmit or cancel.
1. Select **All runs**.

    :::image type="content" source="./media/cancel-resubmit-how-to/all-runs.png" alt-text="Screenshot that displays all runs for the selected flow.":::

   > [!TIP]
   > - The flow must have runs to cancel or resubmit the flow runs.
   > - You can resubmit or cancel up to 20 flows at a time.

1. Select the flow runs that you would like to resubmit or cancel on the **Run history** page.
1. Select **Resubmit flow run(s)**.

    :::image type="content" source="./media/cancel-resubmit-how-to/select-runs.png" alt-text="Screenshot that displays the selected runs for your flow.":::

   > [!IMPORTANT]
   > The number of flows that you can resubmit is limited based on the maximum number of API calls for the connectors in the flow.

## Cancel flow runs

Flow runs can be canceled through the related flow's Run history page, or by using a [template](https://make.powerautomate.com/galleries/public/templates/52c2eb66c0664b3b82480d1adcc6c1b4/cancel-//all-of-my-flow-runs).  The bulk cancel feature available through the flow portal is most efficient when canceling up to 20 flows at a time.  It is advised to use the template linked above for more than 20 (even hundreds) runs when possible, otherwise you can use bulk cancel feature for all flows in **Waiting**, or **Running** status regardless of the count. However, please review the details below to set an expectation of how this utility functions.

### Canceling flow runs in bulk through the flow run history pane

1. To cancel flow(s), navigate to the flow portal and click on **My flows**. Then, select the ellipses (three dots) next to the flow and choose **Run history**. Alternatively, you can click on the flow name and select **All runs** from the 28-day run history list
1. You can manually select up to 20 flows that are in **Waiting**, or **Running** state, or simply click **Cancel all flow runs** in the run history option menu at the top of the screen to initiate the bulk cancellation feature. 

    :::image type="content" source="./media/cancel-resubmit-how-to/flowrunlist.png" alt-text="Screenshot that displays the cancel all flow runs button."::: 

1. After clicking **Cancel all flows** a message window will appear. Click **Yes** to initiate the bulk cancel utility.  If you are concerned about further unwanted flow runs being initiated, you can also choose to turn the flow off.

    :::image type="content" source="./media/cancel-resubmit-how-to/cancelprompt.png" alt-text="Screenshot that displays the cancel all flow runs message window.":::

1. If there are more than 20 flows in **Waiting**, or **Running** status, an additional pop up message may appear, indicating that it may take several minutes for the flow run statuses to change to **Canceling**. Do not be alarmed; your flows have been suspended, and no further actions will be executed for flows that are already **Running**. Flows in **Waiting** status will also be terminated without actions being executed.

    :::image type="content" source="./media/cancel-resubmit-how-to/workingonit.png" alt-text="Screenshot that displays the cancel all flow runs button.":::

1. Refresh your browser screen periodically to see the updated status changes in the Run history list. Flows in the Running state have been suspended and will change to a state of **Canceling** before eventually changing to Canceled. This process can sometimes take up to, or more than, 24 hours. However, note that the flows are suspended, and no actions will be executed. If you click on a flow run in the **Canceling** state, it may appear that the spinner above a respective action is in motion, but it is in a suspended state. When flows are actually running, you will see a notification banner at the top indicating Your flow is running... This is not the case for suspended flows in the **Canceling** state. The image below shows the banner when a flow is running, which a suspended flow in the **Canceling** status will not contain.

    :::image type="content" source="./media/cancel-resubmit-how-to/runningflow.png" alt-text="Screenshot that flow run that indicates it is running.":::

1. Note that flows which exceeded the concurrency setting may be visible in the **Waiting** state alongside other flow runs in the **Canceling** state. This is by design, and you can be reassured that the flows were suspended when the bulk cancel was submitted, unless they were triggered after the feature was used. The state will change to **Canceling** when their turn to be processed comes up in the queue. You can ensure that flows in the **Running** or **Waiting** state before submitting a bulk cancel request have been suspended and will eventually change to the **Canceled** state..  

    :::image type="content" source="./media/cancel-resubmit-how-to/wait_cancel.png" alt-text="Screenshot that flow run in state waiting and canceled.":::

    :::image type="content" source="./media/cancel-resubmit-how-to/cancelled.png" alt-text="Screenshot that flow run state is canceled.":::


[!INCLUDE[footer-include](includes/footer-banner.md)]
