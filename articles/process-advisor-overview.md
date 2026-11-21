---
title: Overview of process mining and task mining in Power Automate
description: Get an overview of process mining and task mining in Power Automate.
author: janPidych
contributors:
  - donums
  - v-aangie  
  - tatn
  - cyrilanderson
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: overview
ms.date: 08/28/2026
ms.author: michalrosik
ms.reviewer: cyanderson
search.audienceType: 
  - flowmaker
  - enduser
  - analyst
---

# Overview of process mining and task mining in Power Automate

Process mining and task mining in Power Automate help you understand your business processes so you can optimize them.

## Process mining

The process mining capability in Power Automate helps you discover inefficiencies in organization-wide processes. You gain a deep understanding of your processes by using event log files from your system of record, such as the apps you use in processes. The process mining capability displays maps of your processes with data and metrics to help you recognize performance issues. Example processes suitable for the process mining capability include _accounts receivable_ and _order-to-cash_.

The process mining capability can help you make intelligent, day-to-day improvements. You can discover and model processes for which you have data readily available, giving you an X-ray visualization of what goes on in your organization. You can also standardize, optimize, and improve operations while staying informed about progress towards defined key process indicators.

## Task mining

The task mining capability in Power Automate helps you discover tasks happening on the desktop. You can zoom in to specific desktop tasks you might have discovered during your process mining analysis. You can understand how your company performs its process tasks by monitoring recorded user actions and collecting data from these actions. You gain insights from this data that help you understand how processes are performed, find common mistakes while performing tasks, and identify tasks that you can automate.

## When to use the process mining capability

Use the process mining capability for the following tasks:

- See the actual steps needed to perform your organization’s operation process and remove any guesswork.
- Save time and money by optimizing processes.
- Detect noncompliant processes and tasks.
- Discover automation opportunities.
- Compare processes.
- Find mistakes.
- Understand where and why problems occur.

## When to use the task mining capability

Use the task mining capability for the following tasks:

- Understand what employees actually do while performing each task on their desktops.
- Identify and eliminate unnecessary actions in process tasks.
- Identify the most common actions through user interactions.
- Ensure compliance and perform audits.
- Automate tasks that accelerate processes and reduce human errors.

## What you'll find in this documentation

Explore topics in [process mining](process-mining-overview.md) and [task mining](task-mining-overview.md) in this documentation for the following:

- Business scenarios
- Tutorials
- Guided procedures
- Videos

## Licensing

Process mining is licensed as part of Microsoft Power Automate. Three Power Automate licenses relate to process mining, and a Power BI license is required for Power BI report customization.

### Power Automate trial license  

For a limited time of 90 days, the Power Automate trial license offers:

- **Task mining capabilities:** Enable you to analyze a recorded process and view the analytics report. You can invite others to contribute recordings to the process for richer insights.

- **Process mining capabilities:** Enable you to create a process, connect to an event log using data flows, analyze a process from data, view the analytics report on the web, and perform advanced analytics on the desktop application. The trial offers limited process mining capacity of 100 MB per process. To process more data, purchase the **Power Automate Premium** license and the **Power Automate Process Mining add-on**.

    To learn more, see [Power Automate Process Mining add-on](#power-automate-process-mining-add-on) in this article.

### Power Automate Premium license  

The **Power Automate Premium** license is a per-user license with the following offerings:

- **Task mining capabilities:** Enable you to analyze a recorded process and view the analytics report. You can invite others to contribute recordings to the process for richer insights.

- **Process mining capabilities:** Enable you to create a process, connect to an event log using data flows, analyze a process from data, view the analytics report in the web, and perform advanced analytics in the desktop application. Each **Power Automate Premium** license adds 50 MB of process mining capacity to a tenant-wide capacity pool up to a total of 100 GB. When you reach 100 GB, you need to purchase the **Power Automate Process Mining add-on** to process more data.

    To learn more, see [Power Automate Process Mining add-on](#power-automate-process-mining-add-on) in this article.

- Additional 250 MB of Dataverse database capacity.

- Additional 2 GB of Dataverse file capacity.

### Power Automate Process Mining add-on

The **Process Mining add-on** is a tenant-wide license that's available for the Power Automate Premium license. It offers:

- An extra 100 GB of process mining capacity to the capacity pool, which users with the Power Automate Premium license can use.
  
- An extra 2 GB of Dataverse database capacity.

- An extra 1 TB of Dataverse file capacity.

Get Power Automate pricing details at [Power Automate pricing](https://powerautomate.microsoft.com/en-us/pricing/). For inquiries about add-on capability licensing, contact [Microsoft Process and Task Mining Questions](mailto:minitq@microsoft.com).

### Power BI license

To customize your report, you need to link the process to your own Power BI workspace, and a **Power BI Premium** license. To learn more about Power BI licensing, go to [Power BI pricing](https://powerbi.microsoft.com/en-us/pricing/).

### Preview

Some features are in preview, denoted by the preview tag. For process templates that are still in preview, you don't need licenses or trials.

### Dataverse capacity

Depending on the size of the process data you import, you might run out of Dataverse storage capacity. If this happens, ask your admin about purchasing more storage capacity, or delete existing processes to free up storage. The process data we store uses mostly file capacity.

To learn more about Dataverse storage capacity, see [New Microsoft Dataverse storage capacity](/power-platform/admin/capacity-storage).

## Prerequisites

Before you start using the process mining capability, ensure you have the following prerequisites:

- The required licenses or trials depending on the capabilities you want access to.

- A Microsoft Power Platform environment with a Microsoft Dataverse database.  

  - Learn how to create an environment in [Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment).  

  - Learn how to add a database to an environment in [Add a Microsoft Dataverse database](/power-platform/admin/create-database).  

- Adequate roles assigned for users who want to use the process mining capability. You need the **Environment Maker** role to create, share, and contribute to processes. Go to [Security and privacy](process-advisor-security.md) to learn more.

Additional considerations for specific capabilities:

- For the Power Automate Process Mining desktop app, download and install [Power Automate Process Mining desktop app](minit/how-to-start-with-minit-desktop-application.md).

- To customize your report, you need to [set up your Power BI workspace](process-mining-pbi-workspace.md) and [register the process mining service principal in Microsoft Entra ID](process-mining-pbi-workspace.md#install-azure-tools).

- For task mining, download and install [Power Automate for desktop](desktop-flows/install.md).
