---
title: Customize your triggers with conditions
description: Learn how to customize your triggers by adding conditions.
author: kewaiss
contributors:
  - kewaiss
  - v-aangie
ms.date: 08/05/2025
ms.topic: how-to
ms.service: power-automate
ms.subservice: cloud-flow
ms.author: kewaiss
ms.reviewer: angieandrews
search.audienceType:
  - flowmaker
  - enduser
ms.collection:
  - get-started
  - bap-ai-copilot
---

# Customize your triggers with conditions

Triggers are the starting point for your flows. They define when a flow should run and can be customized to suit your specific needs. This article shows you how to customize triggers in Power Automate.

## Add conditions to your trigger

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

- [Triggers overview](triggers-introduction.md)
- [Use expressions in conditions to check multiple values](use-expressions-in-conditions.md)