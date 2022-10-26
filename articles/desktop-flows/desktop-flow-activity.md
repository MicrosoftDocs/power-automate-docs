---
title: Desktop flow activity (preview) | Microsoft Docs
description: Desktop flow activity (preview)
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 10/26/2022
ms.author: gtrantzas
ms.reviewer: quseleba
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Desktop flow activity (preview)

As you scale the automation of your business processes, you may need access to aggregated data to monitor your desktop flows effectively. The **Desktop flow activity** section of the Power Automate portal (**Monitor** -> **Desktop flow activity**) provides dashboards, tables, and graphs to monitor desktop flows, measure effectiveness, and quickly identify issues.  

You can filter the presented data by date, desktop flow, cloud flow, machine, run mode, run status, and error. Filtering enables you to focus on a specific range of data and handle them more efficiently.

>[!NOTE]
>
>- Some filters may not be available for some pivots because of the nature of the presented data.
>- When you move between pivots, the tab keeps the active filtering selection. Select **Clear filters** to reset the applied filters.

## Monitor desktop flow runs

The **Last runs** section provides graphs and tables to get meaningful insights about your desktop flows runs, such as the number of runs, the percentage of errors, and the run modes.

You can find information regarding each table in the following list.

- **Completed desktop flows**: This card provides the number of desktop flow runs in a select period of time.

- **Desktop flows runs and error rate**:  This chart shows the number of desktop flows runs and the error percentage by date. If no desktop flows run for one or several days, the corresponding data aren't available in the table.

- **Desktop flow completion status**: This donut chart displays the proportion of desktop flows that succeeded, failed, or got canceled.

- **Run status – Trends**: This stacked area chart helps you understand how your flows work across time. Use this cart to quickly identify if there was a particular issue during a dedicated time period, such as too many failures and low number of runs.

- **Top desktop flows runs status**: This card presents the desktop flow that ran the most during a dedicated time period. For each presented desktop flow, the card gives details about the run mode (attended, unattended or local) and the run status (successful, skipped, failed, canceled). If you want to review other desktop flows, select **few desktop flows** in the appropriate filter.

- **Last desktop flows runs**: This card displays the latest completed desktop flows runs.

[![Screenshot of the Last runs section of the Desktop flow activity.](media\desktop-flow-activity\desktop-flow-activity-runs.png "Screenshot of the Last runs section of the Desktop flow activity.")](media\desktop-flow-activity\desktop-flow-activity-runs.png#lightbox)

## Monitor desktop flow errors

You can use the **Errors** section to identify the most common errors that occur while your flows run. These pivot tables provide information about desktop flows, cloud flows, and machines in which errors occurred, allowing you to view details to identify the source of errors.

By default, this section displays the desktop flow run errors for the last seven days. Optionally, you can select another time period and filter on specific(s) errors.

You can find information regarding each table in the following list.

- **Top errors**: This card displays the errors that occur most frequently during your desktop flow runs.  If you can't see a specific error in the card, select the **All errors** filter, and then choose the error that you want to see.

- **Top failed desktop flows**: This card displays the desktop flows that failed the most in your environment. You can select each desktop flow to display its details page.

- **Top cloud flows with failed desktop flows**: This card provides a list of cloud flows that are the most impacted by failures in desktop flows. For example, if a cloud flow contains two desktop flows and these desktop flows failed two times each, you'll see this cloud flows with a count of four errors.  

- **Top machine failures**: This card displays information about the machines on which desktop flow runs failed most frequently. You can select each machine name to display its details page.

- **Error trends**: This chart displays daily trends for errors in desktop flow runs. These trends can help you to identify if an error started to appear recently or several days ago. In addition to trends per error, the chart can display trends per desktop flow and machine. Select the dropdown menu of the table to display the type of pivot you prefer.

[![Screenshot of the Errors section of the Desktop flow activity.](media\desktop-flow-activity\desktop-flow-activity-errors.png "Screenshot of the Errors section of the Desktop flow activity.")](media\desktop-flow-activity\desktop-flow-activity-errors.png#lightbox)

## Available data for admins and makers

The **Desktop flow activity** section is helpful for Center of Excellence (CoEs) who want to monitor all activity in an environment and makers who want to get an aggregated view of their automation.

If you're the admin of the current environment, you can see all the desktop flows, machines, and machine groups that exist in Dataverse for the environment. If you're a maker, you can see all your desktop flows and machines, including the flows that others share with you.

> [!NOTE]
> If a cloud flow appears as **private flow**, it means that it isn't shared with you. Cloud flows aren't saved in Dataverse, and environment admins need to [get access to the flows](../create-team-flows.md) to read details about them.
