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
ms.date: 06/17/2025
ms.author: kewaiss
ms.reviewer: angieandrews
ms.custom: copilot-scenario-highlight
search.audienceType:
  - flowmaker
  - enduser
ms.collection:
  - get-started
  - bap-ai-copilot
---

# Get started with Power Automate tutorial

This article provides a tutorial for you to create a cloud flow, make changes to it, and then test your new cloud flow. The completed flow sends an email weekly to a customer with an overdue account.

## Create a cloud flow

You can create a cloud flow using natural language in Copilot. You can also create a cloud flow using classic Power Automate functionality. If you have access to Copilot, select the **Using copilot** tab to create your flow. If you don't have access to Copilot, select the **Without copilot** tab.

# [Using copilot](#tab/using-copilot)

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. In the Copilot field, describe what kind of flow you want to create. Use natural language and be as specific as possible.

   Copy the following prompt and paste it into the Copilot field:

   ```copilot-prompt
   Create a flow that runs Monday every week starting 04/28/2025 which sends an email to contoso@gmail.com that their payment is overdue. If they pay by May 31, they can avoid a late fee.
   ```
    Once you paste the prompt, replace the `contoso@gmail.com` email address with your own email address.
1. Select **Generate**.

   :::image type="content" source="media/getting-started-tutorial/copilot-prompt-overdue-notification.png" alt-text="Screenshot of the Copilot interface showing the 'Generate' button.":::

   Based on the description, Copilot begins to create a suggested *trigger* and *actions* for your flow. A trigger is an event that starts a cloud flow. Actions are the events you want the flow to do after the trigger event takes place.

    In this example, the trigger is **Recurrence** and the action is **Send an email**.

1. Select **Keep it and continue**.

   :::image type="content" source="media/getting-started-tutorial/continue-copilot-prompt.png" alt-text="Screenshot of the Copilot interface showing the 'Keep it and continue' button.":::

1. Review your connected apps and services. A green checkmark indicates that the connection is valid. In this example, the connection is **Office 365 Outlook**.

1. Select **Create flow**.

    This flow consists of the **Recurrence** trigger and **Send an email** action based on your prompt.

   :::image type="content" source="media/getting-started-tutorial/create-flow-copilot.png" alt-text="Screenshot of the designer after the flow is created with the Copilot panel.":::

    Once you create a flow, we recommend that you test it. You [test your flow](#test-your-flow) later in this tutorial.

> [!IMPORTANT]
> Make sure the AI-generated content from Copilot is accurate and appropriate before using it. You should review and edit responses and manually check facts, data, and text before you use the AI-generated content.
>
> Learn more in [Human review for automation with a prompt](/ai-builder/azure-openai-human-review) and [Are Copilot's responses always factual?](/power-platform/faqs-copilot-data-security-privacy#are-copilots-responses-always-factual)

# [Without copilot](#tab/without-copilot)

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation menu to the left, select **Create**.
1. Under **Start from blank**, select **Scheduled cloud flow**.
1. In the **Flow name** field, enter a name for your flow. The name used in this tutorial is *Overdue payment notification*.
1. In the **Starting** field, select the calendar icon and then select **04/28/2025** at **08:00 AM**.
1. In the **Repeat every** field, enter **1** and then select **Week** from the dropdown menu.
1. Under **On these days**, deselect **S**, **T**, **W**, **T**, **F** and **S** (for Sunday, Tuesday, Wednesday, Thursday, Friday, and Saturday).

    Only **M** remains selected to indicate the flow runs on Monday every week.

    :::image type="content" source="media/getting-started-tutorial/scheduled-cloud-flow.png" alt-text="Screenshot of the 'Build a scheduled cloud flow' screen.":::

1. Select **Create**.

    The designer opens with the **Recurrence** *trigger*. Now you need to add an *action*. A trigger is an event that starts a cloud flow. Actions are the events you want the flow to do after the trigger event takes place.

    > [!NOTE]
    > Complete creating your flow in the *designer*.
    > Power Automate uses either the new modern designer with Copilot capabilities or the classic cloud flows designer. If you're not sure which designer you're using, learn how to identify the difference in [Identify differences between the classic designer and the new cloud flows designer](flows-designer.md#identify-differences-between-the-classic-designer-and-the-new-cloud-flows-designer).

1. Select the location for your new action in your cloud flow:
    - New designer: Select (**+**) below the **Recurrence** trigger.
    - Classic designer: Select **+ New step**.
1. Add an action to your cloud flow:
    - New designer: In the **Add an action** search field, type **Send an email** and then select the **Send an email (V2)** action.
    - Classic designer: In the **Choose an operation** search field, type **Send an email** and then select the **Send an email (V2)** action.
1. Select the **Send an email (V2)** action.
1. Enter the following information:
    1. In the **To** field, start typing your email address. When it appears in the list, select it.
    1. Enter **Payment Overdue Notification** in the **Subject** field.
    1. In the **Body** field, enter the following text:

        ```
        Your account is overdue. If you pay by May 31, you can avoid a late fee.
        ```

1. If using the new designer, select **<<** in the upper-right corner of the pane. If using the classic designer, select **Save** in the command bar at the top of the screen.

    This flow consists of the **Recurrence** trigger and **Send an email (V2)** action that contains the parameters you set in this procedure.

    :::image type="content" source="media/getting-started-tutorial/create-flow-without-copilot.png" alt-text="Screenshot of the scheduled cloud flow in the new designer.":::

    If you're using the classic designer, the **New step** button appears in place of the plus sign (**+**).

    Once you create a flow, we recommend that you test it. You [test your flow](#test-your-flow) later in this tutorial.

---

## Make changes to your cloud flow

After your flow is created, you can make changes to the trigger and actions using Copilot to assist you, or you can do it manually. In this section, change the subject for your email from **Payment Overdue Notification** to **Your account is overdue**.

# [Using copilot](#tab/using-copilot)

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

1. On the command bar at the top of the screen, select **Save**.

    A green message appears at the top of the screen, indicating that your flow was saved successfully.

    :::image type="content" source="media/getting-started-tutorial/success-message.png" alt-text="Screenshot of a green message at the top of the screen indicating the flow was saved successfully.":::

# [Without copilot](#tab/without-copilot)

You can make changes to your cloud flow manually in the *designer*. You can do this using either the modern [new designer](flows-designer.md) with Copilot capabilities, or the classic designer. If you're not sure which designer you're using, learn how to identify the differences in [Identify differences between the classic designer and the new cloud flows designer](flows-designer.md#identify-differences-between-the-classic-designer-and-the-new-cloud-flows-designer).

1. In the designer, select **Send an email (V2)**. Notice that the subject is **Payment Overdue Notification**.
1. In the **Subject**, type  **Your account is overdue**.
1. On the command bar at the top of the screen, select **Save**.

    A green message appears at the top of the screen, indicating that your flow was saved successfully.

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
