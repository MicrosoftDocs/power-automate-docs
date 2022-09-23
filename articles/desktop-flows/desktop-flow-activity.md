---
title: Desktop flow activity (preview) | Microsoft Docs
description: Desktop flow activity (preview)
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 08/26/2022
ms.author: v-gtrantzas
ms.reviewer: 
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Desktop flow activity (preview)

As you scale the automation of your business processes, you may need access to aggregated data to monitor your desktop flows effectively. The **Desktop flow activity** section of the Power Automate portal (**Monitor** -> **Desktop flow activity**) provides dashboards, tables, and graphs to monitor desktop flows, measure effectiveness, and quickly identify issues.  

## Monitor desktop flow errors

You can use pivot tables to help you identify the most common errors that occur while your flows run. These pivot tables provide information about desktop flows, cloud flows, and machines in which errors occurred, allowing you to view details to identify the source of errors.

By default, the **Desktop flow activity** section displays the desktop flow run errors for the last seven days. Optionally, you can select another time period and filter on specific(s) errors.

You can find information regarding each table in the following list.

- **Top errors**: This card displays the errors that occur most frequently during your desktop flow runs.  If you can't see a specific error in the card, select the **All errors** filter, and then choose the error that you want to see.

- **Top failed desktop flows**: This card displays the desktop flows that failed the most in your environment. You can select each desktop flow to display its details page.

- **Top cloud flows with failed desktop flows**: This card provides a list of cloud flows that are the most impacted by failures in desktop flows. For example, if a cloud flow contains two desktop flows and these desktop flows failed two times each, you'll see this cloud flows with a count of four errors.  

- **Top machine failures**: This card displays information about the machines on which desktop flow runs failed most frequently. You can select each machine name to display its details page.

- **Error trends**: This chart displays daily trends for errors in desktop flow runs. These trends can help you to identify if an error started to appear recently or or several days ago. In addition to trends per error, the chart can display trends per desktop flow and machine. Select the dropdown menu of the table to display the type of pivot you prefer.

[![Screenshot of the Desktop flow activity section.](media\desktop-flow-activity\desktop-flow-activity-section.png "Screenshot of the Desktop flow activity section.")](media\desktop-flow-activity\desktop-flow-activity-section.png#lightbox)

## Available data for admins and makers

The **Desktop flow activity** section is helpful for Center of Excellence (CoEs) who want to monitor all activity in an environment and makers who want to get an aggregated view of their automation.

If you're the admin of the current environment, you can see all the desktop flows, machines, and machine groups that exist in Dataverse for the environment. If you're a maker, you can see all your desktop flows and machines, including those that others share with you.

> [!NOTE]
> If a cloud flow appears as **private flow**, it means that it isn't shared with you. Cloud flows aren't saved in Dataverse, and environment admins need to [get access to the flows](../create-team-flows.md) to read details about them.