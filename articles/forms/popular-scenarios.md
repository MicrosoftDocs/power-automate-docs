---
title: Top Forms scenarios | Microsoft Docs
description: Popular scenarios using forms in flows-Get response details, when a new response is submitted.
services: ''
suite: flow
documentationcenter: na
author: Dean-Haas
manager: kvivek
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/09/2020
ms.author: napienko
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Top scenarios

Here are some of the top scenarios in which you can use Power Automate with forms:

- Send an email when there is a new form response.
- Send an email to the form responder after they submit a response.
- Send an approval with contents of the form.
- Upload Microsoft Forms responses to Excel.
- Get an attachment from a form and send an email with the attachment.

## Send an email when there is a new form response

Although you can enable a notification to “Get email notification of each response” within the Microsoft Form settings, you can create a customized email notification with Power Automate.

First, add the [When a response is submitted](/connectors/microsoftforms.md/#triggers) trigger.

If your form is only for people in your organization, that means that the form is automatically recording the responder’s email and you need to use the 'Apply to Each' control. This demo will demonstrate this scenario and require you to choose “List of response notifications Response Id.” However, if your form is public and anyone with the link can respond, you will need to ask for their email as a response in the form and you will not need to add the 'Apply to Each' control.

   > [!div class="mx-imgBorder"]
   > ![Settings screen.](..\media\forms\only-people-in-my-org-setting.png "Screen showing who can fill out this form")

Then, add the [Get response details](/connectors/microsoftforms/#actions) action. Select **Response Id** to view the dynamic content. Select the Response Id option, which means that you’ll get the response details for the responses that caused the trigger. After that, choose the [Send an email (V2)](/connectors/office365/#send-an-email-(v2)) action. Within the action card, click on Add dynamic content so that you can use the forms responses in your email.



## Send an email to the form responder after they submit a response

Although you can enable a notification to [Send email receipt to respondents](https://support.microsoft.com/office/send-an-email-receipt-of-responses-951f29b7-dbd8-446b-8ebe-b924cc620bb20) within the Microsoft Form settings, you can create a customized email notification with Power Automate.
This is similar to top scenario #1, except the [Send an email (V2)](/connectors/office365/) action is now being sent to the responder.

## Send an approval with contents of the form

Create an approval with dynamic content from the form. In this example, the content will be the feedback, which is denoted by the question “What can we improve about our product?”

After adding the Microsoft Forms trigger and action, the third step is to add the [Start and wait for an approval](/modern-approvals#add-an-approval-action.md) action.

   > [!div class="mx-imgBorder"]
   > ![Start and wait for approval flow screen.](..\media\forms\flow-start-and-wait-for-approval.png "Screen showing the completed flow to start and wait for an approval")

You can view more examples with approvals in the [documentation](/sequential-modern-approvals.md).

## Upload Microsoft Forms responses to Excel

Create a new Excel Online sheet and add a table to the sheet. Learn more about tables in the [Excel documentation](https://support.microsoft.com/en-us/office/overview-of-excel-tables-7ab0bb7d-3a9e-4b56-a3c9-6c94334e492c).

   > [!div class="mx-imgBorder"]
   > ![Excel screen.](..\media\forms\excel.png "Screen showing a blank excel table with the example columns")

   > [!div class="mx-imgBorder"]
   > ![Excel flow screen.](..\media\forms\excel-flow.png "Screen showing the completed Excel flow")

You can also add an approval to approve a response before it enters the Excel sheet. The [Approve a Microsoft Forms response to add a row to an Excel spreadsheet](https://preview.flow.microsoft.com/galleries/public/templates/66f56b919fd64aeabec37245ed927c47/approve-a-microsoft-forms-response-to-add-a-row-to-an-excel-spreadsheet/) template can help you do this!

## Get an attachment from a form and send it in an email message

Ensure that you’ve added a section in your form for the responder to upload their file.
   > [!div class="mx-imgBorder"]
   > ![Forms upload section.](..\media\forms\forms-upload.png "Screen showing the forms upload section")

After adding the Forms trigger and action, add the Parse JSON action. We recommend running the flow before adding this action to generate the JSON schema from a sample.
   > [!div class="mx-imgBorder"]
   > ![Parse JSON action.](..\media\forms\flow-parse-json.png "Add the Parse JSON action")

Once you’ve pasted the full sample, you can [Get file content using path](/connectors/onedrive/#get-file-content-using-path) from OneDrive and find your Microsoft Form. Then, add a ‘/’ followed by the following expression: **first(body('Parse_JSON'))?['id']**. This would extract the one file that the responder will be uploading. 
   > [!div class="mx-imgBorder"]
   > ![Create share link.](..\media\forms\create-share-link.png "'Create share link' tile in Power Automate")

Finally, you can send that upload to via email using the [Send an email (V2)](/connectors/office365/#send-an-email-(v2)) action card from Office 365 Outlook. Include the expression **first(body('Parse_JSON'))?['id']**
 
You can combine the scenario of getting an attachment from a form and creating an approval flow by exploring a blog post here.


[!INCLUDE[footer-include](../includes/footer-banner.md)]
