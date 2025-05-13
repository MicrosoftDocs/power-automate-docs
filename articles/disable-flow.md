---
title: Turn a flow on or off, and delete a flow
description: Learn how to turn a flow on or off, and delete a flow in Power Automate.
services: ''
suite: flow
documentationcenter: na
author: puyush6889
contributors:
  - puyush6889
  - natalie-pienkowska
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 06/14/2023
ms.author: kapolepa
ms.reviewer: angieandrews
search.audienceType:
  - flowmaker
  - enduser
---

# Turn a flow on or off, and delete a flow

At times, you might want to turn off a cloud flow to prevent it from running, or permanently delete a flow. Follow these steps to turn flows on or off, and delete a flow.

## Turn off a flow

After you create a cloud flow, it's turned on by default. Follow these steps to turn off a cloud flow.

1. On the left pane, select **My Flows**.

1. Select a cloud flow, and then select the vertical ellipsis (&vellip;).

1. On the menu that appears, select **Turn off**.

1. On the **Details** page, select the vertical ellipsis (&vellip;), and then select **Details** to verify the new status.

    :::image type="content" source="./media/disable-flow/flow-details-page-new-status.png" alt-text="Screenshot of flow status on Details page.":::

>[!NOTE]
>If you turn off a flow while it’s running, the flow runs will continue to run until all pending flow runs are completed.

## Turn on a flow

If you've turned off a cloud flow, but want to turn it back on so that it'll run again, follow one of these steps.

- If you're on the **Details** page, select **Turn on** on the menu at the top.
- If you are on the **Flows** page:

    1. Select a cloud flow, and then select the vertical ellipsis (&vellip;).

    1. On the menu that appears, select **Turn on**. The status changes to **On**.

## Delete a flow

If you need to delete a flow, follow these steps:

1. Before you delete the flow, go to the **Details** page and select **All runs**.

    To cancel pending runs, follow the instructions in [Cancel or resubmit flow runs in bulk](how-tos-bulk-resubmit.md). Otherwise, some pending flow runs might continue to run to avoid data loss.
1. Once you've cancelled pending runs, return to the **Details** page and select **Delete** on the menu at the top.

>[!NOTE]
>If you deleted a flow accidentally and need to restore it, go to [Restore deleted flows](how-tos-restore-deleted-flow.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]

