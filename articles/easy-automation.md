---
title: Create a cloud flow from a description | Microsoft Docs
description: Learn to create a cloud flow from a written description of the scenario.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: tapanm
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/29/2022
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Create a cloud flow from a description (preview)

[This article is pre-release documentation and is subject to change.]

When you build automation with Power Automate, it might take valuable time to learn which actions and triggers you need, especially if you’re new to the Power Automate. If you want to jump right in and get started, you can just write a description of what you want to automate in everyday language and let Power Automate provide a list of corresponding flows that you can create instantly.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Prerequisites

- A work or school account with access to a Power Automate [environment](/power-platform/admin/create-environment#create-an-environment-in-the-power-platform-admin-center) that's based in the United States.
  
  >[!NOTE]
  >You cannot create cloud flows from a description if you're logged in with a Microsoft Account.

  >[!TIP]
  >If you don’t have access to an environment that's based in the United States, you can [create a new environment and select United States](/power-platform/admin/create-environment#create-an-environment-in-the-power-platform-admin-center) as the region.

- Check current [limitations](#limitations) for more information.

## Create a flow from a description

In the following example, we'll build an automated cloud flow that sends a notification via Teams and an email each time someone responds to a Microsoft Forms survey.

1. Sign in to [Power Automate](https://make.powerautomate.com), select **Create** on the left side of the screen, and then select **You describe it, AI Builds it**.

   >[!div class="mx-imgBorder"]
   >![A screenshot that displays the You describe it, AI Builds it button](media/easy-flow/describe-it-main.png)

   A screen opens where you can enter a description of what you want to automate. You will also see examples you can use for inspiration and that you can try right away.

1. For this example, enter *Every time someone responds to a Microsoft Forms survey, post a message to Teams and send an email*.
1. Select the **Confirm** button.

   >[!div class="mx-imgBorder"]
   >![A screenshot that displays the confirm button](media/easy-flow/confirm-button.png)

   Power Automate returns up to three suggested flows that correspond to what you've entered. You can select the **See flow** icon to the right of each flow to see a preview of the flow.  

   >[!div class="mx-imgBorder"]
   >![A screenshot that displays a suggested flow after providing a description of what to automate](media/easy-flow/describe-flow.png)

   >[!NOTE]
   >If none of the suggestions correspond to what you’re looking to automate, you can select **This is not what I want**. You will see additional guidance on what you can do next, and this signal helps Microsoft to improve the AI behind this feature.

1. Select that flow that best suits your needs.
1. Select **Next**.
1. Setup all the connections needed to run the flow.
   >[!div class="mx-imgBorder"]
   >![A screenshot that displays the connections that you may need to set up.](media/easy-flow/set-up-connections.png)

1. Select **Next**.
1. Enter the information needed to run the flow. For example, which form to use and to whom to send the Teams message and email. You can decide to fill in the information on this step or do it later in the designer.

1. Select **Create flow**.

   And there you have it! Your flow has been built. Congratulations! You can decide to make any modification and edit the flow or save it and test it.

   >[!div class="mx-imgBorder"]
   >![Power Automate showing a cloud flow that has been built from a description](media/easy-flow/generated-flow.png)

<!-- todo: deonhe Behind the tech
===============

The implementation relies on OpenAI Codex, an AI model descendant of GPT-3 that can translate natural language to code, in this case descriptions to cloud flows. Its training data contains both natural language and a large number of sample cloud flows. -->

## Limitations

- Power Automate supports descriptions written in the English language only. Writing descriptions in other languages might work but are not officially supported.
- Cloud flows are the only type of flow that you can create from a description.
- In the current version, some parameters might not be automatically filled by the Artificial Intelligence even if they’ve been specified in the provided description.
- The AI model that transforms a description into a cloud flow is optimized to automate the main actions for the following applications.

  - Microsoft Excel
  - Microsoft Forms
  - Microsoft 365 Outlook
  - Microsoft OneDrive for Business
  - Microsoft Planner
  - Microsoft SharePoint
  - Microsoft Teams

### See also

[Learn more about cloud flows](./overview-cloud.md).  

<!-- todo: Giving us feedback
==================

Microsoft is committed to developing and deploying AI technologies in a responsible manner. If you find any inappropriate results generated by Power Automate, please [report it now](https://msrc.microsoft.com/report/abuse?ThreatType=URL&IncidentType=Responsible%20AI&SourceUrl=https://make.powerautomate.com) to help us keep our AI model behaving in a responsible manner. Thank you for taking the time to provide your comments, they help us greatly build better products. -->
