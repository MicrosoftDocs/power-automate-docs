---
title: Compare your Desktop Flow changes
description: This section describes how compare changes between two version of your desktop flow.
author: nvigne
ms.author: nvigne
ms.subservice: desktop-flow
---

# Compare your Desktop Flow changes
When you commit a change to your repository by running your export pipeline, you can see the differences between two versions of your solutions by going to Azure DevOps.

## Compare the Desktop Flow definition
The Desktop flow definition is stored in **Workflow** folder in a file with the extension `.json.data.xml`. From Azure DevOps, you can click on the file then on the **History** tab to observe the difference.

:::image type="content" source="./media/desktopflow-diff.png" alt-text="Screenshot of the diff tool in Azure DevOps on the Desktop Flow definition":::

## New image or control added to the Desktop Flow
When a new image or a control is added to your Desktop Flow, they are added as new folder in the **desktopflowbinaries** folder. Each image has a dedicated folder, with a subfolder data which contains the screenshot. File is named **Untitled.txt**.

:::image type="content" source="./media/screenshot-diff.png" alt-text="Screenshot of the diff tool in Azure DevOps on a Desktop Flow image.":::

