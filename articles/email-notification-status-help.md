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

Sending the email notification is a two-step process, we place a request to the Microsoft Email Orchestrator, and they put the email to be sent in a queue.

## What does my status mean?

### Pending

Power Automate is still in the process of requesting the Microsoft Email Orchestrator to send the notification.

### Requested

Power Automate correctly placed the request, but the Microsoft Email Orchestrator is still in the process of sending the email.

### Sent

The email notification was correctly sent by the Microsoft Email Orchestrator.

### Failed

The email was correctly placed in the queue, but the Microsoft Email Orchestrator couldn’t send it.

## Why don't I see my email?

If the status of your email notification is Sent and you are unable to see the email notification try the following options:

- Refresh your inbox and verify that you have an active internet connection.
- Make sure that the email address is correct to verify you have the right recipient.
- Review your email settings to verify if there are any filters enabled or blocked addresses.
- Check your spam/promotions folder.

## Why did my request fail?

If the status of your email notification is Failed, you can try the following options:

- Try making another request to the same recipients.
- Raise a ticket to Microsoft support detailing the issue.