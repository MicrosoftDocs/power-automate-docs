<properties
    pageTitle="Automate approval workflows. | Microsoft Flow"
    description="Automate approval workflows that integrate with SharePoint, Dynamics CRM, Salesforce, One Drive for Business, Zendesk, or WordPress."
    services=""
    suite="flow"
    documentationCenter="na"
    authors="msftman"
    manager="anneta"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="06/15/2017"
   ms.author="deonhe"/>

# Manage approvals with Microsoft Flow

Add the Microsoft Flow **Approvals - Start an approval** action to flows to manage the approval of documents or processes. These flows can leverage several services, including SharePoint, Dynamics CRM, Salesforce, One Drive for Business, Zendesk, or WordPress.

For example, you can create a document approval flow that approves or rejects invoices, work orders, or sales quotations. You can also create a process approval flow that approves or rejects vacation requests, overtime work, or travel plans.

Approvers can manage requests from their email inbox, the approvals center on the Microsoft Flow website, or the Microsoft Flow app.

## Create an approval flow

In this walk-through, we'll create a flow that performs the following steps:

1. Starts when a vacation request is created in a SharePoint Online list.

1. Adds the vacation request to the approval center, and then emails the request to the approver.

1. Sends an email to the person who requested vacation, after the approver makes a decision.

1. Updates the SharePoint Online list with the decision, and any comments from the approver.

This diagram shows the details of the flow we'll create:

   ![](./media/modern-approvals/create-flow-overview.png)

## Prerequisites

To complete this walk-through, you must have access to:

[!INCLUDE [INCLUDEDCONTENT](../includes/prerequisites-for-modern-approvals.md)]

   ![](./media/modern-approvals/sharepoint-list-fields.png)

Make note of the name and URL of the SharePoint Online list. You'll need these items later when you configure the **SharePoint - When a new item is created** trigger.

### Create your flow from the blank template

[!INCLUDE [INCLUDEDCONTENT](../includes/sign-in-and-create-flow-from-blank-template.md)]

### Add a trigger

[!INCLUDE [INCLUDEDCONTENT](../includes/add-trigger-when-sharepoint-item-created.md)]

     The **Site Address** and the **List Name** are the items you noted earlier in this walk-through.

     ![sharepoint info](./media/modern-approvals/select-sharepoint-site-info.png)

### Add a profile action

1. Select **New step**, and then select **Add an action**.

     ![new step](./media/modern-approvals/select-sharepoint-add-action.png)

1. Enter **profile** into the **Choose an action** search box.

     ![search for profile](./media/modern-approvals/search-for-profile.png)

1. Find, and then select the **Office 365 Users - Get my profile** action.

     ![select office users](./media/modern-approvals/select-my-profile.png)

1. Provide a name for your flow, and then select **Create flow** to save the work we've done so far.

     ![save flow](./media/modern-approvals/save.png)

### Add an approval action

[!INCLUDE [INCLUDEDCONTENT](../includes/add-an-approval-action.md)]

Note: This action sends the approval request to the email address in the **Assigned To** box.

### Add a condition

[!INCLUDE [INCLUDEDCONTENT](../includes/add-approval-condition-response.md)]

### Add an email action for approvals

Follow these steps to send an email if the vacation request is approved:

[!INCLUDE [INCLUDEDCONTENT](../includes/add-action-to-send-email-when-vacation-approved.md)]

<!--check pic-->
   ![configure approved email template](./media/sequential-modern-approvals/yes-email-config.png)

### Add an update action for approved requests

[!INCLUDE [INCLUDEDCONTENT](../includes/add-action-to-update-sharepoint-with-approval.md)]

     Note: **Site Address**, **List Name**, **Id**, and **Title** are required.

<!--check pic-->

   ![update item configuration](./media/modern-approvals/configure-update-item.png)

### Add an email action for rejections

[!INCLUDE [INCLUDEDCONTENT](../includes/add-action-to-send-email-when-vacation-rejected.md)]

<!--check pic-->
   ![configuration for rejected requests](./media/modern-approvals/configure-rejected-email.png)

### Add update action for rejected requests

[!INCLUDE [INCLUDEDCONTENT](../includes/add-action-to-update-sharepoint-with-rejection.md)]

   Note: **Site Address**, **List Name**, **Id**, and **Title** are required.

   <!-- check pic  -->

   ![update item card](./media/modern-approvals/configure-update-item-no.png)

1. Select **Update flow** to save the work we've done.

     ![select update action](./media/modern-approvals/update.png)

If you've followed along, your flow should resemble this screenshot:

![overview of flow](./media/modern-approvals/completed-flow.png)

Now that we've created the flow, it's time to test it!

## Request an approval

[!INCLUDE [INCLUDEDCONTENT](../includes/request-vacation-approval.md)]

## View pending approval requests

[!INCLUDE [INCLUDEDCONTENT](../includes/view-pending-approvals.md)]

## Approve a request

[!INCLUDE [INCLUDEDCONTENT](../includes/approve-request-from-different-locations.md)]

## Reject a request

[!INCLUDE [INCLUDEDCONTENT](../includes/reject-a-request.md)]
