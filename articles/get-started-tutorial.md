---
title: Get started with Power Automate tutorial
description: Learn how to build a cloud flow with Copilot with a tutorial.
author: HeatherOrt
contributors:
  - Kewaiss
  - HeatherOrt
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 05/05/2025
ms.author: kewaiss
ms.reviewer: angieandrews
search.audienceType:
  - flowmaker
  - enduser
ms.collection:
  - get-started
  - bap-ai-copilot
---

# Get started with Power Automate tutorial

This article provides a tutorial for you to learn how to create a cloud flow using Copilot. Copilot is a feature in Power Automate that helps you create flows using natural language. You can also use Copilot to add actions and modify existing flows.

Once you create a flow, we recommend that you test it. The completed flow in this tutorial sends an email weekly to a customer with an overdue account.

## Build a cloud flow using Copilot

The Power Automate maker portal provides multiple ways to create workflows for your organization. For this tutorial, you create and modify a cloud flow using Copilot.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. In the Copilot field, describe what kind of flow you want to create. Use natural language and be as specific as possible.

   Copy the following prompt and paste it into the Copilot field:

   ```copilot-prompt
   Create a flow that runs Monday every week starting 04/28/2025 which sends an email to contoso@gmail.com that their payment is overdue. If they pay by May 31, they can avoid a late fee.
   ```

1. Select **Generate**.

   :::image type="content" source="media/getting-started-tutorial/copilot-prompt-overdue-notification.png" alt-text="Screenshot of the Copilot interface showing the 'Generate' button.":::

   Based on the description, Copilot begins to create a suggested trigger and actions for your flow. In this example, the trigger is **Recurrence** and the action is **Send an email**.

1. Select **Keep it and continue**.

   :::image type="content" source="media/getting-started-tutorial/continue-copilot-prompt.png" alt-text="Screenshot of the Copilot interface showing the 'Keep it and continue' button.":::

1. Review your connected apps and services. A green checkmark indicates that the connection is valid. In this  example, the connection is **Office 365 Outlook**.

1. Select **Create flow**.

   A new flow is created and opens in the designer. The flow consists of the **Recurrence** trigger and **Send an email** action based on your prompt.

   :::image type="content" source="media/getting-started-tutorial/create-flow-copilot.png" alt-text="Screenshot of the designer after the flow is created.":::

## Use Copilot to make changes to an action

After your flow is created, you can make changes manually, or you can use Copilot to assist you.

In this section, change the subject for your email from **Payment Overdue Notification** to **Your account is overdue** in the Copilot panel.

1. In the designer, select **Send an email**. Notice that in the configuration pane to the left, the subject is **Payment Overdue Notification**.

   :::image type="content" source="media/getting-started-tutorial/subject-overdue.png" alt-text="Screenshot of the subject 'Payment Overdue Notification.":::

1. Close the configuration pane by selecting  **Collapse** (**<<**) in the top-right corner.
1. Copy the following prompt and paste it into the **Copilot** pane:  

   ```copilot-prompt
   Change the subject of the email to "Your account is overdue".
   ```

1. Select **Submit**. Copilot updates the action in the designer.

1. In the **Send an email** action in the designer, select the bubble icon to display the updated subject, **Your account is overdue**.

    :::image type="content" source="media/getting-started-tutorial/send-email-action.png" alt-text="Screenshot of the Copilot pane confirming the 'Send an email' action was changed.":::

1. On the toolbar at the top of the screen, select **Save**.

    A green message appears at the top of the screen, indicating that your flow was saved successfully.

    :::image type="content" source="media/getting-started-tutorial/success-message.png" alt-text="Screenshot of a green message at the top of the screen indicating the flow was saved successfully.":::

## Test your flow

To make sure your flow works as expected, you should test it.

1. On the toolbar, select **Test**.
1. In the **Test your flow** pane, select **Manually**, and then select **Test**.
1. In the **Run flow** pane, select **Run flow**.
1. When the flow run starts successfully (indicated by a green checkmark), select **Done**.

    :::image type="content" source="media/getting-started-tutorial/successful-run.png" alt-text="Screenshot of the message that you flow ran successfully.":::

    When your flow is finished running, the message, **Your flow ran successfully** appears in a green message at the top. Your flow is now listed in **My flows**.

1. To display your flow, leave the designer by selecting **Back** in the top-left corner.
1. On the navigation menu to the left, select **My flows**.

    :::image type="content" source="media/getting-started-tutorial/my-flows.png" alt-text="Screenshot of the list of cloud flows in the main Power Automate screen.":::

Congratulations! You successfully created a cloud flow using Copilot and tested it!

## Related information

- [Explore the Power Automate home page](getting-started.md)
- [Human review for automation with a prompt](/ai-builder/azure-openai-human-review)  
- [Find and fix errors with Flow Checker](error-checker.md)
