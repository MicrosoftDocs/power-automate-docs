---
title: Overview of the Automation kit Technical Description | Microsoft Docs
description: Overview of the Automation kit Technical Description.
suite: flow
documentationcenter: na
author: grarchib
manager: marcsc
editor: ''
ms.custom: guidance

ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/18/2022
ms.author: grarchib
ms.reviewer: deonhe
---

# Technical description

## Automation CoE technical description

The automation kit supports an automation CoE with the following artifacts.

1. The canvas app "Automation Project" to support a way to request and submit automation projects for approval.
1. The model driven app "Automation Center" to support the creation and maintenance of automation assets like master data records, mapping resources, environments and assigning roles to employees.
1. Near realtime cloud flows that sync data from satellite environments to the main environment using Dataverse tables. Data is also stored locally (in the satellite environment) and synced with main in near realtime.
1. Power BI dashboard to provide insights and monitor your automation assets.

## Solutions

The automation kit contains the following two solutions.

- Main solution.
- Satellite solution.

The main solution is deployed in the main environment. The satellite solution is deployed in a satellite environment. A template solution is meant to contain useful assets for makers to utilize when they're developing an automation project.

## Power BI dashboard

The setup package contains one (main) Power BI dashboard.

The main dashboard connects to the main environment connecting to Dataverse tables into which data from all metered solution artifacts gets synced.
