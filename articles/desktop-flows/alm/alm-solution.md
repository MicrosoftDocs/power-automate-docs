---
title: Add Cloud Flow, Desktop Flow and connection reference.
description: This section describes how to add your cloud flow, desktop flow and connection references to your solution.
author: nvigne
ms.author: nvigne
ms.subservice: desktop-flow
---

# Add Cloud Flow, Desktop Flow and connection reference
At this point you have created a solution. Let's add a Desktop Flow and a Cloud Flow to this solution.

> Please note that in order for a Cloud Flow to be added in a solution, it needs to be created in the solution, you cannot add a Cloud Flow created outside a solution to a solution.

## Create a Desktop Flow
Follow those steps:
- **Solution** > **my solution name**
- **New** > **Automation** > **Desktop Flow**

You will be redirected to Power Automate Desktop, once you have finished editing your Desktop Flow, go back to the solution page, you should see your Desktop Flow appear.

:::image type="content" source="./media/desktopflow-solution.png" alt-text="Screenshot of a Desktop Flow in a solution":::

## Create a Cloud Flow
From within the solution: **New** > **Automation** > **Cloud flow** > **Scheduled**

You will be redirected to the Cloud flow designer, edit to add an action with Desktop Flow, if needed create a connection. You need to use the **Unattended** run mode.

> Please note that the connection you use here will not be the connection that will be used in your Production environment.

:::image type="content" source="./media/cloudflow-solution.png" alt-text="Screenshot of a Desktop Flow, a Cloud flow and connection reference in a solution":::

You should see the Cloud flow in your solution as well as a connection reference.

### Next
- [Configure your build pipeline to export your solution](/power-platform/alm/devops-build-tool-tasks#build-pipeline-export-solution-from-development)
