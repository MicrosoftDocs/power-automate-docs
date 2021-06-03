---
title: Identify a window by its handle | Microsoft Docs
description: Identify a window by its handle
author: georgiostrantzas
ms.service: power-automate
ms.topic: article
ms.date: 06/03/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Identify a window by its handle

It's common in flow development to create flows that use several windows with the same title and class.

Power Automate Desktop enables users to distinguish identical windows using handles. Handles are unique numbers that uniquely identify each window.

To retrieve the handle of a window, launch the application with the **Run application** action and set the **After application launch** drop-down menu to **Wait for Application to Load**. The handle is stored by default in a variable named **WindowHandle**.

![The WindowHandle variable in the Run application action.](media/identify-window-handle/run-application-action-handle.png)

You can use handles to manipulate windows through the following Windows actions of the UI automation group:
- Focus window
- Set window state
- Set window visibility
- Move window
- Resize window
- Close window).












