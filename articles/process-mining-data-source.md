---
title: Edit and refresh processes
description: Learn how to edit and refresh processes with the process mining capability in Power Automate.
author: donums
contributors:
  - donums
  - v-aangie  
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 07/18/2023
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Edit and refresh processes

Process mining is a technique used to extract insights from event logs of a process. During the process, it is common to make edits to the mapping or query of an existing process. The following are some of the reasons why you might want to edit your process:

- Your data might have multiple ID columns that can be used as case ID, and changing what you use as a case ID might help you discover more insights.

- Some attributes may be mapped to something more specific, which can provide additional options during analysis, like financial or resource attribute types.

- If you have transformed your data in Power Query, you may want to adjust the transformation if the resulting process is not what you need.

## Edit mapping and query

To edit your mapping or query, follow these steps:

1. In the process details page, select **Setup** to return to the mapping page.

1. To change the case ID or other mappings, select the values in the dropdown menu that correspond to the column name from the original data.

1. For more advanced edits, select **Transform data in Power Query** on the top right.

1. In the Power Query editor, you can edit the applied steps, like choose columns, by selecting (or double-clicking) the corresponding step in the **Applied steps** area under **Query settings**. If you want to add a new step, select it in the toolbar.  

    Otherwise, select the step you want to add in the toolbar.

   > [!WARNING]
   >
   > Avoid selecting options like **Choose columns** again in the toolbar if they are already listed in the applied steps, as it will be added as a new step to the end of applied steps. This means that if you already applied the **Choose columns** step, the new **Choose columns** step will give you fewer options to choose from, since the original **Choose columns** step already filtered down the list of available columns.

     :::image type="content" source="media/process-mining-data-source/applied-steps-warning.png" alt-text="Screenshot of the Applied steps in the Query settings dialog.":::

## Refresh data

If you have a transactional data source, like Dataverse or SQL, select **Refresh data** to update your process with the latest data from your data source. The refresh process may take some time, and you will be prompted to confirm the refresh by selecting **Refresh** again.

## Schedule refresh

To keep your data updated, you can use the schedule refresh feature. Select **Schedule refresh** on the right side of the Data Source card to display the schedule refresh panel. By default, the **Keep data up to date** toggle is on, and you can save the default configuration, which is to schedule a refresh every day starting tomorrow at the time you configure by clicking **Save** directly. You can change the default settings by interacting with the controls on the schedule refresh panel to change the interval, the period (day, week, month), the start date and time. Note that the highest refresh frequency is currently every 1 day.

Once schedule refresh is configured, you will see the details in the Data Source card, including the next scheduled refresh date and time.

## Incremental data refresh

For larger data volumes, Power Automate Process Mining allows to schedule an incremental data refresh. This allows to ingest only newly added data instead of full event log.

You can find more information on how to setup the incremental data refresh on the individual pages related to the ingestion type:
- [Incremental data refresh from Azure Data Lake Storage Gen 2](process-mining-byo-azure-data-lake#define-incremental-data-refresh-settings)
- [Incremental data refresh from Fabric OneLake](process-mining-files-fabric-onelake#define-incremental-data-refresh-settings)

## Custom trigger data refresh

In some scenarios it is required to run a data refresh based on external trigger (e.g. a data pipeline execution is finished, an event is fired in an external system) rather than on a scheduled basis. To achieve this, it is possible to an ad hoc refresh using a triggered flow:

1. Create a Power Automate cloud flow based on your desired trigger mechanism - to learn how to create triggered cloud flows see [Overview of cloud flows](/power-automate/overview-cloud)

2. Include a Dataverse bound action - to learn how to use a bound action see [Perform bound actions or unbound actions](/power-automate/dataverse/bound-unbound)

3. Use the following configuration for the bound action:
-  Table name: **PM Inferred Tasks**
-  Action name: **Analyze**
-  Row ID: **GUID of the process** - this can be found in the URL of the process after the *processes* keyword: ```https://make.powerautomate.com/environments/00000000-0000-0000-0000-000000000000/processadvisor/processes/00000000-0000-0000-0000-000000000000```
-  Advanced parameters - Item/version: **"1"** (including the quotes)

:::image type="content" source="media/process-mining-data-source/bound-action.png" alt-text="Screenshot of the Bound action settings.":::

4. Test and run the flow. You can check the success of the execution in the *Flow history* or on the *Process details* page by checking the *Analyzed* datetime field.

## Disconnect data

If you want to change the data source for your process, you can easily do this. For example, you might have been using a CSV file before, but now you want to connect to a transactional data source instead. To disconnect your current data source, select **Disconnect data** on the right side of the Data Source card. Once you have disconnected, select **Setup** again to connect to your new data source.
