---
title: Troubleshoot known issues with Forms in flows | Microsoft Docs
description: FAQs using Forms - Get response details, when a new response is submitted
services: ''
suite: flow
documentationcenter: na
author: Dean-Haas
manager: kvivek
editor: ''
tags: ''
ms.service: flow
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

# Troubleshoot known issues with Forms in flows

## Limitations

For information about limitations of forms see: [Microsoft Forms - known issues and limitations](/connectors/microsoftforms/#known-issues-and-limitations)

## Known issues

### My flow doesn’t work or has stopped working.

Make sure that the form being referenced hasn’t been deleted or the name of the form hasn’t changed.

You may have reached a limit for the connector or for the product. For the Microsoft Forms connector, the limits on API calls per connection are 300 API calls per connection within 60 seconds and a frequency of 1 trigger poll every 86400 seconds. Furthermore, view the [response limits](https://support.microsoft.com/office/form-question-response-and-character-limits-in-microsoft-forms-ec15323d-92a4-4c33-bf88-3fdb9e5b5fea) for Microsoft Forms.

### I am experiencing an invalid connection error.

Check throttling limits for all connectors in your flow.

Disable any plug-ins, such as the Chrome plug-in Privacy Badger, as it may be blocking the cookies that Power Automate uses.

### When the email sends form responses, the files are corrupt.

Make sure you are not using a base64() function as this may corrupt the files.

### Flow with form only works sometimes.

One reason that this may be happening is that some users may inputting more than 255 characters in the single line of text field in the form. Enable long answer in the text field .  

### Form created by another team doesn’t isn’t listed as an option in Form Id.

Double check that the form is listed in the Microsoft Forms “Shared with me” tab. You may also want to [transfer ownership of the form](https://support.microsoft.com/office/transfer-ownership-of-a-form-921a6361-a4e5-44ea-bce9-c4ed63aa54b4), especially if members of the team will be leaving the company.

### The Forms Id field lists duplicate form names.

The list will propagate all forms until the form is deleted from the recycling bin. Therefore, go back into Microsoft Forms and ensure that the forms you no longer need are deleted.

### Unable to find the correct Form Id.

Go to your form. Copy the Form Id from the URL of the form and add it as a custom value.

### I don’t get an attachment for some of my approvals.

Approval action will attach file in notification email till the size is 5 MB. Beyond that, approval action in Power automate won’t be able to attach the file in notification email. It will redirect user/approver to check the attachment in Microsoft Flow portal.

### Send email action looks stuck in my flow.

If you are using Mail connector as part of your flow, it has a limit of 100 API calls per 24 hours. Try the Office 365 Outlook connector, which has a limit of 300 API calls per 60s, so that you are less likely to hit the limit.


[!INCLUDE[footer-include](../includes/footer-banner.md)]
