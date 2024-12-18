---
title: Asynchronous flow pattern
description: Learn how to use the asynchronous flow pattern
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Asynchronous flow pattern

When a parent flow or Power App invoke a [child flow](/power-automate/create-child-flows), it must send a response back to the caller within 120 seconds. If the flow doesn't respond within this time frame, the caller experiences a timeout and an error occur.

To handle such scenarios, you can configure the flow to send an asynchronous response. This technique allows the flow to return a status code of 202 (Accepted), indicating that the flow received the request. Additionally, a location header is provided, which can be used to check the final status of the request at a later time.

- **Asynchronous Response**: By setting the flow to respond asynchronously, you ensure that the caller doesn't wait indefinitely for a response. Instead, the caller receives an immediate acknowledgment that the request is being processed.
- **202 Status Code**: The 202 status code is a standard HTTP response indicating that the flow accepted the request for processing, but the processing isn't yet complete.
- **Location Header**: The location header in the response provides a URL where the caller can check the status of the request. You can use this URL for tracking the progress and final outcome of the flow.

Follow these steps to configure the asynchronous response:

1. Navigate to make.powerautomate.com.
1. Select **Create**.
1. Select **Instant cloud flow**.
1. Select **When an HTTP request is received** as the trigger.
1. Add the required actions to your cloud flow.
1. Add the **Response** action to your cloud flow.
    :::image type="content" source="media/async-1.png" alt-text="Screenshot of the Response action.":::
1. Select the **Response** action, select **Settings**, and toggle asynchronous response to on.
 :::image type="content" source="media/async-2.png" alt-text="Screenshot of the Settings of the Response action.":::
