---
title: Get started with Power Automate tutorial
description: Learn how to build a cloud flow with Copilot with a tutorial.
author: HeatherOrt
contributors:
  - HeatherOrt
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 05/01/2025
ms.author: heortaol
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

   A new flow is created and opens in the designer. The flow includes the **Recurrence** trigger and **Send an email** action based on your prompt.

   :::image type="content" source="media/getting-started-tutorial/create-flow-copilot.png" alt-text="Screenshot of the designer after the flow is created.":::

## Use Copilot to make changes to an action

After your flow is created, you can make changes manually, or you can use Copilot to assist you. You can make changes directly in the designer, or you can use the Copilot pane to make changes.

In this section, change the subject for your email.

1. In the designer, select **Send an email**.
1. Copy the following prompt and paste it into the **Subject** field (replacing the existing subject):  

    ```copilot-prompt
    Your account is overdue
    ```

    The subject line is updated in the configuration pane.

    :::image type="content" source="media/getting-started-tutorial/send-email-action.png" alt-text="Screenshot of the configuration pane with the 'Send an email' option selected.":::

1. Hide the configuration pane by selecting **Collapse** (**<<**).

    As you make changes, use the icons on the toolbar to adjust the size and appearance of your flow. You can also move your flow anywhere on the screen by dragging with a traditional mouse or using another navigation device.

1. Practice adjusting the size of your flow by using the following icons:
    1. To zoom in, select the **Zoom in** icon (**+**).  
    1. To zoom out, select the **Zoom out** icon (**-**).  
    1. To reposition your flow, select the white space anywhere on the canvas and drag your flow to the desired location.  

1. On the toolbar at the top of the screen, select **Save**.

    A green message appears at the top of the screen, indicating that your flow was saved successfully.

    :::image type="content" source="media/getting-started-tutorial/success-message.png" alt-text="Screenshot of a green message at the top of the screen indicating the flow was saved successfully.":::

## Test your flow

To make sure your flow works as expected, you should test it.

1. On the toolbar, select **Test**.
1. In the **Test your flow** pane, select **Manually**, and then select **Test**.
1. In the **Run flow** pane, select **Run flow**.

    When the flow finishes running, a message appears indicating that the flow ran successfully.

    :::image type="content" source="media/getting-started-tutorial/successful-run.png" alt-text="Screenshot of the message that you flow ran successfully.":::

1. Select **Done**.

    The flow is now listed in **My flows**. To display it, leave the designer by selecting **Back** in the top-left corner, and then select **My flows** in the navigation menu on the left in the main Power Automate screen.

    :::image type="content" source="media/getting-started-tutorial/my-flows.png" alt-text="Screenshot of the list of cloud flows in the main Power Automate screen.":::

Congratulations! You successfully created a cloud flow using Copilot and tested it!

## Related information

- [Explore the Power Automate home page](getting-started.md)  
- [Find and fix errors with Flow Checker](error-checker.md)