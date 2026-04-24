---
title: View, approve, or reject approval requests
description: Learn how to view, approve or reject, and change the language of approval requests in Power Automate.
suite: flow
author: radioblazer
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: article
ms.date: 04/24/2026
ms.author: matow
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage approval requests in Power Automate

Power Automate makes it easy to automate [approval workflow processes](modern-approvals.md). In this article, you learn how to view, approve, and reject approval requests sent. You can also change the language for your approval request.

## View pending approval requests

[!INCLUDE [view-pending-approvals](includes/view-pending-approvals.md)]

## Approve a request

[!INCLUDE [approve-request-from-different-locations](includes/approve-request-from-different-locations.md)]

## Reject a request

[!INCLUDE [reject-a-request](includes/reject-a-request.md)]

## Change your approval language

When you send an approval, Power Automate uses the following hierarchy to make a decision about which language to send it in.

1. The recipient's language as configured in the Power Automate portal.
1. The recipient's language as configured in the Office portal.
1. For manual triggers like **For a Selected Item** in Sharepoint, the caller (for example, Sharepoint) passes the user who invoked the flow's language in the request, which Power Automate honors.
1. For automated flows, Power Automate defaults to the creator of the approval's language as determined by steps 1 and 2.

If you're receiving approvals in an unexpected language, the recipient should modify their language in Power Automate.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the top right, select the gear icon > **View all Power Automate Settings**.
1. In the **Settings** window, select your preferred language and locale in the **Choose display language** and **Regional format (locale)** dropdown menus.
1. Select **Save**.

    These values are cached, so it might take up to 24 hours for the new settings to be reflected. It should generally be quicker than this.

## Related information

- [Create approval flows](modern-approvals.md)
- [Create sequential approval flows](sequential-modern-approvals.md)
- [Create parallel approval flows](parallel-modern-approvals.md)
- [Install the Power Automate mobile app for Android](https://aka.ms/flowmobiledocsandroid)
- [Install the Power Automate mobile app for iOS](https://aka.ms/flowmobiledocsios)
