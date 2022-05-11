---
title: Overview of Microsoft Forms triggers and actions within flows in Power Automate (contains video) | Microsoft Docs
description: Use Microsoft Forms within flows in Power Automate to get response details when a new response is submitted.
services: ''
suite: flow
documentationcenter: na
author: Dean-Haas
manager: kvivek
editor: ''
tags: ''
ms.devlang: na
ms.topic: overview
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/03/2022
ms.author: napienko
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Overview of flows with Microsoft Forms

Connectors serve as a way to connect to a service from Microsoft Power Platform. There are numerous types of form connectors available, including the [Microsoft Forms](/connectors/microsoftforms/) connector. Microsoft Forms is a new part of Office 365 Education that allows teachers and students to quickly and easily create custom quizzes, surveys, questionnaires, registrations, and more. You can follow these instructions to create a Microsoft Form.

Here's a video about Microsoft Forms.<br/>
<br/>
>[!VIDEO https://www.microsoft.com/videoplayer/embed/RWKXdv]

## Microsoft Forms trigger
A trigger is the event that starts the flow. For example, Here's the Microsoft Forms trigger.

> [!div class="mx-imgBorder"]
> ![Screenshot of Microsoft Forms trigger screen.](..\media\forms\forms-trigger.png "Microsoft Forms trigger in Power Automate")

## Microsoft Forms action
Actions are the events you want the workflow to do once the trigger takes place. Here's the Forms action. The trigger doesn’t contain dynamic content that includes all of the responses, so you always need to use **When a new response is submitted** with Get response details.

> [!div class="mx-imgBorder"]
> ![Screenshot of Microsoft Forms action screen.](..\media\forms\forms-action.png "Microsoft Forms action in Power Automate")

## More information

- [Power Apps and Microsoft Teams](/powerapps/teams/overview)
- [Power Virtual Agents and Microsoft Teams]( https://aka.ms/pva-teams-docs)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
