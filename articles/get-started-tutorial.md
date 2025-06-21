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
ms.date: 06/20/2025
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

This article provides a tutorial for you to create a cloud flow and then test it. The completed flow sends a monthly newsletter to an email address.

## Create a cloud flow

You can create a cloud flow using natural language in Copilot. You can also create a cloud flow using classic Power Automate functionality. If you have access to Copilot, select the **Using copilot** tab to create your flow. If you don't have access to Copilot, select the **Without copilot** tab.

# [Using copilot](#tab/using-copilot)

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. In the Copilot field, describe what kind of flow you want to create. Use natural language and be as specific as possible.

   Copy the following prompt and paste it into the Copilot field:

   ```copilot-prompt
    Create a flow that runs on the first of every month starting in June 2025 at 12:00 AM, Pacific Time. Send it to contoso@gmail.com and the title should be, "The Contoso Cadence Newsletter".
   ```
    Once you paste the prompt, replace the `contoso@gmail.com` email address with your own email address.
1. Select **Generate**.

   :::image type="content" source="media/getting-started-tutorial/copilot-generate-newsletter.png" alt-text="Screenshot of the Copilot interface showing the 'Generate' button.":::

   Based on the description, Copilot begins to create a suggested *trigger* and *actions* for your flow. A trigger is an event that starts a cloud flow. Actions are the events you want the flow to do after the trigger event takes place.

    In this example, the trigger is **Recurrence** and the action is **Send an email**.

1. Select **Keep it and continue**.

   :::image type="content" source="media/getting-started-tutorial/continue-copilot-prompt.png" alt-text="Screenshot of the Copilot interface showing the 'Keep it and continue' button.":::

1. Review your connected apps and services. A green checkmark indicates that the connection is valid. In this example, the connection is **Office 365 Outlook**.

    Some connections ask you to sign in. If you aren't signed in already, select **Sign in** and provide your credentials.

    Learn more about connections and how to troubleshoot them in [Manage connections in Power Automate](add-manage-connections.md).

1. Select **Create flow**.

    This flow consists of the **Recurrence** trigger and **Send an email** action based on your prompt.

   :::image type="content" source="media/getting-started-tutorial/create-flow-copilot.png" alt-text="Screenshot of the designer after the flow is created with the Copilot panel.":::

### Fix invalid parameters

If you see a red message in your flow that says **Invalid parameters**, you need to fix them before you can continue. The flow can't run until you enter the required parameters.

1. Select the **Send an email** action card to open the configuration pane.
1. In the **Body** field, copy the following text and paste it into the field:

    ```copilot-prompt
    Welcome to the monthly Contoso Cadence newletter! In this email, you'll find important dates for training sessions and talks. We'll also showcase some demos, and list the frequently asked questions for the month.
    ```

1. Select **<<** in the upper-right corner of the configuration pane to close it.

    Notice that the **Invalid parameters** message is gone.

# [Without copilot](#tab/without-copilot)

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation menu to the left, select **Create**.
1. Under **Start from blank**, select **Scheduled cloud flow**.

   :::image type="content" source="media/getting-started-tutorial/start-from-blank.png" alt-text="Screenshot of the Copilot interface showing the 'Keep it and continue' button.":::

1. In the **Flow name** field, enter a name for your flow. The name used in this tutorial is *Newsletter*.
1. In the **Starting** field, select the calendar icon and then select **6/1/25** at **12:00 AM**.
1. In the **Repeat every** field, enter **1** and then select **Month** from the dropdown menu.

    :::image type="content" source="media/getting-started-tutorial/scheduled-cloud-flow.png" alt-text="Screenshot of the 'Build a scheduled cloud flow' screen.":::

1. Select **Create**.

    The designer opens with the **Recurrence** *trigger*. Now you need to add an *action*. A trigger is an event that starts a cloud flow. Actions are the events you want the flow to do after the trigger event takes place.

---

### Complete creating your cloud flow

