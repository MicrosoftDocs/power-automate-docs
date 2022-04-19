---
title: Overview of Microsoft 365 email and Power Automate | Microsoft Docs
description: Overview of Microsoft 365 email and Power Automate.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: overview
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/05/2022
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Overview of Microsoft 365 Outlook email use with Power Automate

Connectors represent the service to which you want to connect. For example, you can use the OneDrive, SharePoint, or Twitter connectors to use those services. Two of the most popular connectors used in flows to send or receive email are the [Outlook.com](/connectors/outlook/) connector and the [Office 365 Outlook](/connectors/office365/#connector-in-depth) connector. Both connectors offer similar operations that you can use to manage your mail, calendars, and contacts. You can perform actions such as send mail, schedule meetings, add contacts, and more with both of these connectors.

## Outlook.com or Office 365 Outlook: which connector should I use?

If you're using a work or school email account, use Office 365 Outlook connector. If you're using a personal account (Microsoft account), use the Outlook.com connector. In this article, we refer only to the Office 365 Outlook [triggers](/connectors/office365/#triggers) and [actions](/connectors/office365/#actions). You can also use the same techniques for the Outlook.com connector.

## Triggers

A *trigger* is an event that starts a cloud flow. For example, **When a new email arrives (V3)** is a trigger that starts a cloud flow when an email arrives into an inbox. Here's the full list of the [Office 365 Outlook triggers](/connectors/office365/#triggers) you can use to start flows. To learn more about how to trigger flows based on email properties, go to [Trigger a cloud flow based on email properties](./email-triggers.md).

The following screenshot shows a partial list of Office 365 Outlook triggers. For the full list of triggers you can use to start a flow, go to [Office 365 Outlook triggers](/connectors/office365/#triggers).

> [!div class="mx-imgBorder"]
> ![Screenshot of a partial of the Office 365 Outlook triggers.](./media/email/email-triggers.png "Partial list of the Office 365 Outlook triggers")

## Actions

*Actions* are the events you want the flow to do after the trigger event takes place. An example of an action is, "when someone sends me an email, save it to OneDrive."

The following screenshot shows a partial list of Office 365 Outlook actions. For the full list of actions you can use in your flows, go to [Office 365 Outlook actions](/connectors/office365/#actions).

> [!div class="mx-imgBorder"]
> ![Screenshot of a partial list of Office 365 Outlook actions.](./media/email/email-actions.png "Partial list of the Office 365 Outlook actions")

### See also

- [Create flows for popular email scenarios](email-top-scenarios.md)
- [Create flows to manage email](create-email-flows.md)
- [Customize email in flows](email-customization.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]