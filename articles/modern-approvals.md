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
ms.date: 05/08/2025
search.audienceType: 
  - flowmaker
  - enduser
---
# Create and test an approval workflow with Power Automate

With Power Automate, you can manage the approval of documents or processes across several services, including SharePoint, Dynamics 365, Salesforce, OneDrive for work or school, Zendesk, or WordPress.

To create an approval workflow, add the **Approvals - Start and wait for an approval** action to any flow. After you add this action, your flow can manage the approval of documents or processes. For example, you can create document approval flows that approve invoices, work orders, or sales quotations. You can also create process approval flows that approve vacation requests, overtime work, or travel plans.

Approvers can respond to requests from their email inbox, the approvals center in [Power Automate](https://make.powerautomate.com), or the Power Automate app.

## Create an approval flow

Here's an overview of the flow you create and test:

   :::image type="content" source="./media/modern-approvals/create-flow-overview.png" alt-text="Screenshot of an approval flow overview."::: 

The flow performs the following steps:

1. Starts when someone creates a vacation request in a SharePoint Online list.

1. Adds the vacation request to the approval center, and then emails it to the approver.

1. Sends an email with the approver's decision to the person who requested vacation.

1. Updates the SharePoint Online list with the approver's decision comments.

[!INCLUDE [sharepoint-detailed-docs](includes/sharepoint-detailed-docs.md)]

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

Make note of the name and URL of the SharePoint Online list. You need these items later when you configure the **SharePoint - When an item is created** trigger.

## Create an automated cloud flow

Follow these steps to create an automated cloud flow:

[!INCLUDE [sign-in-and-create-flow-from-blank-template](includes/sign-in-and-create-flow-from-blank-template.md)]

## Add a trigger

Follow these steps to add a trigger to your flow:

# [New designer](#tab/new-designer)

[!INCLUDE [add-trigger-when-sharepoint-item-created](includes/add-trigger-when-sharepoint-item-created.md)]

&nbsp;&nbsp;&nbsp;The **Site Address** and the **List Name** are the items you noted earlier in this walkthrough.

&nbsp;&nbsp;&nbsp;:::image type="content" source="./media/modern-approvals/select-sharepoint-site-info-new-designer.png" alt-text="Screenshot showing SharePoint site information selection in the new designer.":::

# [Classic designer](#tab/classic-designer)

[!INCLUDE [add-trigger-when-sharepoint-item-created](includes/add-trigger-when-sharepoint-item-created.md)]

   The **Site Address** and the **List Name** are the items you noted earlier in this walkthrough.

   :::image type="content" source="./media/modern-approvals/select-sharepoint-site-info.png" alt-text="Screenshot showing SharePoint site information selection in the classic designer.":::

---

## Add a profile action

Follow these steps to add a profile action to your flow. This action retrieves the user's profile information, which you can use in the approval request:

# [New designer](#tab/new-designer)

1. Select **+**, and then type **Profile** into the **Add an action** search box.

1. In **Office 365 Users**, select **Get my profile (V2)**.

    :::image type="content" source="./media/modern-approvals/search-for-profile-new-designer.png" alt-text="Screenshot showing how to search for profile action in the new designer.":::

1. Select the fields from your profile to include in your flow, and then select **Create**.

# [Classic designer](#tab/classic-designer)

1. Select **New step**, and then type **profile** into the **Choose an action** search box.

1. Select **Office 365 Users**.

1. Find, and then select the **Get my profile (V2)** action.

    :::image type="content" source="./media/modern-approvals/search-for-profile.png" alt-text="Screenshot showing how to search for profile action in the classic designer.":::

1. Select the fields from your profile to include in your flow, and then select **Create** to save your work.

---

## Add an approval action

Follow these steps to add an approval action to your flow:

# [New designer](#tab/new-designer)

[!INCLUDE [add-an-approval-action](includes/add-an-approval-action-new-designer.md)]

# [Classic designer](#tab/classic-designer)

[!INCLUDE [add-an-approval-action](includes/add-an-approval-action.md)]

---

> [!NOTE]
> This action sends the approval request to the email address in the **Assigned To** box.
>
> If your scenario requires it, you can attach files to your approval requests that use Microsoft Dataverse.

## Add an email action for approvals

Follow these steps to send an email if the vacation request is approved:

# [New designer](#tab/new-designer)

[!INCLUDE [add-action-to-send-email-when-vacation-approved](includes/add-action-to-send-email-when-vacation-approved-new-designer.md)]

   :::image type="content" source="./media/modern-approvals/yes-email-config-new-designer.png" alt-text="Screenshot showing email configuration for approved requests in the new designer.":::

# [Classic designer](#tab/classic-designer)

[!INCLUDE [add-action-to-send-email-when-vacation-approved](includes/add-action-to-send-email-when-vacation-approved.md)]

   :::image type="content" source="./media/modern-approvals/yes-email-config.png" alt-text="Screenshot showing email configuration for approved requests in the classic designer.":::

---

## Add an update action for approved requests

Follow these steps to update actions for approved requests:

# [New designer](#tab/new-designer)

[!INCLUDE [add-action-to-update-sharepoint-with-approval](includes/add-action-to-update-sharepoint-with-approval-new-designer.md)]

   > [!NOTE]
   > **Site Address**, **List Name**, **Id**, and **Title** are required.

   :::image type="content" source="./media/modern-approvals/configure-update-item-new-designer.png" alt-text="Screenshot showing update item configuration in the new designer.":::

# [Classic designer](#tab/classic-designer)

[!INCLUDE [add-action-to-update-sharepoint-with-approval](includes/add-action-to-update-sharepoint-with-approval.md)]

   > [!NOTE]
   > **Site Address**, **List Name**, **Id**, and **Title** are required.

   :::image type="content" source="./media/modern-approvals/configure-update-item.png" alt-text="Screenshot showing update item configuration in the classic designer.":::

---

## Add an email action for rejections

Follow these steps to send an email if the vacation request is rejected:

# [New designer](#tab/new-designer)

[!INCLUDE [add-action-to-send-email-when-vacation-rejected](includes/add-action-to-send-email-when-vacation-rejected-new-designer.md)]

   :::image type="content" source="./media/modern-approvals/configure-rejected-email-new-designer.png" alt-text="Screenshot showing configuration for rejected request emails in the new designer.":::

# [Classic designer](#tab/classic-designer)

[!INCLUDE [add-action-to-send-email-when-vacation-rejected](includes/add-action-to-send-email-when-vacation-rejected.md)]

   :::image type="content" source="./media/modern-approvals/configure-rejected-email.png" alt-text="Screenshot showing configuration for rejected request emails in the classic designer.":::

---

## Add update action for rejected requests

Follow these steps to update actions for rejected requests:

# [New designer](#tab/new-designer)

[!INCLUDE [add-action-to-update-sharepoint-with-rejection](includes/add-action-to-update-sharepoint-with-rejection-new-designer.md)]

  > [!NOTE]
  > **Site Address**, **List Name**, **Id**, and **Title** are required.

  :::image type="content" source="./media/modern-approvals/configure-update-item-no-new-designer.png" alt-text="Screenshot showing update item configuration for rejected requests in the new designer.":::

4. Select **Save** to save your work.

   If you followed along, your flow should resemble this screenshot:

   :::image type="content" source="./media/modern-approvals/completed-flow-new-designer.png" alt-text="Screenshot showing the completed flow in the new designer.":::

   Now that you created the flow, it's time to test it!


# [Classic designer](#tab/classic-designer)

[!INCLUDE [add-action-to-update-sharepoint-with-rejection](includes/add-action-to-update-sharepoint-with-rejection.md)]

   > [!NOTE]
   > **Site Address**, **List Name**, **Id**, and **Title** are required.

   :::image type="content" source="./media/modern-approvals/configure-update-item-no.png" alt-text="Screenshot showing update item configuration for rejected requests in the classic designer.":::

4. Select **Save** to save your work.

   If you followed along, your flow should resemble this screenshot:

   :::image type="content" source="./media/modern-approvals/completed-flow.png" alt-text="Screenshot showing the completed flow in the classic designer.":::

   Now that you created the flow, it's time to test it!

---

## Request an approval to test your flow

[!INCLUDE [request-vacation-approval](includes/request-vacation-approval.md)]

## Create long-running approvals

If your flow might run for more than 30 days, store your approvals in Microsoft Dataverse. This lets you create flows that act on responses to approval requests, even after the original flow run times out.

To do this, use two flows, one to send an approval request, and the other to run business logic on the responses to the approval request, based on the **Create an approval (v2)** action. Learn more about [long running approvals](/business-applications-release-notes/april19/microsoft-flow/increased-run-duration).

> [!TIP]
> If you use modern email clients, you don't have to wonder if a request is still required because Power Automate automatically updates the email to indicate that the approval request is completed.

## Cancel an approval request

Sometimes you might want to cancel an approval request that you sent. Possibly you made a mistake in the request, or it’s no longer relevant. In either case, the person who sent the request can cancel it by following these steps:

1. Select the approval
1. Select **Cancel approval** in the side pane.

> [!TIP]
> You can always select the **History** tab to view the approval requests that you canceled.

> [!NOTE]
> The cancel feature is supported on the **Create an approval (v2)** action.

## Request approvals from guest users

You can send approvals requests to persons outside your organization. To do this, use Microsoft Entra guest users by [inviting users from other tenants as guests](/azure/active-directory/b2b/add-user-without-invite).

When you assign a role to a guest, this gives the guest the permission required to participate in the approval process.

Now that you created and tested your flow, be sure to let others know how to use it.

## Related information

- View and manage [pending approval requests](approve-reject-requests.md)
- Create [sequential approval flows.](sequential-modern-approvals.md)
- Create [parallel approval flows.](parallel-modern-approvals.md)
- Install the Power Automate mobile app for [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows)
- [Training: Build approval flows with Power Automate (module)](/training/modules/build-approval-flows/)
- [Training: Automate an approval process in Power Automate (module)](/training/modules/approvals-power-automate/)


[!INCLUDE[footer-include](includes/footer-banner.md)]