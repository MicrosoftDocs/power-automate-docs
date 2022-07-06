---
title: Automating on virtual desktops (Preview) | Microsoft Docs
description: This section describes how to automate on virtual desktops.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 07/06/2022
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Automating on virtual desktops (Preview)

Apart from physical machines, desktop flows enable you to automate the operating system and applications in Citrix and RDP (Microsoft Remote Desktop Protocol) virtual desktops.

Automating on virtual desktops works precisely as in physical machines. You can [capture UI elements](ui-elements.md), [deploy UI automation actions](actions-reference/uiautomation.md), and [create desktop flows using the recorder](recording-flow.md).

> [!IMPORTANT]
> Automating on virtual desktops doesn't support the automation of webpages using browser automation actions. To automate webpages on virtual desktops, you can [handle them as desktop UI elements](desktop-automation.md) or [use mouse, keyboard, and OCR actions](how-to/automate-using-mouse-keyboard-ocr.md).

To enable this functionality, you must install the **Power Automate agent for virtual desktops** on your virtual desktop. The agent communicates with the Power Automate for desktop application and facilitates the required interaction with it.

Communication is performed through the same channel that the Citrix/RDP virtual desktop uses to connect to your machine. When the agent isn't running on your virtual desktop, the connection with Power Automate for desktop can't be established. In this case, relaunch the agent.  

## Install the Power Automate agent for virtual desktops 

> [!IMPORTANT]
> Power Automate for desktop should be installed on your physical machine before installing the agent on your virtual desktop.

> [!IMPORTANT]
> During the installation of Power Automate for desktop, the Citrix/RDP connection to the virtual desktop should be closed.  

Το install the Power Automate agent for virtual desktops:

- Use [this link](https://go.microsoft.com/fwlink/?linkid=2188766) to download the agent. Alternatively, launch Power Automate for desktop and navigate to **Tools-> Power Automate for virtual desktops (Preview)**
- Copy the installer to the virtual desktop and run it as administrator.
- When the installation is complete, check that the agent for virtual desktops is visible in the System Tray of the virtual desktop. 
- Sync Power Automate for desktop and agent for virtual desktops versions 

To automate on virtual desktops, the version of Power Automate for desktop must be the same as the version of the agent for virtual desktops.

If the versions aren't synced during recording or UI element capturing, a dialog will prompt you to sync the versions. In this case, select **Sync** to sync the two products. 

If the versions are out of sync during the runtime of a desktop flow, Power Automate for desktop will sync the versions of the two products automatically.

> [!IMPORTANT]
> The DLLs of the synced version used by the agent can be found in **...\AppData\Local\Microsoft\Power Automate Desktop\RDP Automation Agents**. If you want to test the sync process while the products are already synced, stop any process of the running agent and delete the file. 

## Distinguish UI elements captured in virtual desktops

Capturing elements in UI elements in virtual desktops works the same way as in physical machines. You can find more information regarding UI elements in Automate using UI elements.

To distinguish the UI elements captured in virtual desktops, check the visual indications and the tree structure in the UI elements pane.

UI elements captured in a Citrix virtual desktop are located under a **Citrix** parent, while the UI elements captured in a virtual machine connected through RDP are located under an **RDP** parent. 

Every individual virtual desktop has its own tree, while numeric prefixes allow you to distinguish virtual desktops of the same type.

[!INCLUDE[footer-include](../includes/footer-banner.md)]