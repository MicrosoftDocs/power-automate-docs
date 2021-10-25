---
title: Automate browser prompts | Microsoft Docs
description: Automate browser prompts
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 09/06/2021
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Automate browser prompts

Many web pages display **Save as**, **Open**, and **Upload** dialogs to prompt users to select destination folders and files, respectively.

These dialogs aren't part of the web page, but they're handled by the web browser application or Windows File Explorer. As a result, you can't use the web recorder or the browser automation actions to automate them.

To automate these dialogs, use either the [desktop recorder](../recording-flow.md#desktop-recorder) or the [UI automation group of actions](../actions-reference/uiautomation.md). 

![Screenshot of a Save as dialog.](media/automate-save-open-upload-dialogs/save-as-dialog.png)