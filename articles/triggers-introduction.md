---
title: Get started with triggers
description: Learn about triggers in Power Automate.
author: samathur
contributors:
  - samathur
  - kisubedi
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: get-started
ms.date: 07/08/2025
ms.update-cycle: 180-days
ms.author: kewaiss
ms.reviewer: angieandrews
ms.collection:
  - get-started
  - bap-ai-copilot
  - DevRelAdv
  - CXT
---

# Get started with triggers

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

## Replace the trigger in an existing cloud flow

When you replace a trigger in an existing flow, the new trigger must be the first step of the flow.

You work with triggers in the *designer*. [!INCLUDE[designer-tab-experience](./includes/designer-tab-experience.md)]

# [New designer](#tab/new-designer)

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Open the cloud flow that you want to edit:
    1. On the navigation pane to the left, select **My flows**.
    1. Select the flow that you want to edit.
    1. On the command bar at the top of the page, select **Edit**.
1. In the flow designer, select the trigger that you want to replace.
1. At the top of the configuration pane, select the vertical ellipsis (**&vellip;**) and then select **Delete**.

    To confirm the deletion, select **OK** in the dialog box that appears.

1. After you delete the trigger, Power Automate replaces the current trigger with the **Add a trigger** card.
1. Select the **Add a trigger** card. The **Add a trigger** pane opens.
1. Search for the connector or trigger you want to use. You can search for a specific trigger by typing a name in the search field, or by selecting the right arrow (**>**) next to an option in a trigger category.

    The **Add a trigger** pane is organized in the same way as the **Add an action** pane. Learn more in [Explore the cloud flows designer](flows-designer.md#configuration-pane).

1. Select the trigger that you want to use. The configuration pane opens to allow you to configure the trigger.
1. Configure the trigger settings, if needed.
1. Close the configuration pane and return to the flow designer by selecting **<<**.

    The new trigger is now the first step in your flow.

1. On the command bar at the top of the page, select **Save** to save your changes.


# [Classic designer](#tab/classic-designer)

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Open the cloud flow that you want to edit:
    1. On the navigation pane to the left, select **My flows**.
    1. Select the flow that you want to edit.
    1. On the command bar at the top of the page, select **Edit**.
1. On the trigger card, select the ellipsis (**…**) and then select **Delete**.

    To confirm the deletion, select **OK** in the dialog box that appears.

    After you delete the trigger, Power Automate prompts you to select a new trigger.

1. Search for the connector or trigger you want to use with one of the following methods:
    - To get a list of the corresponding triggers for a specific app, select the icon for the app.
    - To use a keyword search or to search for a specific trigger, enter the keyword or name of the trigger in the **Search connectors and triggers** field.
  
    Both methods return a list of triggers that you can use in your flow. If you can't find the trigger you want in the list, select **See more**.

1. Select the trigger that you want to use. You return to the designer, where you can configure the trigger.
1. On the command bar at the top of the page, select **Save** to save your changes.

---

## Licensing for premium connectors

You need a standalone [Power Automate license](https://make.powerautomate.com/pricing/) to access all premium, on-premises, and custom connectors. For flows within an app built in Power Apps, you can use a [Power Apps license](https://powerapps.microsoft.com/pricing/). Microsoft 365 plan licenses let you use standard connectors but not premium connectors. Learn more in the [Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

To find your license:

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Select **My flows**.
1. Select a cloud flow.
1. In the **Details** section, view the details under **Plan**.

## Customize a trigger by adding conditions

Sometimes, you might need to customize a trigger so that it fires only when certain conditions are met. For example, you might be using SharePoint's **When an item is created or modified** trigger in Power Automate. This trigger fires for every change to SharePoint items. However, you might want the flow to only trigger when an item is created or the status is marked as *Approved*. While you can filter other events by adding conditions to the flow, the flow still runs and the calls are counted as an API request. This causes you to reach your API request limits faster. To avoid it, you can write [expressions](./use-expressions-in-conditions.md) in trigger conditions, avoiding a *run* if the condition in trigger isn't met.

Learn more about conditions in this quick video:</br>
</br>

> [!VIDEO fd4468f4-6d56-499e-98d0-4d98086cf9d5]

## Use trigger conditions to reduce flow runs  

Trigger conditions can help streamline your flows and reduce the number of unnecessary runs. This helps keep flow runs and Power platform requests consumption low. With trigger conditions, you can set up multiple conditions that must be met before a flow is triggered.

For example, you need to create a flow that processes every approved invoice. Without trigger conditions, your flow would trigger every time an invoice email is received, even if the invoice isn't approved. This can result in the flow running 1,000 times for 1,000 invoices, even though only 50 of them are approved.

By adding a trigger condition to trigger only when an invoice is approved, the flow runs only 50 times. This means it consumes fewer Power Platform requests. If the trigger condition isn't met, the flow isn't triggered, and no run history is logged.

This is especially important in pay-as-you-go environments, where every flow run is charged. By reducing the number of runs, you can keep your costs low while still achieving your desired outcomes.

[!INCLUDE[designer-tab-experience](./includes/designer-tab-experience.md)]

# [New designer](#tab/new-designer)

1. Open the cloud flow that you want to edit:
    1. On the navigation pane to the left, select **My flows**.

    1. Select the flow that you want to edit.

    1. On the command bar at the top of the page, select **Edit**.

1. Set a trigger condition:
    1. Select the trigger of the flow.
    1. Select **Settings**.  
    1. Next to **Trigger conditions**, select **+ Add**.

        :::image type="content" source="./media/triggers-introduction/copilot-trigger-add-new-designer.png" alt-text="Screenshot that shows trigger site in Copilot.":::

1. Add an expression. Learn how to use expressions in [Use expressions in conditions to check multiple values](use-expressions-in-conditions.md). Learn more in [Create, update, and fix expressions with Copilot expression assistant](expressions-copilot.md).

    Every trigger condition must start with the **@** symbol.

     :::image type="content" source="./media/triggers-introduction/copilot-trigger-example-new-designer.png" alt-text="Screenshot that shows an expression example in Copilot.":::

    Alternatively, follow the instructions in [Easily create expressions](#easily-create-expressions).

1. If you have multiple filter conditions to add, select **+ Add** and add expressions.

    By default, all conditions must be met for the condition to be true. If any condition is optional, you need **OR**, and then use the syntax  `@or (test1, test2,test3)`.

### Easily create expressions

Your flow can generate expressions for you.

1. On your flow, select the **+** sign in the down arrow.
1. In the **Add an action** pane, search for and select the **Filter array** action.
1. On the **Filter array** pane, [create your condition](add-condition.md#add-a-condition).
1. Select **Edit in advanced mode** and copy the expression.
1. In the designer, open the trigger.
1. In the **Settings** tab, paste the expression into the trigger condition.
1. Delete the **Filter array** action from your flow.

# [Classic designer](#tab/classic-designer)

1. Open the cloud flow that you want to edit:
    1. On the navigation pane to the left, select **My flows**.

    1. Select the flow that you want to edit.

    1. On the command bar at the top of the page, select **Edit**.

1. Set a trigger condition:
    1. Select the trigger of the flow to expand it.

    1. In the upper-right corner, select the ellipsis (**…**), and then select **Settings**.  

    1. Under **Trigger Conditions**, select **Add**.

    :::image type="content" source="./media/triggers-introduction/add-trigger-condition.png" alt-text="Screenshot that shows where you add a trigger condition.":::

1. Add an expression and then select **Done**. Learn how to use expressions in [Use expressions in conditions to check multiple values](use-expressions-in-conditions.md). Learn more in [Create, update, and fix expressions with Copilot expression assistant](expressions-copilot.md).

    Every trigger condition must start with the **@** symbol.

    :::image type="content" source="./media/triggers-introduction/add-another-condition.png" alt-text="Screenshot of an expression.":::

    Alternatively, follow the instructions in [Easily create expressions](#easily-create-expressions).

1. If you have multiple filter conditions to add, Select **+ Add** and add expressions.

    By default, all conditions must be met for the condition to be true. If any condition is optional, you need **OR**, and then use the syntax  `@or (test1, test2,test3)`.

### Easily create expressions

Your flow can generate expressions for you.

1. On your flow, select the **+** sign in the down arrow, and then select **Add an action**.
1. Search for and select the **Filter array** action.
1. On the **Filter array** card, [create your condition](add-condition.md#add-a-condition).
1. Select **Edit in advanced mode** and copy the expression.
1. Paste the expression into the trigger condition.
1. Delete the **Filter array** action from your flow by selecting the ellipsis (**…**) and then **Delete**.

---

## Related information

- [Training: Describe building automation with Microsoft Power Automate (module)](/training/modules/introduction-power-automate/)
- [Training: Enhance productivity with Power Automate and the Office 365 Outlook Connector (module)](/training/modules/enhance-productivity/)
- [Training: Streamline SharePoint processes with Power Automate (module)](/training/modules/streamline-processes/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
