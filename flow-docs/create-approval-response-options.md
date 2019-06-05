---
title: Create approval flows with custom responses | Microsoft Docs
description: Create approval flows with custom responses.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/04/2019
ms.author: deonhe
search.app: 
  - Flow
  - Powerplatform
search.audienceType: 
  - maker
---

# Create custom response options for approval flows

Let’s say you want to send an approval request each time an employee uploads an expense report to SharePoint and then allow the approver to respond with one of three options: Accept, Need more info, or Reject.


## Prerequisites

- A Microsoft Flow account with a Plan 1 license (Plan 1 is needed to use premium connectors. Approvals is a premium connector.)
- A SharePoint list for employees to enter their expense reports.

## Create approval flow
1. Sign in to [Microsoft Flow](https://flow.microsoft.com).
1. Select **My flows** from the left navigation bar.
1. Select **New** > **Create from blank**.

    ![Create from blank option](media/create-approval-response-options/create-approval-response-options.png)

1. On the screen that opens, select **Create from blank**. 

    ![Select Create from blank](media/create-approval-response-options/create-from-blank.png)

1. Search for **sharepoint** and then select **When an item is created** from the list of triggers. 

1. Provide the SharePoint **Site Address** and **List Name**. 

1. Select **New step**, search for **Approval**, and then select **Start and wait for an approval (V2)**.

1. On the **Start and wait for an approval (V2)** card, select the **Approval type** list.

    ![Approval type](media/create-approval-response-options/select-approval-type.png)

1. Select **Custom Responses - Wait for one response (Premium)**.

    ![Custom responses](media/create-approval-response-options/select-custom-responses.png)

    Next, you will create the custom responses that your approvers will use when they respond to an approval request for an employee expense.


1. In the **Response options Item - 1** box, enter **Accept** and then select **Add new item**. 

    ![Custom response 1](media/create-approval-response-options/enter-response-1.png)

1. In the **Response options Item - 2** box, enter **Reject** and then select **Add new item**.

    ![Custom response 2](media/create-approval-response-options/enter-response-2.png)

1. In the **Response options Item - 3** box, enter **Need more info**.

    ![Custom response 3](media/create-approval-response-options/enter-response-3.png)   
    

1. Enter a **Title**, **Assigned to** (email for the approver), and **Details** (the details to be contained in the approval request).

    Here's an example of what you might include for your organization.

    ![Custom responses details](media/create-approval-response-options/enter-title-assigned-to-details.png)


Now that you've created your custom responses, you might want to do different things in your flow, depending on the response from the approver.


## Use approval responses 

If the response to the request is **Accept**, you might want to send an email to the accounting department, asking them to reimburse the employee for the expense. 

If the response is **Reject**, you might want to send an email to the employee, letting them know that the request was rejected.

And finally, if the response from the approver is **Need more info**, you might want to send an email to the employee, requesting the employee to provide more information.

To do any of these in the flow, add a [**Condition**](add-condition.md) or a **Switch** action to your flow, and then select the **Outcome** field of the approval request from the dynamic content picker. Be sure to confirm whether the value is Accept, Need more info, or Reject.

## Respond to approval requests with a custom response

Approvers receive approval requests in email. The requests are also displayed in the approval center on Microsoft Flow. 

![Approval request email](media/create-approval-response-options/approval-request-email.png)

## Learn more
- Create [single approver flows](modern-approvals.md)
- Create [sequential approver flows](sequential-modern-approvals.md)
