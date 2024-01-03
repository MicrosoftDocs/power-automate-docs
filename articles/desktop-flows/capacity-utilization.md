---
title: Capacity utilization within Power Automate
description: apacity utilization within Power Automate
author: cvassallo
ms.subservice: desktop-flow
ms.date: 01/03/2024
ms.author: cvassallo
ms.reviewer: 
---

# Capacity utilization within Power Automate

> [!IMPORTANT]
> This feature is in preview.


## Introduction to capacity

Within the Power Automate platform, a <b>‘Capacity’</b> is a purchased item that can be utilized by a specific Power Automate object allowing it to carry out premium operation. Currently, there are 4 types of capacity that can be utilized by Power Automate objects :

|Capacity|Power Automate object|Consumption mode|Premium operation enabled|
|----|--------------------|----|----|
|Hosted RPA capacity|Hosted machine|Auto-allocation|To be created, each hosted machine requires an hosted RPA capacity allocated.|
|Hosted RPA capacity|Hosted machine group|Manual commitment|Every hosted RPA capacity committed to a hosted machine group guarantees the availability of a bot when required.|
|Process capacity / Unattended RPA capacity (legacy)|Machine|Manual allocation & auto-allocation|Every capacity allocated to a machine allows it to carry out an extra unattended desktop flow run concurrently.|
|Process capacity / Unattended RPA capacity (legacy)|Cloud flow|Manual allocation & auto-allocation|Every capacity assigned to a cloud flow enables it, along with all its associated cloud flows, to use premium connectors and execute actions up to a daily limit of 250k Power Platform Requests (stackable limit).|
|Per flow plan (legacy)|Cloud flow|Manual allocation|A Per flow plan allocated to a cloud flow enables it to use premium connectors and execute actions up to a daily limit of 250k Power Platform Requests.|

> [!IMPORTANT]
> The Process capacity and the Unattended RPA capacity (legacy) have been merged in a common pool.

## Capacity utilization page

The capacity utilization page offers an overview of the environment capacities, detailing their usage and providing suggestions and insights for more efficient management of automations and the desktop infrastructure.

> [!IMPORTANT]
> The capacity utilization firt version released in January 2024 is centered on the hosted RPA capacity.
