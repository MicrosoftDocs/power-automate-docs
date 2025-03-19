---
title: Explore the cloud flows designer
description: Learn about the components in the cloud flows designer.
suite: flow
author: kisubedi
contributors:
 - lanlanlee2008
 - kisubedi
 - v-aangie
 - EllenWehrle
ms.subservice: cloud-flow
ms.topic: overview
ms.date: 03/19/2025
ms.author: kisubedi
search.audienceType: 
  - flowmaker
  - enduser
ms.reviewer: angieandrews
ms.collection: bap-ai-copilot
---

# What is the cloud flows designer?

You can create, configure, and customize your cloud flows with the classic designer or the cloud flows designer. For a description of the types of cloud flows, go to [Overview of cloud flows](overview-cloud.md).

> [!NOTE]
> Here are some visual cues that tell you that you're using the new cloud flows designer (not the classic designer):
>
> - The cards in the flow are small.
> - The standalone action configuration pane appears on the left when you select a card.
>
> More information: [Identify differences between the classic designer and the new cloud flows designer](#identify-differences-between-the-classic-designer-and-the-new-cloud-flows-designer)

Here's a screenshot of the AI-powered cloud flows designer's features and a legend is available to give you more context.

:::image type="content" source="media/flows-designer/designer-overview-numbers-borders.png" alt-text="Screenshot of the cloud flows designer with Copilot.":::

Legend:

1. **Left arrow button**: Return to the previous page.
1. [**Undo and Redo buttons**](#undo-and-redo): Reverse or reinstate modifications you made to the flow.
1. [**Send feedback button**](#send-feedback): Send us feedback about your flow creation experience or general comments about the AI-powered designer.
1. **Version history button**: Track and manage changes made to your flows over time. It records every modification, enabling you to view previous versions, compare changes, and, if necessary, revert to an earlier version. Learn more in [Drafts and versioning for cloud flows](drafts-versioning.md).
1. **Flow checker button**: Check your flow for errors.
1. [**Save draft button**](#save-draft-button): Save a draft of your flow.
1. [**Test button**](#test-button): Test your flow to make sure that it works as you intended.
1. **Publish button**: Publish your flow so that your flow runs when the trigger event is performed.
1. [**Copilot button**](get-started-with-copilot.md): Show or hide the Copilot pane. The Copilot pane appears by default when the AI-powered designer opens.
1. **New designer toggle**: Switch between the classic designer and the new cloud flows designer. Learn more in [Identify differences between the classic designer and the new cloud flows designer](#identify-differences-between-the-classic-designer-and-the-new-cloud-flows-designer).
1. **Action/trigger name**: The action or trigger card that is selected in your flow in the center of the page (the [*canvas*](#canvas)).
1. [**More commands button**](#more-commands): Add a note to the selected card, *pin* an action, or delete the card. There are two ways to pin an action. Learn more in [View two action panes simultaneously](#view-two-action-panes-simultaneously).
1. **Collapse button**: Hide the pane. When the pane is collapsed, the **Expand** button (**\>\>**) appears in the upper-left corner. Select it to show the pane again.
1. [**Action configuration pane**](#action-configuration-pane): After you select an action card to configure on the canvas, the action configuration pane opens on the left side of the AI-powered designer.
1. [**Canvas**](#canvas): The canvas is where you build your flow. It's free-flowing and therefore allows for easier navigation.
1. [**Copilot pane**](get-started-with-copilot.md): Copilot stays with you during your flow editing and fit-and-finish journey. It can help you update and make changes to your flow, based on your conversational-style prompt. It can also help answer flow-related and product-related questions.

## Undo and Redo

To reverse or reinstate modifications you made to the flow, you can use the **Undo** and **Redo** command bar buttons. For example, if you added or configured an action, or made significant adjustments to the flow, these features allow you to conveniently revert to a previous state or redo changes you previously canceled.

:::image type="content" source="media/flows-designer/undo-redo.png" alt-text="Screenshot of the 'Undo' and 'Redo' buttons in the command bar.":::

## Send feedback

We want to hear from you to help us measure and improve our impact. To provide your feedback, select **Send Feedback**, answer the three questions in the feedback form that opens, and then select **Submit**.

:::image type="content" source="media/flows-designer/feedback.png" alt-text="Screenshot of the options available on the feedback form.":::

## Save draft button

Select **Save draft** to save a draft of your flow. If there are no errors, the message, *"Your flow is ready to go. We recommend you test it"* appears in the upper left with a green check.

:::image type="content" source="media/flows-designer/designer-save.png" alt-text="Screenshot highlighting a successful save.":::

If an error is found, a description of the error and a red *X* appear in the upper left. The following screenshot shows an example of an error message.

:::image type="content" source="media/flows-designer/designer-error.png" alt-text="Screenshot highlighting an error message.":::

The error also appears on the card that caused the error in your flow. Correct the error, and then select **Save** again.

When there are no errors, your next step should be to test your flow.

## Test button

After your flow is saved successfully, **Test** becomes active. To test your flow, select **Test** > After your flow is successfully saved, the **Test** button becomes available. To test your flow, select **Test**, select the **Manually** option, and then select **Test**.

:::image type="content" source="media/flows-designer/test-manually.png" alt-text="Screenshot of the option for manually testing your flow.":::

Instructions appear and tell you what you must do to test your flow. The following screenshot shows an example of an instructional message.

:::image type="content" source="media/flows-designer/test-prompt.png" alt-text="Screenshot of instructions that tell you how to test your flow.":::

To test your flow, follow the instructions. In this example, you must send an email. The flow test then runs. When the test finishes running, a green check mark appears on each card, together with the number of seconds that it took to be processed.

:::image type="content" source="media/flows-designer/test-result.png" alt-text="Screenshot highlighting the appearance of the green check mark for successful test results.":::

Testing is part of the planning for a Power Automate project. To learn more, go to [Introduction: Planning a Power Automate project](guidance/planning/introduction.md).

## More commands

Select the **More commands** (**&vellip;**) button to add a note to the selected card in your flow, pin an action, or to delete the card.

Select **Add a note** to describe the purpose of the card in your flow. After you add a note, a note symbol appears in the lower right of the card. To view the note, hover over this symbol.

:::image type="content" source="media/flows-designer/designer-note.png" alt-text="Screenshot that shows a note being added.":::

Select **Pin action** to pin the action card to the top of the action configuration pane. This feature is useful when you want to compare two actions side by side, or copy values across two actions. Learn more in [View two action panes simultaneously](#view-two-action-panes-simultaneously).

## Action configuration pane

Use the action configuration pane to customize parameters, settings, and code for the selected card in your flow.

### Parameters

On the **Parameters** tab, you can use the blue **Insert token** (lightning bolt) and **Insert expression** (***fx***) buttons next to the **Inputs** field to quickly enter values for the selected action card.

:::image type="content" source="media/flows-designer/skittles.png" alt-text="Screenshot of the Insert token and Insert expression buttons on the Parameters tab in the action configuration pane.":::

To insert a dynamic token into the **Inputs** field, select the **Insert token** (lightning bolt) button. In the pop-up window that opens, search for or scroll to find the tokens that you can use. After you select a token, it appears in the **Inputs** field.

To insert an expression into the **Inputs** field, select the **Insert expression** (***fx***) button. In the pop-up window that opens, select a function to start your expression. To complete your expression, place the cursor in the function, and then select **Dynamic content**. Search for or select the content/tokens to add, and then select **Add**. Your completed expression appears in the **Inputs** field.

To learn more about expressions, go to [Reference guide to workflow expression functions](/azure/logic-apps/workflow-definition-language-functions-reference).

Alternatively, use the keyboard to enter a slash (**/**) in the **Inputs** field. Then select the dynamic content/token and expression pop-ups.

### Settings

On the **Settings** tab, you can set the action time-out, network retry policy, how an action should run, security input and output, and tracking properties. The following table provides a description of the settings.

| Setting | Description |
|---------|-------------|
| General | In the **Action Timeout** field, set the maximum duration between retries and asynchronous responses for the selected action. This setting doesn't change the request time-out of a single request. |
| Networking | In the **Retry Policy** field, select a retry policy for intermittent failures. The default setting is an exponential interval policy that is set to retry four times. You can also set your own exponential or fixed interval settings, or choose none at all. |
| Run After | In the **Run After** field, configure how an action should run after the execution of any of the preceding flow actions. For example, you can choose to run an action after the preceding action runs successfully, times out, skips, or fails. |
| Security | Use the **Secure inputs** and **Secure outputs** toggles to turn the operations, and references of output properties, on or off. |
| Tracking | Set the key and value of tracked properties.|

### Configurable trigger polling setting

In select triggers such as *When an item is created-Sharepoint*, and more, you can manually configure the trigger polling setting. This means you can configure how often the flow should check for new items in Sharepoint and others. This in turn ensures how quickly your flow responds to any changes or trigger events. The default polling period is three (3) minutes, which means the flow checks every three (3) minutes if a new item was created.

1. On the [action configuration pane](#action-configuration-pane), select the **Parameters** tab.
1. Under the **How often do you want to check for items?** heading, enter the interval number and the frequency from the dropdown menu.

    :::image type="content" source="media/flows-designer/trigger-polling.svg" alt-text="Screenshot of the trigger polling setting in the action configuration pane, Parameters tab.":::

### Code View

To view the code behind any card in your flow, select the card on the canvas, and then select **Code View** in the action configuration pane. As you customize the code on the [Parameters](#parameters) tab, you can view the new code on the **Code View** tab.

The following screenshot shows an example of the code for the **Compose** action card.

:::image type="content" source="media/flows-designer/compose.png" alt-text="Screenshot of the code view of the Compose action card.":::

### Copy and paste actions

You can copy actions to the clipboard whether they're atomic actions or container actions. Examples of atomic actions are `Compose`, `Get items`, `Create item`, and others. Examples of container actions are `Scope`, `Switch`, `Condition`, `Apply to each`, and others.

To copy and paste an action, follow these steps.

1. Right-click on any action (or trigger) you want to copy.

    :::image type="content" source="media/flows-designer/copy-action.png" alt-text="Screenshot highlights copying an action.":::

1. On the canvas, select **+** on the canvas to add an action, and then select **Paste an action**.

    You can copy and paste actions across different parts of your flow, or in between flows.

    :::image type="content" source="media/flows-designer/paste-action.png" alt-text="Screenshot highlights pasting an action.":::

    After you paste your action, the copied action name is followed by **-copy**.

    :::image type="content" source="media/flows-designer/copy-paste-final.png" alt-text="Screenshot of an action that was copied and pasted, ending with a hyphen and the word 'copy'.":::

If you don't have access to a mouse, you can use your keyboard. To copy, press **Ctrl** + **C**. To paste, press **Ctrl** + **V**.

## Canvas

For easy navigation, you can drag your flow on the canvas. You configure the actions of each card in the action configuration pane on the left. The cards on the canvas are compact to allow for easy visibility and navigation, especially in large flows.

### Drop zones

The canvas contains AI-powered designer drop zones to help you easily drag cloud flow actions. Blue dashed lines represent the drop zones.

:::image type="content" source="media/flows-designer/drop-zone.png" alt-text="Screenshot of an action card and a drop-zone.":::

### Zoom buttons

Depending on the size and complexity of your flow, you might want to adjust its size on the canvas as you're building it. Use the zoom buttons to zoom in, zoom out, fit to screen, and toggle a *minimap*. The buttons appear when the Action configuration pane is closed.

The bottom button is for the minimap. Use it to focus on a specific section of a large flow.

:::image type="content" source="media/flows-designer/zoom-controls.png" alt-text="Screenshot highlights the four zoom buttons.":::

### Expression editor and token picker

The expression editor in the designer is multi-line, which allows you to easily create and edit long, complex expressions. A *gripper* allows you to temporarily expand the box by one or two (1-2) lines, as needed. If that's not enough, you can expand the popup to a full page view. A search box allows you to search for tokens and functions, both in the **Dynamic content** view and **Function** view.

:::image type="content" source="media/flows-designer/expression-editor.png" alt-text="Screenshot highlights the expression editor.":::

> [!TIP]
> You can use a forward slash ( / ) keyboard shortcut to invoke the token picker/expression editor popup when you're on an action field.

### Create, update, and fix your expressions with Copilot expression assistant (preview)

[!INCLUDE[cc-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

This is a preview feature and is available to tenants where Copilot is enabled. On the modern designer, you can use this functionality to create, update, or fix expression with the help of Copilot.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

#### Scenario 1: Create expression with natural language

1. On the expression editor, select **Create expression with Copilot**.
    The user experience that displays is the user experience for expression assistant.
1. In the text box, write a prompt to generate an expression for, and select **Create expression**.
    You can reference the flow's dynamic content in your prompt using their names to build expressions around. For example, assume you have first name, last name, phone number, and TriggerDate as dynamic data in your flow. You can ask following sample prompts:
    - Concatenate first name and last name.
    - Grab last four characters of Phone Number.
    - Convert Phone number from Integer to String.
    - Format TriggerDate to 'DD-MM' format.
    :::image type="content" source="media/flows-designer/create-expression-nl.png" alt-text="Screenshot of creating an expression with Copilot.":::

#### Scenario 2: Update an existing expression with natural language

If you have an existing expression that you created manually or through the expression assistant, you can select **Create expression with Copilot** in expression editor. Now it understands the context of the expression, and any prompt you write is used to modify the existing expression.

To finalize the update, do the following steps:

1. To return the updated expression, select **Create expression**.
1. To apply to expression editor, select **OK**.
1. To apply to your flow, select **Add**.

For example, the first step is to select an expression.

:::image type="content" source="media/flows-designer/compose-nl.png" alt-text="Screenshot highlights an input parameter.":::

The next step is to select **Create expression with Copilot**. Then, describe how you want to update this existing expression and select **Update**.

:::image type="content" source="media/flows-designer/compose-full-nl.png" alt-text="Screenshot of an expression and string functions.":::

Finally, select **OK** to apply the Copilot generated expression.

:::image type="content" source="media/flows-designer/compose-ok-nl.png" alt-text="Screenshot highlights a suggested expression.":::

#### Scenario 3: Fix invalid expression using a button

You can use the same experience to fix erroneous expressions. The following example shows an erroneous expression that has a missing parenthesis after 'Phone' [variables function opening parenthesis didn't close].  

:::image type="content" source="media/flows-designer/phone-paren.png" alt-text="Screenshot highlighting an erroneous expression.":::

At this point, when you select **Create expression with Copilot**, it automatically fixes the expression that is currently loaded in expression editor.

:::image type="content" source="media/flows-designer/phone-paren-fix.png" alt-text="Screenshot of a suggested fix for an erroneous expression.":::

### Disable an action or enable static results on an action

On the designer, if you want to disable an action rather than remove it entirely, go to the **Testing** tab of the action and enable static outputs by turning on the **Enable Static Result** toggle. When the flow runs, this essentially treats the action as successful, without actually running the action.

Similarly, if you want to see how your flow reacts if a certain action fails with a code or succeeds with a code, you can use the same capability of static outputs available on the action to mock the action execution to your needs.

When static outputs are disabled, the toggle label is **Enable Static Result**. When static outputs are enabled, the toggle label is **Disable Static Result**.

:::image type="content" source="media/flows-designer/static-result.png" alt-text="Screenshot of the 'Enable or Disable Static Result' toggle in the Testing tab.":::

### View two action panes simultaneously

One the new designer, you can pin an action pane so that you can open a second action pane next to it. This can be useful to compare two similar actions, or copy values across two actions.

To pin an action, you can either right-click the action on the canvas and select **Pin action**. Alternatively, in the action pane, you can select **Pin action** in the **More commands** dropdown menu.

:::image type="content" source="media/flows-designer/pin-option.png" alt-text="Screenshot of the 'Pin action' menu option.":::

Once you pin an action, any other selected action panes are placed to the right of the pinned action pane.

:::image type="content" source="media/flows-designer/pin-result.png" alt-text="Screenshot of a pinned action next to the open action pane.":::

To unpin an action, you have two options:

- Right-click the action on the canvas and select **Unpin action**.
- Select the **Pin** icon on the action pane.

## Identify differences between the classic designer and the new cloud flows designer

To quickly identify which designer version you're using, ask yourself the following questions:

- Are the action cards on the flow small or large?
- Is the action configuration pane inline or in a separate pane?

> [!NOTE]
> The new cloud flows designer has smaller cards to facilitate easy navigation. It also has a standalone action configuration pane on the left.

## Designer resiliency and save flow with errors

The new designer automatically saves a copy of the flow to browser storage upon failed save, even with errors. This capability comes in handy on two occasions a. when underlying service is going through an outage and when makers need to avoid losing their unsaved changes, by exiting out of their flows, or b. for non-solution flows which lack the Save draft functionality, makers can exit out of their flow with errors and come back at a later time to fix the errors and save the flow.

A info banner appears on the designer notifying when designer is able to save the flow copy to browser's storage. Makers can now exit out of their flow.

:::image type="content" source="media/flows-designer/designer-info-banner.png" alt-text="Screenshot of the info banner above the flow.":::

Upon revisiting the flow on the designer, the previously saved version loads on the designer by default. The unsaved copy is recoverable through the 'Recover' button on the info banner.

:::image type="content" source="media/flows-designer/designer-recover.png" alt-text="Screenshot of the Recover flow button in flow designer.":::

When you click on 'Recover' button, the unsaved browser copy of the flow is loaded on the designer, on top of which you can make updates.

![image](https://github.com/user-attachments/assets/37c917bf-2f6b-46a9-a07c-dbad2aa7b512)

You can now fix errors on this copy of the flow, and save it. If you do not save this copy, the previously saved version of the flow is still accessible upon reloading the tab. However, please note that saving this copy will override the previously saved version of the flow, and will also clear up the browser storage as there is no unsaved changes on the flow.

Warning: Clearing the browser cache will delete the saved copy of the flow from browser. Please do not clear cache/cookies from browser if you still need access to the unsaved flow copy.

## Limitations and known issues

You might notice that some functionalities that were in the classic designer aren't available in the cloud flows designer yet. Currently, the designer doesn't support the following items:

- Non-Open API flows (If there's Peek code on an action and if you see the API Connection value instead of Open API Connection in Kind field, it's a non-Open API flow.)
  - These are legacy flows, probably created a long time ago when Open API support wasn't available.
  - We have plans to migrate them to Open API format, with no fixed announcement date. In the meantime, if you want to work with the latest functionalities in the new designer/Copilot experience, consider recreating the flow in new designer until the migration plan is announced.
- Some hybrid triggers:
  - When a flow is run from business process flow (Dataverse)
  - Microsoft 365 Compliance Connector
- A comment
- Power Pages connector
- Power Apps v1 trigger
- Perform a changeset request action (Dataverse)
- A solution flow using connections instead of connection reference isn't supported. We recommend that you use connection reference instead.

As we continue to innovate, we're introducing a new designer alongside our classic designer. While the classic designer remains valuable, the new designer is our future direction. While the classic designer isn't supported indefinitely, the new designer is gradually becoming the primary interface.

If you prefer to access features not yet available in the new designer, or encounter any limitations or known issues, you can temporarily revert to the classic designer. Simply turn off the **New designer** toggle on the menu in the cloud flows designer.

:::image type="content" source="media/flows-designer/designer-toggle.png" alt-text="Screenshot of the 'New designer' toggle.":::

> [!NOTE]
> The Power Automate cloud flows designer isn't yet available in integration surfaces such as Power Apps, Teams, and others.

If a flow is saved too soon on load, it might be saved without advanced parameters if those parameters weren't fetched yet. As a workaround, you can avoid saving a flow too soon on load. Alternatively, use the classic designer.

## FAQ

This section highlights some of the most frequently asked questions about working with Power Automate classic designer and cloud flows designer.

### Why do I get this error "O.split(...).at is not a function" when signing in?

Power Automate designer doesn't support browsers that are more than two (2) years old. You could see the aforementioned or similar errors in the designer if your browser version is old. It's generally a good idea to update your browser to latest version to avoid such issues.

### Why do I get this error "The provided flow name contains invalid characters" when importing a flow in a new tenant?

This error is a temporary gap, which you can work around by adding a query parameter `v3=false` in your URL.

### Why don't I see new or updated SharePoint or Excel column values in my flow?

Power Automate designer requires a flow action to be re-added in order to pick up new entities of the underlying action. For example, if you have a SharePoint *Get item* action in your flow and Sharepoint item has four (4) columns, the flow allows you to access all four column values of the SharePoint item. Now, if you navigate to SharePoint, add a fifth column, and come back to the flow, you can't access the fifth column unless you delete the *Get item* action and re-add it again to force the designer to pick up the latest changes. The same behavior applies in Excel columns, Dataverse, OneDrive folder/files, and others.

### Will the new cloud flows designer eventually replace the classic designer fully?

Yes, once the issues noted here are resolved and the new cloud flows designer can cover most, if not all, of the classic designer scenarios. At this time, the classic designer will be fully replaced.

## Related information

Learn how to work with Copilot in cloud flows. You can get started with these articles:

- [Get started with Copilot in cloud flows](get-started-with-copilot.md)
- [FAQ for Copilot expression assistant](faqs-copilot-expression-assistant.md)
