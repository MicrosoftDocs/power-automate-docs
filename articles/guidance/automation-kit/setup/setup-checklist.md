---
title: Automation Kit setup checklist | Microsoft Docs
description: Setup the Automation Kit.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
editor: ''
ms.custom: guidance

ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/18/2022
ms.author: grarchib
ms.reviewer: angieandrews
---

# Automation Kit setup checklist

The following checklist provides an overview of the key steps, to assist you in setting up the Automation Kit.

**Use this checklist to ensure you have followed the key steps in the setup instructions.**

## Checklist for main

- Import the Power Platform Creator Kit (CreatorKitCore_x.x.x.x _managed).
- Verify Creator Kit is installed correctly.
- Imported **AutomationCoEMain_x_x_x_x_managed** into your **main** environment.
- Provisioned the approvals solution (optional).
- Confirmed all flows in the solution are turned on.
- Assigned the security roles that follow.
- Shared the Canvas apps with appropriate users, using the guidance that follows.

## Checklist for satellite

- Import the Power Platform Creator Kit (CreatorKitCore_x.x.x.x _managed).
- Verify Creator Kit is installed correctly.
- Created Microsoft Entra app registration (Dataverse API) for each satellite.
- Defined satellite environments (new or existing).
- Created application users in all satellite environments.
- Imported AutomationCoESatellite_x_x_x_x_managed.
- Configured environment variables that follow.
- Confirmed all flows in the solution are enabled.
- Shared the Canvas apps with appropriate users, using the guidance that follows.

## Checklist for configuration data

- Configured the general data defined below
- Defined the ROI data
- Console data configured
- Flow Exception Rules Framework has been defined.

## ROI calculations

Example data:

| **Cost element**       | **Input** |
|------------------------|-----------|
| FTE Cost               | $50/hr    |
| Time to Process (mins) | 60 mins   |
| Frequency              | Daily*    |
| # of FTEs to Process   | 1         |
| Error Rate (%)         | 10%       |
| # of FTEs to Fix       | 1         |
| Time to Fix (mins)     | 25        |
| Overhead               | 15%       |

Hourly = 2008, Daily = 251, Weekly = 52, Monthly = 12, Quarterly = 4
Calculation Formula

**Total Cost per Year** = Cost to complete (per Year) + cost to remediate (per year)

**Cost to Complete (per Year)**: ((((FTE Cost/60) x # of FTEs to process) x time to process (mins)) x frequency)

**Cost to Remediate (per Year)**: (((Frequency x (Error Rate/100)) x Time to Fix (mins)) x FTE Cost/60) x # of FTEs to Fix))

**Full Formula**: ((((FTE Cost/60) x # of FTEs to Process) x Time to Process (mins)) x Frequency) + (((Frequency x (Error Rate/100)) x Time to Fix (mins)) x FTE Cost/60) x # of FTEs to Fix))

## ROI calculation example

### Summary of cost calculations

| **Cost element**                 | **Calculation**                                                                                      |
|----------------------------------|------------------------------------------------------------------------------------------------------|
| Cost to Complete (per Year)      | \$12,550 (((FTE Cost/60) x # of FTEs to Process) x Time to Process) x Frequency                     |
| Cost to Remediate (per Year)     | \$522.92 ((Frequency x (Error Rate/100)) x Time to Fix (mins)) x ((FTE Cost/60) x # of FTEs to Fix) |
| Cost to Remediate (per Instance) | \$20.83 (Cost to Remediate (per Year) / (Frequency x (Error Rate/100))                               |
| Total Cost per Year              | \$13,072.92 (Cost to Complete (per Year) + Cost to Remediate (per Year)                              |
| Total Cost per Month             | \$1,089.41 (Cost to Complete per Year / 12)                                                          |
| Cost per Instance                | \$52.08 (Cost to Complete per Year / Frequency)                                                      |

### Summary of savings per instance for bot

| **Run Detail**            | **Total Savings** | **Description**                                 |
|---------------------------|-------------------|-------------------------------------------------|
| Successful Run, no errors | \$44.27           | Cost per Instance minus Overhead %              |
| Failure                   | \-\$28.65         | Cost to Remediate per Instance minus Overhead % |