---
title: Call Microsoft Copilot Studio agents from Power Automate
description: Learn how to call Copilot Studio agents from Power Automate or use them in Copilot Studio workflows, based on the agent harness.
author: JoeFernandezMS
ms.author: jofernan
ms.reviewer: angieandrews
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 08/17/2026
ms.update-cycle: 180-days
ms.collection:
  - bap-ai-copilot
search.audienceType:
  - flowmaker
  - enduser
ai-usage: ai-assisted
---

# Call Microsoft Copilot Studio agents from Power Automate

Microsoft Copilot Studio offers agents powered by different [agent harnesses](/microsoft-copilot-studio/harnesses-overview). The harness that powers an agent determines how you can use the agent in an automation.

| Agent harness | Supported automation experience |
| --- | --- |
| Standard harness | Call the agent from a Power Automate cloud flow by using the [Microsoft Copilot Studio connector](/connectors/microsoftcopilotstudio/). |
| GitHub Copilot harness | Use the agent node in a Copilot Studio workflow. You can't call this type of agent from a Power Automate cloud flow by using the Microsoft Copilot Studio connector. |

## Call a standard harness agent from a cloud flow

Use the **Microsoft Copilot Studio** connector to send a message to an agent powered by the standard harness. The following procedure uses the **Execute Agent and wait** action so the flow waits for the agent's response before continuing.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Create a cloud flow, or open an existing cloud flow and select **Edit**.
1. In the designer, select the plus sign (**+**) where you want to call the agent, and then select **Add an action**.
1. Search for **Microsoft Copilot Studio**, and then select **Execute Agent and wait**.
1. If prompted, sign in with Microsoft Entra ID to create a connection.
1. In **Agent**, select the published standard harness agent that you want to call.
1. In **Message**, enter the instructions for the agent. You can add dynamic content from earlier steps in the flow.
1. Configure any optional inputs that your scenario requires:

   - **Locale**: Specify the language of the message by using a BCP-47 locale.
   - **Conversation ID**: Provide an existing conversation ID to continue an agent conversation.
   - **Environment ID**: Specify the environment that contains the agent.

1. Add any actions that should use the agent's response. The action provides the last response, a list of responses, and the conversation ID as dynamic content.
1. Select **Save**, and then test the flow.

> [!TIP]
> If the flow doesn't need to wait for the agent's response, use the **Execute Agent** action instead. This action sends the message and returns the conversation ID.

## Use a GitHub Copilot harness agent in an automation

The Microsoft Copilot Studio connector in Power Automate doesn't support agents powered by the GitHub Copilot harness. To use one in an automation, create a workflow in Copilot Studio and call the agent from an agent node.

1. In Copilot Studio, go to **Workflows** and open an existing workflow, or create a new workflow.
1. On the **Add** panel, select the **Agent** icon.
1. Under **Agent**, select **An existing agent**, and then select the published GitHub Copilot harness agent that you want to call.
1. In **Message**, enter the instructions for this run. Add dynamic content from earlier workflow steps as needed.
1. Add later workflow steps that use the agent response.
1. Test the workflow before you publish it.

Learn more about configuring the agent node and using its output in [Add an agent node to a workflow](/microsoft-copilot-studio/workflows-experience/agent-node-workflow).



## Related information

- [Choose a harness in Microsoft Copilot Studio](/microsoft-copilot-studio/harnesses-overview)
- [Microsoft Copilot Studio connector reference](/connectors/microsoftcopilotstudio/)
- [Work with triggers and actions](work-with-triggers-actions.md)


