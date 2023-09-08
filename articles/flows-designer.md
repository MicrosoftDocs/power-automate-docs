---
title: Understand the Edit with Copilot designer (preview)
description: Learn about the components in the Edit with Copilot (preview) designer.
services: ''
suite: flow
author: kisubedi
contributors:
 - kisubedi
 - v-aangie
ms.subservice: cloud-flow
ms.topic: overview
ms.date: 08/16/2023
ms.author: kisubedi
search.audienceType: 
  - flowmaker
  - enduser
ms.reviewer: angieandrews
---

# Understand the Edit with Copilot designer (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

You can create, configure, and customize your cloud flows with the classic designer or the Edit with Copilot designer. For a description of the types of cloud flows, go to [Overview of cloud flows](overview-cloud.md).

> [!NOTE]
> Here are some visual queues that tell you that you're using the Edit with Copilot designer:
> - The Copilot pane appears on the right.
> - The cards in the flow are small.
> - The standalone Action configuration pane appears on the left when you select a card.
>
> To learn more about the classic designiner versus the Edit with Copilot designer, go to [Differences between the classic and Edit with Copilot (preview) designers](#differences-between-the-classic-and-edit-with-copilot-preview-designers) in this article.

## Overview

The legend below the following screenshot describes the features of the Edit with Copilot designer.

:::image type="content" source="media/flows-designer/designer-overview-numbers-borders.png" alt-text="Screenshot of the Edit with Copilot designer.":::

Legend:

1. **Left arrow:** Return to the previous screen.
1. [**Send Feedback button:**](#send-feedback) Send us feedback on your flow creation experience, or general comments for the Edit with Copilot designer.
1. **Action/trigger name:** The action or trigger card that's selected in your flow on the center of the screen.
1. [**More commands:**](#more-commands) Add a note to the selected card or delete it.
1. **Collapse:** Hide this pane. When it's collapsed, the **Expand** icon (**>>**) appears in the upper-left corner. To show the panel again, select **>>**.
1. [**Copilot button:**](get-started-with-copilot.md) Show or hide the Copilot pane. The Copilot pane appears by default when the Edit with Copilot designer opens.
1. [**Save button:**](#save-button) Save your flow.
1. [**Test button:**](#test-button) Test your flow to make sure it works as you intended.
1. [**Action configuration pane:**](#action-configuration-pane) Once you select an action card to configure in the canvas, the Action configuration pane opens to the left of the Edit with Copilot designer.
1. [**Canvas**](#canvas): The canvas is where you build your flow. It's free-flowing, which allows for easier navigation.
1. [**Copilot pane:**](get-started-with-copilot.md) Copilot stays by you in your flow editing and fit-and-finish journey. It can help you update and make changes to your flow based on your conversational style prompt. It can also help answer flow and product related  questions.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature might not be available in your region or environment yet.
> - To use and learn about the availability of the Edit with Copilot (preview) designer, go to [Prerequisites](get-started-with-copilot.md#prerequisites).
> - [!INCLUDE [cross-geo-support](~/../shared-content/shared/preview-includes/cross-geo-support.md)]
> - For more information, go to our [preview terms](https://powerplatform.microsoft.com/legaldocs/supp-powerplatform-preview/).

## Send feedback

We want to hear from you to help us measure and improve our impact. To provide your feedback, select **Send Feedback**, answer three questions, and then select **Submit**.

:::image type="content" source="media/flows-designer/feedback.png" alt-text="Screenshot of the feedback form.":::

## More commands

Select **More commands** (**...**) to either add a note to or delete the selected card in your flow. Select **Add a note** to describe the purpose of the card in your flow. When you add a note, you see a note icon on the bottom right of the card. Hover over the icon to see the note.

:::image type="content" source="media/flows-designer/designer-note.png" alt-text="Screenshot of adding a note.":::

## Save button

Select **Save** to save your flow. If there are no errors, the message, *"Your flow is ready to go. We recommend you test it"* appears in the upper left with a green check.

:::image type="content" source="media/flows-designer/designer-save.png" alt-text="Screenshot of a successful save.":::

If an error is found, a description of the error appears in the upper left with a red **X**. The following screenshot is an example of an error.

:::image type="content" source="media/flows-designer/designer-error.png" alt-text="Screenshot of an error.":::

The error also appears in the card that caused the error in your flow. You can correct it and select **Save** again. When there are no errors, your next step should be to test your flow.

## Test button

After your flow is saved successfully, **Test** becomes active. To test your flow, select **Test** > **Manually** > **Test**.

:::image type="content" source="media/flows-designer/test-manually.png" alt-text="Screenshot of manually testing your flow.":::

You see instructions on what you need to do to test your flow, as in the following example.

:::image type="content" source="media/flows-designer/test-prompt.png" alt-text="Screenshot of the prompt telling you what to do to test your flow.":::

Test you flow by following the instructions. In this example, you need to send an email and then the flow test will run. When the test has completed, a green check appears in each card and the number of seconds it took to process appear in your flow.

:::image type="content" source="media/flows-designer/test-result.png" alt-text="Screenshot of the test results.":::

Testing is part of planning a Power Automate project. To learn more, go to [Introduction: Planning a Power Automate project](guidance/planning/introduction.md).

## Action configuration pane

The Action configuration pane allows you to customize parameters, settings, and code for the selected card on your flow.

### Parameters

The **Parameters** tab allows you to use the blue **Insert token** and **Insert expression** icons to quickly enter values for the selected action card.

:::image type="content" source="media/flows-designer/skittles.png" alt-text="Screenshot of the Insert token and Insert expression icons in the Parameters tab in Action configuration pane.":::

To insert a dynamic token into the **Inputs** field, select the top icon (the lightening rod). A popup screen opens, where you can search for or scroll to find the tokens you can use. When you make your selection, it appears in the **Inputs** field.

To insert an expression into the **Inputs** field, select the bottom icon (***fx***). A popup screen opens, where you can select a function to start your expression. To complete your expression, place your cursor in the function, and then select **Dynamic content**. Search for or select the content/tokens to add, and then select **Add**. Your completed expression appears in the **Inputs** field.

To learn more about expressions, go to [Reference guide to workflow expression functions](/azure/logic-apps/workflow-definition-language-functions-reference).

Alternatively, you can select the dynamic content/token and expression popups by entering a forward slash (**/**) on the keyboard in the **Inputs** field.

### Settings

The **Settings** tab allows you to set the action timeout, network retry policy, how an action should run, security input and output, and tracking properties. The following table provides a description of the settings.

|Setting  |Description  |
|---------|---------|
|General     | In the **Action Timeout** field, set the limit for the maximum duration between the retries and asynchronous responses for the selected action. This doesn't alter the request timeout of a single request.        |
|Networking     | In the **Retry Policy** field, select a retry policy for intermittent failures. The default is an exponential interval policy set to retry four times. You can also set your own exponential or fixed interval settings, or choose none at all.   |
|Run After     | In the **Run After** field, configure how an action should run after the execution of any of the preceding flow actions. For example, you can choose to run an action after the preceding action runs successfully, times out, skips, or fails.    |
|Security  | Use the **Secure inputs** and **Secure outputs** toggles to turn on or off the operations, and references of output properties.    |
|Tracking   | Set the key and value of tracked properties.    |

### Code

See the code behind any card in your flow by selecting it in the canvas, and then selecting **Code View** in the action configuration pane. As you customize the code in the [Parameters](#parameters) tab, you can see the new code in the  **Code View** tab.

The following screenshot is an example of the code for the **Compose** action card.

:::image type="content" source="media/flows-designer/compose.png" alt-text="Screenshot of the code view of the Compose action card.":::

## Canvas

For easy navigation, you can drag your flow on the canvas. You configure the actions of each card on the left in the action configuration pane. The cards on the canvas are compact. This allows for easy visibility and navigation, especially for large flows.

### Drop zones

The canvas contains Edit with Copilot designer drop zones indicated by a blue dashed line. The drop zones help you to easily drag and drop cloud flow actions.

:::image type="content" source="media/flows-designer/drop-zone.png" alt-text="Screenshot of an action card and a drop-zone.":::

### Zooming icons

Adjust the size of your flow on the canvas. Depending on the size and complexity of your flow, you might want to adjust its size as you're building it. The zooming icons allow you to zoom in, zoom out, fit to screen, and toggle a *minimap*. These icons appear when the Action configuration pane is closed.

The last option in the zooming icons is the minimap. Select this icon to focus on a particular section of a large flow.

:::image type="content" source="media/flows-designer/zoom-controls.png" alt-text="Screenshot of the four zoom icons.":::

## Differences between the classic and Edit with Copilot (preview) designers

With the Edit with Copilot designer, you can use natural language to tell Copilot what you want to do and it will help you get started.

For example, Copilot can help you with the following tasks:
- Create a flow from scratch
- Edit and improve a flow
- Learn about how your flow works

Your cards on a flow that uses the Edit with Copilot designer are smaller than the cards on a flow that uses the classic designer. One of the reasons is that smaller cards allow you a larger canvas area to display complex flows. To allow for the small cards, the configuration items associated with each card are available in the standalone Action configuration pane on the left when you select a card.

To compare this view to the classic designing, you can get the same configuration items directly on the card.  

To learn more, go to (get-started-with-copilot.md).
