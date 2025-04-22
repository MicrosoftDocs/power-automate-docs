---
title: Rebind reports using a composite model - different workspaces
description: Learn how to rebind reports using a composite model with different workspaces.
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
#customer intent: As a business process analyst, I want to migrate customizations of my Process Mining report from one workspace to another so that the report customizations appear where I need them.
---

# Rebind reports using a composite model (different workspaces)

To migrate customizations of your Process Mining report from one workspace to another, follow the steps in this article. Learn more about composite models in [Use composite models in Power BI Desktop](/power-bi/transform-model/desktop-composite-models) and [Customize reports in Power BI workspace](process-mining-pbi-workspace.md#customize-reports-in-power-bi-workspace) or [Customize reports in Fabric workspace (preview)](process-mining-fabric-workspace.md).

If your process in the Test environment is connected to a different workspace (for example, WkSpace B) than the one used in the Dev environment (for example, WkSpace A), follow the steps in this article.

## Attach a workspace to your process

[!INCLUDE[alm-attach-workspace](./includes/alm-attach-workspace.md)]
[!INCLUDE[alm-attach-with-and-without](./includes/alm-attach-with-and-without.md)]

7. Sign in to [Power BI](https://msit.powerbi.com/home).

Before you get started, ensure that the states of your reports, workspaces, and their lineages correspond to what's in the following sections.

## State of your Report A

The following report and its composite model are in WkSpace A. Your report can look like this, or have customizations of your choice.

:::image type="content" source="media/process-mining-alm-rebind-with-comp/state-of-report-a.png" alt-text="Screenshot of Report A dashboard with a process map, case percentages, duration of cases, and other variants.":::

### State of your WkSpace A

Your **WkSpace A** should have the following entities:

|Number  |Description  |Entity  |
|:-:|---------|---------|
|1  | The original report of your process.        | **Report A**        |
|2  | The original semantic model of your process.  | **Report_A_Dataset_206…**   |
|3  | The updated report with the composite model.    | **Report A**  |
|4  | The composite model.   | **Report A**   |

The numbering corresponds with the numbering of entities in the following screenshot.

There are three (3) entities titled **Report A**. You can differentiate them using their icons and their **Refreshed** timestamps:

- The icon with yellow bars represents the reports. The other icon is that of the composite model or semantic model.
- The report with the same **Refreshed** timestamp as the composite model is the report of the composite model.

    :::image type="content" source="media/process-mining-alm-rebind-with-comp/state-of-workspace-a.png" alt-text="Screenshot of entities and refreshed timestamps for WkSpace A using different workspaces.":::

Your lineage view should look like the following screenshot. The semantic model points to the composite model, which then points to a report.

:::image type="content" source="media/process-mining-alm-rebind-with-comp/wkspace-a-semantic.png" alt-text="Screenshot of the semantic model pointing to the composite model, which then points to a report.":::

### State of your WkSpace B

Your **WkSpace B** should have the following entities:

|Number  |Description  |Entity  |
|:-:|---------|---------|
|1  | The original report of the process you transferred from the Dev environment.   | **Report A**        |
|2  | The original semantic model of the process you transferred from the Dev environment.  | **Report_A_Dataset_206…**   |

The numbering corresponds with the numbering of entities in the following screenshot.

:::image type="content" source="media/process-mining-alm-rebind-with-comp/state-of-workspace-b.png" alt-text="Screenshot of entities and refreshed timestamps for WkSpace B using different workspaces.":::

Your lineage views should like the following screenshot. A semantic model points to a report:

:::image type="content" source="media/process-mining-alm-rebind-with-comp/wkspace-b-semantic.png" alt-text="Screenshot of the lineage view of the semantic model pointing to a report.":::

To understand the distinctions between each entity, familiarize yourself with the entities before you proceed.

## Rebind the report in Power BI

[!INCLUDE[alm-rebind-in-power-bi](./includes/alm-rebind-in-power-bi.md)]

5. From the home tab, select **Transform data** > **Data source settings**. Notice the **Direct Query connection** in the Data source settings.
1. Select **Change Source**.
1. Search for and select for the semantic model of the process that was created in Test. Its semantic model is in your **WkSpace B**.
1. Select **Create**.

    :::image type="content" source="media/process-mining-alm-rebind-with-comp/select-dataset-to-create-report.png" alt-text="Screenshot of the semantic model of the process that was created in your Test environment.":::

1. When the **Connect to your data** message appears, select relevant tables, and then select **Submit**.
1. When the query changes are applied, select **Close**.
1. Save the report.
1. From the **Home** tab, select **Publish**.
1. Select your **WkSpace B** as the destination, and then choose **Select**.
1. When the publishing completes, go to your **WkSpace B** in Power BI to confirm the changes were applied.

    The lineage view now shows the composite model. In the following screenshot, it's the first red box.

    :::image type="content" source="media/process-mining-alm-rebind-with-comp/composite-b.png" alt-text="Screenshot of the lineage view of the composite model.":::

1. Select the **Report A** that the composite model points to. In the previous screenshot, it's the second red box.
1. Select **Open report**.

    The report looks like that of the composite model from **WkSpace A** with the **Self Loop** percentage in the report.

    :::image type="content" source="media/process-mining-alm-rebind-with-comp/self-loop-b.png" alt-text="Screenshot of the composite model with the 'Self Loop' percentage.":::
