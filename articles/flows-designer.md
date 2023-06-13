---
title: Understand the cloud flows designer (preview)
description: Learn about the components in the cloud flows designer.
services: ''
suite: flow
author: kisubedi
contributors:
 - kisubedi
 - v-aangie
editor: ''
tags: ''
ms.subservice: cloud-flow
ms.topic: overview
ms.date: 06/30/2023
ms.author: kisubedi
search.audienceType: 
  - flowmaker
  - enduser
ms.reviewer: angieandrews
---

# Understand the cloud flows designer (preview)

[This article is prerelease documentation and is subject to change.]

## Overview of the cloud flows designer

Use the designer to create, configure, and customize your cloud flows. The legend below the following screenshot describes the features of the designer.

:::image type="content" source="media/flows-designer/designer-overview.png" alt-text="Screenshot of the cloud flows designer.":::

Legend:

1. [Free-form canvas](#free-form-canvas): The canvas is free-flowing, which allows for easier navigation.
1. [Copilot pane](get-started-with-copilot.md): Copilot stays by you in your flow editing and fit-and-finish journey. It can help you update and make changes to your flow based on your conversational style prompt. It can also help answer flow and product related  questions.
1. [Action configuration pane](#action-configuration-pane): Once you select an action card in the canvas to configure, the action pane opens on demand to the left of the designer.
1. [Flow zooming controls](#flow-zooming-controls): Adjust the size of your flow in the canvas.
1. [Send Feedback](#send-feedback): Send us feedback on your flow creation experience, or general comments on the designer.
1. [Copilot entry point](get-started-with-copilot.md): Show or hide the Copilot pane. The Copilot pane opens by default as soon as the designer loads.
1. [**Save** and **Test**](guidance/planning/introduction.md): Save and test your flow. Testing is part of planning a Power Automate project. To learn more, go to [Introduction: Planning a Power Automate project](guidance/planning/introduction.md).

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]
>- For more information, go to our [preview terms](https://powerplatform.microsoft.com/legaldocs/supp-powerplatform-preview/).

## Free-form canvas

For easy navigation, you can drag your flow within the canvas. The action cards in the canvas are small, as you can configure individual actions on the left in their own pane. The action cards on the free-form canvas are compact. This allows for easy visibility and navigation, especially for large flows. The canvas also contains designer drop zones indicated by a blue dashed line to help you easily drag and drop cloud flow actions.  

:::image type="content" source="media/flows-designer/drop-zone.png" alt-text="Screenshot of an action card and a drop-zone.":::

## Action configuration pane

The action configuration pane allows you to customize parameters, settings, and code for the selected action card.

### Parameters

The **Parameters** tab allows you to use the blue **Insert token** and **Insert expression** icons to quickly enter values for the selected action card.

:::image type="content" source="media/flows-designer/skittles.png" alt-text="Screenshot of how an action should run after a preceding action.":::

To insert a dynamic token into the **Inputs** field, select the top icon (the lightening rod). A popup screen will open where you can search for or scroll to find the tokens you can use. Once you make your selection, it appears in the **Inputs** field.

To insert an expression into the **Inputs** field, select the bottom icon (***fx***). A popup screen will open where you can select a function to start your expression. To complete your expression, place your cursor in the function you selected, and then select **Dynamic content**. Search for or select the content/tokens to add, and then select **Add**. Your completed expression appears in the **Inputs** field.

Alternatively, you can select the dynamic content/token and expression popups by entering **/** in the **Inputs** field.

### Settings

You can select **Settings** > **Run after** to configure how an action should run after the execution of any of the preceding flow actions.

You can select more than one option:

- is successful
- has timed out
- is skipped
- has failed

:::image type="content" source="media/flows-designer/run-after.png" alt-text="Screenshot of how an action should run after a preceding action.":::

### Code

See the code behind any card in your flow by selecting it in the canvas, and then selecting **Code View** in the Action configuration pane. As you customize the code in the [Parameters](#parameters) tab, you can see the new code in the  **Code View** tab.

When you're finished with the Action configuration pane, you can hide it by selecting **<<** in the upper-right corner. To show it, select **>>** in the upper-left corner.

## Flow zooming controls

Depending on the size and complexity of your flow, you might want to adjust its size on the canvas as you are building it. The zooming controls allow you to zoom in, zoom out, fit to screen, and toggle a *minimap*.

The last option in the following screenshot is the minimap. Select this option to focus on a particular section of a large flow.

:::image type="content" source="media/flows-designer/zoom-controls.png" alt-text="Screenshot of the four zoom .":::

## Send feedback

We want to hear from you to help us measure and improve our impact. To provide your feedback, select **Send Feedback**, answer three questions, and then select **Submit**.

:::image type="content" source="media/flows-designer/feedback.png" alt-text="Screenshot of the feedback form.":::