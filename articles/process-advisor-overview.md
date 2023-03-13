---
title: Process advisor overview
description: Get an overview of process advisor capabilities.
author: donums
contributors:
  - donums
  - v-aangie  
  - tatn
ms.subservice: process-advisor
ms.topic: overview
ms.date: 03/15/2023
ms.author: derahonuorah
ms.reviewer: angieandrews
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
  - analyst
---

# Overview of process advisor

The process advisor feature allows you to gain a better understanding of your business processes so you can optimize them. Process advisor offers *task mining* and *process mining* capabilities to do this.

Task mining and process mining share the same goal of improving process efficiency. The main difference is their area of focus.

- **Process mining:** Process mining is better suited for discovery of inefficiencies in organization-wide processes. It enables you to gain a deep understanding of your processes using event log files that you can get from your system of recording (apps you use in your processes). Process mining displays maps of your processes with data and metrics to recognize performance issues. Example processes suitable for process mining include *accounts receivable* and *order-to-cash*.

   Process mining can be a key driver in making intelligent, day-today improvements on every level. You can discover and model processes for which you have data readily available, giving you an X-ray visualization of what goes on in your organization. In addition, you can standardize, optimize, and improve operations, while staying informed about progress towards defined key process indicators.

- **Task mining:** Task mining is better suited to discover tasks happening on the desktop. It enables you to zoom-in to specific desktop tasks you might have discovered during your process mining analysis. You can understand how your company performs its process tasks through monitoring recorded user actions and collecting data from these actions. You'll gain insights from this data that will let you know how processes are performed, find common mistakes while performing tasks, and identify tasks that can be automated.

## When to use process mining

Here are some reasons to help you decide to use process mining.

- See the actual steps needed to perform your organization’s operation process and remove any guesswork.

- Save time and money by optimizing processes.

- Detect non-compliant processes and/or tasks.

- Discover automation opportunities.

- Compare processes.

- Understand where and why problems occur.

Explore the topics in [Process mining (preview)](process-mining-overview.md) and [Task mining](task-mining-overview.md) in this documentation for the following:

- Business scenarios

- Understand where and why problems occur.

## When to use task mining

Here are some reasons to help you decide to use task mining.

- Understand what employees actually do while performing each task on their desktops.

- Identify and eliminate unnecessary actions in process tasks.

- Identify the most common actions through user interactions.

- Ensure compliance and perform audit.

- Automate tasks that would accelerate processes and reduce human errors.

## What you'll find in this documentation

Explore the topics in [Process mining (preview)](process-mining-overview.md) and [Task mining](task-mining-overview.md) in this documentation for the following:

- Business scenarios

- Tutorials

- Guided procedures

- Videos

## Licensing

Process advisor is licensed as part of Power Automate per-user licenses. If you don’t have a license, you can start a Power Automate premium trial to try process advisor. The per-user licenses enable users to analyze processes and view the analytics report.

**Task mining capability:** A *Power Automate per-user license* enables a user to analyze a recorded process and view the analytics report. Note that contributing recordings to a process does not need the per-user license.

**Process mining capability:** A *Power Automate per-user license with attended RPA* enables a user to create a process, connect to an event log using data flows, analyze a process from data, and view the analytics report in the web.

**Process mining add-on:** A separately purchasable add-on is required to do the following:
- Use of the [desktop application](minit/minit-desktop-application-overview.md) which provides many features to get deep insights into your process
- Customize the analytics report by publishing it into your own Power BI workspace

For inquiries about add-on capability licensing, contact minitq@microsoft.com

**Trial license:** You can start a free 90 day Power Automate premium trial will provide access to all available capabilities listed above, including the add-on capability. Note that there is a process size limit for any processes created while on the trial.

**Power BI license:** To customize your report, you need to link the process to your own Power BI workspace, and a Power BI premium per-user license (or better) is needed. To learn more about Power BI licensing, go to [Power BI pricing](https://powerbi.microsoft.com/en-us/pricing/).

**Preview:** Note that some features are in preview, denoted by the preview tag, and for process templates that are still in preview, license and trial are not needed.

**Dataverse capacity:** Depending on the size of the process data you import, you might run out of Dataverse storage capacity. If this happens, you'll need to contact your admin about purchasing more storage capacity, or delete existing processes to free up storage. The process data we store will mostly use file capacity. To learn more about Dataverse storage capacity, go to [New Microsoft Dataverse storage capacity](/power-platform/admin/capacity-storage).

## Prerequisites

Before you start using process advisor capabilities, make sure you have the following prerequisites:

- The required licenses or trials depending on the capabilities you want access to (see above).

- A Microsoft Power Platform environment with a Microsoft Dataverse database.  

  - To learn how to create an environment, go to [Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment).  

  - To learn how to add a database to an environment, go to [Add a Microsoft Dataverse database](/power-platform/admin/create-database).  

- Adequate roles are assigned for users that want to use process advisor. Typically an Environment Maker security role is recommended. Go to [Security and privacy](process-advisor-security.md) to learn more.

Additional considerations for specific capabilities:

- For process mining, download the [minit desktop application](minit/how-to-start-with-minit-desktop-application.md).

- To customize your report, you need to [set up your Power BI workspace](process-mining-pbi-workspace.md) and [register the process advisor service principal in Azure AD](process-mining-pbi-workspace.md#install-azure-tools).

- For task mining, download [Power Automate for desktop](desktop-flows/install.md).
