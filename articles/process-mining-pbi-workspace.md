---
title: Customize a report with your own Power BI workspace (preview)
description: Learn how to use your own custom Power BI workspace and leverage a higher capacity to analyze processes with process mining in the process advisor feature in Power Automate.
author: donums
contributors:
  - donums
  - v-aangie 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 11/15/2022
ms.author: derahonuorah
ms.reviewer: angieandrews
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Customize a report with your own Power BI workspace (preview) 

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

You can use your own custom Power BI workspace and leverage a higher capacity to analyze processes with a lot more data. You'll also be able to customize the look and feel of the report.
## Setup: Connect your Power BI workspace to process advisor

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for **azure active directory** in the search bar and select **Azure Active Directory**.

    :::image type="content" source="media/process-mining-pbi-workspace/azure-add.png" alt-text="Screenshot of the 'Summary' tab.":::

1. Under **Manage**, select **Users**.

    :::image type="content" source="media/process-mining-pbi-workspace/az-users.png" alt-text="Screenshot of the 'Summary' tab.":::

1. Select **User settings**.

1. Review the **App registrations** selection.

    If **App registrations** is **Yes**, then any user can register process advisor as an app. If **App registrations** is **No**, then only admins can register apps. If you are an admin, you can choose to turn this on to allow others to register process advisor as an app.

    :::image type="content" source="media/process-mining-pbi-workspace/az-app-reg.png" alt-text="Screenshot of the 'Summary' tab.":::






### See also

https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-new-workspaces