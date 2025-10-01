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
ms.date: 10/01/2025
ms.update-cycle: 180-days
ms.author: kewaiss
ms.reviewer: angieandrews
ms.collection:
  - get-started
  - bap-ai-copilot
---

# Actions

*Actions* are the events or operations you want the flow to do after the [trigger](triggers-introduction.md) event takes place. Examples of actions are: send emails, update records, or post messages. Actions can interact with a wide variety of services and applications, which helps you automate repetitive tasks and streamline business processes without the need for manual intervention.

Power Automate offers various actions that you can use in your cloud flows. There are three main categories:

- AI capabilities
- Built-in tools
- By connector

Here's a screenshot of a partial list of actions:

:::image type="content" source="./media/actions-introduction/actions-examples.png" alt-text="Screenshot of some actions.":::

- **AI Capabilities**: (*Need better definition and/or give example*) Uplevel AI capabilities in this standalone section.
- **Built-in tools**: Building blocks to your flow if you want to store values in a variable, insert a loop, and more.
- **By connector**: Connect to services such as SharePoint and Outlook. Most connectors offer prebuilt actions that you can use in your flows.

## Choose the right actions

The hundreds of actions in Power Automate allow you to create complex workflows that respond to different scenarios and automate various tasks. Most cloud flows need more than one action when your automation requires many tasks to be completed either in sequence or in parallel. For example, you need multiple actions to do the following tasks:

- Add a condition to check if a value is true or false, and then add different actions based on the outcome.
- If a new item is added to a SharePoint list, send an email notification.
- If the item contains a specific value, create a task in Microsoft Planner.

Here are some scenarios that require multiple actions and examples of actions you can use.

|Scenario |Examples |
|---------|---------|
| Automate multi-step processes in your workflow. | When a new item is added to a SharePoint list, you might want to:</li><li>Send an email notification to the team.</li><li>Create a task in Microsoft Planner.</li><li>Update a database record.</li> |
| Add decisions using conditional logic and branching in your flow. | If a value meets certain criteria, you might send an approval request; otherwise, you update a record. This requires multiple actions organized with conditions, switches, or scopes. |
| Build error handling in your flow. | Group actions into [scopes](scopes.md) for organization and clarity, and use run-after conditions to make your flows more reliable. |
| Perform tasks to make your flow run faster and more efficiently. | Choose these actions to run simultaneously rather than sequentially: </li><li>Retrieve data from multiple sources.</li><li>Send multiple notifications. |
| Transform, merge, or aggregate data from different sources. | Merge multiple PDF files into one document that requires several actions to collect, process, and output the result. |

## Next step

> [!div class="nextstepaction"]
> [Explore the cloud flows designer](flows-designer.md)

## Related information

- [Training: Describe building automation with Microsoft Power Automate (module)](/training/modules/introduction-power-automate/)
- [Training: Enhance productivity with Power Automate and the Office 365 Outlook Connector (module)](/training/modules/enhance-productivity/)
- [Training: Streamline SharePoint processes with Power Automate (module)](/training/modules/streamline-processes/)


