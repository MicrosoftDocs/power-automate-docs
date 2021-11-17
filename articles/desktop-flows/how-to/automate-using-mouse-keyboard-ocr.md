---
title: Automate with mouse, keyboard, and OCR actions | Microsoft Docs
description: Automate with mouse, keyboard, and OCR actions
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 11/17/2021
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Automate with mouse, keyboard, and OCR actions

In some cases, certain web pages and applications don't allow external software to interact with them. As a result, you can't automate them using the web and UI automation actions or the recorders.

Although you can use [image-based recording](../recording-flow.md#image-based-recording) to automate some of these applications, it may not be the best option in some scenarios. For example, some applications change their interface dynamically, while the texts remain the same.

To bypass this issue, you can use a combination of keys, images, mouse clicks, and OCR extraction. 

Before building your automation, ensure that the appropriate window is focused and maximized using the **Focus window** and **Set window state** actions.

![Screenshot of the Focus window action.](media/automate-using-mouse-keyboard-ocr/focus-window-action.png)

If you need to wait for specific components to load before running an action, use the wait group of actions. 

Use the **Wait** action to wait for a set amount of time, the **Wait for image** action to wait for an image to appear/disappear, or the **Wait for text on screen (OCR)** action to wait for a text to appear/disappear.

![Screenshot of the Wait for text on screen action.](media/automate-using-mouse-keyboard-ocr/wait-text-screen-action.png)

To navigate through the web page or application and interact with its components, use the mouse and keyboard actions.

For example, deploy the **Send keys** action to use the available keyboard shortcuts, or the **Move mouse to image** and **Move mouse to text on screen (OCR)** actions to move the cursor to a specific image or text, respectively.

![Screenshot of the Move mouse to image action.](media/automate-using-mouse-keyboard-ocr/move-mouse-image-action.png)

To retrieve text from the screen and store it into a variable, deploy either the clipboard actions or the **Extract text with OCR** action. To store a text in the clipboard, highlight the text using either the **Send keys** or the **Send mouse click** action.

You can configure the **Send keys** action to send the **CTRL + A** keyboard shortcut that selects all the text on the web page or application.

![Screenshot of the Send keys action.](media/automate-using-mouse-keyboard-ocr/send-keys-action.png)

> [!NOTE]
> You can find more information regarding automation using keyboard shortcuts in [Automate applications using keyboard shortcuts](automate-applications-keyboard-shortcuts.md).

Alternatively, you can use the **Send mouse click**  action to send a **Left button down** at the beginning of the text you want to select and then a **Left button up** at the end. 

![Screenshot of the Send mouse click action.](media/automate-using-mouse-keyboard-ocr/send-mouse-click-action.png)

After highlighting, deploy the **Send keys** action to send the **CTRL + C** keyboard shortcut that stores the selected text in the clipboard. After storing the text in the clipboard, use the **Get clipboard text** action to store the clipboard content into a variable. 

![Screenshot of the Get clipboard text action.](media/automate-using-mouse-keyboard-ocr/get-clipboard-action.png)