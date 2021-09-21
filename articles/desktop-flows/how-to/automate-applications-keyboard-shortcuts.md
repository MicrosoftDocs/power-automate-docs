---
title: Automate applications using keyboard shortcuts | Microsoft Docs
description: Automate applications using keyboard shortcuts
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 06/09/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Automate applications using keyboard shortcuts

Many desktop application provides keyboard shortcuts that make multi-step tasks easy and fast to perform. Power Automate allows you to apply these shortcuts to create shorter and less complicated flows.

> [!IMPORTANT]
> Before sending keystrokes to an open application, use the **Focus window** action to activate the respective window. 

![The Focus window action.](media/automate-applications-keyboard-shortcuts/focus-window-action.png)

To select a specific element in the window, use the appropriate UI automation action, such as the **Click UI element in windows** action.

When the window is activated or the required element is selected, use the **Send keys** action to send the intended keystrokes.

For example, you can use the **Ctrl + B** shortcut to apply bold formatting in the currently selected cell. To use this shortcut, populate the **Text to send** field of the **Send keys** action with the following expression: **{Control}({B})**

![The Text to send field in the Send keys action.](media/automate-applications-keyboard-shortcuts/send-keys-action.png)

> [!NOTE]
> You can find all the available Excel keyboard shortcuts in [this article](https://support.microsoft.com/office/keyboard-shortcuts-in-excel-1798d9d5-842a-42b8-9c99-9b7213f0040f).

