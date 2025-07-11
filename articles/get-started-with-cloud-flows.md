---
title: Get started with cloud flows
description: In this tutorial, learn how to create a cloud flow, test it, and run it.
author: kewaiss
contributors:
  - Kewaiss
  - HeatherOrt
  - v-aangie
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 07/11/2025
ms.update-cycle: 180-days
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

# Get started with cloud flows

In this article, you create a cloud flow, test it, and then run it. The completed cloud flow sends a monthly newsletter to an email address. To give you the full experience, you send the email to your own address so you can receive the results of the cloud flow in your inbox.

## Create a cloud flow

You can create a cloud flow using natural language in Copilot, or create it from scratch. If you have access to Copilot, select the **Using copilot** tab to create your flow. If you want to create a cloud flow from scratch, select the **Without copilot** tab.

# [Using copilot](#tab/using-copilot)

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the navigation pane to the left, make sure **Home** is selected.
1. In the **Create your automation with Copilot** field, describe what kind of flow you want to create. Use natural language and be as specific as possible.

   Copy the following prompt and paste it into the Copilot field:

   ```copilot-prompt
    Create a flow that runs on the first of every month starting in June 2025 at 12:00 AM, Pacific Time. Send it to contoso@gmail.com and the title should be, "The Contoso Cadence Newsletter". The body for the email is, "Welcome to the monthly Contoso Cadence newsletter! In this email, you'll find important dates for training sessions and talks. We'll also showcase demos and list the frequently asked questions for the month."

   ```

    Your prompt tells Copilot how to set up the recurrence of the email, who the recipient is, and the contents of the email's subject and body&mdash;all the information you need to create a working cloud flow.

1. Once you paste the prompt, replace the `contoso@gmail.com` email address with your own email address.

    If you were doing this in a real life scenario, you would enter the email of the person you want to send the newsletter to. In this tutorial, use your own email so that you can see the results of the flow.

1. Select **Generate**.

   :::image type="content" source="media/get-started-with-cloud-flows/copilot-generate-newsletter.png" alt-text="Screenshot of the Copilot interface showing the 'Generate' button.":::

   Based on the description, Copilot begins to create a suggested *trigger* and *actions* for your flow. A trigger is an event that starts a cloud flow. Actions are the events you want the flow to do after the trigger event takes place.

    In this example, the trigger is **Recurrence** and the action is **Send an email**.

1. Select **Keep it and continue**.

   :::image type="content" source="media/get-started-with-cloud-flows/continue-copilot-prompt.png" alt-text="Screenshot of the Copilot interface showing the 'Keep it and continue' button.":::

1. Review your connected apps and services. A green checkmark indicates that the connection is valid. In this tutorial, the connection is **Office 365 Outlook**.

    Some connections ask you to sign in. If you aren't signed in already, select **Sign in** and provide your credentials.

    Learn more about connections and how to troubleshoot them in [Manage connections in Power Automate](add-manage-connections.md).

1. Select **Create flow**.

    This flow consists of the **Recurrence** trigger and **Send an email** action based on your prompt.

   :::image type="content" source="media/get-started-with-cloud-flows/create-flow-copilot.png" alt-text="Screenshot of the designer after the flow is created with the Copilot panel.":::

    > [!NOTE]
    > The prompt you generated in step 3 sends the email to only one person. You can send it to multiple people by selecting the **Send an email** action card to display the configuration pane. In the **To** field, enter multiple emails.

1. Save your cloud flow by selecting **Save** in the command bar at the top of the screen.

    A green message appears below the command bar, indicating that your flow is now saved.

    :::image type="content" source="media/get-started-with-cloud-flows/success-message.png" alt-text="Screenshot of a green message at the top of the screen indicating your flow is now saved.":::

    > [!NOTE]
    > Make sure a human reviews AI-generated content to verify that it's accurate and appropriate. Learn more in [Human review for automation with a prompt](/ai-builder/azure-openai-human-review).

