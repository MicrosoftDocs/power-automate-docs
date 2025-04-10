---
title: Rebind reports using a composite model - same workspace
description: Learn how to rebind Process Mining reports using a composite model if your Test and Dev workspaces are linked.
author: janPidych
contributors:
  - janPidych
  - rosikm
  - hamenon-ms
  - donums
  - v-aangie  
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 04/03/2025
ms.author: janpidych
ms.reviewer: ellenwehrle
search.audienceType: 
  - flowmaker
  - enduser
#customer intent: As a business process analyst, I want to learn how to rebind my Process Mining reports using a composite model with the same workspace so that the report customizations appear where I need them.
---

# Rebind reports using a composite model (same workspace)

If you linked your process in your Test environment to a workspace (for example, WkSpace B) that's the same as the one used for the process in your Dev environment (for example, WkSpace A), follow the steps in this article.

## Attach a workspace to your process

Take these steps to attach a workspace to your process:

[!INCLUDE[alm-attach-workspace](./includes/alm-attach-workspace.md)]

4. If you newly imported the process, continue to step 5. If you didn't newly import the process, go to step 7.
1. Select the type of workspace to be used - Power BI workspace or Fabric workspace
    1. The dialog informs you whether you originally exported the process to Power BI or Fabric workspace
    2. Select the same type of workspace
    3. Select **Continue**
1. Select the same workspace for this process by following these steps:
    1. For Power BI workspace - in the **Power BI workspace** dropdown menu, select the *same workspace* as the previous workspace.
    1. For Fabric workspace - in the **Fabric workspace** dropdown menu, select the *same workspace*, in the **Lakehouse** dropdown menu select the same destination Lakehouse.
    1. In the **Report Name** field, enter a *different report name* from your previous report name.

        > [!IMPORTANT]
        > The report name must be different from your previous report name.

    1. To continue setting up the process, select **Continue**.

    :::image type="content" source="media/process-mining-alm-rebind-with-comp/new-workspace-same-with.png" alt-text="Screenshot of selecting a new workspace for your process with a different report name from your previous report.":::

1. (If you didn't newly import the process) Attach a custom Power BI workspace to the process:
    1. Go to the process details page for the process.
    1. On the **Details** card, select **Edit**.
    1. From the **Power BI workspace (optional)** dropdown menu, select your **WkSpace A** Power BI workspace.
    1. Provide a *different report name* from the name you used for the process in Dev environment.

        > [!IMPORTANT]
        >
        > The report name must be different from the report name of the process in Dev environment.

    1. Select **Save** > **Continue**.
    1. From the command bar or in the report view, select **Refresh data**.
1. Sign in to [Power BI](https://msit.powerbi.com/home).

Before you get started, ensure that the states of your reports, workspaces, and their lineages correspond to what's in the following sections.

### State of your WkSpace A

Your **WkSpace A** should have the following entities:

|Number  |Description  |Entity  |
|:-:|---------|---------|
|1  | The original report of your process.        | **Report A**        |
|2  | The original semantic model of your process.  | **Report_A_Dataset_206…**   |
|3  | The updated report with the composite model.    | **Report A**  |
|4  | The composite model.   | **Report A**   |
|5  | The original report of the copied process.  | **Report B**  |
|6  | The original semantic model of the copied process   | **Report_B_Dataset_206…** |

The numbering corresponds with the numbering of entities in the following screenshot.

There are three (3) entities titled 'Report A'. You can differentiate them using their icons and their **Refreshed** timestamps:

- The icon with the yellow bars represents the reports and the other icon is that of the composite model or semantic model.
- The report with the same **Refreshed** timestamp as the composite model is the report of the composite model.

    :::image type="content" source="media/process-mining-alm-rebind-with-comp/state-of-workspace-a-same.png" alt-text="Highlights a report showing entities and refreshed timestamps.":::

Your lineage view should look like the following screenshot:

:::image type="content" source="media/process-mining-alm-rebind-with-comp/wkspace-a-semantic-same.png" alt-text="Highlights the lineage view of the semantic model.":::

## Rebind the report in Power BI

Take these steps to rebind the report in Power BI:

[!INCLUDE[alm-rebind-in-power-bi](./includes/alm-rebind-in-power-bi.md)]

5. From the **File** menu, select **Save as** and give the report a new name such as **Report B**.
6. From the home tab, select **Transform data** > **Data source settings**. Notice the **Direct Query connection** in the Data source settings.
7. Select **Change Source**.
8. Search for and select the semantic model of the process that's in your Test environment. The semantic model is **Report B_Dataset_206…** and it should be in your **WkSpace A**.
9. Select **Create**.

    :::image type="content" source="media/process-mining-alm-rebind-with-comp/select-dataset-to-create-report-same.png" alt-text="Shows selecting a dataset to create a report using the same workspace.":::

10. When the **Connect to your data** message appears, select relevant tables, and then select **Submit**.
11. When the query changes are applied, select **Close**.
12. Save the report.
13. From the **Home** tab, select **Publish**.
14. Select your **WkSpace A** as the destination, and then choose **Select**.
15. When the publishing completes, go to your **WkSpace A** in Power BI to confirm the changes are applied.

    The lineage view now shows the composite model.

    :::image type="content" source="media/process-mining-alm-rebind-with-comp/state-of-workspace-a-same-lineage.png" alt-text="The lineage view now highlights the composite model.":::

16. Select the **Report B** that the composite model points to. It's the second red box in the previous image.
17. Select **Open report**.

    The report looks like that of the composite model from **WkSpace A** with the **Self Loop** percentage in the report.

    :::image type="content" source="media/process-mining-alm-rebind-with-comp/self-loop-b.png" alt-text="Shows the composite model highlighting the 'Self Loop' percentage.":::
