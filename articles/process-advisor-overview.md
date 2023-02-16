---
title: Overview of process mining
description: Get an overview of process mining capabilities.
author: donums
contributors:
  - donums
  - v-aangie  
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
---

# Overview of process mining

Process mining capabilities allow you to gain a better understanding of your business processes so you can optimize them. They can be a key driver in making intelligent, day-today improvements on every level. You can discover and model processes for which you have data readily available, giving you an X-ray visualization of what goes on in your organization. In addition, you can standardize, optimize, and improve operations, while staying informed about progress towards defined key process indicators.

Process mining capabilities allow you to discover inefficiencies in organization-wide processes. They enable you to gain a deep understanding of your processes using event log files that you can get from your system of recording (apps you use in your processes). You'll get maps of your processes with data and metrics to recognize performance issues. Example processes include *accounts receivable* and *order-to-cash*.

## Benefits of using process mining capabilities

Your organization can achieve many benefits from using process mining capabilities. Here are just a few things you can do:

- See the actual steps needed to perform your organization’s operation process and remove any guesswork.

- Save time and money by optimizing processes.

- Detect non-compliant processes and/or tasks.

- Discover automation opportunities.

- Compare processes.

- Understand where and why problems occur.

Explore the topics in this documentation for the business scenarios, tutorials, guided procedures, and videos.

## Business example

For example, as a business owner in accounts payable, you can use process advisor to find the steps and actions in your procure-to-pay process. Using event log files from your ERP systems like Dynamics 365 or SAP, process advisor produces a process map. This map enables you to visualize the activities in the procure-to-pay process to gain the following insights:

- Which activities in a process take the longest?

- How many variations of invoice approval exist in the organization?

- Are the activities of the process within compliance?

You can easily filter for custom attributes such as location, department, and other dimensions that are relevant to your process.

## Components

Following are the main components in process mining:

- [Data requirements](process-mining-processes-and-data.md#data-requirements)

- [Transform and map data](process-mining-transform.md)

- [Use KPIs and visualizations for analytics](process-mining-visualize.md#use-kpis-and-visualizations-for-analytics)

- [Edit and refresh processes](process-mining-data-source.md)

- [Share processes](process-mining-share.md)

- [Troubleshoot issues (if necessary)](process-mining-troubleshoot.md)

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
