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
ms.date: 10/01/2025
ms.update-cycle: 180-days
ms.author: kewaiss
ms.reviewer: angieandrews
ms.collection:
  - get-started
  - bap-ai-copilot
ms.custom:
  - DevRelAdv
---

# Triggers

A *trigger* is an event that starts a cloud flow. For example, you want to get a notification in Microsoft Teams when someone sends you an email. In this case, receiving an email is the trigger that starts this flow.

Power Automate offers connectors to services such as SharePoint and Outlook. Most connectors offer prebuilt triggers that you can use to start your flows. Here's a partial look at the triggers that Office 365 Outlook connector provides by default.

:::image type="content" source="./media/triggers-introduction/outlook-triggers-new-designer.png" alt-text="Screenshot of some of the Office 365 Outlook triggers.":::

Learn more about triggers in this quick video:</br>
</br>

> [!VIDEO 523050f3-8402-4a8a-ad86-108a1c6d2518]

## Choose the right trigger

Triggers can be started instantly or manually, on a schedule, or automatically when an external event occurs, such as when an email arrives. The following table lists some common trigger scenarios and the type of flow you should create.

|Trigger scenario |Flow type |
|---------|---------|
|Run a cloud flow with a tap of a button on your mobile device to remind your team to join the daily team meeting. You can trigger these flows manually from any device.  | Instant/manual   |
|Run a cloud flow on a schedule, for example, to send a weekly project report. Choose when (date and time) and frequency (monthly/daily/hourly, and more). Learn more in [Run flows on a schedule](./run-scheduled-tasks.md).     | Scheduled   |
|Create a cloud flow that performs tasks automatically after an event occurs, for example, a cloud flow that notifies you by email when someone tweets with a keyword you specify. Learn more in [Create a cloud flow from scratch](get-started-logic-flow.md).   | Automated   |

## Licensing for premium connectors

You need a standalone [Power Automate license](https://make.powerautomate.com/pricing/) to access all premium, on-premises, and custom connectors. For flows within an app built in Power Apps, you can use a [Power Apps license](https://powerapps.microsoft.com/pricing/). Microsoft 365 plan licenses let you use standard connectors but not premium connectors. Learn more in the [Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

To find your license:

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Select **My flows**.
1. Select a cloud flow.
1. In the **Details** section, view the details under **Plan**.

## Next step

> [!div class="nextstepaction"]
> [Actions overview](actions-introduction.md)

## Related information

- [Training: Describe building automation with Microsoft Power Automate (module)](/training/modules/introduction-power-automate/)
- [Training: Enhance productivity with Power Automate and the Office 365 Outlook Connector (module)](/training/modules/enhance-productivity/)
- [Training: Streamline SharePoint processes with Power Automate (module)](/training/modules/streamline-processes/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
