---
title: Troubleshoot issues in the process mining capability
description: Learn how to troubleshoot issues in the process mining capability in Power Automate.
author: donums
contributors:
  - donums
  - rosikm
  - v-aangie  
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/18/2023
ms.author: derahonuorah
ms.reviewer: angieandrews
ms.custom: bap-template
search.audienceType: 
  - flowmaker
  - enduser
---

# Troubleshoot issues in the process mining capability

This article explains common issues and error messages in the process mining capability. You'll find solutions to troubleshoot with procedures and helpful tips.

## Issues with dataflow refresh

### "There was an issue with a recent dataflow refresh, check your dataflow refresh history."

When you go through setup, the process mining capability creates a dataflow that's tied to the process. Normally you don’t need to interact with the dataflow, but if there are issues with the dataflow refresh, you might need to troubleshoot them. Dataflow refresh is what reads the data source and makes it ready to be analyzed.

To troubleshoot:

1. Make a note of the environment in the environment display on the upper-right corner of the page.

1. Make a note of the value of **Name** in the Data Source card below the Details card.

1. Sign in to [Power Apps](https://make.powerapps.com).

1. Select the same environment that you noted in step 1.

1. Select **More** > **Dataflows**.

     :::image type="content" source="media/process-mining-troubleshoot/dataflows.png" alt-text="Screenshot of the Dataflows screen.":::

1. Find the dataflow name that you noted in step 2.

1. View the issue by selecting the **Warning** icon in the **Last refresh** column.

     :::image type="content" source="media/process-mining-troubleshoot/warning.png" alt-text="Screenshot of the Warning icon.":::

1. Download the report by selecting the **Download** icon in the **Actions** column.

1. Open the report to see details of the issue.

### "There was an issue with your Dataverse access privileges for dataflows"

When you go through setup, the process mining capability creates a dataflow that's tied to the process. A dataflow requires certain sets of Dataverse privileges. If these privileges are revoked or altered, it may result in this issue.

To troubleshoot, system administrators can review the privileges on the dataflow tables for the environment Maker role, and ensure they have the default privileges at the **Organization** level set.

:::image type="content" source="media/process-mining-troubleshoot/tables.png" alt-text="Screenshot of the privileges on the dataflow tables for the environment Maker role.":::

## Issues with analyze

### Failure when analyzing

If you encounter an error message while attempting to create and analyze a process, it may be due to a missing security role. To resolve this, contact the administrator of your environment and request that they assign you the **Environment Maker** security role.

### Analyze a process

Once you're done with setup, select **Analyze**. You'll be able to view the Analytics page when the analysis is complete. Analysis typically takes a few minutes but may be faster or slower depending on how much data needs to be analyzed.

> [!NOTE]
>
> If you don't visit the Analytics page for 14 days, you need to re-analyze the process to access the Analytics page again.

For more information and a short video of analytics, go to [Use KPIs and visualizations for analytics](process-mining-visualize.md#use-kpis-and-visualizations-for-analytics).

### "The process can't be analyzed because there are too many processes in this environment. To fix this, delete some of the processes or use a different environment."

At present, Dataverse-managed Power BI workspaces allow only 1,000 reports for each environment. This means you need to delete a few processes from the current environment, or create a new environment to analyze the process in. To learn more about limitations, go to [Workspaces in Power BI&mdash;Considerations and limitations](/power-bi/collaborate-share/service-new-workspaces#considerations-and-limitations).

To delete a process follow these steps:

1. Select **Processes** from the breadcrumbs on the analytics or details page, or select **All procesess** from the **Process mining** home page.

    :::image type="content" source="media/process-mining-troubleshoot/processes-breadcrumbs.png" alt-text="Screenshot of 'processes' in the breadcrumbs.":::

1. Select the vertical ellipses (**&vellip;**) for the process you want to delete, and then select **Delete process** from the dropdown menu.

    :::image type="content" source="media/process-mining-troubleshoot/delete-process.png" alt-text="Screenshot of deleting a process from the dropdown menu.":::

1. To delete the process, select **Confirm**.

### "You must have one case with at least two activities to analyze your process. Please change your data."

Process mining isn't normally helpful when there's only one activity name in the data. This is because the process map visualizes the flow of the process from one activity to the next. In this case, you should do the following:

- Check the column that's been mapped to activity name.
- Confirm that there's only one value for that column.
- Determine if there's another column that contains something with more than one possible value that can represent activities of the process.

### "Following column(s) do not have the right data types: [x]. Please check your data and try again."

The *case ID* and *activity name* columns should be of the **Text** data type. The *timestamp* columns should be of the **Date/Time** data type. One of the most frequent causes of invalid format is in the *timestamp* column. To fix the format, return to setup and select the icon next to the *timestamp* column, and ensure it's been mapped to **Date/Time**.

:::image type="content" source="media/process-mining-troubleshoot/timestamp.png" alt-text="Screenshot of the Date/Time data type for StartTimestamp.":::

If the format is incorrect, you see something like this:

:::image type="content" source="media/process-mining-troubleshoot/timestamp-error.png" alt-text="Screenshot of errors in StartTimestamp.":::

One possibility is that although the *timestamp* column has a valid datetime format, the format is valid for a different locale than the locale that the process is created in. A typical example is this datetime format being used in the United States locale: **dd/mm/yyyy hh:mm:ss**. In this case, we won't automatically detect that column as a datetime column. One way to fix this issue is by manually changing the locale. To do this:

1. Delete the **Changed column** type step that you did previously. Do this by selecting **X** next to the last applied step in the Query settings pane on the right.

    :::image type="content" source="media/process-mining-troubleshoot/changed-column.png" alt-text="Screenshot of Changed columns.":::

1. On the toolbar, select **Options** > **Project options**.

1. On the **Locale** dropdown list, select the correct locale and then select **OK**.

1. Use the same method to set the *timestamp* column to the **Date/Time** data type again.

Where the format is **dd/mm/yyyy hh:mm:ss**, setting the locale to **English (Canada)** should result in successful conversion of the column type. For other cases, find the correct locale that supports your specific datetime format.

### "More than 50% of your data has invalid format. Please check your data and try again."

To fix this issue, go to [Following column(s) do not have the right data types: [x]. Please check your data and try again.](#following-columns-do-not-have-the-right-data-types-x-please-check-your-data-and-try-again)

### "Following column(s) are missing from your dataflow: [x]. Please check your data and try again."

This issue should occur only if you didn't properly map the columns in your data source to the columns. For more information, go to [Map data](process-mining-transform.md#map-data).

### "Your entity contains no data, check your dataflow and try again."

This issue should occur only if there's no data. Either the data source that you're connecting to has no data, or the power query expression you used filtered out all the data. Check your query and ensure that you can see some data rows in the preview table.

### "The number of rows in your data exceeds the limit. [x] rows have been ignored."

We support only up to 150,000 rows of data. To learn how to fix this issue using Power Query, go to [Reduce the number of total records](process-mining-transform.md#reduce-the-number-of-total-records).

### "Analysis failed, please try again."

You might have run into other analyze issues. For more ways that we can support you, go to [Support](https://make.powerautomate.com/support/), or post your issue in the [Community Forums](https://community.dynamics.com/forums/thread/).

## Issues with your own Power BI workspace

### "You must be an admin of the Power BI workspace to use it with this report."

You must be an admin of your Power BI workspace. To learn more about user access and permissions, go to [Give users access to workspaces](/power-bi/collaborate-share/service-give-access-new-workspaces).

### "You must be an admin of the Power BI workspace to use it with this report. After you become an admin, try to reanalyze the report."

This is the same as the previous issue, but the error occurred during process analysis. Once you become an admin using the fix from the previous issue, reanalyze the report.

### "The process mining service principal must be an admin of the Power BI workspace to refresh this report."

Enable admin access for the process mining capability prod service principal. To learn how to give the service principal admin access, go to [Create your own custom Power BI workspace](process-mining-pbi-workspace.md#create-your-own-custom-power-bi-workspace).

### "The process mining service principal must be an admin of the Power BI workspace to refresh this report. After the problem is fixed, try to reanalyze the report."

This is the same as the previous issue, but the error occurred during process analysis. After ensuring the process mining capability service principal is the admin of the workspace, reanalyze the report.

### "The process mining service principal cannot access the Power BI workspace."  

Set up the process mining capability service principal for your Power BI workspace. To learn how to set up, go to [Set up your workspace](process-mining-pbi-workspace.md#set-up-your-workspace).

### "The process mining service principal cannot access the Power BI workspace. After the problem is fixed, try to reanalyze the report."

This is the same as the previous issue, but the error occurred during process analysis. After ensuring that the process mining service principal is added to the workspace and has admin access, reanalyze the report.

### "The selected Power BI workspace needs premium capacity to work with this report."  

Assign a premium license to your workspace. To learn how to enable premium capacity, go to [Premium capacity settings](/power-bi/collaborate-share/service-create-the-new-workspaces#premium-capacity-settings).

### "The selected Power BI workspace needs premium capacity to work with this report. After the problem is fixed, try to reanalyze the report."

This is the same as the previous issue, but the error occurred during process analysis. After ensuring that your workspace has premium capacity per [Premium capacity settings](/power-bi/collaborate-share/service-create-the-new-workspaces#premium-capacity-settings), reanalyze the report.

## Issues with your own Azure Data Lake Storage Gen2 and incremental data refresh

### If you encountered an error message, "Couldn’t connect to container"

Revisit the prerequisites to make sure settings are correct.

### How can I check if a CORS issue exists or not?

You can check the network logs in your browser with developer tools while connecting data lake storage. Some HTTP requests failed with a 403 error and it could state "CORS not enabled, or no matching rule found for this request."

### Although I set CORS setting correctly, why do I still get the error and am unable to access?

The browser has cached CORS settings. Retry after flushing out browser cache. As the client browser does cache the CORS setting, you need to remove the cache if you have trouble even after you have set the CORS properly. You can also adjust the max age of CORS settings.

### Your header row is larger than 1 MB

Check the event log file and rename the column headers so that their aggregated length including separator (comma) is less than 1 MB.
