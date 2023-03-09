---
title: Process mining overview
description: Get an overview of process mining capabilities.
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

# Process mining overview

Process mining capabilities provide a powerful tool to optimize your business processes by enabling you to identify inefficiencies and make informed, intelligent improvements on every level. By analyzing event log files from the apps you use in your processes, you can gain a deep understanding of your organization's processes and visualize them with X-ray clarity. This helps you standardize, optimize, and improve operations, while staying informed about progress towards defined key process indicators.

With process mining, you can discover inefficiencies in organization-wide processes in any indurstry such as sales processes, manufacturing, funance, IT, etc... By analyzing data and metrics, you can quickly recognize performance issues and take action to address them.

To learn more about process mining and how it can help your business, explore the topics covered in this documentation. You'll find business scenarios, tutorials, guided procedures, and videos to help you get started.

## Benefits of using process mining capabilities

Process mining capabilities offer numerous benefits for your organization. Here are just a few examples:

- Gain a clear understanding of the actual steps involved in your organization's operational processes, removing guesswork and providing actionable insights for improvement.

- Save time and money by optimizing processes, identifying inefficiencies, and automating tasks.

- Detect non-compliant processes or tasks, ensuring compliance with regulations and industry standards.

- Discover automation opportunities, enabling you to streamline your operations and reduce the potential for errors.

- Compare processes, identifying variations and best practices that can be shared across your organization.

- Understand where and why problems occur, helping you to identify root causes and take corrective action to improve performance.

By leveraging process mining capabilities, your organization can gain a deeper understanding of its processes, optimize its operations, and improve overall efficiency and effectiveness.

## Business example

As a business owner in accounts payable, process mining capabilities can help you uncover the steps and actions involved in your procure-to-pay process. By analyzing event log files from your ERP systems, such as Dynamics 365 or SAP, process mining produces a detailed process map that allows you to visualize the activities in the procure-to-pay process and gain valuable insights.

Using process mining, you can answer important questions such as:

- Which activities in the process take the longest to complete?

- How many variations of invoice approval exist within your organization?

- Are the activities of the process in compliance with regulations and industry standards?

In addition, you can filter the process map based on custom attributes, such as location, department, or other relevant dimensions, to gain a deeper understanding of how different parts of your organization are performing.

By leveraging process mining capabilities, you can identify inefficiencies in your procure-to-pay process and take action to optimize operations, reduce costs, and improve compliance.

## Components

Following are the main components for process mining:

- [Data requirements](process-mining-processes-and-data.md#data-requirements)

- [Transform and map data](process-mining-transform.md)

- [Use KPIs and visualizations for analytics](process-mining-visualize.md#use-kpis-and-visualizations-for-analytics)

- [Edit and refresh processes](process-mining-data-source.md)

- [Share processes](process-mining-share.md)

- [Troubleshoot issues (if necessary)](process-mining-troubleshoot.md)

## Licensing

Process advisor is licensed as part of Power Automate per-user licenses. If you don’t have a license, you can start a Power Automate premium trial to try process advisor. The per-user licenses enable users to analyze processes and view the analytics report.

**Task mining capability:** A *Power Automate per user license* enables a user to analyze a recorded process and view the analytics report. Other actions such as contributing recordings and setting up process mining processes don't need the Power Automate per-user licenses.

**Process mining capability:** A *Power Automate per user license with attended RPA* enables a user to create a process, connect to an event log using dataflows, analyze a process from data, and view the analytics report in the web.

**Process mining add-on:** A separately purchasable add-on is required to do the following:
- Use of the [desktop application](minit-desktop-application-overview.md) which provides many features to get deep insights into your process
- Customize the analytics report by publishing it into your own Power BI workspace

For inquiries about add-on capability licensing, contact minitq@microsoft.com

**Trial license:** You can start a free 90 day Power Automate premium trial will provide access to all available capabilities listed above, including the add-on capability. Note that there is a process size limit for any processes created while on the trial.

**Power BI license:** To customize your report, you need to link the process to your own Power BI workspace, and a Power BI premium per user license (or better) is needed. To learn more about Power BI licensing, go to [Power BI pricing](https://powerbi.microsoft.com/en-us/pricing/).

**Preview:** Note that some features are in preview, denoted by the preview tag, and for process templates that are still in preview, license and trial are not needed.

## Prerequisites - NEEDS REVISION

Before you start using process mining capabilities, make sure you have the following prerequisites:

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
