---
title: Actions
description: Learn about actions in Power Automate.
author: kewaiss
contributors:
  -kewaiss
  -v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: get-started
ms.date: 11/26/2025
ms.update-cycle: 180-days
ms.author: kewaiss
ms.reviewer: angieandrews
ms.collection:
  - get-started
  - bap-ai-copilot
---

# Actions

*Actions* are the events or operations you want the flow to do after the [trigger](triggers-introduction.md) event takes place. Examples of actions are: send emails, update records, or post messages. Actions can interact with a wide variety of services and applications, which helps you automate repetitive tasks and streamline business processes without the need for manual intervention.

To add your first action to your flow, select the plus sign (**+**) below the trigger in the cloud flows designer. The configuration panel opens on the left side, where you can search for and select the action you want to add.

The following screenshot shows the configuration panel, which is organized in four sections:

- **Favorites**
- **AI capabilities**
- **Built-in tools**
- **By connector**

Here's a screenshot of the configuration panel:

:::image type="content" source="./media/actions-introduction/actions-examples.png" alt-text="Screenshot of some actions.":::

- **Favorites**: When you favorite an action, category, or connector using the star icon, these items show in the **Favorites** section for quick retrieval. The star icon appears when you hover over it in the configuration pane.
- **AI Capabilities**: All AI capabilities are uplevelled in this standalone section.
- **Built-in tools**: These tools are the building blocks to your flow if you want to store values in a variable, insert a loop, and more.
- **By connector**: Shows a list of all connectors. At the top of the list are your most frequently used 20 connectors.

After you select an action for your trigger, the configuration panel updates to show the required fields and options for that action. You can fill in the necessary information, such as specifying the recipient's email address or selecting a file to attach.

Continue adding actions as needed to build your flow. To add more actions, select the plus sign (**+**) below the action where you want the new action to take place. The configuration panel opens again, allowing you to search for and select another action.

Learn more about adding actions in [Work with triggers and actions](work-with-triggers-actions.md).

## Choose the right actions

The hundreds of actions in Power Automate allow you to create complex workflows that respond to different scenarios and automate various tasks. Most cloud flows need more than one action when your automation requires many tasks to be completed either in sequence or in parallel. For example, you need multiple actions to do the following tasks:

- Add a condition to check if a value is true or false, and then add different actions based on the outcome.
- If a new item is added to a SharePoint list, send an email notification.
- If the item contains a specific value, create a task in Microsoft Planner.

Here are some scenarios that require multiple actions and examples of actions you can use.

|Scenario |Examples |
|---------|---------|
| Automate multi-step processes in your workflow. | When a new item is added to a SharePoint list, you might want to:<li>Send an email notification to the team.<li>Create a task in Microsoft Planner.<li>Update a database record. |
| Add decisions using conditional logic and branching in your flow. | If a value meets certain criteria, you might send an approval request; otherwise, you update a record. This requires multiple actions organized with [conditions](add-condition.md), switches, or [scopes](scopes.md). |
| Build error handling in your flow. | Group actions into [scopes](scopes.md) for organization and clarity, and use run-after [conditions](add-condition.md) to make your flows more reliable. |
| Perform tasks to make your flow run faster and more efficiently. | Choose these actions to run simultaneously rather than sequentially:<li>Retrieve data from multiple sources.<li>Send multiple notifications. |
| Transform, merge, or aggregate data from different sources. | Merge multiple PDF files into one document that requires several actions to collect, process, and output the result. |

## Next step

> [!div class="nextstepaction"]
> [Explore the cloud flows designer](flows-designer.md)

## Related information

- [Training: Describe building automation with Microsoft Power Automate (module)](/training/modules/introduction-power-automate/)
- [Training: Enhance productivity with Power Automate and the Office 365 Outlook Connector (module)](/training/modules/enhance-productivity/)
- [Training: Streamline SharePoint processes with Power Automate (module)](/training/modules/streamline-processes/)


