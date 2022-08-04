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

Apart from physical machines, desktop flows enable you to automate the operating system and applications in Citrix and RDP (Microsoft Remote Desktop Protocol) virtual desktops, and interact with Citrix virtual apps.

Automating on virtual desktops works precisely as on physical machines. You can [capture UI elements](ui-elements.md), [deploy UI automation actions](actions-reference/uiautomation.md), and [create desktop flows using the recorder](recording-flow.md).

> [!IMPORTANT]
> Automating on virtual desktops doesn't currently support the automation of webpages using browser automation actions. To automate webpages on virtual desktops, you can [handle them as desktop UI elements](desktop-automation.md), [use mouse, keyboard, and OCR actions](how-to/automate-using-mouse-keyboard-ocr.md), or [automate using images](images.md).


To enable this functionality, install the **Power Automate agent for virtual desktops** on your virtual desktop. The agent communicates with the Power Automate for desktop application and facilitates the required interaction with it. The same agent can work with both Citrix and RDP virtual desktops.

Communication is performed through the same channel that the Citrix/RDP virtual desktop uses to connect to your machine. Therefore, a running agent is necessary for desktop flows to interact with a virtual desktop, and the agent should be up and running for both design and run time.

The agent starts running every time the user logs in to the virtual desktop, as the launching of the agent is set as a scheduled task. If the agent isn't running on your virtual desktop, the connection with Power Automate for desktop can't be established. In this case, relaunch the agent manually.  

## Prerequisites

* Windows 10 Pro, Windows 10 Enterprise, Windows 11 Pro, Windows 11 Enterprise, Windows Server 2016, Windows Server 2019 or Windows Server 2022

*	Power Automate for desktop should be installed on the user’s host machine. Users must download the installer from the Power Automate portal and install it manually.

*	Power Automate agent for virtual desktops should be installed on the Citrix/RDP virtual desktop. The agent installation requires admin rights.

*	Power Automate agent for virtual desktops should be up and running.  

## Install the Power Automate agent for virtual desktops 

> [!IMPORTANT]
> Power Automate for desktop should be installed on your host machine before installing the agent on your virtual desktop. The virtual machine might have or not installed the Power Automate for desktop. 

> [!IMPORTANT]
> During the installation of Power Automate for desktop, the Citrix/RDP connection to the virtual desktop should be closed.  

Το install the Power Automate agent for virtual desktops:

- Use [this link](https://go.microsoft.com/fwlink/?linkid=2188766) to download the agent. Alternatively, launch the Power Automate for desktop designer and navigate to **Tools -> Power Automate for virtual desktops (Preview)**

- Copy the installer to the virtual desktop and run it as administrator.

  ![Screenshot of the Power Automate agent for virtual desktops installer.](media\virtual-desktops\virtual-desktops-agent-installer.png)

- When the installation is complete, ensure that the agent for virtual desktops is visible in the System Tray of the virtual desktop. 

If there's an unexpected issue, you can restart the agent using the shortcut in the System Tray. If you encounter errors while launching the agent, refer to [Resolve Power Automate agent for virtual desktops issues](troubleshoot.md#resolve-power-automate-agent-for-virtual-desktops-issues).

## Sync Power Automate for desktop and agent for virtual desktops versions 

To automate on virtual desktops, the version of Power Automate for desktop used to interact with the virtual desktop's UI elements must be the same as the version of the agent for virtual desktops.

If the versions aren't synced during recording or UI element capturing, a dialog will prompt you to sync the versions. In this case, select **Sync** to sync the two products. 

  ![Screenshot of a dialog prompting you to sync Power Automate for desktop and the agent for virtual desktops.](media\virtual-desktops\virtual-desktops-agent-sync-dialog.png)

If the versions are out of sync during the runtime of a desktop flow, Power Automate for desktop will sync the versions of the two products automatically.

> [!NOTE]
> The DLLs of the synced version used by the agent can be found in **C:\Users\\[Username]]\AppData\Local\Microsoft\Power Automate Desktop\RDP Automation Agents**.

## Distinguish UI elements captured on virtual desktops

Capturing UI elements on virtual desktops works the same way as on physical machines. The generated selectors of windows and UI elements are the same, independently of whether they've been captured on a host machine or a virtual desktop. You can find more information regarding UI elements and selectors in [Automate using UI elements](ui-elements.md).

To distinguish the UI elements captured on virtual desktops, check the visual indications and the tree structure in the UI elements pane.

UI elements captured in the host machine are located under the **Computer** parent, while the UI elements captured on a virtual desktop are located under an **RDP** parent.

Every individual virtual desktop has its own tree, while numeric prefixes allow you to distinguish virtual desktops of the same type.

![Screenshot of some UI elements captured on an RDP virtual desktop.](media\virtual-desktops\ui-elements-rdp.png)

## Known issues and limitations

* **Issue:** Virtual desktop automation is available only in Windows RDP (Microsoft Remote Desktop Protocol), Citrix Desktop, and Citrix Virtual Apps. Other platforms of virtual desktop infrastructure aren't currently supported.

* **Workarounds:** None

*	**Issue:** Power Automate agent for virtual desktops isn't compatible with Windows 10 and Windows 11 Home editions as the Remote Desktop Connection isn't supported in these Windows editions.

* **Workarounds:** None

*	**Issue:** Virtual desktop automation isn't supported in Power Automate for desktop installed through the Microsoft store.

* **Workarounds:** Download and install the Microsoft Visual C++ Redistributable, that installs Microsoft C and C++ (MSVC) runtime libraries. You can find the x86 version [here](https://aka.ms/vs/17/release/vc_redist.x86.exe) and the x64 version [here](https://aka.ms/vs/17/release/vc_redist.x64.exe).

*	**Issue:** Citrix/RDP automation doesn't support the use of web automation actions.

* **Workarounds:** [Handle web components as desktop UI elements](desktop-automation.md), [use mouse, keyboard, and OCR actions](how-to/automate-using-mouse-keyboard-ocr.md), or [automate using images](images.md).

*	**Issue:** During runtime, the Citrix/RDP window shouldn't be minimized otherwise the element won't be found. 

* **Workarounds:** Use a **Focus window** action on the Citrix/RDP window before deploying UI automation actions to interact with the virtual desktop. 

*	**Issue:** When the Citrix/RDP window is maximized and the recorder is used, the **Populate text field in window** and **Send keys** actions might not work as expected. 

* **Workarounds:** Ensure that the Citrix/RDP window isn't maximized during recording.

*	**Issue:** UI automation of Java applets running on virtual desktops isn't supported yet. 

* **Workarounds:** None

*	**Issue:** Citrix/RDP UI automation doesn't work correctly when using Citrix Desktop and Citrix App from the same session. 

* **Workarounds:** None

*	**Issue:** Defining a window on virtual desktops using the **Window instance/handle** or **Window title/class** options isn't supported yet.

* **Workarounds:** None

[!INCLUDE[footer-include](../includes/footer-banner.md)]