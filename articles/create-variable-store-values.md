---
title: Store and manage values in variables in Power Automate
description: Learn how to store, manage, use, and pass values by using variables in your flows
suite: flow
author: kisubedi
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 04/04/2025
ms.author: kisubedi
ms.reviewer: angieandrews
ms.custom: bap-template
ms.collection: bap-ai-copilot
---

# Store and manage values in variables

This article shows how to create and work with variables to store values in your cloud flows. For example, variables can help you track the number of times a loop runs. To iterate over an array or check an array for a specific item, you can use a variable to reference the index number 'apply to each' array item.

You can create variables for data types such as integer, float, boolean, string, array, and object. After you create a variable, you can perform other tasks, for example:

- Get or reference the variable's value.
- Increase or decrease the variable by a constant value, also known as *increment* and *decrement*.
- Assign a different value to the variable.
- Insert or *append* the variable's value as the last item in a string or array.

Variables exist and are global only within the cloud flow that creates them. Also, they persist across any loop iterations inside the flow. 

When you reference a variable, use the variable's name as the token, not the action's name, which is the usual way to reference an action's outputs.

> [!WARNING]
> By default, each iteration in the 'apply to each' loops run sequentially. You can run the loop iterations in parallel to improve performance. If you use variables in the 'apply to each' loops, you *must* run the loop iterations sequentially if it's important for your loop variables to return predictable results.

## Prerequisites

Before you can add actions for creating and working with variables, your flow must start with a trigger. You can't use a mobile device to add variables.

