---
title: Troubleshoot common issues with Outlook email in Power Automate
description: Troubleshoot common issues with Outlook email or mail notifications.
services: ''
suite: flow
author: v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: troubleshooting-general
ms.date: 10/09/2024
ms.author: angieandrews
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Troubleshoot common issues with email in flows

## Known limitations

For known limitations of the **Send an email** action, go to [Office 365 Outlook: Known issues and limitations](/connectors/office365/#known-issues-and-limitations).

## Frequently asked questions

**I didn't get an email. Why?**

1.  Confirm that your IT department has approved all Power Automate endpoints to allow it to send email to your email servers. These endpoints include [IP addresses](/powerapps/maker/canvas-apps/limits-and-config\#ip-addresses) and [domains](https://support.microsoft.com/help/4557620/client-request-aborted-or-failed-to-fetch-error-in-power-automate).

1. Double-check whether you have any Outlook rules that are moving the email to a different folder.

1. Check whether you're using the **Focused** inbox feature. Check whether the email landed in another folder.

**I didn't get an email, and the send an email action looks stuck in my flow.**

If you're using the **Mail** connector, note that it has a limit of 100 API calls per 24 hours. Try the Office 365 Outlook connector, which has a limit of 300 API calls per 60 seconds instead, so you'll be less likely to hit the limit.

**I have a cloud flow that is triggered when an email arrives in a folder. Will my flow trigger if I move email from one folder to another folder?**

No. Your flow will be triggered only when a new email arrives.

**I'm trying to send an email to all the approvers. I see an Apply to each action around the Send an email action, causing separate emails. I want to send an email to all of them.**

**Apply to each** is added because there are multiple approvers. You can create a string variable (as opposed to an array) and store email addresses, separated by semicolons, in it.

**I don't get an attachment for some of my approvals.**

The **Approval** action attaches files to a notification email until the size of the email reaches 5 MB. If the attachments exceed 5 MB, the approval email directs the approver to check the attachments in the Power Automate approval center.

**How do I increase the email attachment size limit for Power Automate?**

A Microsoft Dataverse administrator can change the limit by going into **Microsoft Dataverse** >  **Email Configuration** settings, and then setting the file size limit for attachments.

**Power Automate stopped working - I get "Item ID doesn't belong to current mailbox" error in Power Automate when using actions with shared mailbox.**

As of May 6, 2020, shared mailbox support was added for certain operations with an optional **Mailbox address** parameter, allowing you to specify a shared mailbox address for your operations to access. If you were using this operation prior to May 6, 2020, you'll need to explicitly [update your operations to specify the shared mailbox address](/connectors/office365/#shared-mailbox-support).

**I see this error: "REST API is not yet supported for this mailbox".**

This error can occur for accounts that are on a dedicated (on-premises) mail server when:

1. The mailbox is on a dedicated Microsoft Exchange Server, or it isn't a valid Microsoft 365 mailbox.

1. The mailbox is an Outlook.com account that isn't enabled.

1. The mailbox isn't part of a Microsoft 365 plan that includes Power Automate.

To resolve the issue, go to ["REST API is not yet supported for this mailbox" error for request to a mailbox](https://support.microsoft.com/help/4462988/rest-api-is-not-yet-supported-for-this-mailbox-error).

**Unable to send email with attachment error: "Parameter 'Attachment Content' cannot be null or empty."**

Use expressions to encode the attachment with base64. The attachment will be recognized after you're done.

## Related information

- [Overview of using Outlook with Power Automate](email-overview.md)
- [Create flows to manage email](create-email-flows.md)
- [Customize email in flows](email-customization.md)
- [Create flows for popular email scenarios](email-top-scenarios.md)
- [Training: Create flows to manage email (module)](create-email-flows.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]
