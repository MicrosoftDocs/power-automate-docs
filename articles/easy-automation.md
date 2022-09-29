---
title: Create a cloud flow from a description | Microsoft Docs
description: Learn to create a cloud flow from a written description of the scenario.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/28/2022
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Create a cloud flow from a description

T

When building automation with Power Automate knowing which actions to stitch together might take time, especially when you’re new to the product. Now you can let Artificial Intelligence (AI) do all the hard work by describing what you want to automate in everyday language and see the corresponding flow created instantly.

## Prerequisites

- A work or school account with access to a Power Automate [environment](/power-platform/admin/create-environment#create-an-environment-in-the-power-platform-admin-center) that's based in the United States.
  
  >[!NOTE]
  >You cannot create cloud flows from a description if you're logged in with a Microsoft Account.

  >[!TIP]
  >If you don’t have access to an environment that's based in the United States, you can [create a new environment and select United States](](/power-platform/admin/create-environment#create-an-environment-in-the-power-platform-admin-center) as the region.

- Check current [limitations](#limitations) for more information.

## Create a flow from a description

In the following example, we'll build an automated cloud flow that sends a notification via Teams and an email each time someone responds to a Microsoft Forms survey.

1. Navigate to the **Create** page for Power Automate, and select **You describe it, AI Builds it**.

   A screen opens where you can enter a description of what you want to automate. You will also see examples you can use for inspiration and that you can try right away.

1. For this example, enter *Every time someone responds to a Microsoft Forms survey, post a message to Teams and send an email*.
1. Select the **Submit** button.

   Power Automate returns up to three suggested flows that respond to what you have entered. You can see a preview of the flow by selecting the preview icon to the right of each flow.  

    ![A screenshot that displays where you'd describe the flow in everyday language](media/describe-flow.png)

    [describe-flow-step-1.png](https://microsoft.sharepoint.com/:i:/t/PARIS/Eexvb_0mf6BDoZmW91reAxgBXIB_F5A9ZDNOWZUIlUpkSA?e=ToRJfZ)
    (Alt: Power Automate showing a suggested flow after providing a description of what to automate)

   >[!NOTE]
   >Note If none of the suggestions respond to what you’re looking to automate. You can select “**This is not what I want”**. You will see additional guidance on what you can do next, and this signal will help us improve the AI behind this feature.

1. Once you have selected one of the suggested flows, select **Next**.
1. In this step, you will setup all the connections needed to run the flow.
1. On the final step, you will be asked to enter information needed to run the flow. For example, which Microsoft Form to use and to whom send the Teams message and email message. You can decide to fill in the information on this step or do it later in the flow designer. In both cases, you then select **Create flow**.
1. And there you have it! Your flow has been built – congratulations! You can decide to make any modification and edit the flow or save it and test it.
    [Learn more about cloud flows](./overview-cloud.md).  

    ![Graphical user interface, application Description automatically generated](media/generated-flow.png)

    [describe-flow-complete.png](https://microsoft.sharepoint.com/:i:/t/PARIS/EeadKHBuCipJneXeY07RUfsB8wtlI94-eA1AW311ooOUfw?e=FVE4JZ)
    (Alt: Power Automate showing a cloud flow that has been built from a description)

Behind the tech
===============

The implementation relies on OpenAI Codex, an AI model descendant of GPT-3 that can translate natural language to code, in this case descriptions to cloud flows. Its training data contains both natural language and a large number of sample cloud flows.

## Limitations

- Power Automate supports descriptions written in the English language only.
- Cloud flows are the only type of flow that you can create from a description.
- The AI model that transforms a description into a cloud flow is optimized to automate the main actions for the following applications.

  - Microsoft Excel
  - Microsoft Forms
  - Microsoft 365 Outlook
  - Microsoft OneDrive for Business
  - Microsoft Planner
  - Microsoft SharePoint
  - MicrosoftTeams

Giving us feedback
==================

If you have any feedback for this feature, e.g., the suggested flow is inaccurate or you have suggestions, ideas to share with us, you can [fill this
feedback survey](https://ncv.microsoft.com/1gCpCCaFfu).

Microsoft is committed to developing and deploying AI technologies in a responsible manner. If you find any inappropriate results generated by Power
Automate, please [report it now](https://msrc.microsoft.com/report/abuse?ThreatType=URL&IncidentType=Responsible%20AI&SourceUrl=https://make.powerautomate.com) to help us keep our AI model behaving in a responsible manner. Thank you for taking the time to provide your comments, they help us greatly build better products.
