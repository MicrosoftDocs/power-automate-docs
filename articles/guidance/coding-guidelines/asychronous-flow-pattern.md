---
title: Use asynchronous responses
description: Learn how to use asynchronous responses in your Power Automate flows to handle long-running processes efficiently and avoid time-outs.
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 04/03/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/03/2025
---

# Use asynchronous responses

When a parent flow or an app invokes a [child flow](/power-automate/create-child-flows), the child flow must send a response within 120 seconds. If it doesn't, the calling flow or app, or *caller*, times out and an error occurs. This time limit can be problematic for long-running processes, such as those that require approval or involve multiple steps. This article explains how to avoid this issue by configuring the child flow to respond asynchronously.

Asynchronous responses ensure that the caller doesn't wait indefinitely for a response. Instead, it receives an immediate acknowledgment that the request is being processed.

When you configure a flow to respond asynchronously, it sends the following response to the caller:

- **202 status code**: The 202 status code is a standard HTTP response. It indicates that the flow accepted the request for processing, but the processing isn't complete.
- **Location header**: The location header provides a URL where the caller can check the status of the request. You can use this URL to track the flow's progress and final outcome.

To configure a child flow to respond asynchronously, add a **Response** action to the flow. In the **Response** action, select **Settings**, and then turn on **Asynchronous response**.

:::image type="content" source="media/async-2.png" alt-text="Screenshot of a cloud flow in the Power Automate designer showing the Response action settings with Asynchronous response turned on." lightbox="media/async-1.png":::
