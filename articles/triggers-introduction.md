---
title: Triggers
description: Learn about triggers in Power Automate.
author: samathur
contributors:
  - samathur
  - kisubedi
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: get-started
ms.date: 01/16/2026
ms.update-cycle: 180-days
ms.author: matow
ms.reviewer: angieandrews
ms.collection:
  - get-started
  - bap-ai-copilot
ms.custom:
  - DevRelAdv
---

# Triggers

A *trigger* is an event that starts a cloud flow. For example, you want to get a notification in Microsoft Teams when someone sends you an email. In this case, receiving an email is the trigger that starts this flow.

Power Automate offers connectors to services such as SharePoint and Outlook. Most connectors offer prebuilt triggers that you can use to start your flows. Here's a partial list of the triggers the Office 365 Outlook connector provides.

:::image type="content" source="./media/triggers-introduction/outlook-triggers-new-designer.png" alt-text="Screenshot of some of the Office 365 Outlook triggers.":::

Learn more about triggers in this quick video:</br>
</br>

> [!VIDEO 523050f3-8402-4a8a-ad86-108a1c6d2518]

## Choose the right trigger

Triggers can be started automatically, instantly or manually, or on a schedule. The following table lists some common trigger scenarios and the type of flow you should create.

|Trigger scenario |Flow type |
|---------|---------|
|Create a cloud flow that performs tasks automatically after an event occurs. For example, a cloud flow can notify you by email when someone tweets with a keyword you specify. Learn more in [Create a cloud flow from scratch](get-started-logic-flow.md).   | Automated   |
|Run a cloud flow with a tap of a button on your mobile device to remind your team to join the daily team meeting. You can trigger these flows manually from any device. Learn more in [Create flows from your phone](mobile/mobile-create-flow.md).  | Instant/manual   |
|Run a cloud flow on a schedule, for example, to send a weekly project report. Choose when (date and time) and frequency (monthly/daily/hourly, and more). Learn more in [Run flows on a schedule](./run-scheduled-tasks.md).     | Scheduled   |

## Examples of triggers

After you decide which type of flow you want to create, you can add a trigger to your flow.

### A trigger that starts an automated flow

When you create an automated cloud flow, you start by choosing your flow's trigger. The following example shows the **When a new email arrives (V3)** trigger from the Office 365 Outlook connector.

:::image type="content" source="media/triggers-introduction/triggers-automated.png" alt-text="Screenshot of some of the triggers available for automated cloud flows.":::

When you select **Create**, the trigger is added to your flow.

:::image type="content" source="media/triggers-introduction/triggers-automated-designer.png" alt-text="Screenshot of the trigger in the designer for an automated cloud flow.":::

### A trigger that starts an instant/manual flow

An instant cloud flow is triggered manually, such as when you select a button in Power Automate or in a mobile app. The following example shows the **Manually trigger a flow** trigger.

:::image type="content" source="media/triggers-introduction/triggers-instant.png" alt-text="Screenshot of some of the triggers available for instant cloud flows.":::

When you select **Create**, the trigger is added to your flow.

:::image type="content" source="media/triggers-introduction/triggers-instant-designer.png" alt-text="Screenshot of the trigger in the designer for an instant cloud flow.":::

### A trigger that starts a scheduled flow

A scheduled cloud flow runs at a specific time or on a recurring schedule, such as every day at 10:00 AM or every Monday at 9:00 AM. Before your trigger is created, you need to define the schedule for when it will run, as in the following example.

:::image type="content" source="media/work-with-triggers-actions/triggers-scheduled.png" alt-text="Screenshot of the 'Build a scheduled cloud flow' screen.":::

When you select **Create**, the **Recurrence** trigger is added to your flow.

:::image type="content" source="media/work-with-triggers-actions/triggers-scheduled-designer.png" alt-text="Screenshot of the 'Recurrence' trigger in the designer for a scheduled cloud flow.":::

## Next step

> [!div class="nextstepaction"]
> [Actions](actions-introduction.md)

## Related information

- [Training: Describe building automation with Microsoft Power Automate (module)](/training/modules/introduction-power-automate/)
- [Training: Enhance productivity with Power Automate and the Office 365 Outlook Connector (module)](/training/modules/enhance-productivity/)
- [Training: Streamline SharePoint processes with Power Automate (module)](/training/modules/streamline-processes/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
