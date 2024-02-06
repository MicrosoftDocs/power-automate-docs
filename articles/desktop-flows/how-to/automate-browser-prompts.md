---
title: Automate browser prompts
description: Automate browser prompts
author: mattp123

ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 09/06/2021
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Automate browser prompts

Many web pages display **Save as**, **Open**, and **Upload** dialogs to prompt users to select destination folders and files, respectively.

These dialogs aren't part of the web page, but they're handled by the web browser application or Windows File Explorer. As a result, you can't use the browser automation actions to automate them.

To automate these dialogs, use either the [recorder](../recording-flow.md) or the [UI automation group of actions](../actions-reference/uiautomation.md). 

![Screenshot of a Save as dialog.](media/automate-save-open-upload-dialogs/save-as-dialog.png)
