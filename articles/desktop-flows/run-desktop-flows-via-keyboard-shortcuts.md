---
title: Run desktop flows via URL via keyboard shortcuts
description: See how to run desktop flows via keyboard shortcuts.
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 03/24/2023
ms.author: pefelesk
ms.reviewer: ndoelman
contributors:
search.app: 
  - Flow 
search.audienceType: 
  - flowmaker
  - enduser
---

# Run desktop flows via keyboard shortcuts 

Power Automate enables you to control desktop flow runs using keyboard shortcuts. You can press key or key combinations to trigger desktop flows and pause/resume or stop the running flow. 

If a triggered flow requires input variables, the console will ask you to enter the appropriate values. 

## Prerequisites 

- Power Automate for desktop needs to be installed on the machine. 

- The user must be signed in. 

## Set a keyboard shortcut 

To create a keyboard shortcut that triggers a desktop flow, right-click its name in the console and select **Properties**. Then enter the key or key combination that will trigger the flow. 

:::image type="content" source="media/run-flow-keyboard/create-keyboard-shortcut.png" alt-text="Create a keyboard shortcut.":::

To create a keyboard shortcut that pauses/resumes or stops the running flow go to [Console Settings](console.md#console-settings).

> [!NOTE]
> A list of all keyboard shortcuts can be found at `%localappdata%\Microsoft\Power Automate Desktop\Console\console.config` for each user that has signed into Power Automate on the current machine and under the current user in the past.

## Limitations

- Supported keys and key combinations include either a single Functional key or a combination of at least one modifier key along with any other key. 

- Keyboard shortcuts are saved per user and per machine. Each user with access to a desktop flow can set their own shortcuts for each machine. 

[!INCLUDE[footer-include](../includes/footer-banner.md)]
