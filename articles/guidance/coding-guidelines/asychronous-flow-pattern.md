---
title: Use an asynchronous flow pattern
description: Learn how to use the asynchronous flow pattern in Power Automate to handle long-running processes efficiently.
#customer intent: As a Power Automate user, I want to configure a flow to send an asynchronous response so that I can manage long-running processes efficiently.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/18/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Use an asynchronous flow pattern

When a parent flow or a Power App invokes a [child flow](/power-automate/create-child-flows), it must send a response back to the caller within 120 seconds. If the flow doesn't respond within this time frame, the caller experiences a time-out and an error occurs.

To ensure that the caller doesn't wait indefinitely for a response, you can configure the flow to send an asynchronous response. By setting the flow to respond asynchronously, the caller receives an immediate acknowledgment that the request is being processed. 

When you configure a flow to respond asynchronously, the flow sends the following response to the caller:

- **202 status code**: The 202 status code is a standard HTTP response indicating that the flow accepted the request for processing, but the processing isn't yet complete.
- **Location header**: The location header in the response provides a URL where the caller can check the status of the request. You can use this URL to track the progress and final outcome of the flow.

Follow these steps to configure the asynchronous response:

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Select **Create**.
1. Select **Instant cloud flow**.
1. Select **When an HTTP request is received** as the trigger.
1. Add the required actions to your cloud flow.
1. Add the **Response** action to your cloud flow.

    :::image type="content" source="media/async-1.png" alt-text="Screenshot of a cloud flow showing the Response action." lightbox="media/async-1.png":::


1. Select the **Response** action, select **Settings**, and toggle **Asynchronous response** to on.

    :::image type="content" source="media/async-2.png" alt-text="Screenshot of the Settings tab of the Response action with Asynchronous response toggled on." lightbox="media/async-2.png":::
