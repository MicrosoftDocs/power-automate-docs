---
title: Debugging issues with Approval emails | Microsoft Docs
description: Debugging issues with Approval notification emails
services: ''
suite: flow
documentationcenter: na
author: hamenon 
manager: tapanm
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/19/2022
ms.author: tatn
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Email notification status help

This article contains an explanation of the process for sending an email notification, as well as a description of the possible email notification statuses and troubleshooting.

Sending the email notification is a two-step process.

1. Power Automate places a request to the Microsoft Email Orchestrator.
1. Microsoft Email Orchestrator places the email to be sent in a queue.

## status definitions

Status|Description
------------------
Pending| Power Automate is in the process of requesting that the Microsoft Email Orchestrator sends the notification.
Requested| Power Automate successfully placed the request, but the Microsoft Email Orchestrator is still in the process of sending the email.
Sent| The email notification was correctly sent by the Microsoft Email Orchestrator.
Failed| The email was correctly placed in the queue, but the Microsoft Email Orchestrator couldn’t send it.

## Missing emails

If the status of your email notification is **Sent** but you don't see the email notification, try the following options.

- Refresh your inbox and verify that you have an active Internet connection.
- Confirm that the email address is correct for the recipient to whom you intend to send the notifcaton.
- Review your email settings and verify if there are any filters or blocked addresses that may prevent you from seeing the notification.
- Check your spam/promotions folder.

## Troubleshoot failed requests

If the status of your email notification is **Failed**, you can try the following options.

- Make another request to the same recipients.
- Raise a ticket to Microsoft support, detailing the issue.
