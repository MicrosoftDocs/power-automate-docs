---
title: Create flows from the OneDrive for Business launch panel | Microsoft Docs
description: Learn how to create flows from the OneDrive for Business launch panel.
services: ''
suite: flow
documentationcenter: na
author: natalie-pienkowska
contributors:
  - natalie-pienkowska
  - kartikraop
  - v-aangie
ms.author: jamiller
ms.reviewer: angieandrews
editor: ''
tags: ''
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/26/2023
search.audienceType: 
  - flowmaker
  - enduser
---

# Create flows from the OneDrive for Business launch panel

Similar to the Power Automate [Launch Panel in SharePoint](https://make.powerautomate.com/blog/introducing-flow-launch-panel-in-sharepoint-lists-and-libraries/), you can run flows on specific files in OneDrive for Business. 

This feature enables the person running the flow to use their own credentials, which is especially applicable for flows that have been created by an IT department. 

Users can also get prompts for runtime inputs like **Approver** or **Message**, which can be of type text, file, email, Boolean, or number.

In this tutorial, we'll create a simple flow that uses one of the many [OneDrive for Business templates](https://make.powerautomate.com/search/?q=OneDrive) to request approval of a file by the requestor's manager.

## Create a cloud flow that requests manager approval for a file in OneDrive for Business

1. Sign in to OneDrive for Business.

1. Find, and then select the file for which you want to create the flow.

1. Select the **Show actions** link (three dots).

1. Select **Automate** > **Power Automate** > **Create a flow**.

    :::image type="content" source="media/onedrive-launch-panel/create-flow.png" alt-text="Screenshot of the option to create a cloud flow for a file.":::

1. Select one of the available templates.

    In this example, select the **Request my manager's approval for the selected file** template.

    :::image type="content" source="media/onedrive-launch-panel/onedrive-templates.png" alt-text="Screenshot of the available templates.":::

1. Sign in to the required connectors, and then select **Continue**.

    :::image type="content" source="media/onedrive-launch-panel/required-connections.png" alt-text="Screenshot of the required connections.":::

1. Make any changes you want to the template and then save your flow with a name that you'll remember easily.

## Run the flow

1. Sign in to OneDrive for Business.
1. Find, and then select the file for which you want to request manager approval.
1. Select the **Show actions** link (three dots).
1. Select **Flow**. You'll see the flow that you created earlier.
1. Select the flow you created earlier.

     ![Run your flow.](./media/onedrive-launch-panel/run-flow.png)

>[!TIP]
>While this tutorial shows how to create a cloud flow from a template, you can also create a cloud flow from blank to use any of the hundreds of connectors available in Power Automate.

## Related information

- [Get started with Power Automate](getting-started.md)
- [Build multi-step flows](multi-step-logic-flow.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]
