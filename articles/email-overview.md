---
title: Overview of using Outlook and Power Automate
description: Get an overview of using Outlook and Power Automate.
suite: flow
author: kewaiss
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: overview
ms.date: 06/17/2025
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

## Find Outlook triggers

A *trigger* is an event that starts a cloud flow. For example, **When an email is flagged (V3)** is a trigger.

Use the **Search** field to find triggers by entering keywords. For example, if you want to find triggers related to Outlook, type **outlook** in the search box.

:::image type="content" source="./media/email/email-triggers.png" alt-text="Screenshot of a list of Office 365 Outlook triggers.":::


Tutorials for how to use triggers in your cloud flows are available in [Trigger a cloud flow based on email properties](./email-triggers.md).

Get the full list of triggers you can use in your cloud flows in [Office 365 Outlook triggers](/connectors/office365/#triggers).

## Find Outlook actions

*Actions* are the events you want the flow to do after the trigger event takes place. An example of an action for the **When an email is flagged (V3)** trigger is **Create contact (V2)**.

:::image type="content" source="./media/email/trigger-action.png" alt-text="Screenshot of a trigger and an action in a cloud flow.":::

You can use the **Search** field to find actions by entering keywords. For example, if you want to find actions related to Outlook, type **outlook** in the search box.

:::image type="content" source="./media/email/email-actions.png" alt-text="Screenshot of a list of Office 365 Outlook actions.":::


Tutorials for how to use actions in your cloud flows are available in [Create flows for popular email scenarios](email-top-scenarios.md) and [Customize email in flows](./email-customization.md).

Get the full list of actions you can use in your cloud flows in [Office 365 Outlook actions](/connectors/office365/#actions).

## Shortcuts to find triggers and actions

To help you find triggers or actions quickly, use the shortcuts in the following table.

|Shortcut  |How to use  |
|---------|---------|
|Display all triggers or actions  |     When you search for actions or triggers, a condensed list within each category displays. If you want all options to display, select **See more** at the top of the category.    |
|Display your most often used triggers or actions at the top  | Select the **Favorite** icon (the star) next to a category name or the trigger or action name. Next time you open the pane, your triggers or actions you marked as favorite appear at the top of the pane.  |

## Related information

- [Create flows for popular email scenarios](email-top-scenarios.md)
- [Create flows to manage email](create-email-flows.md)
- [Customize email in flows](email-customization.md)
- [Training: Enhance productivity with Power Automate and the Office 365 Outlook Connector (module)](/training/modules/enhance-productivity/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
