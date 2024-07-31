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

You can cancel flow runs either through the Run history page or by using a [template](https://make.powerautomate.com/galleries/public/templates/52c2eb66c0664b3b82480d1adcc6c1b4/cancel-all-of-my-flow-runs). If you need to cancel up to 20 runs, use the Run history page. If you need to cancel more than 20 (even hundreds), use the template. Procedures for both methods are detailed in the following sections.

### Cancel up to 20 flow runs

To cancel flow runs that are in progress, follow the steps outlined previously in [Resubmit flow runs](#resubmit-flow-runs) with one exception: In step 6, select **Cancel flow run(s)**, as shown in the following screenshot.

:::image type="content" source="./media/cancel-resubmit-how-to/cancel-runs.png" alt-text="Screenshot that displays the Cancel flow run(s) button.":::

### Cancel flow runs in bulk

This feature cancels a large number of flow runs.

Canceling a large number of flow runs changes the run status to **Canceling**, typically within three (3) minutes. Then, the final status changes to **Canceled** after some time. Runs are effectively canceled after the three-minute window.

> [!NOTE]
> If you have a smaller number of flow runs, we recommend you cancel runs in batches of 20. To learn how to do this, go to [Cancel up to 20 flow runs](#cancel-up-to-20-flow-runs) in this article.

Depending on your license, you might be subject to temporary throttling if the flow has an excessive number of runs. To learn more, go to [Throughput limits](limits-and-config.md#throughput-limits).

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the left panel, select **My flows**.
1. On the right panel, select the cloud flow in which you would like to cancel flow runs.
1. Select **All runs**.
1. At the top of the page, select **Cancel all flow runs**.

    A message opens asking you to confirm the cancellation of all runs.

1. (Optional) In the message, select **Turn my flow off to prevent additional runs**.

    If you don't do this optional step, go to step 7.

1. Confirm you want to cancel all flow runs by selecting **Yes**.

    The run **Status** column might take up to three (3) minutes to show **Canceling**. Within the three-minute window, the runs might show up as running or canceling, but might still continue to execute. Beyond the three-minute window, nothing runs.

    You can refresh the page to see the current status. In rare instances, if you don't see the **Canceling** status after the first three minutes, you can cancel all runs again. You can now make changes to the flow and start the flow again.

1. To verify the cancelation, you can view runs with a **Canceling** status in **All Runs**. To view the canceled runs, you can select **Bulk-Canceled Runs** from the filters menu at the top of the page. Only runs that were canceled using this feature will show with this filter selected. To view other canceled runs, select **Canceled runs**.

[!INCLUDE[footer-include](includes/footer-banner.md)]

