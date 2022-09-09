---
title: Limitations and resolutions for issues in the automation kit | Microsoft Docs
description: Limitations and resolutions for issues in the automation kit.
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

# Limitations and resolutions for issues in the automation kit

This article contains some of the limitations in the automation kit.

## Limitations and resolutions

### Environment variables are not editable after you import a solution

**Issue** - You cannot update the values for environment variables from within the solution because the solution is **Managed**.

**Resoluton:** - Use the following steps to update environment variables.

1. Go to [Power Automate](https://flow.microsoft.com/).
1. On the left pane, select **Solutions**.
1. Select the **Default Solution** and change the filter to show **Environment Variables**.
1. Select a variable that you want to update, and then configure its **Current Value**.

### Environment variables continue to use the old values after a manual change

**Issue** - When someone changes environment variable values directly within an environment, instead of through an ALM operation like solution import, flows continue to use the previous value.

**Resolution** - For canvas apps, the new value will be used during the next session. For example, closing the app and then playing it again.

>[!NOTE]
>You must deactivate and then reactivate cloud flows for them to use the updated value.

### Cannot meter non-solution aware flows

**Issue** - At this time, the current solution cannot meter any flows that are not inside a solution.

**Resolution** - Put all flows that need to be metered inside a solution.

### Cloud flows don't support metering

**Issue** - Cloud flows must follow a specific naming convention before they're used for metering.

**Resolution** - All solution-aware cloud flows that you want to be metered, must follow a new naming convention that is internally being validated via **RegEx (_AP-[0-9]{9}_[0-9]{3}\\b)**. Here is the expected format.

   [CloudFlowName]_AP-[9digits]_[3digits]

For example, in **MostLikleyTheBest-CLoUdfLoW_AP-000001013_001.**, you can use the last 3 digits advanced scenarios and are typically 001 if you only have one solution per automation project. If you have multiple solutions for a single project, you could increase that number by 1 for each additional solution if you wish to distinguish them.

>[!TIP]
>You can select the information button inside the solution manager app to bypass this requirement.

### Unexpected behaviors with the flow exception framework

**Issue** - Unable to disable or suspend desktop flows.

**Resolution** - Turn off parent cloud flows if they're configured to allow them to be turned off.

**Issue** - Flow runs remain in the waiting stage.

**Resolution** - If you configure your flows to require acknowledgements when they fail, all flow runs remain in a waiting stage until either you acknowledge the email or the flow times out.

### Desktop flows impact analysis sync limitation (No data in app)

**Issue:** - There is a limitation where only new or modified desktop flows will be analyzed and shown in the app.

**Resolution:** - Do any of the following tasks.

- Modify the desktop flow.
- Import the desktop flow (solution).
- Create a new desktop flow.

>[!NOTE]
>You can use a solution to extend the automation CoE to sync all desktop flows in an  environment with the [RPA CLI](https://aka.ms/rpacli).

### More information

[Read more on how to use the RPA CLI for the Automation CoE.](https://aka.ms/rpaclie)
