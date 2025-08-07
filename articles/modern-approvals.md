---
title: Create and test an approval workflow with Power Automate
description: Learn how to automate approval workflows that integrate with SharePoint, Dynamics CRM, Salesforce, OneDrive for work or school, Zendesk, or WordPress.
suite: flow
author: kisubedi
contributors:
  - kewaiss
  - kisubedi
  - kartikraop
  - v-aangie
ms.author: kewaiss
ms.reviewer: angieandrews
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 06/27/2025
search.audienceType: 
  - flowmaker
  - enduser
---
# Create and test an approval workflow with Power Automate

With Power Automate, you can manage the approval of documents or processes across several services, including SharePoint, Dynamics 365, Salesforce, OneDrive for work or school, Zendesk, or WordPress.

To create an approval workflow, add the **Approvals - Start and wait for an approval** action to any flow. After you add this action, your flow can manage the approval of documents or processes. For example, you can create document approval flows that approve invoices, work orders, or sales quotations. You can also create process approval flows that approve vacation requests, overtime work, or travel plans.

Approvers can respond to requests from their email inbox, the approvals center in [Power Automate](https://make.powerautomate.com), or the Power Automate app.

## Create an approval flow

Here's an overview of the flow you create and test. In this example, you use SharePoint Online as the trigger, but you can use any other trigger to start your approval flow.

   :::image type="content" source="./media/modern-approvals/create-flow-overview.png" alt-text="Screenshot of an approval flow overview.":::

The flow performs the following steps:

1. Starts when someone creates a vacation request in a SharePoint Online list.

1. Adds the vacation request to the approval center, and then emails it to the approver.

1. Sends an email with the approver's decision to the person who requested vacation.

1. Updates the SharePoint Online list with the approver's decision comments.

Learn more about using SharePoint with Power Automate in the [SharePoint documentation](/sharepoint/dev/business-apps/power-automate/sharepoint-connector-actions-triggers).

> [!IMPORTANT]
> Always follow the [best practices for SharePoint security](/microsoft-365/community/permission-model-differences) and your organization's best practices to ensure your environment is secure. Security is outside the scope of this article.

## Prerequisites

To complete this tutorial, you must have access to:

[!INCLUDE [prerequisites-for-modern-approvals](includes/prerequisites-for-modern-approvals.md)]

Create these columns in your SharePoint Online list:

| Column | Type |
| ------ | ------ |
| Title | Single line of text |
|Start Date | Date and Time |
| End Date | Date and Time |
| Comments | Single line of text |
| Approved | Yes/No |
| Manager Comments | Single line of text |

Make a note of the name and URL of the SharePoint Online list. You need these items later when you configure the **SharePoint - When an item is created** trigger.

## Create an automated cloud flow

Follow these steps to create an automated cloud flow.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation pane to the left, select **My flows**.
1. On the command bar, select **New flow** > **Automated cloud flow**.
1. Give your flow a name.
1. Under **Choose your flow's trigger**, select **When an item is created - SharePoint**, and then select **Create**.
1. Go to [Configure the flow trigger](#configure-the-flow-trigger).

## Configure the flow trigger

When you create a flow, the first step is to configure the trigger. The trigger starts your flow when a specific event occurs. [!INCLUDE[designer-tab-experience](./includes/designer-tab-experience.md)]

1. Make sure you [created an automated cloud flow](#create-an-automated-cloud-flow).
1. New designer: Open the configuration pane on the left by selecting the **When an item is created** card.

   Classic designer: Expand the **When an item is created** card by selecting the **When an item is created** card.
1. Select the **Site Address** and the **List Name** for the SharePoint list that you created earlier.

    The **Site Address** and the **List Name** are the items you created in the SharePoint online list in the  [Prerequisites](#prerequisites) section.

    |New designer  |Classic designer  |
    |---------|---------|
    |:::image type="content" source="./media/modern-approvals/select-sharepoint-site-info-new-designer.png" alt-text="Screenshot showing SharePoint site information selection in the new designer.":::    | :::image type="content" source="./media/modern-approvals/select-sharepoint-site-info.png" alt-text="Screenshot showing SharePoint site information selection in the classic designer.":::        |

1. Close the configuration pane by selecting (**<<**) in the upper-right corner of the pane.
1. Go to [Add a profile action](#add-a-profile-action).

## Add a profile action

Follow these steps to add a profile action to your flow. This action retrieves the user's profile information, which you can use in the approval request.

# [New designer](#tab/new-designer)

1. Make sure you [created an automated cloud flow](#create-an-automated-cloud-flow) and [configured the flow trigger](#configure-the-flow-trigger).
1. Select **+**, and then type **Profile** in the **Add an action** search field.
1. Under **Office 365 Users**, select **Get my profile (V2)**.

    :::image type="content" source="./media/modern-approvals/search-for-profile-new-designer.png" alt-text="Screenshot showing how to search for profile action in the new designer.":::

1. In the **Advanced parameters** dropdown menu, place a check in the **Select fields** checkbox, and then select a blank area of the pane.
1. Select the **Select fields** field, and then select the lightning bolt icon.
1. Select a field from your profile to include in your flow.

    If your field doesn't display what you're looking for, select **See more** to view additional fields.

1. To add more fields from your profile, repeat the previous two steps.
1. Close the configuration pane by selecting (**<<**) in the upper-right corner of the pane.
1. Go to [Add an approval action](#add-an-approval-action).

# [Classic designer](#tab/classic-designer)

1. Make sure you [created an automated cloud flow](#create-an-automated-cloud-flow) and [configured the flow trigger](#configure-the-flow-trigger).
1. Select **New step**, and then type **Profile** into the **Choose an operation** search field.
1. Select the **Office 365 Users** icon.
1. Find, and then select the **Get my profile (V2)** action.

    :::image type="content" source="media/modern-approvals/search-for-profile.png" alt-text="Screenshot showing how to search for profile action in the classic designer.":::

1. In the **Get my profile (V2)** card, select the dropdown arrow next to **Show advanced options**.
1. Select the **Select fields** field.
1. In the **Dynamic content** list, select one or more fields from your profile.
1. When you're done, select an area outside the **Dynamic content** list to close it.
1. Go to [Add an approval action](#add-an-approval-action).

---

## Add an approval action

Follow these steps to add an approval action to your flow.

# [New designer](#tab/new-designer)

1. Make sure you performed these procedures in this order:
   - [Create an automated cloud flow](#create-an-automated-cloud-flow)
   - [Configure the flow trigger](#configure-the-flow-trigger)
   - [Add a profile action](#add-a-profile-action)
1. In the designer below the **Get my profile (V2)** card, select **+**.
1. In the **Add an action** search field, type **approval**.
1. Under **Standard approvals**, select the **Start and wait for an approval** action.
    :::image type="content" source="media/modern-approvals/select-approvals-new-designer.png" alt-text="Screenshot showing how to select the approvals action in the new designer.":::

1. In the **Approval type** dropdown menu, select a value.

    You can also create your own by selecting **Enter custom value**.

1. In the **Title** field, enter a title for the approval request.
1. In the **Assigned to** field, enter the email address of the person who will approve the request.

     This action sends the approval request to the email address in the **Assigned to** field.

1. In the **Details** field, describe the vacation request. You can include information such as the start date and end date from the person who requested vacation.

    In this example, do the following steps:
    1. Select the **Details** field, and then select the lightning bolt icon.
    1. Select the value for the person who requested the vacation. This inserts the value in the **Details** field.
    1. In the **Details** field next to the value you just inserted, enter *wants to go on vacation from*.
    1. Select the lightning bolt icon, and then select the value for the start date of the vacation request.
    1. In the **Details** field next to the value you just inserted, enter *until*.
    1. Select the lightning bolt icon, and then select the value for the end date of the vacation request.

          The **Details** field should look similar to this example: `<requestor>` wants to go on vacation from `<start date>` until `<end date>`.

          (Optional) You can use [Markdown](approvals-markdown-support.md) to format the **Details** field.

    :::image type="content" source="media/modern-approvals/provide-approval-config-info-new-designer.png" alt-text="Screenshot showing how to configure the Start and wait for an approval card in the new designer.":::

1. Close the configuration pane by selecting (**<<**) in the upper-right corner of the pane.
1. Go to [Add an email action for approvals](#add-an-email-action-for-approvals).

# [Classic designer](#tab/classic-designer)

1. Make sure you performed these procedures in this order:
   - [Create an automated cloud flow](#create-an-automated-cloud-flow)
   - [Configure the flow trigger](#configure-the-flow-trigger)
   - [Add a profile action](#add-a-profile-action)
1. In the designer, select **New step**.
1. In the **Choose an operation** search field, type **approval**.
1. In the **Actions** list, select **Start and wait for an approval**.

    :::image type="content" source="media/modern-approvals/select-approvals.png" alt-text="Screenshot showing how to select the approvals action in the classic designer.":::

1. In the **Approval type** dropdown menu, select a value.

    You can also create your own by selecting **Enter custom value**.

1. In the **Title** field, enter a title for the approval request.
1. In the **Assigned to** field, enter the email address of the person who will approve the request.

     This action sends the approval request to the email address in the **Assigned to** field.

1. In the **Details** field, describe the vacation request. You can include information such as the start date and end date from the person who requested vacation.

    In this example, do the following steps:
    1. Select the **Details** field, and then select the lightning bolt icon.
    1. Select the value for the person who requested the vacation. This inserts the value in the **Details** field.
    1. In the **Details** field next to the value you just inserted, enter *wants to go on vacation from*.
    1. Select the lightning bolt icon, and then select the value for the start date of the vacation request.
    1. In the **Details** field next to the value you just inserted, enter *until*.
    1. Select the lightning bolt icon, and then select the value for the end date of the vacation request.

          The **Details** field should look similar to this example: `<requestor>` wants to go on vacation from `<start date>` until `<end date>`.

          (Optional) You can use [Markdown](approvals-markdown-support.md) to format the **Details** field.

    :::image type="content" source="media/modern-approvals/provide-approval-config-info.png" alt-text="Screenshot showing how to configure the Start and wait for an approval card in the classic designer.":::

1. Go to [Add an email action for approvals](#add-an-email-action-for-approvals).

---

## Add an email action for approvals

Follow these steps to send an email if the vacation request is approved.

# [New designer](#tab/new-designer)

1. Make sure you performed these procedures in this order:
   - [Create an automated cloud flow](#create-an-automated-cloud-flow)
   - [Configure the flow trigger](#configure-the-flow-trigger)
   - [Add a profile action](#add-a-profile-action)
   - [Add an approval action](#add-an-approval-action)
1. Under the **Start and wait for an approval** card, select the plus sign (**+**) to add the **Condition** action.
1. In the **Add an action** search field, type **condition**.
1. Under **Control**, select **Condition**.
1. In the **Parameters** tab, select the first **Choose a value** field, and then select the lightning bolt icon.
1. Select the **Responses Approver response** value.

    If the expected response doesn't appear, select **See more** in the title bar of the dropdown menu to display additional values.

1. In the next field, select **is equal to** from the dropdown menu.
1. In the other **Choose a value** field, type **Approve**.

    :::image type="content" source="media/modern-approvals/add-condition.png" alt-text="Screenshot showing how to add a condition in the new designer.":::

1. Close the configuration pane by selecting (**<<**) in the upper-right corner of the pane.
1. In the designer, select the plus sign in the **True** branch.
1. In the **Add an action** search field, type **send email**.
1. Under **Office 365 Outlook**, select **Send an email (V2)**.

    The **Parameters** tab displays. This is the template for the email sent when the status of the vacation request changes.

1. In the **To** field, enter the email address of the person who submitted the vacation request.
1. In the **Subject** field, type a subject for the email. This example uses *Your vacation request has been approved* as the subject.
1. In the **Body** field, type a message for the email:
    1. Type the standard text you want to appear in the email, such as *Your vacation request has been approved by*.
    1. To insert the name of the person who approved the vacation request:
        1. Place your cursor in the **Body** field at the location where you want the name to appear, and then select the lightning bolt icon.
        1. From the dropdown menu, select a dynamic value. The following example uses the **Responses Approver name** dynamic value.
    1. (Optional) To insert the comments from the approver:
        1. Type *Approver's comments*.
        1. Place your cursor in the **Body** field at the location where you want the comments to appear, and then select the lightning bolt icon.
        1. Select a dynamic value from the dropdown menu. The following example uses the **Responses comments** dynamic value.

        :::image type="content" source="media/modern-approvals/yes-email-config-new-designer.png" alt-text="Screenshot showing how to configure an email in the new designer.":::

1. Close the configuration pane by selecting (**<<**) in the upper-right corner of the pane.
1. Go to [Add an update action for approved requests](#add-an-update-action-for-approved-requests).

# [Classic designer](#tab/classic-designer)

1. Make sure you performed these procedures in this order:
   - [Create an automated cloud flow](#create-an-automated-cloud-flow)
   - [Configure the flow trigger](#configure-the-flow-trigger)
   - [Add a profile action](#add-a-profile-action)
   - [Add an approval action](#add-an-approval-action)

[!INCLUDE [add-action-to-send-email-when-vacation-approved](includes/add-action-to-send-email-when-vacation-approved.md)]

:::image type="content" source="media/modern-approvals/yes-email-config.png" alt-text="Screenshot showing email configuration for approved requests in the classic designer.":::

1. Go to [Add an update action for approved requests](#add-an-update-action-for-approved-requests).

---

## Add an update action for approved requests

Follow these steps to update actions for approved requests.

# [New designer](#tab/new-designer)

1. Make sure you performed these procedures:
   - [Create an automated cloud flow](#create-an-automated-cloud-flow)
   - [Configure the flow trigger](#configure-the-flow-trigger)
   - [Add a profile action](#add-a-profile-action)
   - [Add an approval action](#add-an-approval-action)
   - [Add an email action for approvals](#add-an-email-action-for-approvals)

1. In the **True** branch under the **Send an email (V2)** card, select **+**.
1. In the **Add an action** search field, enter **SharePoint update**.
1. Under **SharePoint**, select **Update item**.

    :::image type="content" source="media/modern-approvals/select-update-item-yes-new-designer.png" alt-text="Screenshot showing how to select the SharePoint update item action if true in the new designer.":::

1. Configure the **Update item** card to suit your needs.

    The **Site Address**, **List Name**, **Id**, and **Title** fields are required.

   :::image type="content" source="./media/modern-approvals/configure-update-item-new-designer.png" alt-text="Screenshot showing update item configuration in the new designer.":::

1. Close the configuration pane by selecting (**>>**) in the upper-right corner of the pane.
1. Go to [Add an email action for rejections](#add-an-email-action-for-rejections).

# [Classic designer](#tab/classic-designer)

1. Make sure you performed these procedures in this order:
   - [Create an automated cloud flow](#create-an-automated-cloud-flow)
   - [Configure the flow trigger](#configure-the-flow-trigger)
   - [Add a profile action](#add-a-profile-action)
   - [Add an approval action](#add-an-approval-action)
   - [Add an email action for approvals](#add-an-email-action-for-approvals)

[!INCLUDE [add-action-to-update-sharepoint-with-approval](includes/add-action-to-update-sharepoint-with-approval.md)]

   The **Site Address**, **List Name**, **Id**, and **Title** fields are required.

   :::image type="content" source="./media/modern-approvals/configure-update-item.png" alt-text="Screenshot showing update item configuration in the classic designer.":::

1. Go to [Add an email action for rejections](#add-an-email-action-for-rejections).

---

## Add an email action for rejections

Follow these steps to send an email if the vacation request is rejected.

# [New designer](#tab/new-designer)

1. Make sure you performed these procedures in this order:
   - [Create an automated cloud flow](#create-an-automated-cloud-flow)
   - [Configure the flow trigger](#configure-the-flow-trigger)
   - [Add a profile action](#add-a-profile-action)
   - [Add an approval action](#add-an-approval-action)
   - [Add an email action for approvals](#add-an-email-action-for-approvals)
   - [Add an update action for approved requests](#add-an-update-action-for-approved-requests)

[!INCLUDE [add-action-to-send-email-when-vacation-rejected](includes/add-action-to-send-email-when-vacation-rejected-new-designer.md)]

:::image type="content" source="media/modern-approvals/configure-rejected-email-new-designer.png" alt-text="Screenshot showing configuration for rejected request emails in the new designer.":::

1. Go to [Add update action for rejected requests](#add-update-action-for-rejected-requests).

# [Classic designer](#tab/classic-designer)

1. Make sure you performed these procedures in this order:
   - [Create an automated cloud flow](#create-an-automated-cloud-flow)
   - [Configure the flow trigger](#configure-the-flow-trigger)
   - [Add a profile action](#add-a-profile-action)
   - [Add an approval action](#add-an-approval-action)
   - [Add an email action for approvals](#add-an-email-action-for-approvals)
   - [Add an update action for approved requests](#add-an-update-action-for-approved-requests)

[!INCLUDE [add-action-to-send-email-when-vacation-rejected](includes/add-action-to-send-email-when-vacation-rejected.md)]

   :::image type="content" source="./media/modern-approvals/configure-rejected-email.png" alt-text="Screenshot showing configuration for rejected request emails in the classic designer.":::

1. Go to [Add update action for rejected requests](#add-update-action-for-rejected-requests).

---

## Add update action for rejected requests

Follow these steps to update actions for rejected requests.

# [New designer](#tab/new-designer)

1. Make sure you performed these procedures in this order:
   - [Create an automated cloud flow](#create-an-automated-cloud-flow)
   - [Configure the flow trigger](#configure-the-flow-trigger)
   - [Add a profile action](#add-a-profile-action)
   - [Add an approval action](#add-an-approval-action)
   - [Add an email action for approvals](#add-an-email-action-for-approvals)
   - [Add an update action for approved requests](#add-an-update-action-for-approved-requests)
   - [Add an email action for rejections](#add-an-email-action-for-rejections)

[!INCLUDE [add-action-to-update-sharepoint-with-rejection](includes/add-action-to-update-sharepoint-with-rejection-new-designer.md)]

   The **Site Address**, **List Name**, **Id**, and **Title** fields are required.

  :::image type="content" source="./media/modern-approvals/configure-update-item-no-new-designer.png" alt-text="Screenshot showing update item configuration for rejected requests in the new designer.":::

4. Select **Save** to save your work.

   If you followed along, your flow should resemble this screenshot:

   :::image type="content" source="./media/modern-approvals/completed-flow-new-designer.png" alt-text="Screenshot showing the completed flow in the new designer.":::

1. Now that you created the flow, it's time to test it. Go to [Test your flow that requests an approval](#test-your-flow-that-requests-an-approval).

# [Classic designer](#tab/classic-designer)

1. Make sure you performed these procedures in this order:
   - [Create an automated cloud flow](#create-an-automated-cloud-flow)
   - [Configure the flow trigger](#configure-the-flow-trigger)
   - [Add a profile action](#add-a-profile-action)
   - [Add an approval action](#add-an-approval-action)
   - [Add an email action for approvals](#add-an-email-action-for-approvals)
   - [Add an update action for approved requests](#add-an-update-action-for-approved-requests)
   - [Add an email action for rejections](#add-an-email-action-for-rejections)

[!INCLUDE [add-action-to-update-sharepoint-with-rejection](includes/add-action-to-update-sharepoint-with-rejection.md)]

   The **Site Address**, **List Name**, **Id**, and **Title** fields are required.

   :::image type="content" source="./media/modern-approvals/configure-update-item-no.png" alt-text="Screenshot showing update item configuration for rejected requests in the classic designer.":::

4. Select **Save** to save your work.

   If you followed along, your flow should resemble this screenshot:

   :::image type="content" source="./media/modern-approvals/completed-flow.png" alt-text="Screenshot showing the completed flow in the classic designer.":::

1. Now that you created the flow, it's time to test it. Go to [Test your flow that requests an approval](#test-your-flow-that-requests-an-approval).

---

## Test your flow that requests an approval

After you complete the sections in this tutorial, you created a flow that requests an approval for a vacation request. Now you can test your flow to make sure it works as expected.

[!INCLUDE [request-vacation-approval](includes/request-vacation-approval.md)]

Congratulations! You created a flow that requests an approval for a vacation request and tested it. You can now use this flow to manage vacation requests in your organization.

## Create long-running approvals

If your flow might run for more than 30 days, store your approvals in Microsoft Dataverse. This lets you create flows that act on responses to approval requests, even after the original flow run times out.

To do this, use two flows, one to send an approval request, and the other to run business logic on the responses to the approval request, based on the **Create an approval (v2)** action.

> [!TIP]
> If you use modern email clients, you don't need to wonder if a request is still required because Power Automate automatically updates the email to indicate that the approval request is completed.

## Cancel an approval request

Sometimes you might want to cancel an approval request that you sent. Possibly you made a mistake in the request, or it's no longer relevant. The person who sent the request can cancel it by following these steps.

The cancel feature is supported on the **Create an approval (v2)** action.

1. On the navigation pane to the left, select **Approvals**.
1. In the **Sent** tab, find and select your approval request.
1. At the top of the page, select **Cancel**.

    You might be prompted to confirm that you want to cancel the request.

> [!TIP]
> You can select the **History** tab to view the approval requests that you canceled.

## Request approvals from guest users

You can send approvals requests to persons outside your organization. To do this, use Microsoft Entra guest users by [inviting users from other tenants as guests](/azure/active-directory/b2b/add-user-without-invite).

When you assign a role to a guest, this gives the guest the permission required to participate in the approval process.

Now that you created and tested your flow, be sure to let others know how to use it.

## Related information

- [Manage approval requests](approve-reject-requests.md)
- [Manage sequential approvals](sequential-modern-approvals.md)
- [Create parallel approval workflows](parallel-modern-approvals.md)
- Install the Power Automate mobile app for [Android](https://aka.ms/flowmobiledocsandroid) or [iOS](https://aka.ms/flowmobiledocsios)
- [Training: Build approval flows with Power Automate (module)](/training/modules/build-approval-flows/)
- [Training: Automate an approval process in Power Automate (module)](/training/modules/approvals-power-automate/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
