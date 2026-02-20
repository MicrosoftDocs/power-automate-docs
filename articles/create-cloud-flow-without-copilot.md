---
title: Create your first cloud flow without Copilot
description: Learn how to create a cloud flow from scratch.
suite: flow
author: kewaiss
contributors:
  - kewaiss
  - HeatherOrt
  - jamiemwork
  - v-aangie
ms.reviewer: angieandrews
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: get-started
ms.date: 07/18/2025
ms.author: matow
search.audienceType: 
  - flowmaker
  - enduser
---

# Create your first cloud flow without Copilot

If you're creating a cloud flow without Copilot, you can choose from three cloud flow types depending on what you want to automate:

- **Automated cloud flow**: Create an automation that's triggered by an event such as the arrival of an email from a specific person, or a mention of your company in social media.
- **Instant cloud flow**: Start an automation with the selection of a button.
- **Scheduled cloud flow**: Start a scheduled automation such as daily data upload to SharePoint or a database.

Learn more about the types of cloud flows, when to use them, examples, and benefits in [Types of cloud flows](overview-cloud.md#types-of-cloud-flows).

Create your flow without Copilot if you prefer a more hands-on approach to building your flows, or don't have access to Copilot.

## Create a cloud flow without Copilot

The main steps to create a cloud flow without Copilot are the same for any of the cloud flow types. This section uses a scheduled cloud flow as an example. Each screen in the create process guides you with instructions.

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

## Configure your cloud flow

Complete creating your cloud flow in the *designer*. Power Automate provides two designers for you to choose from: the *new designer* and the *classic designer*. The new designer is the default experience, but you can switch to the classic designer. The steps are similar in both designers. Learn more and get examples in [Identify differences between the new designer and the classic designer](flows-designer.md#identify-differences-between-the-new-designer-and-the-classic-designer).

1. Select the location for your new action in your cloud flow:
    - New designer: Below the **Recurrence** trigger, select (**+**).
    - Classic designer: Select **+ New step**.
1. Add an action to your cloud flow:
    - New designer: In the **Add an action** search field, type **Send an email (V2)** and then select the **Send an email (V2)** action under **Microsoft 365 Outlook**.
    - Classic designer: In the **Choose an operation** search field, type **Send an email (V2)** and then select the **Send an email (V2) Microsoft 365 Outlook** action.
1. Enter the following information:
    1. In the **To** field, enter your email address.

        If you were doing this in a real life scenario, you would enter the email of the person you want to send the newsletter to. In this example, you're sending it to yourself so that you can get the email sent by your cloud flow when you run it later. You can also send it to multiple people in the **To** field.

    1. In the **Subject** field, enter **The Contoso Cadence Newsletter**.
    1. In the **Body** field, copy and paste the following text:

        ```
        Welcome to the monthly Contoso Cadence newsletter! In this email, you'll find important dates for training sessions and talks. We'll also showcase demos, and list the frequently asked questions for the month.
        ```

    1. New designer: Select (**<<**) in the upper-right corner of the panel to collapse the configuration pane.

    This flow consists of the **Recurrence** trigger and **Send an email (V2)** action that contain the parameters you set in this procedure.

    |New designer  |Classic designer  |
    |---------|---------|
    | :::image type="content" source="media/get-started-with-cloud-flows/create-flow-without-copilot-new.png" alt-text="Screenshot of the scheduled cloud flow in the new designer.":::    | :::image type="content" source="media/get-started-with-cloud-flows/create-flow-without-copilot-classic.png" alt-text="Screenshot of the scheduled cloud flow in the classic designer.":::         |

1. Save your cloud flow by selecting **Save** on the command bar.

    A green message appears below the **Power Automate** title bar indicating that your flow is now saved.

1. Once you save your flow, we recommend that you [test it](get-started-with-cloud-flows.md#test-your-cloud-flow).

## Next step

> [!div class="nextstepaction"]
> [Work with triggers and actions](work-with-triggers-actions.md)