1. Once you create a flow, we recommend that you test it. Go to [Test your cloud flow](#test-your-cloud-flow).

# [Without copilot](#tab/without-copilot)

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation menu to the left, select **Create**.
1. Under **Start from blank**, select **Scheduled cloud flow**.

   :::image type="content" source="media/get-started-with-cloud-flows/start-from-blank.png" alt-text="Screenshot of the Copilot interface showing the 'Keep it and continue' button.":::

1. In the **Flow name** field, enter a name for your flow. The name used in this tutorial is *Newsletter*.
1. In the **Starting** field, select the calendar icon and then select **6/1/25** at **12:00 AM**.
1. In the **Repeat every** field, enter **1**, and then select **Month** from the dropdown menu.

    :::image type="content" source="media/get-started-with-cloud-flows/scheduled-cloud-flow.png" alt-text="Screenshot of the 'Build a scheduled cloud flow' screen.":::

1. Select **Create**.

    The designer opens with the **Recurrence** *trigger*. Now you need to add an *action*. A trigger is an event that starts a cloud flow. Actions are the events you want the flow to do after the trigger event takes place.

### Complete creating your cloud flow

Complete creating your cloud flow in the *designer*. Power Automate allows you to use either the [new designer](flows-designer.md) or the classic designer to configure your cloud flow. The steps are similar in both designers. Learn more (with examples) in [Identify differences between the new designer and the classic designer](flows-designer.md#identify-differences-between-the-new-designer-and-the-classic-designer).

1. Select the location for your new action in your cloud flow:
    - New designer: Select (**+**) below the **Recurrence** trigger.
    - Classic designer: Select **+ New step**.
1. Add an action to your cloud flow:
    - New designer: In the **Add an action** search field, type **Send an email (V2)** and then select the **Send an email (V2)** action under **Microsoft 365 Outlook**.
    - Classic designer: In the **Choose an operation** search field, type **Send an email (V2)** and then select the **Send an email (V2) Microsoft 365 Outlook** action.
1. Enter the following information:
    1. In the **To** field, enter your email address.

        If you were doing this in a real life scenario, you would enter the email of the person you want to send the newsletter to. In this tutorial, you're sending it to yourself so that you can get the email sent by your cloud flow when you run it later in this tutorial. You can also send it to multiple people in the **To** field.

    1. In the **Subject** field, enter **The Contoso Cadence Newsletter**.
    1. In the **Body** field, copy and paste the following text:

        ```
        Welcome to the monthly Contoso Cadence newsletter! In this email, you'll find important dates for training sessions and talks. We'll also showcase demos, and list the frequently asked questions for the month.
        ```

    1. New designer: Select (**<<**) in the upper-right corner of the panel to collapse the configuration pane.

    This flow consists of the **Recurrence** trigger and **Send an email (V2)** action that contains the parameters you set in this procedure.

    |New designer  |Classic designer  |
    |---------|---------|
    | :::image type="content" source="media/get-started-with-cloud-flows/create-flow-without-copilot-new.png" alt-text="Screenshot of the scheduled cloud flow in the new designer.":::    | :::image type="content" source="media/get-started-with-cloud-flows/create-flow-without-copilot-classic.png" alt-text="Screenshot of the scheduled cloud flow in the classic designer.":::         |

1. Save your cloud flow by selecting **Save** in the command bar.

    A green message appears below the **Power Automate** title bar, indicating that your flow is now saved.

1. Once you create a flow, we recommend that you test it. Go to [Test your cloud flow](#test-your-cloud-flow).

---

## Test your cloud flow

To make sure your flow works as expected, you should test it.

1. Make sure you completed [Create a cloud flow](#create-a-cloud-flow).

    This procedure also works with any cloud flow you want to test.

1. On the toolbar, select **Test**.
1. In the **Test flow** pane, select **Manually**, and then select **Test**.
1. In the **Run flow** pane, select **Run flow**.
1. When the flow run starts successfully (indicated by a green checkmark), select **Done**.

    :::image type="content" source="media/get-started-with-cloud-flows/successful-run.png" alt-text="Screenshot of the message that you flow ran successfully.":::

    When your flow is finished running, the message, **Your flow ran successfully** appears in a green message at the top.

    If your flow encounters an error, a red message appears instead. You can select the **Flow Checker** icon (the stethoscope icon on the command bar) for details about the error. Learn how to correct the errors in [Find and fix errors with Flow Checker](error-checker.md).

1. To display your flow, leave the designer by selecting **Back** (arrow pointing left) in the top-left corner below the **Power Automate** title bar (not the **Back** button in the address bar).

    The screen that appears shows the details of the flow you created, including the owner, create date, type of flow, connections, and other information about the flow.

    Under the **28-day run history** panel, you can check if your flow ran successfully, failed, or is still running.

    :::image type="content" source="media/get-started-with-cloud-flows/details.png" alt-text="Screenshot of the details screen for your new cloud flow.":::

1. Go to [Run your cloud flow](#run-your-cloud-flow).

## Run your cloud flow

When your cloud flow runs successfully, it's listed in the **My flows** screen. This is where you can run it.

1. On the navigation menu to the left, select **My flows**. Your cloud flow is at the top of the list.

1. Hover over your cloud flow, and then select the **Run** icon (the first icon, which is a triangle pointing to the right).

    :::image type="content" source="media/get-started-with-cloud-flows/run-flow.png" alt-text="Screenshot of the 'Run' icon next to your cloud flow.":::

1. In the **Run flow** pane, select **Run flow**.
1. When the flow run starts successfully (indicated by a green checkmark), select **Done**.

    When your flow finishes running, it sends an email to the address you specified in the **To** field. In this tutorial, you used your own email.

1. Check your email inbox for the email your cloud flow sent you.

Congratulations! You successfully created a cloud flow, tested it, and ran it!

## Next step

> [!div class="nextstepaction"]
> [Create your first cloud flow using Copilot](create-cloud-flow-using-copilot.md)

