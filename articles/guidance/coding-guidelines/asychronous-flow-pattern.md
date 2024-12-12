---
title: Asynchronous flow pattern
description: Learn how to use the asynchronous flow pattern
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

## Asynchronous flow pattern

If a flow is called from a parent flow or a Power App, it has to send a response back to the calling entity within 120 seconds. If the called flow fails to do that, then the calling entity receives a timeout and errors out. 

Therefore, in such cases, setting asynchronous response allows the flow to respond with a 202 to indicate the request is accepted for processing. Additionally, a location header is provided to retrieve the final state.

Follow these steps to set the asychronous reponse:

1. Navigate to make.powerautomate.com.
1. Select **Create**.
1. Select **Instant cloud flow**.
1. Select **When an HTTP request is received** as the trigger.
1. Add the required actions to your cloud flow.
1. Add the **Response** action to your cloud flow.
    :::image type="content" source="media/async-1.png" alt-text="Screenshot of the Response action.":::
1. Select the **Response** action, select **Settings** and toggle asychronous reponse to on.
 :::image type="content" source="media/async-2.png" alt-text="Screenshot of the Settings of the Response action.":::
