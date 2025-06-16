---
title: Overview of using Outlook and Power Automate
description: Get an overview of using Outlook and Power Automate.
suite: flow
author: v-kewaiss
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: overview
ms.date: 06//2025
ms.author: kewaiss
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Overview of using Outlook and Power Automate

Connectors represent the service to which you want to connect. For example, you can use the OneDrive, SharePoint, or Twitter (now X) connectors to use those services. Two of the most popular connectors used in cloud flows to send or receive email are the [Outlook.com](/connectors/outlook/) connector and the [Office 365 Outlook](/connectors/office365/#connector-in-depth) connector. Both connectors offer similar operations that you can use to manage your mail, calendars, and contacts. You can perform actions such as send mail, schedule meetings, add contacts, and more with either of these connectors.

## When to use the Outlook.com or Office 365 Outlook connector

If you're using a work or school email account, use the Office 365 Outlook connector. If you're using a personal account (Microsoft account), use the Outlook.com connector. In this article, we refer only to the Office 365 Outlook [triggers](/connectors/office365/#triggers) and [actions](/connectors/office365/#actions). You can also use the same techniques for the Outlook.com connector.

## Start a cloud flow with a trigger

A *trigger* is an event that starts a cloud flow. For example, **When a new email arrives (V3)** is a trigger that starts a flow when an email arrives into an inbox. You can also trigger flows based on the properties of an email. Learn more in [Trigger a cloud flow based on email properties](./email-triggers.md).

:::image type="content" source="./media/email/email-triggers.png" alt-text="Screenshot of a list of Office 365 Outlook triggers.":::

Get the full list of triggers you can use to start cloud flows in [Office 365 Outlook triggers](/connectors/office365/#triggers).

## Find actions to take place after the trigger

*Actions* are the events you want the flow to do after the trigger event takes place. An example of an action is, **Create event (V4)**.

When you search for actions, you get a condensed list of the actions within each category. If you want all actions to display, select **See more** at the top of the category.

You can save your favorite actions to use them later. To do this, select the star next to the action name. Next time you open the action pane, your actions marked as favorite appear at the top of the list.

You can also use the **Search** box to find actions by entering keywords. For example, if you want to find actions related to calendar, type "calendar" in the search box.

:::image type="content" source="./media/email/email-actions.png" alt-text="Screenshot of a partial list of Office 365 Outlook actions.":::

Get the full list of actions you can use in your flows in [Office 365 Outlook actions](/connectors/office365/#actions).

## Related information

- [Create flows for popular email scenarios](email-top-scenarios.md)
- [Create flows to manage email](create-email-flows.md)
- [Customize email in flows](email-customization.md)
- [Training: Enhance productivity with Power Automate and the Office 365 Outlook Connector (module)](/training/modules/enhance-productivity/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
