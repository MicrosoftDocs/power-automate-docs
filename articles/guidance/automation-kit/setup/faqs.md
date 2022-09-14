---
title: Frequently asked questions about the Automation Kit setup guidance | Microsoft Docs
description: Frequently asked questions about the Automation Kit setup guidance.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
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

# Frequently asked questions about the Automation Kit setup guidance

This article provides answers to some of the most common questions about the Automation Kit.

**Question** - What are the datacenter region codes?

**Answer** - These values are crucial when configuring a satellite’s environment variables. Each region has a different URL. The following is a list of regions and their URLs.

| Region     |            URL           |
|------------|--------------------------|
| Region     | URL                      |
| NAM        | crm.dynamics.com         |
| DEU        | crm.microsoftdynamics.de |
| SAM        | crm2.dynamics.com        |
| CAN        | crm3.dynamics.com        |
| EUR        | crm4.dynamics.com        |
| FRA        | crm12.dynamics.com       |
| APJ        | crm5.dynamics.com        |
| OCE        | crm6.dynamics.com        |
| JPN        | crm7.dynamics.com        |
| IND        | crm8.dynamics.com        |
| GCC        | crm9.dynamics.com        |
| GCC High   | crm.microsoftdynamics.us |
| GBR        | crm11.dynamics.com       |
| ZAF        | crm14.dynamics.com       |
| UAE        | crm15.dynamics.com       |
| GER        | crm16.dynamics.com       |
| CHE        | crm17.dynamics.com       |
| CHN        | crm.dynamics.cn          |

For more information, review [Datacenter regions](/power-platform/admin/new-datacenter-regions).

**Question** - How can the RPA CLI be used to extend the Automation Kit?

**Answer** - Read more about how to use the [RPA CLI](https://aka.ms/rpacli).

**Issue** - No organization matches the given dataset: unq0a5fac6XXXXXXXXXXXXX.crm

**Answer** - The issue might be due to a wrongly entered environment variable value for the **Environment Unique Name** of CoE main. If your environment is provisioned in Australia for instance, you need to enter the Australian region suffix to the crm domain. For example, enter **crm6** instead of **crm**. After you fix this, you can turn on all cloud flows.

You can also review [Environment variables are not editable after you import a solution](../limitations.md#environment-variables-are-not-editable-after-you-import-a-solution) and [Environment variables continue to use the old values after a manual change](../limitations.md#environment-variables-continue-to-use-the-old-values-after-a-manual-change) to learn more.

**Issue** - GetDataverseSolutionArtifacts.Run failed.

**Details** - This error happens inside the Automation Solution Manager app (inside a satellite) when you try to view the  solution artifacts.

**Answer** - First check out these flows:

- Get Dataverse Bearer Token (Azure KeyVault Env)
- Get Dataverse Solution Artifacts

The error in the flow might be like the following screenshot.

![A screenshot that displays the solution artifacts errors from a run](../media/solution-artifact-errors.png)

There could be two main causes of this error.
1. The application user isn't created in the satellite environment. [Create application user inside Dataverse (Per satellite Env)](satellite.md#create-application-user-inside-dataverse-per-satellite-env)

1. The satellite environment variables aren't configured properly. [Configure environment variables](environment-variables.md#configure-environment-variables)
