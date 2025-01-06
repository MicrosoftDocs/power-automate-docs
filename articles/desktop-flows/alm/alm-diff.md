---
title: Compare your desktop flow changes
description: This section describes how compare changes between two versions of your desktop flow.
author: nvigne
ms.author: nvigne
ms.subservice: desktop-flow
ms.reviewer: matp
ms.date: 01/06/2025
ms.topic: how-to
---

# Compare your desktop flow changes

When you commit a change to your repository by running your export pipeline, you can see the differences between two versions of your solutions by going to Azure DevOps.

## Compare the desktop flow definition

The desktop flow definition is stored in the **Workflow** folder in a file with the extension `.json.data.xml`. From [Azure DevOps](https://azure.microsoft.com/products/devops/), you can open the file on the **History** tab to observe the difference.

:::image type="content" source="./media/desktopflow-diff.png" alt-text="Screenshot of the diff tool in Azure DevOps on the desktop flow definition":::

## New image or control added to the desktop flow

When you add a new image or control to your desktop flow, a new folder is created in the **desktopflowbinaries** folder. Each image has its own folder with a subfolder containing the screenshot.

The image is stored so you can easily compare which control was removed or added while authoring your desktop flow.

## Related information

[Overview for configuring ALM for desktop flows](alm-intro.md)