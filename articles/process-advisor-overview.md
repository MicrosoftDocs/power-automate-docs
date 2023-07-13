---
title: Overview of process mining and task mining in Power Automate
description: Get an overview of process mining and task mining in Power Automate.
author: donums
contributors:
  - donums
  - v-aangie  
  - tatn
ms.subservice: process-advisor
ms.topic: overview
ms.date: 07/18/2023
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
  - analyst
---

# Overview of process mining and task mining in Power Automate

Process mining and task mining in Power Automate allow you to gain a better understanding of your business processes so you can optimize them.

## Process mining

The process mining capability in Power Automate is better suited for discovery of inefficiencies in organization-wide processes. It enables you to gain a deep understanding of your processes using event log files that you can get from your system of recording (apps you use in your processes). The process mining capability displays maps of your processes with data and metrics to recognize performance issues. Example processes suitable for the process mining capability include *accounts receivable* and *order-to-cash*.

The process mining capability can be a key driver in making intelligent, day-today improvements on every level. You can discover and model processes for which you have data readily available, giving you an X-ray visualization of what goes on in your organization. In addition, you can standardize, optimize, and improve operations, while staying informed about progress towards defined key process indicators.

## Task mining

The task mining capability in Power Automate is better suited to discover tasks happening on the desktop. It enables you to zoom-in to specific desktop tasks you might have discovered during your process mining analysis. You can understand how your company performs its process tasks through monitoring recorded user actions and collecting data from these actions. You gain insights from this data that lets you know how processes are performed, find common mistakes while performing tasks, and identify tasks that can be automated.

## When to use the process mining capability

Here are some reasons to help you decide to use the process mining capability.

- See the actual steps needed to perform your organization’s operation process and remove any guesswork.

- Save time and money by optimizing processes.

- Detect noncompliant processes and/or tasks.

- Discover automation opportunities.

- Compare processes.

- Find mistakes.

- Understand where and why problems occur.

Explore the topics in the documentation for the [process mining](process-mining-overview.md) and [task mining](task-mining-overview.md) capabilities in Power Automate for the following:

- Business scenarios

- Understand where and why problems occur.

## When to use the task mining capability

Here are some reasons to help you decide to use the task mining capability.

- Understand what employees actually do while performing each task on their desktops.

- Identify and eliminate unnecessary actions in process tasks.

- Identify the most common actions through user interactions.

- Ensure compliance and perform audit.

- Automate tasks that would accelerate processes and reduce human errors.

## What you'll find in this documentation

Explore topics in [process mining](process-mining-overview.md) and [task mining](task-mining-overview.md) in this documentation for the following:

- Business scenarios

- Tutorials

- Guided procedures

- Videos

## Licensing

Process mining is licensed as part of Power Automate per-user licenses. If you don’t have a license, you can start a Power Automate premium trial to try the process mining capability. The per-user licenses enable users to analyze processes and view the analytics report.

**Task mining capability:** A *Power Automate per-user license* enables a user to analyze a recorded process and view the analytics report. Contributing recordings to a process doesn't need the per-user license.

**Process mining capability:** A *Power Automate per-user license with attended RPA* enables a user to create a process, connect to an event log using data flows, analyze a process from data, and view the analytics report in the web.

**Power Automate Process Mining add-on license:** A separately purchasable add-on is required to do the following:
- Use [Power Automate Process Mining](minit/minit-desktop-application-overview.md), which provides many features to get deep insights into your process.
- Customize the analytics report by publishing it into your own Power BI workspace.

For inquiries about add-on capability licensing, contact [Microsoft Process and Task Mining Questions](mailto:minitq@microsoft.com).

**Trial license:** You can start a free 90 day Power Automate premium trial, which provides access to all available capabilities listed previously, including the add-on capability. There's a process size limit of 200 cases for processes created while on the trial.

**Power BI license:** To customize your report, you need to link the process to your own Power BI workspace, and a Power BI premium per-user license (or better) is needed. To learn more about Power BI licensing, go to [Power BI pricing](https://powerbi.microsoft.com/en-us/pricing/).

**Preview:** Some features are in preview, denoted by the preview tag. For process templates that are still in preview, license and trial aren't needed.

**Dataverse capacity:** The Power Automate Process Mining add-on provides 2 GB of database capacity, 1 TB of file capacity, and 250,000 Power Platform requests per 24 hours. Depending on the size of the process data you import, you might run out of Dataverse storage capacity. If this happens, ask your admin about purchasing more storage capacity, or delete existing processes to free up storage. The process data we store uses mostly file capacity. To learn more about Dataverse storage capacity, go to [New Microsoft Dataverse storage capacity](/power-platform/admin/capacity-storage).

## Prerequisites

Before you start using the process mining capability, make sure you have the following prerequisites:

- The required licenses or trials depending on the capabilities you want access to.

- A Microsoft Power Platform environment with a Microsoft Dataverse database.  

  - To learn how to create an environment, go to [Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment).  

  - To learn how to add a database to an environment, go to [Add a Microsoft Dataverse database](/power-platform/admin/create-database).  

- Adequate roles are assigned for users who want to use the process mining capability. Typically an Environment Maker security role is recommended. Go to [Security and privacy](process-advisor-security.md) to learn more.

Additional considerations for specific capabilities:

- For the Power Automate Process Mining desktop app, install [Power Automate Process Mining](minit/how-to-start-with-minit-desktop-application.md).

- To customize your report, you need to [set up your Power BI workspace](process-mining-pbi-workspace.md) and [register the process mining service principal in Azure AD](process-mining-pbi-workspace.md#install-azure-tools).

- For task mining, download [Power Automate for desktop](desktop-flows/install.md).
