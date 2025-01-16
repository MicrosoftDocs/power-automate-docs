---
title: Add cloud flow, desktop flow and connection reference.
description: This section describes how to add your cloud flow, desktop flow and connection references to your solution.
author: nvigne
ms.author: nvigne
ms.subservice: desktop-flow
ms.reviewer: matp
ms.topic: how-to
ms.date: 01/06/2025
---

# Add a cloud flow, desktop flow and connection reference to a solution

If you've followed the article [for configuring ALM for desktop flows](alm-intro.md), at this point you've created a solution. Now, add a desktop flow and a cloud flow to this solution. If you haven't created a solution yet, [create a publisher and a solution](/power-platform/alm/solution-concepts-alm#solution-lifecycle)

> [!IMPORTANT]
> In order for a cloud flow to be added to a solution, the cloud flow has to be created in the solution. You can't add a cloud flow to a solution after it's been created.

## Create a desktop flow

1. Sign in to [Power Automate](https://make.powerautomate.com), and then go to **Solutions**, and then open the unmanaged solution you want or select **New solution** to [create a solution](/power-apps/maker/data-platform/create-solution).
1. Select **New** > **Automation** > **Desktop flow**.

You're redirected to Power Automate desktop, once you have finished editing your desktop flow, go back to the solution page to see your desktop flow appear.

:::image type="content" source="./media/desktopflow-solution.png" alt-text="Screenshot of a desktop flow in a solution":::

## (Optional) Add your desktop flow connection references

You might use connections inside your desktop flow. To easily export your desktop flow to another environment, ensure that the connection references are added.

1. Select **Add existing** > **More** > **Connection Reference**.
1. Search for the connection reference that matches the one used in your desktop flow.

:::image type="content" source="./media/desktopflow-connectionreference.png" alt-text="Screenshot of a desktop flow and a connection reference in a solution.":::

If you export as a managed solution, you need this step to map your connection reference to your connection used in Production.

## Create a cloud flow

From within the solution, select **New** > **Automation** > **Cloud flow** > **Scheduled**.

You're redirected to the cloud flow designer. Edit to add an action with a desktop flow, and if needed, create a connection. You need to use the **Unattended** run mode.

The connection you use won't be the connection that is used in your production environment.

:::image type="content" source="./media/cloudflow-solution.png" alt-text="Screenshot of a desktop flow, a cloud flow, and connection references in a solution":::

You see the cloud flow and its connection reference in your solution. Map the connection when importing to the production environment.

## Next steps

- [Configure your build pipeline to export your solution](/power-platform/alm/devops-build-tool-tasks#build-pipeline-export-solution-from-development)