Complete creating your cloud flow in the *designer*. Power Automate uses either the new designer or the classic designer. If you're not sure which designer you're using, learn how to identify the differences in [Identify differences between the new designer and the classic designer](flows-designer.md#identify-differences-between-the-classic-designer-and-the-new-cloud-flows-designer).

1. Select the location for your new action in your cloud flow:
    - New designer: Select (**+**) below the **Recurrence** trigger.
    - Classic designer: Select **+ New step**.
1. Add an action to your cloud flow:
    - New designer: In the **Add an action** search field, type **Send an email (V2)** and then select the **Send an email (V2)** action.
    - Classic designer: In the **Choose an operation** search field, type **Send an email (V2)** and then select the **Send an email (V2)** action.
1. Enter the following information:
    1. In the **To** field, enter your email address.

        If you were doing this in a real life scenario, you would enter the email of the person you want to send the newsletter to. In this tutorial, use your own email so that you can see the results of the flow.

    1. In the **Subject** field, enter **The Contoso Cadence Newsletter**.
    1. In the **Body** field, enter the following text:

        ```copilot-prompt
        Welcome to the monthly Contoso Cadence newletter! In this email, you'll find important dates for training sessions and talks. We'll also showcase some demos, and list the frequently asked questions for the month.
        ```

    1. (In the new designer) Select (**<<**) in the upper-right corner of the panel to collapse the configuration pane.

    This flow consists of the **Recurrence** trigger and **Send an email (V2)** action that contains the parameters you set in this procedure.

    |New designer  |Classic designer  |
    |---------|---------|
    | :::image type="content" source="media/getting-started-tutorial/create-flow-without-copilot-new.png" alt-text="Screenshot of the scheduled cloud flow in the new designer.":::    | :::image type="content" source="media/getting-started-tutorial/create-flow-without-copilot-classic.png" alt-text="Screenshot of the scheduled cloud flow in the classic designer.":::         |

1. Save your cloud flow by selecting **Save** in the command bar.

    A green message appears at the top of the screen, indicating that your flow was saved successfully.

    :::image type="content" source="media/getting-started-tutorial/success-message.png" alt-text="Screenshot of a green message at the top of the screen indicating the flow was saved successfully.":::

    Once you create a flow, we recommend that you test it. Go to [test your cloud flow](#test-your-cloud-flow).

> [!NOTE]
> Make sure a human reviews AI-generated content to verify that it is accurate and appropriate. Learn more in [Human review for automation with a prompt](/ai-builder/azure-openai-human-review).

1. Go to [Test your cloud flow](#test-your-cloud-flow)

## Test your cloud flow

To make sure your flow works as expected, you should test it.

1. Make sure you completed [Create a cloud flow](#create-a-cloud-flow).

    This procedure also works with any cloud flow you want to test.

1. On the toolbar, select **Test**.
1. In the **Test flow** pane, select **Manually**, and then select **Test**.
1. In the **Run flow** pane, select **Run flow**.
1. When the flow run starts successfully (indicated by a green checkmark), select **Done**.

    :::image type="content" source="media/getting-started-tutorial/successful-run.png" alt-text="Screenshot of the message that you flow ran successfully.":::

    When your flow is finished running, the message, **Your flow ran successfully** appears in a green message at the top.

1. To display your flow, leave the designer by selecting **Back** (arrow pointing left) in the top-left corner next to your flow name (not the **Back** button in the address bar).

    The details screen displays the flow you created. The details screen shows the flow's name, description, and other information about the flow

    :::image type="content" source="media/getting-started-tutorial/details.png" alt-text="Screenshot of the details screen for your new cloud flow.":::

1. Your flow is now in the **My flows** list. To find it, select **My flows** on the navigation menu to the left. Your new flow is at the top of the list.

    :::image type="content" source="media/getting-started-tutorial/my-flows.png" alt-text="Screenshot of the list of cloud flows in the main Power Automate screen.":::

When your flow runs, it sends an email to the address you specified in the **To** field. In this tutorial, you used your own email. Check your email inbox to see the results of your flow.

Congratulations! You successfully created a cloud flow using Copilot and tested it!

## Related information

- [Explore the Power Automate home page](getting-started.md)
- [Human review for automation with a prompt](/ai-builder/azure-openai-human-review)  
- [Find and fix errors with Flow Checker](error-checker.md)