- Access to [Power Automate](https://make.powerautomate.com).
- A cloud flow in which you want to create the variable.
- If you're new to Power Automate, review [Get started with Power Automate](getting-started.md) and [Overview of cloud flows](overview-cloud.md).

[!INCLUDE[designer-tab-experience](./includes/designer-tab-experience.md)]

## Initialize a variable

# [New designer](#tab/new-designer)

You can create a variable and declare its data type and initial value all within one action in your flow. You can only declare variables at the global level, not within scopes, conditions, and loops.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Create or open a cloud flow.

1. Under the step where you want to add a variable, follow one of these steps.

   * To add an action below the last step, select the plus sign (**+**).
   * To add an action between steps, move your input device pointer over the connecting arrow so that the plus sign (**+**) appears. Select the plus sign (**+**) > **Add an action**.

1. In the search box under **Add an action**, enter **initialize variable** as your filter.
1. From the **Actions** list, select **Initialize variable - Variable**.

1. Provide the following information about your variable.

   | Property | Required | Value |  Description |
   |----------|----------|-------|--------------|
   | Name | Yes | <*variable-name*> | The name for the variable to initialize. |
   | Type | Yes | <*variable-type*> | The data type for the variable. |
   | Value | No | <*start-value*> | The initial value for your variable.<br/>**Tip**: Although optional, set this value as a best practice so you always know the start value for your variable. |

    Example:
    :::image type="content" source="./media/create-variables-store-values/variable-values.png" alt-text="Screenshot of the variable parameters example.":::

1. Add the other actions that you want. When you're done, select **Save**.

> [!NOTE]
> Although the **Initialize variable** action has a `variable` section structured as an array, the action can create only one variable at a time. Each new variable requires an individual **Initialize variable** action.

# [Classic designer](#tab/classic-designer)

You can create a variable and declare its data type and initial value all within one action in your flow. You can only declare variables at the global level, not within scopes, conditions, and loops.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Create or open a cloud flow.
1. Under the step where you want to add a variable, follow one of these steps.

   * To add an action under the last step, select **New step**.
   * To add an action between steps, move your input device pointer over the connecting arrow until the plus sign (**+**) appears. Select the plus sign (**+**) > **Add an action**.

1. In the search box under **Choose an operation**, enter **variable** as your filter.
1. From the **Actions** list, select **Initialize variable - Variable**.

    :::image type="content" source="./media/create-variables-store-values/select-initialize-variable-action.png" alt-text="Screenshot of the Initialize variable action.":::

1. Provide the following information about your variable.

   | Property | Required | Value |  Description |
   |----------|----------|-------|--------------|
   | **Name** | Yes | <*variable-name*> | The name for the variable to initialize |
   | **Type** | Yes | <*variable-type*> | The data type for the variable |
   | **Value** | No | <*start-value*> | The initial value for your variable <p><p>**Tip**: Although optional, set this value as a best practice so you always know the start value for your variable. |

    Example:

    :::image type="content" source="./media/create-variables-store-values/initialize-variable.png" alt-text="Screenshot of the Initialize variable example.":::

1. Add the other actions that you want. When you're done, select **Save**.

> [!NOTE]
> Although the **Initialize variable** action has a `variable` section structured as an array, the action can create only one variable at a time. Each new variable requires an individual **Initialize variable** action.

---

## Examples of other variable types

*String variable*

```json

   "name": "myStringVariable",
   "type": "String",
   "value": "lorem ipsum"
```

*Boolean variable*

```json
   "name": "myBooleanVariable",
   "type": "Boolean",
   "value": false
```

*Array with integers*

```json
   "name": "myArrayVariable",
   "type": "Array",
   "value": [1, 2, 3]
```

*Array with strings*

```json
   "name": "myArrayVariable",
   "type": "Array",
   "value": ["red", "orange", "yellow"]
```

## Get the variable's value

To retrieve or reference a variable's contents, you can use the `variables()` function in the Power Automate designer.

For example, this expression gets the items from the array variable by using the `variables()` function. The `string()` function returns the variable's contents in string format: `"1, 2, 3, red"`

```json
@{string(variables('myArrayVariable'))}
```

## Increment variable

To increase or *increment* a variable by a constant value, add the **Increment variable** action to your flow.

> [!NOTE]
> The **Increment variable** action works only with integer and float variables.

# [New designer](#tab/new-designer)

1. In the Power Automate designer, under the step where you want to increase an existing variable, select the plus sign (**+**).

    To add an action between steps, move your input device pointer over the connecting arrow until the plus sign (**+**) appears. Select the plus sign (**+**) > **Add an action**.

1. In the search box, enter **increment variable** as your filter.
1. In the **Actions** list, select **Increment variable - Variable**.

1. Provide this information for incrementing your variable:

   | Property | Required | Value |  Description |
   |----------|----------|-------|--------------|
   | **Name** | Yes | <*variable-name*> | The name for the variable to increment |
   | **Value** | No | <*increment-value*> | The value used for incrementing the variable. The default value is one. <p><p>**Tip**: Although optional, set this value as a best practice so you always know the specific value for incrementing your variable. |

   Example:

    :::image type="content" source="./media/create-variables-store-values/increment-variable-action-information-modern-designer.png" alt-text="Screenshot of the Increment variable action example.":::

1. When you're done, select **Save** on the designer toolbar.

# [Classic designer](#tab/classic-designer)

This action works only with integer and float variables.

1. In the Power Automate designer, under the step where you want to increase an existing variable, select **New step**.

    To add an action between steps, move your input device pointer over the connecting arrow until the plus sign (**+**) appears. Select the plus sign (**+**) > **Add an action**.

1. In the search box, enter **increment variable** as your filter.
1. In the **Actions** list, select **Increment variable - Variable**.
1. Provide this information for incrementing your variable:

   | Property | Required | Value |  Description |
   |----------|----------|-------|--------------|
   | **Name** | Yes | <*variable-name*> | The name for the variable to increment |
   | **Value** | No | <*increment-value*> | The value used for incrementing the variable. The default value is one. <p><p>**Tip**: Although optional, set this value as a best practice so you always know the specific value for incrementing your variable. |

   Example:

    :::image type="content" source="./media/create-variables-store-values/increment-variable-action-information-classic.png" alt-text="Screenshot of the Increment variable action example.":::

1. When you're done, on the designer toolbar, select **Save**.

---

## Example: Create loop counter

Variables are commonly used for counting the number of times that a loop runs. This example shows how to create and use variables for this task by creating a loop that counts the attachments in an email.

# [New designer](#tab/new-designer)

1. In Power Automate, create a cloud flow and add a trigger that checks for new email and any attachments.

   This example uses the Office 365 Outlook trigger for **When a new email arrives (V3)**. You can set up this trigger to fire only when the email has attachments. However, you can use any connector that checks for new emails with attachments, such as the Outlook.com connector.

1. In the trigger, to check for attachments and pass those attachments into your flow, select **Yes** for these properties:

    - **Include Attachments**
    - **Only with Attachments**

1. Add the **Initialize variable** action with the following values:
    - **Name:** Count
    - **Type:** Integer
    - **Value:** 0 (start value)

1. Add an *apply to each* loop to cycle through the attachments.

   1. Under the **Initialize variable** action, select **New step**.
   1. In the search box, enter **apply to each** as your search filter, and select **Apply to each**.

    :::image type="content" source="./media/create-variables-store-values/copilot-add-loop-new-designer.png" alt-text="Screenshot of adding an Apply to each - Control loop.":::

1. In the loop, select inside the **Select an output from previous steps** box. When the dynamic content list appears, select **Attachments**.

   The **Attachments** property passes an array, which has all email attachments from the email, into your loop.

1. In the **Apply to each** loop, select the plus sign (+) for **Add an action**.
1. In the search box, enter **increment variable** as your filter.
1. From the actions list, select **Increment variable**.

   > [!NOTE]
   > The **Increment variable** action must appear inside the loop.

1. In the **Increment variable** action, from the **Name** list, select the **Count** variable.

1. Under the loop, add any action that sends you the number of attachments. In your action, include the value from the **Count** variable. For example, in the following screenshot, **Send an email (V2)** sends the number of attachments:

    :::image type="content" source="./media/create-variables-store-values/copilot-send-email-results-new-designer.png" alt-text="Screenshot of adding an action that sends results.":::

1. On the designer toolbar, select **Save**.

# [Classic designer](#tab/classic-designer)

1. In Power Automate, create a cloud flow and add a trigger that checks for new email and any attachments.

   This example uses the Office 365 Outlook trigger for **When a new email arrives (V3)**. You can set up this trigger to fire only when the email has attachments. However, you can use any connector that checks for new emails with attachments, such as the Outlook.com connector.

1. In the trigger, to check for attachments and pass those attachments into your flow, select **Yes** for these properties:

    - **Include Attachments**
    - **Only with Attachments**

1. Add the **Initialize variable** action with the following values:
    - **Name:** Count
    - **Type:** Integer
    - **Value:** 0 (start value)

1. Add an *apply to each* loop to cycle through the attachments.

   1. Under the **Initialize variable** action, select **New step**.
   1. In the search box, enter **apply to each** as your search filter, and select **Apply to each**.

    :::image type="content" source="./media/create-variables-store-values/add-loop.png" alt-text="Screenshot of adding an Apply to each loop to cycle through the attavhments.":::

1. In the loop, select inside the **Select an output from previous steps** box. When the dynamic content list appears, select **Attachments**.

   The **Attachments** property passes an array, which has all email attachments from the email, into your loop.

1. In the **Apply to each** loop, select **Add an action**.
1. In the search box, enter **increment variable** as your filter.
1. From the actions list, select **Increment variable**.

   > [!NOTE]
   > The **Increment variable** action must appear inside the loop.

1. In the **Increment variable** action, from the **Name** list, select the **Count** variable.

1. Under the loop, add any action that sends you the number of attachments. In your action, include the value from the **Count** variable. For example, in the following screenshot, **Send an email (V2)** sends the number of attachments:

    :::image type="content" source="./media/create-variables-store-values/send-email-results-classic-designer.png" alt-text="Screenshot of adding an action that sends results in Copilot.":::

1. On the designer toolbar, select **Save**.

---

## Decrement variable

To decrease or *decrement* a variable by a constant value, follow the steps for increasing a variable except that you find and select the **Decrement variable** action instead. This action works only with integer and float variables.

Here are the properties for the **Decrement variable** action:

| Property | Required | Value |  Description |
|----------|----------|-------|--------------|
| **Name** | Yes | <*variable-name*> | The name for the variable to decrement | 
| **Value** | No | <*increment-value*> | The value for decrementing the variable. The default value is one. <p><p>**Tip**: Although optional, set this value as a best practice so you always know the specific value for decrementing your variable. |

## Set variable

To assign a different value to an existing variable, follow the steps for increasing a variable except that you:

1. Find and select the **Set variable** action instead.

1. Provide the variable name and value you want to assign. Both the new value and the variable must have the same data type. The value is required because this action doesn't have a default value.

Here are the properties for the **Set variable** action:

| Property | Required | Value |  Description |
|----------|----------|-------|--------------|
| **Name** | Yes | <*variable-name*> | The name for the variable to change |
| **Value** | Yes | <*new-value*> | The value you want to assign the variable. Both must have the same data type. |

> [!NOTE]
> Unless you're incrementing or decrementing variables, changing variables inside loops *might* create unexpected results if you run loops in parallel. For these cases, try setting your loop to run sequentially, which is the default setting. 

## Append to variable

For variables that store strings or arrays, you can insert or *append* a variable's value as the last item in those strings or arrays. You can follow the steps for increasing a variable except that you follow these steps instead: 

1. Find and select one of these actions based on whether your variable is a string or an array. 

   * **Append to string variable**
   * **Append to array variable**

1. Provide the value to append as the last item in the string or array. This value is required.

Here are the properties for the **Append to...** actions:

| Property | Required | Value |  Description |
|----------|----------|-------|--------------|
| **Name** | Yes | <*variable-name*> | The name for the variable to change |
| **Value** | Yes | <*append-value*> | The value you want to append, which can have any type |

## Related information

[Power Automate connectors](/connectors/connectors)
