---
title: Desktop flows activity (preview) | Microsoft Docs
description: Desktop flows activity (preview)
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

# Desktop flows activity (preview)

As you scale the automation of business processes, you may need access to aggregated data to monitor your desktop flows effectively. The **Desktop flow activity** section of the Power Automate portal provides dashboards, tables, and graphs to monitor desktop flows, measure effectiveness, and quickly identify issues.  

## Monitor desktop flow errors

The provided pivot tables help you identify the most common errors that occur while running your flows. Their objective is to provide information regarding desktop flows, cloud flows, and machines impacted by errors and allow you to reach various details to identify the source of the issues. 
 
By default, the **Desktop flow activity** section displays the desktop flow run errors for the last seven days. Optionally, you can select another time period and filter on specific(s) errors. 

You can find information regarding each table in the following list:

- **Top errors**: This card represents the top errors that occurred during desktop flows running. If you can't see a specific error in the table, select the **All errors** filter, and choose the one you want to see. 

- **Top failed desktop flows**: This card displays the desktop flows that failed the most in your environment. You can select each desktop flow to reach its details page.

- **Top cloud flows with failed desktop flows**: This card provides you with a list of cloud flows that are the most impacted by failures of desktop flows. For example, if a cloud flow contains two desktop flows and these desktop flows failed two times each, you'll see this cloud flows with a count of four errors.  

- **Top machine failures**: This card displays the machine where the desktop flow runnings failed the most. You can select each machine name to reach its details page. 

- **Error trends**: This chart displays the trends day by day. It could help you to see if an error started to appear recently or if the failing is a regular phenomenon. In addition to trends per error, the chart can also present trends per desktop flow and machine. Select the dropdown menu of the table to change the type of pivot you prefer.

## Available data

The **Desktop flow activity** section is helpful for CoEs (Center of Excellence) who want to monitor all the activity in the environment and makers who want to get an aggregated view of their automations. 

If you're the admin of the current environment, you can see all the desktop flows, machines, and machine groups saved in Dataverse for this environment. If you're an environment maker, you can see all your desktop flows and machines, including the ones shared with you. 

> [!NOTE]
> If a cloud flow appears as **private flow**, it isn't shared with you. Cloud flows don't get saved in Dataverse, and even the environment admins need to [get access to the flows](../create-team-flows.md) to read details about them. 