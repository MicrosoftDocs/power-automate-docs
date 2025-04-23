---
title: Troubleshoot known issues with Forms in Power Automate
description: Learn how to fix known issues with using forms in automated flows.
services: ''
suite: i
documentationcenter: na
author: HeatherOrt
editor: ''
tags: ''
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/12/2022
ms.author: dbekirop
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Troubleshoot known issues with forms in flows

Review the following troubleshooting tips in your form in a flow isn't working as you expect.

## Limitations

Make sure you aren't trying to make a form do something it can't. For information about the limitations of forms, go to [Microsoft Forms - known issues and limitations](/connectors/microsoftforms/#known-issues-and-limitations).

## Known issues

### My flow doesn’t work or has stopped working

Make sure that your form still exists in the same location.

You might have reached a limit for the connector or for the product. For the Microsoft Forms connector, you're limited to 300 API calls per connection within 60 seconds and one trigger poll every 86,400 seconds. Also check the [response limits](https://support.microsoft.com/office/form-question-response-and-character-limits-in-microsoft-forms-ec15323d-92a4-4c33-bf88-3fdb9e5b5fea) for Microsoft Forms.

### I'm getting an invalid connection error

Verify the throttling limits for all connectors in your flow. You can find the throttling limits for each connector in the reference documentation for that connector. For example, the reference documentation for the [SharePoint connector](/connectors/sharepointonline/#general-limits) is available.

Temporarily turn off your browser plug-ins, such as the Privacy Badger, that may block the cookies that Power Automate uses.

### When the email sends form responses, the files are corrupt

Make sure you aren't using a `base64()` function, since it might corrupt the files.

### Flows with forms only work sometimes

One common reason this happens is that a user entered more than 255 characters in a single-line text field in the form. Try using a multi-line text field instead.

### Form created by another team isn’t listed as an option in Form Id

Check whether the form is listed in the Microsoft Forms **Shared with me** tab.

You can also check the [transfer ownership of the form](https://support.microsoft.com/office/transfer-ownership-of-a-form-921a6361-a4e5-44ea-bce9-c4ed63aa54b4), especially if members of the team will leave the company.

### The Form Id field lists duplicate form names

The Form Id list picks up forms that you have deleted but which are still in the Recycle Bin. In Microsoft Forms, delete forms you no longer need, and then empty the recycle bin.

### Unable to find the correct Form Id

Go to your form. copy the Form Id from the URL of the form, and then add it as a custom value.

### I don’t get an attachment for some of my approvals

The approval action limits the size of file attachments in email to 5 MB. For attachments that are larger than 5 MB, the approval action redirects approvers to check for the attachment on the Power Automate **Action items > Approvals** page.

### Send email action looks stuck in my flow

If you're using the Mail connector in your flow, try using the Office 365 Outlook connector instead. The Mail connector has a limit of 100 API calls per 24 hours. The Outlook connector has a limit of 300 API calls per 60 seconds, which means that you're much less likely to reach the limit.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
