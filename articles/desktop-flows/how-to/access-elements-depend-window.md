---
title: Access elements that depend on how the window appears on the screen | Microsoft Docs
description: Access elements that depend on how the window appears on the screen	
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 06/24/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Access elements that depend on how the window appears on the screen	

There are cases where Power Automate Desktop can't detect UI elements if they aren't visible on the computer screen.

These elements may be located in areas not directly visible on the screen or may not appear on the window at all. An element may be missing because the window's zoom level isn't suitable or the screen resolution is low.

To resolve this issue, you can:

- Increase the resolution of the screen manually or using the **Set screen resolution** action.

    ![The Set screen resolution action.](media/access-elements-depend-window/set-screen-resolution-action.png)

- Maximize the window of the application using the **Set window state** action.

    ![The Set window state action.](media/access-elements-depend-window/set-window-state-action.png)

- Zoom in or out of the window.

In some cases, you can create dynamic selectors that adapt to the state of the window or application. You can find more information about dynamic selectors in [Build a custom selector](..\build-custom-selectors.md).