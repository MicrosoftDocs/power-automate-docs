---
title: Overview of process advisor | Microsoft Docs
description: This topic provides an overview of the process advisor feature in Power Automate.
author: nijemcevic 
ms.subservice: process-advisor
ms.topic: overview
ms.date: 05/25/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Overview of process advisor

The process advisor feature allows you to gain a better understanding of your business processes so you can optimize them. Process advisor offers *task mining* and *process mining* capabilities to do this. Take a quick self-guided tour by going to [Process Advisor guided tour](https://guidedtour.microsoft.com/en-us/guidedtour/power-platform/process-advisor/1/1).

Task mining and process mining share the same goal of improving process efficiency. The main difference is their area of focus.

- **Process mining:** Process mining is better suited for discovery of inefficiencies in organization-wide processes. It enables you to gain a deep understanding of your processes using event log files that you can get from your system of record (apps you use in your processes). Process mining displays maps of your processes with data and metrics to recognize performance issues. Example processes suitable for process mining include *accounts receivable* and *order-to-cash*.

- **Task mining:** Task mining is better suited to discover tasks happening on the desktop. It enables you to zoom-in to specific desktop tasks you might have discovered during your process mining analysis. You can understand how your company performs its process tasks through monitoring recorded user actions and collecting data from these actions. You'll gain insights from this data that will let you know how processes are performed, find common mistakes while performing tasks, and identify tasks that can be automated.

## When to use process mining

Here are some reasons to help you decide to use process mining.

- See the actual steps needed to perform your organization’s operation process and remove any guesswork.

- Optimize processes by reducing time to completion.

- Detect non-compliant processes.

- Discover automation opportunities.

Explore the topics in [**Process mining (preview)**](process-mining-overview.md) and [**Task mining**](task-mining-overview.md) in this documentation for the following:

- Business scenarios

- Tutorials

- Guided procedures

- Videos

## When to use task mining

Here are some reasons to help you decide to use task mining.

- Understand what employees actually do while performing each task on their desktops.

- Identify and eliminate unnecessary actions in process tasks.

- Identify the most common actions through user interactions.

- Ensure compliance and perform audit.

- Automate tasks that would accelerate processes and reduce human errors.

## Licensing

Process advisor is licensed as part of Power Automate per-user licenses. If you don’t have a license, you can start a Power Automate trial to try process advisor. The per-user licenses enable users to analyze task mining processes and view their analytics. Other actions such as contributing recordings and setting up process mining processes don't need the Power Automate per-user licenses.

For more information about process advisor licensing, go to [Power Automate pricing](https://us.flow.microsoft.com/pricing/) and [Power Apps and Power Automate licensing FAQ](/power-platform/admin/powerapps-flow-licensing-faq).

For complete licensing details, go to the [Microsoft Power Apps and Power Automate licensing guide](https://go.microsoft.com/fwlink/?LinkId=2085130).

## Prerequisites

Before you start using process advisor, make sure you have the following prerequisites:

- A Microsoft Power Platform environment with a Microsoft Dataverse database.
  - For information about how to create an environment, go to [Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment).
  - For information about how to add a database to an environment, go to [Add a Microsoft Dataverse database](/power-platform/admin/create-database).

- An Environment Maker security role if you want to set up dataflows for process mining.
    - If you're assigned an Environment Admin or System Admin role, go to [What are dataflows](/power-query/dataflows/overview-dataflows-across-power-platform-dynamics-365) to learn more.
   
- [Power Automate for desktop](desktop-flows/introduction.md) for task mining. You can download it from process advisor.

[!INCLUDE[footer-include](includes/footer-banner.md)]
