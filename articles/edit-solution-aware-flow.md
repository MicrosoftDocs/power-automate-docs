---
title: Edit a solution-aware cloud flow
description: Learn how to edit solution-aware cloud flows.
services: ''
suite: flow
documentationcenter: na
author: ChrisGarty
contributors:
  - ChrisGarty
  - v-aangie
editor: ''
tags: ''
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/02/2023
ms.author: cgarty
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Edit a solution-aware cloud flow

You can edit solution-aware cloud flows in [solutions](#edit-a-solution-aware-cloud-flow-via-solutions) or in [my flows](#edit-a-solution-aware-cloud-flow-via-my-flows).

> [!IMPORTANT]
> Stop your flow before you edit it so that you don't lose your changes.

## Edit a solution-aware cloud flow via Solutions

1. Sign in to [Power Automate](https://make.powerautomate.com), and then select **Solutions** from the menu on the left.

1. Select the solution that contains the flow you want to edit.

    :::image type="content" alt-text="Screenshot of a new flow inside a solution." source="./media/edit-solution-aware-flow/new-flow-inside-solution.png":::

1. Select the vertical ellipsis (&vellip;) for your flow, and then select **Turn off**.

1. Select the vertical ellipsis (&vellip;) for your flow, and then select **Edit**.

    :::image type="content" alt-text="Screenshot of editing a cloud flow." source="./media/edit-solution-aware-flow/edit-flow.png":::

1. Make your edits in the Power Automate designer, test your changes, and then save your flow.

1. Turn on your flow if you'd like it to run.

## Edit a solution-aware cloud flow via My flows

1. In [Power Automate](https://make.powerautomate.com), select **My flows** from the menu on the left.

1. Find the flow you want to edit. Cloud flows that you own will be in the **Cloud flows** tab and flows that you have co-ownership of will be in the **Shared with me** tab.

1. Select the vertical ellipsis (&vellip;) for your flow, and then select **Turn off**.

1. Select the vertical ellipsis (&vellip;) for your flow, and then select **Edit**.

1. Make your edits in the Power Automate designer, test your changes, and then save your flow.

1. Turn on your flow if you'd like it to run.

> [!WARNING]
> When you edit solution-aware flows, it's possible for you to introduce unmanaged customization layers into your managed solution-aware flows. Unmanaged customization layers can impact your ability to update these flows in the future.

## Duplicate a solution-aware cloud flow using Save As

The **Save As** capability can be used to duplicate a solution cloud flow. If an unmanaged solution is in context when **Save As** takes place, the flow will be added into that solution. Solution cloud flows won't be added into a solution if there's no context, or if a managed solution has context, so those flows can be located in the **My flows** list or in the **Default Solution**.

### Save As without solution context

1. In [Power Automate](https://make.powerautomate.com), select **My flows** from the menu on the left.

1. Open the cloud flow you want to duplicate.

    The flow details page will show a **Solutions** card listing any custom solutions the flow is referenced by.

1. Select **Save As**.

    :::image type="content" alt-text="Screenshot of Save As." source="./media/edit-solution-aware-flow/save-as.png":::

1. On the **Create a copy of this flow** screen, enter a custom flow name if desired and select **Save**.

    The flow will now be visible in **My flows**.

    > [!NOTE]
    > If the save takes a few seconds, it's possible to return to **My flows** before that's completed. If that happens, refresh the browser screen to view the flow.

### Save As with unmanaged solution context

1. In [Power Automate](https://make.powerautomate.com), select **Solutions** from the menu on the left.

1. Open an unmanaged solution. This solution is now providing solution context.

1. Inside that solution, find and open the cloud flow you want to duplicate.

    The flow details page will show a **Solutions** card listing the current solution and any other custom solutions the flow is referenced by.

1. Select **Save As**.

1. On the **Create a copy of this flow** screen, enter a custom flow name if desired and select **Save**.

    The flow will now be visible in the solution. Upon opening that flow, it will have the solution in the **Solutions** card in the flow details page.

## Related information

- [Manage and edit a cloud flow](/power-automate/get-started-logic-flow#manage-a-cloud-flow)
- [Create a solution](./overview-solution-flows.md)
- [Use drafts and versioning](./drafts-versioning.md)
- [Create a cloud flow in a solution](./create-flow-solution.md)
- [Set a preferred solution](/power-apps/maker/data-platform/preferred-solution)
- [Export a solution](./export-flow-solution.md)
- [Import a solution](./import-flow-solution.md)
- [Remove a solution-aware flow](./remove-solution-aware-flow.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
