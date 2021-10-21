---
title: Edit your data source with process mining in process advisor | Microsoft Docs
description: This topic describes how to edit your data source with process mining in process advisor.
author: nijemcevic 
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 11/02/2021
ms.author: tatn
ms.reviewer: v-aangie
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Edit your data source with process mining in process advisor


## Edit query

There are many reasons why you want to edit the query:

- Your data might have multiple ID columns that can be used as case ID. There often is not a right answer and you may discover additional insights by changing what you use as case ID.

- You have more than five additional columns with useful data, and you want to try analyzing other columns to see if they are potentially useful in uncovering root causes of bottlenecks.

To edit the query:

1. Click Setup in the process details page to return to the query editor. 

1. Do not click the Map to entity or Choose columns buttons again. 

1. Instead, double click on the corresponding steps in the Applied steps screen under Query settings to edit those steps.

## Refresh data

If you have a data source that is a transactional data source, like Dataverse or SQL, or if you want to see the Analytics page updated with the latest data from that data source, simply click Refresh on the right side of the Data Source card in the Process details page. You need to click Analyze again after clicking Refresh.

## Disconnect data

If you want to change the data source for your process, maybe you were just using a CSV file before but now you want to connect to a transactional data source instead, you can do that easily by clicking Disconnect data on the right side of the Data Source card. In the Process details page, once you disconnect, click Setup again to connect to your new dat
