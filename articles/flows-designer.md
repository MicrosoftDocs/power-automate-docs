---
title: Explore the cloud flows designer
description: Learn about the components in the cloud flows designer.
suite: flow
author: kisubedi
contributors:
 - QuentinSele
 - AndreasTouly
 - kisubedi
 - v-aangie
 - EllenWehrle
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: overview
ms.date: 07/18/2025
ms.update-cycle: 180-days
ms.author: kisubedi
search.audienceType: 
  - flowmaker
  - enduser
ms.reviewer: angieandrews
ms.collection: bap-ai-copilot
---

# Explore the cloud flows designer

You can create and configure your cloud flows with the new designer or the classic designer. Learn how to determine the designer you're using in [Identify differences between the new designer and the classic designer](#identify-differences-between-the-new-designer-and-the-classic-designer).

This article provides an overview of the designer's features and capabilities. Learn more in [Overview of cloud flows](overview-cloud.md).

Following is a screenshot of the designer's features. To give you more context, refer to the legend.

:::image type="content" source="media/flows-designer/designer-overview-numbers-borders.png" alt-text="Screenshot of the cloud flows designer with Copilot." lightbox="media/flows-designer/designer-overview-numbers-borders.png":::

Legend:

1. **Left arrow button**: Go back to the previous page.
1. **Flow name**: The name of your flow, which you can edit at any time. To do this, select the flow name, enter a new name, and then select **Save** on the command bar.
1. [**Undo and Redo buttons**](#undo-and-redo): Reverse or reinstate modifications you made to the flow.
1. [**Send feedback button**](#send-feedback): *(New designer only)* Send us feedback about your flow creation experience or general comments about the AI-powered designer.

    (*Classic designer only*) Select the smiley face icon in the title bar.

1. **Flow checker button**: Check your flow for errors.
1. [**Save button**](#save-button): Save your flow.
1. [**Test button**](#test-button): Test your flow to make sure that it works as you intended.
1. [**Copilot button**](create-cloud-flow-using-copilot.md): *(New designer only)* Show or hide the Copilot pane. The Copilot pane appears by default when the AI-powered designer opens.
1. **New designer toggle**: Switch between the new designer and the classic designer. Learn more in [Identify differences between the new designer and the classic designer](#identify-differences-between-the-new-designer-and-the-classic-designer).
1. **Action/trigger name**: *(New designer only)* The action or trigger card that is selected in your flow in the center of the page (the [canvas](#canvas)).
1. [**More commands button**](#more-commands): *(New designer only)* Add a note to the selected card, *pin* an action, or delete the card. There are two ways to pin an action. Learn more in [View two action panes simultaneously](#view-two-action-panes-simultaneously).
1. **Collapse button**: *(New designer only)* Hide the pane. When the pane is collapsed, the **Expand** button (**>>**) appears in the upper-right corner. Select it to show the pane again.
1. [**Configuration pane**](#configuration-pane): *(New designer only)* After you select a card to configure on the [canvas](#canvas), the configuration pane opens on the left side of the AI-powered designer.
1. [**Canvas**](#canvas): The canvas is where you build your flow.
1. [**Copilot pane**](create-cloud-flow-using-copilot.md): *(New designer only)* Copilot stays with you during your entire editing journey. It can help you update and make changes to your flow based on your conversational-style prompt. It can also help answer flow-related and product-related questions.

## Save a solution-aware flow draft and then publish it

When you work with [solution-aware flows](overview-solution-flows.md), there are two more buttons added to the toolbar: **Save draft** and **Publish**.

:::image type="content" source="media/flows-designer/solutions-toolbar.png" alt-text="Screenshot of the solution-aware cloud flows toolbar with the 'Save draft' and 'Publish' buttons.":::

When you [create a solution-aware flow](create-flow-solution.md), you can save it as a draft, even with errors. This allows you to continue working on it without publishing it immediately. To do this, select [Save draft](drafts-versioning.md#save-drafts) at any time.

When your draft is ready for production, select [Publish](drafts-versioning.md#publish-a-cloud-flow) to make it available for use.

Learn more about drafts and publishing in [Drafts and versioning for solution-aware cloud flows](drafts-versioning.md).

## Undo and Redo

To reverse or reinstate modifications you made to the flow, you can use the **Undo** and **Redo** command bar buttons. For example, if you added or configured an action, or made significant adjustments to the flow, these features allow you to conveniently revert to a previous state or redo changes you previously canceled.

:::image type="content" source="media/flows-designer/undo-redo.png" alt-text="Screenshot of the 'Undo' and 'Redo' buttons in the command bar.":::

## Send feedback

*(New designer only)* We want to hear from you to help us measure and improve our impact. To provide your feedback, select **Send Feedback**, answer the three questions in the feedback form that opens, and then select **Submit**.

:::image type="content" source="media/flows-designer/feedback.png" alt-text="Screenshot of the options available on the feedback form.":::

## Save button

Select **Save** to save your flow. If there are no errors, the message, *"Your flow is ready to go. We recommend you test it"* appears in the upper left with a green checkmark.

:::image type="content" source="media/flows-designer/designer-save.png" alt-text="Screenshot highlighting a successful save.":::

If an error is found, a description of the error and a red **X** appear in the upper left. The following screenshot shows an example of an error message.

:::image type="content" source="media/flows-designer/designer-error.png" alt-text="Screenshot highlighting an error message.":::

The error also appears on the card that caused the error in your flow. Correct the error, and then select **Save** again.

When there are no errors, your next step should be to test your flow.

## Test button

After your flow is successfully saved, the **Test** button becomes available. To test your flow, select **Test**, select the **Manually** option, and then select **Test**.

:::image type="content" source="media/flows-designer/test-manually.png" alt-text="Screenshot of the option for manually testing your flow.":::

Instructions appear and tell you what you must do to test your flow. The following screenshot shows an example of an instructional message.

:::image type="content" source="media/flows-designer/test-prompt.png" alt-text="Screenshot of instructions that tell you how to test your flow.":::

To test your flow, follow the instructions. In this example, you must send an email. The flow test then runs. When the test finishes running, a green checkmark appears on each card, together with the number of seconds that it took to be processed.

:::image type="content" source="media/flows-designer/test-result.png" alt-text="Screenshot highlighting the appearance of the green check mark for successful test results.":::

Testing is part of the planning for a Power Automate project. Learn more in [Introduction: Planning a Power Automate project](guidance/planning/introduction.md).

## More commands

*(New designer only)* Select the **More commands** (**&vellip;**) button to add a note to the selected card in your flow, pin an action, or to delete the card.

Select **Add a note** to describe the purpose of the card in your flow. After you add a note, a note symbol appears in the lower right of the card. To view the note, hover over this symbol.

:::image type="content" source="media/flows-designer/designer-note.png" alt-text="Screenshot that shows a note being added.":::

Select **Pin action** to pin the card to the top of the configuration pane. This feature is useful when you want to compare two actions side by side, or copy values across two actions. Learn more in [View two action panes simultaneously](#view-two-action-panes-simultaneously).

## Configuration pane

*(New designer only)* When you select the plus (+) icon on the [canvas](#canvas), the _Add action_ view for adding actions to your flow appears (for example, **Send email**, **Get Dataverse rows**, **Initialize variable**, and more).

:::image type="content" source="media/flows-designer/add-action.png" alt-text="Screenshot of the 'Add an action' pane.":::

This view by default is organized into four (4) sections:

- **Favorites**: When you favorite a connector or an action using the star icon, these connectors show in the **Favorites** section for quick retrieval. The star icon appears when you hover over it in the **Add an action** pane.
- **AI Capabilities**: All AI capabilities are uplevelled in this standalone section.
- **Built-in tools**: These are the building blocks to your flow if you want to store values in a variable, insert a loop, and more.
- **By connector**: Below the three sections is a list of all connectors. At the top of the list are the top used 20 connectors.

After you select an action from the **Add an action** pane, it's time to configure it. The same pane view refreshes to let you customize the action. This pane is referred to as the *configuration pane*.
Use the configuration pane to customize parameters, settings, and code for the selected card in your flow.

### Parameters

On the **Parameters** tab, you can use the blue lightning bolt and ***fx*** buttons next to the **Inputs** field to quickly enter values for the selected action card.

:::image type="content" source="media/flows-designer/skittles.png" alt-text="Screenshot of the Insert dynamic content and Insert expression buttons on the Parameters tab in the configuration pane.":::

To insert a dynamic value into the **Inputs** field, select the **Inputs** field and then select the lightning bolt button. In the pop-up screen, search for or scroll to find the values that you can use. After you select a dynamic value, it appears in the **Inputs** field.

To insert an expression into the **Inputs** field, select the **Inputs** field and then select the ***fx*** button. In the pop-up screen, select a function to start your expression. To complete your expression, place the cursor in the function, and then select **Dynamic content**. Search for or select the dynamic content to add, and then select **Add**. Your expression appears in the **Inputs** field.

To learn more about expressions, go to [Reference guide to workflow expression functions](/azure/logic-apps/workflow-definition-language-functions-reference).

Alternatively, enter a slash (**/**) in the **Inputs** field, and then select **Insert dynamic content** or **Insert expression**.

### Settings

On the **Settings** tab, you can set the action timeout, network retry policy, how an action should run, security input and output, and tracking properties. The following table provides a description of the settings.

| Setting | Description |
|---------|-------------|
| General | In the **Action Timeout** field, set the maximum duration between retries and asynchronous responses for the selected action. This setting doesn't change the request timeout of a single request. |
| Networking | In the **Retry Policy** field, select a retry policy for intermittent failures. The default setting is an exponential interval policy that is set to retry two (2) times for low profiles, eight (8) for medium/high profiles without premium connectors, and 12 for medium/high profiles with premium connectors. You can also set your own exponential or fixed interval settings, or choose none at all. |
| Run After | In the **Run After** field, configure how an action should run after the execution of any of the preceding flow actions. For example, you can choose to run an action after the preceding action runs successfully, times out, skips, or fails. |
| Security | Use the **Secure inputs** and **Secure outputs** toggles to turn the operations, and references of output properties, on or off. |
| Tracking | Set the key and value of tracked properties.|

### Code View

To view the code behind any card in your flow, select the card on the [canvas](#canvas), and then select **Code View** in the configuration pane. As you customize the code on the [Parameters](#parameters) tab, you can view the new code on the **Code View** tab.

The following screenshot shows an example of the code for the **Compose** action card.

:::image type="content" source="media/flows-designer/compose.png" alt-text="Screenshot of the code view of the Compose action card.":::

### Copy and paste actions

You can copy actions to the clipboard whether they're atomic actions or container actions. Examples of atomic actions are `Compose`, `Get items`, `Create item`, and others. Examples of container actions are `Scope`, `Switch`, `Condition`, `Apply to each`, and others.

To copy and paste an action, follow these steps.

1. Right-click on any action (or trigger) you want to copy, and select **Copy Action**.

    :::image type="content" source="media/flows-designer/copy-action.png" alt-text="Screenshot highlights copying an action.":::

1. On the [canvas](#canvas), right-click on **+**, and then select **Paste an action**.

    You can copy and paste actions across different parts of your flow, or in between flows.

    :::image type="content" source="media/flows-designer/paste-action.png" alt-text="Screenshot highlights pasting an action.":::

    After you paste your action, the copied action name is followed by **-copy**.

    :::image type="content" source="media/flows-designer/copy-paste-final.png" alt-text="Screenshot of an action that was copied and pasted, ending with a hyphen and the word 'copy'.":::

If you don't have access to a mouse, you can use your keyboard. To copy, press **Ctrl** + **C**. To paste, press **Ctrl** + **V**.

## Canvas

For easy navigation, you can drag your flow on the canvas. You configure the actions of each card in the configuration pane on the left. The cards on the canvas are compact to allow for easy visibility and navigation, especially in large flows.

### Drop zones

The [canvas](#canvas) contains AI-powered designer drop zones to help you easily drag cloud flow actions. Blue dashed lines represent the drop zones.

:::image type="content" source="media/flows-designer/drop-zone.png" alt-text="Screenshot of an action card and a drop-zone.":::

### Change how your flow displays

Depending on the size and complexity of your cloud flow, you might want to adjust how it displays to make it easier to work with. The buttons appear at the bottom-left corner of the [canvas](#canvas) when the configuration pane is closed.

:::image type="content" source="media/flows-designer/tools-numbers.png" alt-text="Screenshot highlights the buttons that allow you to adjust how your flow displays on the canvas.":::

Legend:
1. **Expand/Collapse**: Expand or collapse all action groups. For example, if an action has multiple conditions, select this icon to show the condition details.
1. **Zoom in**: Increase the size of the flow on the canvas.
1. **Zoom out**: Decrease the size of the flow on the canvas.
1. **Fit view**: Resize the view to fit the entire flow on the canvas.
1. **Minimap**: Navigate to a specific section of a large flow.
1. **Search**: Look for an operation in your flow.

### Expression and dynamic content editor

The expression editor in the designer is multi-line, which allows you to easily create and edit long, complex expressions. A *gripper* allows you to temporarily expand the box by one or two (1 or 2) lines, as needed. If that's not enough, you can expand the popup to a full page view. A search box allows you to search for dynamic content and functions, both in the **Dynamic content** view and **Function** view.

:::image type="content" source="media/flows-designer/token-picker.png" alt-text="Screenshot of the gripper and the 'Dynamic content' and 'Function' tabs.":::

> [!TIP]
> You can use a forward slash ( / ) keyboard shortcut to invoke the dynamic content/expression editor popup when you're on an action field.

If you have access to Copilot, you can learn to use it to create expressions in [Create, update, and fix expressions with Copilot expression assistant (preview)](expressions-copilot.md).

### Disable an action or enable static results on an action

On the designer, if you want to disable an action rather than remove it entirely, select the **Testing** tab of the action and enable static outputs by turning on the **Enable Static Result** toggle. When the flow runs, this treats the action as successful without actually running the action.

Similarly, if you want to learn how your flow reacts if a certain action fails with a code or succeeds with a code, you can use the same capability of static outputs available on the action to mock the action execution to your needs.

When static outputs are disabled, the toggle label is **Enable Static Result**. When static outputs are enabled, the toggle label is **Disable Static Result**.

:::image type="content" source="media/flows-designer/static-result.png" alt-text="Screenshot of the 'Enable or Disable Static Result' toggle in the Testing tab.":::

### View two action panes simultaneously

One the new designer, you can pin an action pane so that you can open a second action pane next to it. This can be useful to compare two similar actions, or copy values across two actions.

To pin an action, you can either right-click the action on the [canvas](#canvas) and select **Pin action**. Alternatively, in the configuration pane, you can select **Pin action** in the **More commands** dropdown menu.

:::image type="content" source="media/flows-designer/pin-option.png" alt-text="Screenshot of the 'Pin action' menu option.":::

Once you pin an action, any other selected action panes are placed to the right of the pinned action pane.

:::image type="content" source="media/flows-designer/pin-result.png" alt-text="Screenshot of a pinned action next to the open configuration pane.":::

To unpin an action, you have two options:

- Right-click the action on the [canvas](#canvas) and select **Unpin action**.
- Select the **Pin** icon on the configuration pane.

## Identify differences between the new designer and the classic designer

The new cloud designer has smaller cards to facilitate easy navigation. To display the configuration data for a card, you need to select it to open a configuration pane on the left. To compare, the classic designer has larger cards, and each card contains the related configuration data. To display the configuration data, you need to select the title of a card to expand it.


|New designer  |Classic designer  |
|---------|---------|
|:::image type="content" source="media/flows-designer/designer-differences-new.png" alt-text="Screenshot of a cloud flow and the configuration pane in the new designer.":::    | :::image type="content" source="media/flows-designer/designer-differences-classic.png" alt-text="Screenshot of an expanded action card in a cloud flow in the classic designer.":::        |

In either the configuration pane or the expanded card, you can edit the configuration data.

## Designer resiliency and save flow with errors

The new designer automatically saves a copy of the flow to browser storage upon failed save, even with errors. This capability comes in handy on two occasions: 1) When the underlying service is going through an outage and when you need to avoid losing your unsaved changes by exiting out of your flow, or 2) For non-solution flows, which lack the 'Save draft' functionality, you can exit out of your flow with errors and come back at a later time to fix the errors and save the flow.<!--Kishor, where's Save draft functionality? It's not a button anymore.-->

When you have unsaved changes on the flow, the **Save** button is disabled. If you try to exit out of the flow, a prompt appears asking if you want to save your changes. If you select **Yes**, the designer saves a copy of the flow to browser storage.

A banner appears on the designer notifying you when designer can save the flow copy to browser's storage. You can now exit out of your flow.

:::image type="content" source="media/flows-designer/designer-info-banner.png" alt-text="Screenshot of the info banner above the flow.":::

Upon revisiting the flow on the designer, the previously saved version loads on the designer by default. The unsaved copy is recoverable through the **Recover flow** command bar button.

:::image type="content" source="media/flows-designer/designer-recover.png" alt-text="Screenshot of the Recover flow button in flow designer.":::

When you select **Recover flow**, the unsaved browser copy of the flow is loaded on the designer, on top of which you can make updates.

:::image type="content" source="media/flows-designer/recover.png" alt-text="Screenshot of the unsaved copy of the flow in flow designer.":::

You can now fix errors on this copy of the flow and save it. If you don't save this copy, the previously saved version of the flow is still accessible when you reload the tab.

> [!WARNING]
> - Saving this copy overrides the previously saved version of the flow. It also clears the browser storage, as there are no unsaved changes on the flow.
> - Clearing the browser cache deletes the saved copy of the flow from the browser.
> - If you still need access to the unsaved flow copy, *don't* clear cache or cookies from the browser.

## Limitations and known issues in the new designer

You might notice that some functionalities that were in the classic designer aren't available in the cloud flows designer yet. Currently, the new designer doesn't support the following items:

- Non-Open API flows (If there's Peek code on an action and if you see the API Connection value instead of Open API Connection in Kind field, it's a non-Open API flow.)
  - These are legacy flows, probably created a long time ago when Open API support wasn't available.
  - We plan to migrate them to Open API format. In the meantime, if you want to work with the latest functionalities in the new designer Copilot experience, consider recreating the flow in the new designer until we announce the migration plan.
- Some hybrid triggers:
  - When a flow is run from business process flow (Dataverse).
  - Microsoft 365 Compliance Connector.
- A comment. We recommend that you use Action _notes_ until the support is available.
- Power Pages connector.
- Power Apps v1 trigger. We recommend that you use V2 trigger instead.
- Perform a changeset request action (Dataverse).
- A solution flow using connections instead of connection reference isn't supported. We recommend that you use connection reference as a proper application lifecycle management (ALM) practice instead.

As we continue to innovate, we're introducing a new designer alongside our classic designer. While the classic designer remains valuable, the new designer is our future direction. While the classic designer isn't supported indefinitely, the new designer is becoming the primary interface.

If you prefer to access features not yet available in the new designer, or encounter any [limitations or known issues](#limitations-and-known-issues-in-the-new-designer), you can temporarily revert to the classic designer. To do this, turn off the **New designer** toggle on the menu in the cloud flows designer.

> [!NOTE]
> The new cloud flows designer isn't yet available in integration surfaces such as Solution Explorer, Power Apps, Teams, and others.

If a flow is saved too soon on load, it might be saved without advanced parameters if those parameters weren't fetched yet. As a workaround, you can avoid saving a flow too soon on load. Alternatively, use the classic designer.

## FAQ

This section highlights some of the most frequently asked questions about working with Power Automate classic designer and cloud flows designer. <!--Kishor, is this up to date?-->

### Why do I get this error "O.split(...).at is not a function" when signing in?

Power Automate designer doesn't support browsers that are more than two (2) years old. You could see the previously mentioned or similar errors in the designer if your browser version is old. It's generally a good idea to update your browser to latest version to avoid such issues.

### Why do I get this error "The provided flow name contains invalid characters" when importing a flow in a new tenant?

This error is a temporary gap, which you can work around by adding a query parameter `v3=false` in your URL.

### Why don't I see new or updated SharePoint or Excel column values in my flow?

Power Automate designer requires a flow action to be re-added in order to pick up new entities of the underlying action. For example, if you have a SharePoint *Get item* action in your flow and Sharepoint item has four (4) columns, the flow allows you to access all four column values of the SharePoint item. Now, if you navigate to SharePoint, add a fifth column, and come back to the flow, you can't access the fifth column unless you delete the *Get item* action and re-add it again to force the designer to pick up the latest changes. The same behavior applies in Excel columns, Dataverse, OneDrive folder/files, and others.

### Will the new cloud flows designer eventually replace the classic designer fully?

Yes, once the issues noted here are resolved and the new cloud flows designer can cover most, if not all, of the classic designer scenarios. At this time, the classic designer will be fully replaced.

## Next step

> [!div class="nextstepaction"]
> [Tutorial: Get started with cloud flows](get-started-with-cloud-flows.md)

## Related information

Learn how to work with Copilot in cloud flows. You can get started with these articles:

- [Create your first cloud flow using Copilot](create-cloud-flow-using-copilot.md)
- [Create your first cloud flow without using Copilot](create-cloud-flow-without-copilot.md)
- [FAQ for Copilot expression assistant](faqs-copilot-expression-assistant.md)

