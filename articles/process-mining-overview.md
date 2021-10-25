---
title: Overview of process mining in process advisor (preview) | Microsoft Docs
description: This topic is an overview of process mining in the process advisor feature in Power Automate.
author: nijemcevic 
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.custom: intro-internal
ms.date: 11/02/2021
ms.author: tatn
ms.reviewer: v-aangie
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Overview of process mining in process advisor (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

Process mining in process advisor allows you to take the event data from your system of records and visualize the processes happening in your organization. Process mining provides novel insights that can help you find identify automation opportunities, and address performance and compliance opportunities.

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

Process mining in process advisor helps you to:

- Identify which activities in your process take the most time.

- Discover which process variations are repeated the most.

- Gain insights about which activities in your processes are ripe for automation and prioritize by ROI.

- Improve efficiencies by understanding where the bottlenecks are.

- Detect uncompliant processes.

## Business example

As a business owner in accounts payable, you can use process advisor to find the steps and actions in your procure to pay process. Using event log files from your ERP systems like Dynamics 365 or SAP, process advisor will produce a process map. This map enables you to visualizes the activities in the procure to pay process to derive the following insights:

- Which activities in a process take the longest?

- How many variations of invoice approval exist in the organization?

- Are the activities of the process within compliance?

You can easily filter for custom attributes such as location, department, and other dimensions that are relevant to your process.

## Steps to process mining

- [Understand data requirements](process-mining-processes-and-data.md#data-requirements).

- [Connect to a data source](process-mining-processes-and-data.md#connect-to-a-data-source).

- [Transform data](process-mining-transform.md).

- [Map data](process-mining-transform.md#map-data).

- [Analyze process](process-mining-visualize.md#use-kpis-and-visualizations-for-analytics).