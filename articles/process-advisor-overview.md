---
title: Overview of process advisor
description: This topic provides an overview of the process advisor feature in Power Automate.
author: donums
contributors:
  - donums
  - v-aangie  
ms.subservice: process-advisor
ms.topic: overview
ms.date: 11/15/2022
ms.author: derahonuorah
ms.reviewer: angieandrews
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
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

Process advisor is licensed as part of Power Automate per-user licenses. If you don’t have a license, you can start a Power Automate trial to try process advisor. The per-user licenses enable users to analyze task mining processes and view their analytics. Other actions such as contributing recordings and setting up process mining processes don't need the Power Automate per-user licenses.

For more information about process advisor licensing, go to [Power Automate pricing](https://make.powerautomate.com/pricing/) and [Power Apps and Power Automate licensing FAQ](/power-platform/admin/powerapps-flow-licensing-faq).

For complete licensing details, go to the [Microsoft Power Apps and Power Automate licensing guide](https://go.microsoft.com/fwlink/?LinkId=2085130).

There are data limitations on Dataverse and it’s possible that you’ll run out of space. If you need to buy more Dataverse space, go to the [Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130). The Power Platform licensing guide will be sent to your **Downloads** folder.

Currently, only the task mining recording feature is generally available and will require either a license or trial. The process mining data feature and the templates are in public preview and don't require a license or trial. However, a license or trial is needed if you're using this feature in an environment that isn't the default environment.

To customize your report, you need to link the process to your own workspace, and a paid Power BI license is needed. The specific license you need depends on the data size of the process data. To learn more about Power BI licensing, go to [Power BI pricing](https://powerbi.microsoft.com/en-us/pricing/).

## Prerequisites

Before you start using process advisor, make sure you have the following prerequisites:

- Process mining licenses

   - To use basic process mining functionality, go to [Power Automate Pricing](https://powerautomate.microsoft.com/pricing/) to obtain a Power Automate license.

   - To be able to customize your process reports in Power BI, go to [Power BI Pricing](https://powerbi.microsoft.com/pricing/) to obtain a Power Bi license.

   - To learn more about licensing and add Dataverse capacity, visit page 21 of the [Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).  

- A Microsoft Power Platform environment with a Microsoft Dataverse database.  

  - To learn how to create an environment, go to [Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment).  

  - To learn how to add a database to an environment, go to [Add a Microsoft Dataverse database](/power-platform/admin/create-database).  

- (If you want to set up dataflows for process mining) An Environment Maker security role.  

     - If you're assigned an Environment Admin or System Admin role, go to [What are dataflows](/power-query/dataflows/overview-dataflows-across-power-platform-dynamics-365) to learn more.  

- For additional process mining capabilities, download the[minit desktop application](minit/how-to-start-with-minit-desktop-application.md).

- To customize your report, you need to [set up your Power BI workspace](process-mining-pbi-workspace.md) and [register the process advisor service principal in Azure AD](process-mining-pbi-workspace.md#install-azure-tools).

- Power Automate for desktop for task mining. You can download it from process advisor.
  - To learn more, go to [Introduction to desktop flows](desktop-flows/introduction.md).
