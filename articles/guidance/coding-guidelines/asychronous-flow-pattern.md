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

When a [child flow](/power-automate/create-child-flows) is invoked by a parent flow or a Power App, it must send a response back to the caller within 120 seconds. If the flow does not respond within this time frame, the caller will experience a timeout and an error will occur.

To handle such scenarios, you can configure the flow to send an asynchronous response. This allows the flow to return a status code of 202 (Accepted), indicating that the request has been received and is being processed. Additionally, a location header is provided, which can be used to check the final status of the request at a later time.

- **Asynchronous Response**: By setting the flow to respond asynchronously, you ensure that the caller does not wait indefinitely for a response. Instead, the caller receives an immediate acknowledgment that the request is being processed.
- **202 Status Code**: The 202 status code is a standard HTTP response indicating that the request has been accepted for processing, but the processing is not yet complete.
- **Location Header**: The location header in the response provides a URL where the caller can check the status of the request. This is useful for tracking the progress and final outcome of the flow.

By implementing these settings, you can improve the reliability and efficiency of your flows, ensuring that they handle long-running processes without causing timeouts or errors for the calling entities.

Follow these steps to configure the asychronous reponse:

1. Navigate to make.powerautomate.com.
1. Select **Create**.
1. Select **Instant cloud flow**.
1. Select **When an HTTP request is received** as the trigger.
1. Add the required actions to your cloud flow.
1. Add the **Response** action to your cloud flow.
    :::image type="content" source="media/async-1.png" alt-text="Screenshot of the Response action.":::
1. Select the **Response** action, select **Settings** and toggle asychronous reponse to on.
 :::image type="content" source="media/async-2.png" alt-text="Screenshot of the Settings of the Response action.":::
