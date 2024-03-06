---
title: Get started with triggers
description: Learn about triggers in Power Automate.
author: PriyaKodukula
contributors:
  - PriyaKodukula
  - kisubedi
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 10/02/2023
ms.author: prkoduku
ms.reviewer: angieandrews
ms.collection:
  - get-started
  - bap-ai-copilot
---

# Get started with triggers

A *trigger* is an event that starts a cloud flow. For example, you want to get a notification in Microsoft Teams when someone sends you an email. In this case, receiving an email is the trigger that starts this flow.

Power Automate offers connectors to services such as SharePoint and Outlook. Most connectors
offer prebuilt triggers that you can use to start your flows. Here's a partial look at the triggers that Office 365 Outlook connector provides by default.

:::image type="content" source="./media/triggers-introduction/outlook-triggers.png" alt-text="Screenshot of some of the Office 365 Outlook triggers.":::

## Choose the right trigger

Triggers can be started instantly or manually, on a schedule, or automatically when an external event occurs, such as when an email arrives.

### Triggers for instant/manual flows

If you'd like to run a cloud flow with a tap of a button on your mobile device, to remind your team to join the daily team meeting, create an instant flow. You can trigger these flows manually from any device.

### Triggers for scheduled flows

If you'd like to run a cloud flow on a schedule, for example, to send a weekly project report, create a *scheduled flow*. In scheduled flows, you can choose when (date and time) and frequency (monthly/daily/hourly, and more).

To learn more, go to [Run flows on a schedule](./run-scheduled-tasks.md).

### Triggers for automated flows

If you'd like to create a cloud flow that performs tasks automatically after an event occurs, for example, a cloud flow that notifies you by email when someone tweets with a keyword you specify, create [an automated flow](./get-started-logic-flow.md).

## Add a trigger to an existing flow

When you edit a trigger in an existing flow, the new trigger must be the first step of the flow.

1. Edit the flow and delete the existing trigger.

1. After deleting the trigger, Power Automate prompts you to select a new trigger.

1. Search for the connector and then select the app icon. The following screenshot shows the results if you search for **Share**.

    :::image type="content" source="./media/triggers-introduction/connectors.png" alt-text="A screenshot that shows a search for a connector.":::

1. When you select the app icon, the corresponding triggers and actions are listed. Select the trigger that best suits your needs.

## Licensing for premium connectors

You need a standalone [Power Apps license](https://powerapps.microsoft.com/pricing/) or [Power Automate license](https://make.powerautomate.com/pricing/) to access all premium, on-premises, and custom connectors. Microsoft 365 plan licensees can use standard connectors but can't use premium connectors.

Follow these steps to find your license.

1. Go to [Power Automate](https://make.powerautomate.com)

1. Select **My flows**.

1. Select a cloud flow.

1. Go to the **Details** section, and view the details under **Plan**.

## Customize a trigger by adding conditions

Sometimes, you may need to customize a trigger so that it fires only when certain conditions are met. For example, you might be using SharePoint's **When an item is created or modified** trigger in Power Automate. This trigger fires for every change to SharePoint items. However, you might want the flow to only trigger when an item is created or the status is marked as *Approved*. While you can filter other events by adding conditions to the flow, the flow still runs and the calls are counted as an API request. This causes you to reach your API request limits faster. To avoid it, you can write [expressions](./use-expressions-in-conditions.md) in trigger conditions, avoiding a *run* if the condition in trigger isn't met.

## Use trigger conditions to reduce flow runs  

Trigger conditions can help streamline your flows and reduce the number of unnecessary runs. This helps keep flow runs and Power platform requests consumption low. With trigger conditions, you can set up multiple conditions that must be met before a flow is triggered.

For example, you need to create a flow that processes every approved invoice. Without trigger conditions, your flow would trigger every time an invoice email is received, even if the invoice is not approved. This can result in the flow running 1,000 times for 1,000 invoices, even though only 50 of them are approved.

By adding a trigger condition to trigger only when an invoice has been approved, the flow runs only 50 times. This means it consumes fewer Power Platform requests. If the trigger condition isn't met, the flow isn't triggered, and no run history is logged.

This is especially important in pay-as-you-go environments, where every flow run is charged. By reducing the number of runs, you can keep your costs low while still achieving your desired outcomes.

[!INCLUDE[copilot-designer-note](./includes/copilot-designer-note.md)]

# [Classic designer](#tab/classic-designer)

To set a trigger condition:

1. Select the trigger of the flow.

1. On the upper right, select the ellipses (**…**) > **Settings**.  

1. Under **Trigger Conditions**, select **Add**.

    :::image type="content" source="./media/triggers-introduction/add-trigger-condition.png" alt-text="Screenshot that shows where you add a trigger condition.":::

1. Add an expression and then select **Done**.

    > [!NOTE]
    > Every trigger condition must start with a the **@** symbol.

    :::image type="content" source="./media/triggers-introduction/add-another-condition.png" alt-text="Screenshot of an expression.":::

    As an alternative, follow the instructions in [Easily create expressions](#easily-create-expressions).

1. If you have multiple filter conditions to add, Select **+ Add** and add expressions.

    By default, all conditions must be met for the condition to be true. If any condition is optional, you need **OR**, and then use the syntax  `@or (test1, test2,test3)`.

### Easily create expressions

Your flow can generate expressions for you.

1. On your flow, select the **+** sign in the down arrow, and then select **Add an action**.

1. Search for and select the **Filter array** action.

1. On the **Filter array** card, create your condition.

1. Select **Edit in advanced mode** and copy the expression.

1. Paste the expression into the trigger condition.

1. Remove the **Filter array** action.

# [Edit with Copilot](#tab/edit-with-copilot)

[!INCLUDE [cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

To set a trigger condition:

1. Select the trigger of the flow.
1. Select **Settings**.  
1. Next to **Trigger conditions**, select **Add**.

     :::image type="content" source="./media/triggers-introduction/copilot-trigger-add.png" alt-text="Screenshot that shows trigger site in Copilot.":::

1. Add an expression.

    > [!NOTE]
    > Every trigger condition must start with a the **@** symbol.

     :::image type="content" source="./media/triggers-introduction/copilot-trigger-example.png" alt-text="Screenshot that shows an expression example in Copilot.":::

    As an alternative, follow the instructions in [Easily create expressions](#easily-create-expressions).

1. If you have multiple filter conditions to add, Select **+ Add** and add expressions.

    By default, all conditions must be met for the condition to be true. If any condition is optional, you need **OR**, and then use the syntax  `@or (test1, test2,test3)`.

### Easily create expressions

Your flow can generate expressions for you.

1. On your flow, select the **+** sign in the down arrow, and then select **Add an action**.

1. Search for and select the **Filter array** action.

1. On the **Filter array** card, create your condition.

1. Select **Edit in advanced mode** and copy the expression.

1. Paste the expression into the trigger condition.

1. Remove the **Filter array** action.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
