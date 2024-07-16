---
title: Reduce the size of desktop flows in a solution
description: Reduce the size of desktop flows that are referenced by a solution, by removing the UI element screenshots from the solution.
author: PetrosFeleskouras
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 07/15/2024
ms.author: pefelesk
ms.reviewer: 
contributors:
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - admin
---
# Reduce the size of desktop flows in a solution

This article provides a workaround to reduce the size of desktop flows that are referenced by a solution, by removing all UI element screenshots of the flows. 

This aims to reduce the overall solution size, and address the issue of solution export failure due to its size. 

UI element screenshots are useful in identifying the captured UI elements during flow authoring. However, they do not affect the flow runtime or edit, and they can safely be removed. 

> [!CAUTION]
> Remove only the **Desktop flow ui element screenshot** objects from the solution. Removing any other desktop flow binary object will result in data loss for the desktop flow, and you will encounter issues editing or running the flow in the target Environment.

> [!NOTE]
> - This workaround applies only to desktop flows saved in v2 Dataverse schema.
> - For size limit related errors during flow save, learn more in [Exceeded size limit](../schema.md#exceeded-size-limit).

To remove all UI element screenshots of all desktop flows within a solution, follow these steps: 

1. Sign in to the [Power Automate portal](https://make.powerautomate.com).
1. Go to **Solutions**.
1. Select the solution that contains the desktop flow(s).
1. Select all items with name **Desktop flow ui element screenshot**.
1. Select **Remove** > **Remove from this solution**.

:::image type="content" source="/media/reduce-flow-size/remove-ui-element-screenshots.png" alt-text="Screenshot of a solution containing desktop flow objects.":::
