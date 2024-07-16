---
title: Reduce the size of desktop flows in a solution
description: Learn how to reduce the size of desktop flows in a solution by removing UI element screenshots.
author: PetrosFeleskouras
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 07/16/2024
ms.author: pefelesk
ms.reviewer: dmartens
contributors:
- PetrosFeleskouras
- DanaMartens
search.audienceType: 
  - flowmaker
  - admin
---
# Reduce the size of desktop flows in a solution

This article provides a workaround to reduce the size of desktop flows in a solution by removing all UI element screenshots of the flows. The objective is to minimize the total size of the solution to prevent export failures caused by its size.

UI element screenshots help in identifying the captured UI elements when creating a flow. However, they don't affect the flow's operation or modification and can safely be removed.

> [!CAUTION]
> Remove only the **Desktop flow ui element screenshot** objects from the solution. Removing any other desktop flow binary object will result in data loss for the desktop flow, and you will encounter issues editing or running the flow in the target environment.

> [!NOTE]
> - This workaround applies only to desktop flows saved in v2 Dataverse [schema](../schema.md).
> - Learn more about size limit related errors during flow save at [Exceeded size limit](../schema.md#exceeded-size-limit).

To remove all UI element screenshots of desktop flows within a solution:

1. Sign in to the [Power Automate portal](https://make.powerautomate.com).
1. Go to **Solutions**.
1. Select the solution that contains one or more desktop flows.
1. Select all items with name **Desktop flow ui element screenshot**.
1. Select **Remove** > **Remove from this solution**.

    :::image type="content" source="media/reduce-flow-size/remove-ui-element-screenshots.png" alt-text="Screenshot of a solution containing desktop flow objects." lightbox="media/reduce-flow-size/remove-ui-element-screenshots.png":::
