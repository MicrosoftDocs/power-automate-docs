---
title: Troubleshoot common issues with Microsoft 365 Email | Microsoft Docs
description: Troubleshoot common issues with Microsoft 365 Email.
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
ms.date: 11/10/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Troubleshoot common issues with Microsoft 365 Outlook email


## Known limitations

Check out known limitations of the **Send an email** action [here](https://docs.microsoft.com/connectors/office365/#known-issues-and-limitations).

## Frequently asked questions

**I didn’t get an email. Why?**

1.  Confirm that your IT department has approved all Power Automate endpoints to allow it to send email to your email servers. These endpoints include [IP addresses](https://docs.microsoft.com/powerapps/maker/canvas-apps/limits-and-config\#ip-addresses) and [domains](https://support.microsoft.com/help/4557620/client-request-aborted-or-failed-to-fetch-error-in-power-automate).

1. Double check if you have any Outlook rules that are moving the email to a different folder.

1. Check if you are using the **Focused** inbox feature? Check if the email landed in another folder.

**I didn’t get an email and the send an email action looks stuck in my flow.**

If you are using the **Mail** connector, it has a limit of 100 API calls per 24 hours. Try the Office 365 Outlook connector, which has a limit of 300 API calls per 60 seconds instead, so you are less likely to hit the limit.

**I have a flow that triggers when an email arrives in a folder. Will my flow trigger if I move email from one folder to another folder?**

No. Your flow triggers only when a new email arrives.

**I am trying to send an email to all the approvers. I see an apply to each action around the send an email action, causing separate emails. I want to send an email to all of them.**

Apply to each is added because there are multiple approvers. You can create a string
variable and stores email addresses in it (as opposed to an array), separated by a
semicolon.

**I don’t get an attachment for some of my approvals.**

The Approval action attaches files to a notification email until the size of the email reaches 5MB. If the attachments exceed 5MB, the the approval email directs the approver to check the attachments in the Power Automate approval center.

**How to increase email attachment size limit for Power Automate?**

 A Common Data Service administrator can change the limit by going into Common Data Service >  Email Configuration settings, and then setting the file size limit for attachments.


**Power Automate stopped working - "Item ID doesn't belong to current mailbox" error Power Automate when using actions with shared mailbox.**

As of May 6, 2020, shared mailbox support was added for certain operations with an optional **Mailbox address** parameter, allowing you to specify a shared mailbox address for your operations to access. If you were using this operation prior to May 6, 2020, you will need to explicitly [update your operations to specify the shared mailbox address](https://docs.microsoft.com/connectors/office365/#shared-mailbox-support).

**I see this error: “REST API is not yet supported for this mailbox”**

This error can occur for accounts that are on a dedicated (on-premises) mail server when:

1. The mailbox is on a dedicated Microsoft Exchange Server or it is not a valid Office 365 mailbox.

1. The mailbox is an Outlook.com account that hasn't been enabled.

1.  The mailbox is not part of an Office 365 plan that includes Power Automate.

Follow the guidance in this [article](https://support.microsoft.com/help/4462988/rest-api-is-not-yet-supported-for-this-mailbox-error) to fix it.



## More information

- Overview of [email with flows](email-overview.md)
- Create [flows to manage email](create-email-flows.md)
- [Customize email in flows](email-customization.md)
- Top [email scenarios](email-top-scenarios.md)


