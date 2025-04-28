---
title: Create, update, and fix expressions with Copilot expression assistant (preview)
description: Learn how to create, update, and fix your expressions with Copilot expression assistant in the cloud flows designer.
suite: flow
author: HeatherOrt
contributors:
 - HeatherOrt
 - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 04/16/2025
ms.author: heortaol
ms.custom: DevRelAdv
search.audienceType: 
  - flowmaker
  - enduser
ms.reviewer: angieandrews
ms.collection: bap-ai-copilot
---

# Create, update, and fix expressions with Copilot expression assistant (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

The expression assistant is available to tenants where Copilot is enabled. On the new designer, you can use this functionality to create, update, and fix expressions with the help of Copilot.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

To learn how to create an expression with Copilot, check out this short video:<br/>
<br/>
> [!VIDEO 403ad290-5271-42d3-ba4c-e5bb3c5629c8]

## Open the expression editor

Once you open the expression editor, you can use the instructions in the following scenarios to create and edit your expressions.

1. Select the action that contains the operation you want to edit.
1. In the action configuration pane, select the field that you want to edit.
1. Select **fx**.

## Scenario 1: Create an expression with natural language

Use Copilot to create an expression with natural language.

1. On the expression editor, select **Create expression with Copilot**.

    The user experience that displays is the user experience for expression assistant.
1. In the text box, write a prompt to generate an expression for, and select **Create expression**.

    You can reference the flow's dynamic content in your prompt using their names to build expressions around. For example, assume you have first name, last name, phone number, and TriggerDate as dynamic data in your flow. You can ask following sample prompts:

    - Concatenate first name and last name.
    - Grab last four characters of Phone Number.
    - Convert Phone number from Integer to String.
    - Format TriggerDate to 'DD-MM' format.

    :::image type="content" source="media/expressions-copilot/create-expression-nl.png" alt-text="Screenshot of creating an expression with Copilot.":::

## Scenario 2: Update an existing expression with natural language

If you have an existing expression that you created manually or through the expression assistant, you can select **Create expression with Copilot** in expression editor. Now it understands the context of the expression, and any prompt you write is used to modify the existing expression.

To finalize the update, follow this procedure:

1. To return the updated expression, select **Create expression**.
1. To apply to expression editor, select **OK**.
1. To apply to your flow, select **Add**.

For example, select an expression.

:::image type="content" source="media/expressions-copilot/compose-nl.png" alt-text="Screenshot of an input parameter.":::

Then, select **Create expression with Copilot**. Next, describe how you want to update this existing expression and select **Update**.

:::image type="content" source="media/expressions-copilot/compose-full-nl.png" alt-text="Screenshot of an expression and string functions.":::

Finally, select **OK** to apply the Copilot generated expression.

:::image type="content" source="media/expressions-copilot/compose-ok-nl.png" alt-text="Screenshot of a suggested expression.":::

## Scenario 3: Fix an invalid expression using a button

You can use the same experience to fix erroneous expressions. The following example shows an erroneous expression that has a missing parenthesis after 'Phone' [variables function opening parenthesis didn't close].  

:::image type="content" source="media/expressions-copilot/phone-paren.png" alt-text="Screenshot of an erroneous expression.":::

At this point, when you select **Create expression with Copilot**, it automatically fixes the expression that is currently loaded in expression editor.

:::image type="content" source="media/expressions-copilot/phone-paren-fix.png" alt-text="Screenshot of a suggested fix for an erroneous expression.":::

