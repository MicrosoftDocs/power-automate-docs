---
title: Automate on virtual desktops | Microsoft Docs
description: Automate on virtual desktops
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

# Automate on virtual desktops

Some scenarios may require you to develop flows that automate web pages on Citrix and RDP machines. Although web automation isn't available through the Power Automate agent for virtual desktops, you can use some of the following workarounds to achieve the same functionality.

- Automate web pages using UI automation actions

  Although you can't use browser automation actions in flows that run through the Power Automate agent for virtual desktops, you can deploy the corresponding UI automation actions to implement the same result. 

  You can find more information regarding UI automation actions in [Automate desktop flows](../desktop-automation.md).

- Automate web pages using mouse, keyboard, and OCR actions

  In scenarios in which both browser and UI automation actions may not be feasible, you can use a combination of keys, images, mouse clicks, and OCR extraction to automate web pages. 

  To find more information regarding using mouse, keyboard, and OCR actions, see [Automate with mouse, keyboard, and OCR actions](automate-using-mouse-keyboard-ocr.md).

- Automate web pages using image-based recording

  Apart from manually created flows, Power Automate for desktop enables you to design flows automatically by replicating the task you wish to automate. To automate flows that will run through the Power Automate agent for virtual desktops, you can use [image-based recording](recording-flow.md#image-based-recording). 