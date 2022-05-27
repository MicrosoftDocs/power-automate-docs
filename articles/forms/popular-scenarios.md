---
title: Common ways to use Microsoft Forms in Power Automate
description: Learn some of the most popular ways to use a form in an automated flow.
services: ''
suite: flow
documentationcenter: na
author: Dean-Haas
manager: kvivek
editor: ''
tags: ''
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/11/2022
ms.author: napienko
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Common ways to use a form in a flow

If you're not sure where to start, these are some of the most common ways people use Microsoft Forms with Power Automate:

- Send an email when there's a new form response
- Send an email to the form responder
- Send an approval request with the form details
- Add form responses to an Excel worksheet
- Get an attachment from a form and send it in an email

## Send an email when there's a new form response

You can turn on email notifications for the form's owners in your form settings. If you want someone else to be notified when a response is submitted, create a custom email notification with Power Automate.

We'll start with a pre-built template and customize it to help our managers plan for employees' summer vacations.

1. Search for "Microsoft Forms" in the [Power Automate template gallery](https://flow.microsoft.com/templates/) and select the template named "Notify me in Outlook when a student completes a quiz."

1. Sign in to the connectors, if needed, and select **Continue**.

1. In the first step in the flow, "When a new response is submitted," select your form in the **Form Id** box.

    :::image type="content" source="../media/forms/email-flow-step1.png" alt-text="Screenshot of a Forms trigger in a flow under construction, with the form ID highlighted.":::

1. In the next step in the flow, "Apply to each," select your form again in the **Form Id** box. Leave everything else as it is.

    :::image type="content" source="../media/forms/email-flow-step2.png" alt-text="Screenshot of a Forms action in a flow under construction, with the form ID highlighted.":::

1. Skip the Office 365 "[Get my profile (V2)](/connectors/office365/)" step. (If you don't need to send the email to yourself, you may delete this step.)

1. In the final step in the flow, "[Send an email](/connectors/office365/)," enter the recipients, subject, and body of the email. Select dynamic content to include details from the form response in your email.

    :::image type="content" source="../media/forms/email-flow-step3.png" alt-text="Screenshot of an Outlook send email action in a flow under construction, with custom information highlighted.":::

1. Select the flow name at the top of the Power Automate canvas and change it as you like.

1. Save and test your flow.

## Send an email to the form responder

You can turn on [email receipts for respondents](https://support.microsoft.com/office/send-an-email-receipt-of-responses-951f29b7-dbd8-446b-8ebe-b924cc620bb20) in your form settings. If you want to customize the email they receive, use Power Automate.

Follow the steps to [send an email when there's a new form response](#send-an-email-when-theres-a-new-form-response), but send the email to the responder.

:::image type="content" source="../media/forms/responder-email-flow.png" alt-text="Screenshot of an Outlook send email action in a flow under construction, with the responder's email address highlighted.":::

## Send an approval request with the form details

In this example, we'll start with another pre-built template and customize it to create a vacation approval request.

1. Search for "Microsoft Forms" in the [Power Automate template gallery](https://flow.microsoft.com/templates/) and select the template named "Send form responses for approval."

1. Sign in to or create the connectors, as needed, and select **Continue**.

1. In the first step in the flow, "When a new response is submitted," select your form in the **Form Id** box.

    :::image type="content" source="../media/forms/email-flow-step1.png" alt-text="Screenshot of a Forms trigger in a flow under construction, with the form ID highlighted.":::

1. In the next step in the flow, "Apply to each," select your form again in the **Form Id** box. Leave everything else as it is.

    :::image type="content" source="../media/forms/approval-flow-step2.png" alt-text="Screenshot of a Forms action in a flow under construction, with the form ID highlighted.":::

1. In the next step in the flow, "[Start and wait for an approval](/power-automate/modern-approvals#add-an-approval-action.md)," select the **Approval type**, enter a **Title**, and enter the approvers' email addresses in **Assigned to**. Select dynamic content to include details from the form response in the approval request.

    :::image type="content" source="../media/forms/approval-flow-step3.png" alt-text="Screenshot of an approval action in a flow under construction, with custom information highlighted.":::

1. Skip the "Condition" action.

1. In the "If yes" step:

    - Delete the SharePoint action that comes with the template.
    - Add an Office 365 Outlook "Send an email (V2)" action.
    - In the **To** box, select the dynamic content **Responders' Email**.
    - Enter the subject and body of the email.

    :::image type="content" source="../media/forms/approval-flow-step-yes.png" alt-text="Screenshot of a 'request approved' email in a flow under construction, with custom information highlighted.":::

1. In the "If no" step:

    - Delete the Office 365 "Get my profile (V2)" step that comes with the template.
    - In the "Send an email (V2)" action, in the **To** box, select the dynamic content **Responders' Email**.
    - Enter the subject and body of the email.

    :::image type="content" source="../media/forms/approval-flow-step-no.png" alt-text="Screenshot of a 'request denied' email in a flow under construction, with custom information highlighted.":::

1. Select the flow name at the top of the Power Automate canvas and change it as you like.

1. Save and test your flow.

More examples of approval flows are in the [documentation](../sequential-modern-approvals.md).

## Add form responses to an Excel worksheet

In this example, we'll create a flow from blank. Continuing with the scenario from our earlier examples, we'll use the flow to record employees' names and vacation dates in an Excel table when they submit their summer vacation form.

1. Create a workbook in Excel Online. Add a table with one column for each question on your form. Save and close the workbook.

    :::image type="content" source="../media/forms/excel-flow-table.png" alt-text="Screenshot of an Excel table with three columns titled Name, Vacation Start, and Return.":::

1. In Power Automate, create an automated cloud flow from blank. Select the Microsoft Forms "When a new response is submitted" trigger.

    :::image type="content" source="../media/forms/excel-flow-step1.png" alt-text="Screenshot of creating a cloud flow with a Microsoft Forms trigger.":::

1. In the first step in the flow, "When a new response is submitted," select your form in the **Form Id** box.

1. Add a step to your flow:

    - Search for "forms" and select **Microsoft Forms**.
    - Select **Get response details**.
    - Select your form in the **Form Id** box.

    :::image type="content" source="../media/forms/excel-flow-step2.png" alt-text="Screenshot of a Forms trigger and action in a flow under construction, with the form ID highlighted in each.":::

1. Add a step to your flow:

    - Search for "profile" and select **Office 365 Users**.
    - Select **Get user profile (V2)**.
    - In the **User (UPN)** box, select the dynamic content **Responders' Email**. This will look up the responder's name by the email address on the form.

    :::image type="content" source="../media/forms/excel-flow-step3.png" alt-text="Screenshot of an Office 365 Get user profile action in a flow under construction, with the dynamic content Responders' Email highlighted.":::

1. Add a step to your flow:

    - Search for "excel" and select **Excel Online (Business)**.
    - Select **Add a row into a table**.
    - Select the **Location** and **Document Library**.
    - Select the folder icon and browse to the Excel workbook you created earlier.
    - Select the **Table**.
    - In each column in the table, select the corresponding dynamic content.

    :::image type="content" source="../media/forms/excel-flow-step4.png" alt-text="Screenshot of an Excel Add row into a table action in a flow under construction, with dynamic content highlighted.":::

1. Select the flow name at the top of the Power Automate canvas and change it as you like.

1. Save and test your flow.

    :::image type="content" source="../media/forms/excel-flow-table-after.png" alt-text="Screenshot of an Excel table with Name, Vacation Start, and Return columns filled with form data.":::

You can use a template to [add an approval step before a form response is added to the Excel table](https://flow.microsoft.com/galleries/public/templates/66f56b919fd64aeabec37245ed927c47/approve-a-microsoft-forms-response-to-add-a-row-to-an-excel-spreadsheet/).

## Get an attachment from a form and send it in an email

In this example, we'll create another flow from blank. We'll use the flow to create a share link for a file that's uploaded on our summer vacation form, and then email the link.

:::image type="content" source="../media/forms/attachment-flow-form-upload.png" alt-text="Screenshot of a file upload option on a form.":::

### Select your form

1. In Power Automate, create an automated cloud flow from blank. Select the Microsoft Forms "When a new response is submitted" trigger.

    :::image type="content" source="../media/forms/attachment-flow-step1.png" alt-text="Screenshot of creating a cloud flow with a Microsoft Forms trigger.":::

1. In the first step in the flow, "When a new response is submitted," select your form in the **Form Id** box.

1. Add a step to your flow:

    - Search for "forms" and select **Microsoft Forms**.
    - Select **Get response details**.
    - Select your form in the **Form Id** box.

    :::image type="content" source="../media/forms/excel-flow-step2.png" alt-text="Screenshot of a Forms trigger and action in a flow under construction, with the form ID highlighted in each.":::

### Use a JSON schema to find the uploaded file

1. Save and test your flow. Be sure to upload a file to your form.

    We're not done yet! This step allows Power Automate to use the test run to generate a sample JSON schema for the uploaded file.

1. On your flow's information page, under **28-day run history**, select the test run.

    :::image type="content" source="../media/forms/attachment-flow-run-history.png" alt-text="Screenshot of a flow's run history with a test run highlighted.":::

1. Expand the "Get response details" step and copy the contents of the file upload output.

    :::image type="content" source="../media/forms/attachment-flow-run-outputs.png" alt-text="Screenshot of a flow's form inputs and outputs, with the file upload output highlighted.":::

1. In the upper-right corner of the window, select the **Edit** pencil icon to open the flow canvas.

1. Add a step to your flow:

    - Search for "parse" and select **Parse JSON**.
    - In the **Content** box, select the dynamic content that corresponds to the file upload option on the form.

        :::image type="content" source="../media/forms/attachment-flow-step2.png" alt-text="Screenshot of a Data Operation Parse JSON action in a flow under construction, with the form's file upload dynamic content highlighted.":::

1. Select **Generate from sample**.

1. Under **Insert a sample JSON payload**, select the box and paste the file upload output you copied earlier, and then select **Done**.

    :::image type="content" source="../media/forms/attachment-flow-sample-payload.png" alt-text="Screenshot of a sample JSON payload.":::

    The "Parse JSON" action should look something like this after you select **Done**:

    :::image type="content" source="../media/forms/attachment-flow-json-schema.png" alt-text="Screenshot of the Parse JSON action with a JSON schema.":::

### Create a share link and email the URL

1. Add a step to your flow:

    - Search for "create share link" and select the OneDrive for Business action **Create share link**.
    - Select the **File** box. The dynamic content panel opens. Select the **Expression** tab.
    - Type the following expression: **first(body('Parse_JSON'))?['id']**
    - Select the **Link type** and **Link scope**.
    - Select **OK**.

        :::image type="content" source="../media/forms/attachment-flow-share-link-step.png" alt-text="Screenshot of a OneDrive Create share link action in a flow under construction, with the form's uploaded file, link type, and link scope highlighted.":::

1. Add a step to your flow:

    - Search for "send email" and select the Office 365 Outlook action **Send an email (V2)**.
    - Enter the recipients, subject, and body of the email. Select dynamic content to include details from the form response in your email.

        :::image type="content" source="../media/forms/attachment-flow-share-link-step-final.png" alt-text="Screenshot of an Outlook send email action in a flow under construction, with custom information and dynamic content highlighted.":::

#### Convert the URL to a clickable link

To make the URL of the shared file a clickable link in the email, you'll need to use the HTML editor and an anchor tag:

1. In the email body toolbar, select the **HTML view** icon (**</>**).

1. Enclose the dynamic content **Web URL** and **name** in an anchor tag to turn them into a link and the link title, respectively.

In our example, we entered the following HTML in the email body, where text in curly brackets indicates the dynamic content:

```html
<a href="{WebURL}">{name}</a>
```

Here's our example:

:::image type="content" source="../media/forms/attachment-flow-share-link-step-final2.png" alt-text="Screenshot of an Outlook send email action in a flow under construction, with custom information and dynamic content highlighted in HTML view.":::

 You can combine [getting an attachment from a form and creating an approval flow](../approval-attachments.md).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
