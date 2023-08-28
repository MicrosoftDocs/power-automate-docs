---
title: Add cloud flow, desktop flow and connection reference.
description: This section describes how to add your cloud flow, desktop flow and connection references to your solution.
author: nvigne
ms.author: nvigne
ms.subservice: desktop-flow
---

# Add cloud flow, desktop flow and connection reference
At this point you have created a solution. Let's add a desktop Flow and a cloud flow to this solution. If you haven't created a solution yet, [create a solution and a publisher](/power-platform/alm/solution-concepts-alm#solution-lifecycle)

> Please note that in order for a cloud flow to be added in a solution, it needs to be created in the solution, you cannot add a cloud flow to a solution after its creation.

## Create a desktop flow
Follow those steps:
- **Solution** > **my solution name**
- **New** > **Automation** > **Desktop Flow**

You will be redirected to Power Automate Desktop, once you have finished editing your desktop flow, go back to the solution page, you should see your desktop flow appear.

:::image type="content" source="./media/desktopflow-solution.png" alt-text="Screenshot of a desktop flow in a solution":::

## Create a cloud flow
From within the solution: **New** > **Automation** > **Cloud flow** > **Scheduled**

You will be redirected to the cloud flow designer, edit to add an action with desktop flow, if needed create a connection. You need to use the **Unattended** run mode.

> Please note that the connection you use here will not be the connection that will be used in your Production environment.

:::image type="content" source="./media/cloudflow-solution.png" alt-text="Screenshot of a desktop flow, a cloud flow and connection reference in a solution":::

You should see the cloud flow in your solution as well as a connection reference.

### Next
- [Configure your build pipeline to export your solution](/power-platform/alm/devops-build-tool-tasks#build-pipeline-export-solution-from-development)
