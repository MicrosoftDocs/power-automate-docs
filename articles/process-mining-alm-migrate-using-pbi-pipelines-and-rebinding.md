---
title: Migrate using Power BI pipelines and rebinding
description: Learn how to migrate using Power BI pipelines and rebinding.
author: janPidych
contributors:
  - janPidych
  - rosikm
  - hamenon-ms
  - donums
  - v-aangie  
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: upgrade-and-migration-article
ms.date: 08/12/2024
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Migrate using Power BI pipelines and rebinding

This solution involves using Power BI pipelines for moving entities across two different workspaces.

## Attach a workspace to your process

[!INCLUDE[alm-attach-workspace](./includes/alm-attach-workspace.md)]

4. If your process was newly copied to the Test environment, select the process and go to step 5. If the process wasn't newly imported, go to step 6.
1. Select a new workspace for this process:
    1. Select a *different workspace* that you will be using for the Test environment.
    1. For **Report Name**, enter a *different report name* than that of your previous report.
  
        > [!IMPORTANT]
        > The report name must be different from the report name of the process in Dev environment.

    1. Select **Continue** and continue setting up your process.

        :::image type="content" source="media/process-mining-alm-pbi-pipelines-and-rebinding/new-workspace-pipeline.png" alt-text="Screenshot of your process with a different workspace and report name from your previous workspace.":::

1. (If your process wasn't newly imported) Attach a custom Power BI workspace to the process:
    1. Go to the process details page for the process.
    1. On the **Details** card, select **Edit**.
    1. From the **Power BI workspace (optional)** dropdown menu, select your **WkSpace B** Power BI workspace that you want to port changes to.
    1. Provide the *different report name* than that which you used before.
    1. Select **Save** > **Continue**.
    1. From the command bar or in the report view, select **Refresh data**.

## Deploy Power BI reports using pipelines

1. Sign in to [Power BI](https://msit.powerbi.com/home).
1. From the left navigation pane, select **Deployment pipelines**.

    :::image type="content" source="media/process-mining-alm-pbi-pipelines-and-rebinding/deployment-pipelines.png" alt-text="Screenshot of the Deployment pipelines icon in the 'More' menu.":::

1. Create a new Power BI pipeline by following these steps:
    1. Select **New pipeline**.
    1. In the **Pipeline name** and **Description (optional)** fields, enter a name and description.
    1. Select **Next**.
    1. Customize your stages.

        For this example, we use **Dev** and **Test**. If you see others, select the trash can icon next to it.

    :::image type="content" source="media/process-mining-alm-pbi-pipelines-and-rebinding/customize-your-stages.png" alt-text="Screenshot of customizing your stages.":::

    1. Select **Create**.

1. Assign workspaces for the pipeline.
    1. For the **Dev** stage: From the dropdown menu, select your **WkSpace A** > **Assign a workspace**.
    1. For the **Test** stage: From the dropdown menu, select your **WkSpace B** > **Assign a workspace**.

         In the following screenshot, your environments might use a different name.

    :::image type="content" source="media/process-mining-alm-pbi-pipelines-and-rebinding/assign-pipeline-workspaces.png" alt-text="Screenshot of assigning workspaces for a pipeline.":::

    The visual that compares the contents of each workspace now shows.

1. From your **ALM A** workspace, select **Deploy** > **Deploy**.

    :::image type="content" source="media/process-mining-alm-pbi-pipelines-and-rebinding/deploy.png" alt-text="Screenshot of how to deploy to the next stage.":::

    When deployment is complete, go to your **WkSpace B**, which contains items copied over from your **WkSpace A**.

    :::image type="content" source="media/process-mining-alm-pbi-pipelines-and-rebinding/deployed-wkspaace-b.png" alt-text="Screenshot of items from WkSpace A and WkSpace B.":::

## Rebind your semantic model

The final step is to rebind the semantic model in the **ALM B** workspace to the report from the **ALM A** workspace.

1. Go to your **WkSpace B**, and then select **Report A**.

    It's normal to see issues with loading the report.

1. To download the report, from the command bar, select **File** > **Download this file** > **A copy of your report with a live connection…** > **Download**.
1. After downloading, open the file in Power BI desktop.
1. From the command bar, select **Transform data** > **Data source settings**.
1. From the list of semantic models, select the **Report B_Dataset_206…** semantic model.
1. Select **Connect**.

    :::image type="content" source="media/process-mining-alm-pbi-pipelines-and-rebinding/report-206-rebind.png" alt-text="Screenshot of connecting a semantic report.":::

    The procedure is a success if the report has report customizations from the **Report A** but uses the semantic model from the original **Report B**.

1. When you finish, select **Save** > **Publish** from the command bar and publish to your **WkSpace B**.
1. When complete, go to **Power BI web** and go to your **WkSpace B** workspace. The new report is now in the workspace. You can also rename it.
1. You can clean up the workspace by deleting the semantic models and reports that you don't need.

