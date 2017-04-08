<properties
    pageTitle="SharePoint Approvals. | Microsoft Flow"
    description="SharePoint Approvals."
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
   ms.date="04/17/2017"
   ms.author="deonhe"/>

# Manage approvals with Microsoft Flow

## Overview

You can create a flow that integrates with SharePoint and manages the approval of documents or processes. For example, a document approval flow can be created to approve or reject invoices, work orders or sales quotations. You can create a process approval flow to approve or reject vacation time for an employee, a request to work overtime or for travel plans.

## Prerequisites

- Access to [Microsoft Flow](https://flow.microsoft.com).

- Access to SharePoint Online. You'll need to create a list in SharePoint.

- Access to Office 365 email and Office 365 Users account.

## Create an approval flow

In this walk-through, we'll create a flow that defines a vacation request-approval workflow. This type of workflow is typically used in organizations to approve employee vacations. Each vacation request is sent to a SharePoint list. The flow monitors the SharePoint list and sends an approval request to a group or user whenever a new item appears in the list. After the group or user makes a decision, the flow sends an email to the person who requested vacation. Finally, the flow updates the SharePoint list with the approval decision and any comments from the decision-maker.

This diagram shows the details of the flow we'll create in this walk-through:

   ![](./media/sharepoint-approvals/create-flow-overview.png)

Before we start creating the flow, create a SharePoint online list; this list will be used to request approval for vacations. The list must include the following fields:

   ![](./media/sharepoint-approvals/sharepoint-list-fields.png)

Make a note of the name of the list and its url. You will need these items later when you test your flow.

1. Sign into [Microsoft Flow](https://flow.microsoft.com):

     ![sign in](./media/sharepoint-approvals/sign-in.png)

1. Select the **My flows** tab, and then create a flow from a blank:

     ![create from blank](./media/sharepoint-approvals/blank-template.png)

1. Enter **Sharepoint** into the search box.

     ![](./media/sharepoint-approvals/search-for-sharepoint.png)

1. Find, and then select **SharePoint - When a new item is created**.

     ![](./media/sharepoint-approvals/select-sharepoint-new-item.png)

1. Select the **Site Address** and the **List Name** for the list that your flow monitors for new items.

     ![](./media/sharepoint-approvals/select-sharepoint-site-info.png)

1. Select **New step**, and then select **Add an action**.

     ![](./media/sharepoint-approvals/select-sharepoint-add-action.png)

1. Enter **profile** into the **Choose an action** search box.

     ![](./media/sharepoint-approvals/search-for-profile.png)

1. Select the **Office 365 Users - Get my profile** action.

     ![](./media/sharepoint-approvals/select-my-profile.png)

### Add an approval action

1. Select **New step**, and then select **Add an action**.

     ![](./media/sharepoint-approvals/select-profile-add-action.png)

1. Enter **approval** into the **Choose an action** search box.

     ![](./media/sharepoint-approvals/search-approvals.png)

1. Select the **Approvals - Start an approval** action.

     ![](./media/sharepoint-approvals/select-approvals.png)

1. Configure the **Start an approval** card to suit your needs.

     Note: **Title** and **Assigned To** are required.

     ![](./media/sharepoint-approvals/provide-approval-config-info.png)

### Add a condition

1. Select **New step**, and then select **Add a condition**.

     ![](./media/sharepoint-approvals/add-response-condition.png)

1. Select the **Object Name** box, and then enter **response** into the search box on the **Add dynamic content from the apps and services used in this flow** card.

1. Select the **Response** token.

     ![](./media/sharepoint-approvals/search-for-response.png)

1. Select the **Value** box, and then enter **Approved** into the search box on the **Add dynamic content from the apps and services used in this flow** card.

     ![](./media/sharepoint-approvals/search-for-approved.png)

1. Your condition card should now resemble this image:

     ![](./media/sharepoint-approvals/response-condition-test.png)

## Add an email action

1. Select **Add an action** on the **IF YES, DO NOTHING** branch of the condition.

     ![](./media/sharepoint-approvals/add-action-after-condition.png)

1. Enter **send email** into the search box on the **Choose an action** card.

     ![](./media/sharepoint-approvals/search-send-email-yes.png)

1. Select the **Office 365 - Send an email** action.

     ![](./media/sharepoint-approvals/select-send-email-yes.png)

1. Configure the **Send an email** card to suit your needs.

     Note: **To**, **Subject**, and **Body** are required.

### Add an update action

1. Select **Add an action**.

     ![](./media/sharepoint-approvals/configure-approved-email.png)

1. Enter **update** into the search box on the **Choose an action** card.

     ![](./media/sharepoint-approvals/search-update-item.png)

1. Select **SharePoint - Update item**.

     ![](./media/sharepoint-approvals/select-update-item.png)

1. Configure the **Update item** card to suit your needs.

     Note: **Site Address**, **List Name**, **Id**, and **Title** are required.

     ![](./media/sharepoint-approvals/configure-update-item.png)

1. Provide a name for your flow, and then select **Create flow** to save the work we've done so far.

     ![](./media/sharepoint-approvals/save.png)

1. Select **Edit flow**.

     ![](./media/sharepoint-approvals/edit-flow.png)

### Add an email action

1. Select **Add an action** on the **IF NO, DO NOTHING** branch of the condition.

1. Enter **Send email** into the search box of the **Choose an action** card.

     ![](./media/sharepoint-approvals/search-send-email-no.png)

1. Select the **Office 365 - Send an email** action.

     ![](./media/sharepoint-approvals/select-send-email-no.png)

1. Configure the **Send an email 2** card to suit your needs.

     Note: **To**, **Subject**, and **Body** are required.

     ![](./media/sharepoint-approvals/configure-rejected-email.png)

### Add an update action

1. Select **Add an action**.

     ![](./media/sharepoint-approvals/add-update-item-action.png)

1. Enter **update item** into the search box on the **Choose an action** card.

     ![](./media/sharepoint-approvals/search-update-item-rejected.png)

1. Select **SharePoint - Update item**.

     ![](./media/sharepoint-approvals/select-update-item-no.png)

1. Configure the **Update item 2** card to suit your needs.

     Note: **Site Address**, **List Name**, **Id**, and **Title** are required.

     ![](./media/sharepoint-approvals/configure-update-item-no.png)

1. Select **Update flow** to save the work we've done.

     ![](./media/sharepoint-approvals/save.png)

If you've followed along, your flow should look similar to the screenshot:

![](./media/sharepoint-approvals/completed-flow.png)

## Request an approval

You can request an approval from a SharePoint document library or a SharePoint document list by following these steps:

1. Select the document from the **Flow and approvals** list.

     ![](./media/sharepoint-approvals/1.png)

1. Select **Get started** from the **Flow and approvals** list.

     ![](./media/sharepoint-approvals/1.png)

1. Select **Send for approval**:

     You need to accept the terms and conditions if you haven't done so previously. To do so, select the **Accept** button on the **APPROVAL MADE EASY** page.

     ![](./media/sharepoint-approvals/1.png)

1. Provide the name, email address, or group alias for the approver whom you want to approve the request.

     ![](./media/sharepoint-approvals/1.png)

1. Optionally, provide a message for the approver.

     ![](./media/sharepoint-approvals/1.png)

1. Select the **Send for approval** button.

     ![](./media/sharepoint-approvals/1.png)

1. Confirm that the **Approval status** for the document now shows **Awaiting approval**.

     ![](./media/sharepoint-approvals/1.png)

## View pending approval requests

1. Sign into [Microsoft Flow](https://flow.microsoft.com):

     ![sign in](./media/sharepoint-approvals/sign-in.png)

1. Select the **Approvals** tab:

     ![create from blank](./media/sharepoint-approvals/blank-template.png)

1. Select the **Received requests** tab:

     ![create from blank](./media/sharepoint-approvals/blank-template.png)


## Approve a request

If you're the approver in a flow, you'll receive an email or a push notification whenever an approval request is sent to you. The approval request is also sent to the approvals center. You can approve or reject the request from within the email, push notification, or approvals center. The push notification and email show a subset of the approval request's details. Select the link within the push notification or email to launch the approvals center where you can view all details about the approval request.

To approve a request:

### From email or push notification

1. Select the **Approve** button.

     ![](./media/sharepoint-approvals/1.png)

### From the approvals center

1. Select the **Approve** button

![](./media/sharepoint-approvals/1.png)

## Reject a request

1. Select the **Reject** button, and optionally provide a reason why you are rejecting the request.

     ![](./media/sharepoint-approvals/1.png)

## More information



