---
title: Automate on virtual desktops
description: Learn how to build automated workflows on Citrix and RDP virtual desktops.
author: NikosMoutzourakis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 02/10/2025
ms.author: quseleba
ms.reviewer: matp
contributors:
  - DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---

# Automate on virtual desktops

With the Power Automate agent for virtual desktops, you can automate processes on virtual desktops as easily as you can on physical devices. If your virtual desktop uses Citrix or Microsoft Remote Desktop Protocol (RDP), you can [capture UI elements](ui-elements.md), [deploy UI automation actions](actions-reference/uiautomation.md), [deploy Browser automation actions](actions-reference/webautomation.md),and [create desktop flows using the recorder](recording-flow.md), just like on your physical desktop.

The Power Automate agent for virtual desktops must be running both while you're designing a flow and when the flow runs. The agent starts automatically when a user logs in to the virtual desktop. If it isn't running on your virtual desktop, launch the agent manually. To launch the Power Automate agent for virtual desktops manually, double-click the shortcut on your desktop, or search for *Power Automate agent for virtual desktops* on the **Start** menu and then select the respective result, or go to the installation directory of the Power Automate agent for virtual desktops (by default, it's `C:\Program Files (x86)\Power Automate agent for virtual desktops`) and double-click **PAD.RDP.ControlAgent.exe.**

It's important to install Power Automate for desktop on the machine where you're developing and executing your desktop flows, and Power Automate agent for virtual desktops on the machine where the flow just interacts with for UI automation actions. This second machine can be a Citrix Desktop, a host machine for a Citrix Virtual App, a remote desktop with Windows RDP communication, or a machine that hosts a Remote Desktop app.

## Prerequisites

- Your physical device and virtual machine must be running Windows 10 Pro, Windows 10 Enterprise, Windows 11 Pro, Windows 11 Enterprise, Windows Server 2016, Windows Server 2019, or Windows Server 2022.

- Make sure the Citrix or RDP connection to the virtual desktop is closed and then [install Power Automate on your physical device](https://go.microsoft.com/fwlink/?linkid=2137322).

- A device with the following hardware (these requirements don't include the resources required for the applications involved in your desktop flows):

  Minimum hardware:
  - Processor: 1.50 GHz per session or faster with two or more cores.
  - Storage: 300 ΜΒ system storage for agent installation, plus 500 MB for each user (each version of Power Automate for desktop requires a user have 500 MB of storage space).
  - RAM: 384 MB per session.

  Recommended hardware:
  - Processor: 2.00 GHz per session or faster with two or more cores.
  - Storage: 300 ΜΒ or more system storage for agent installation, plus 500 MB or more for each user (each version of Power Automate for desktop requires a user have 500 MB of storage space).
  - RAM: 512 MB or more per session.

## Install the Power Automate agent for virtual desktops

1. [Download the Power Automate agent for virtual desktops](https://go.microsoft.com/fwlink/?linkid=2188766).

    Alternatively, launch the Power Automate desktop designer and select **Tools** > **Power Automate for virtual desktops**.

1. Copy the installer to your Citrix or RDP virtual desktop.

1. As an administrator, run the installer.

    :::image type="content" source="media\virtual-desktops\virtual-desktops-agent-installer.png" alt-text="Screenshot of the Power Automate agent for virtual desktops installer.":::

    When the installation is complete, make sure the agent appears in the virtual desktop's notification area.

If you notice the agent isn't running, restart it using the shortcut in the notification area. If you encounter an error, refer to [Resolve Power Automate agent for virtual desktops issues](troubleshoot.md#resolve-power-automate-agent-for-virtual-desktops-issues).

## Sync Power Automate and agent for virtual desktops versions

To automate on virtual desktops, the versions of Power Automate and Power Automate agent for virtual desktops must be the same. If they're different when you start recording or capturing UI elements, select **Sync** when you're prompted to sync them.

:::image type="content" source="media\virtual-desktops\virtual-desktops-agent-sync-dialog.png" alt-text="Screenshot of the prompt to sync Power Automate and Power Automate agent for virtual desktops.":::

If the versions are out of sync when a desktop flow is running, Power Automate syncs them automatically.

> [!NOTE]
> The DLLs of the synced agent are stored in **C:\Users\\*username*\AppData\Local\Microsoft\Power Automate Desktop\RDP Automation Agents**.

## Distinguish UI elements captured on virtual desktops

Generated selectors of windows and UI elements are the same regardless of whether they were captured on a physical device or a virtual desktop. Visual indications and the tree structure in the UI elements pane help you to distinguish UI elements captured on virtual desktops from those captured on a physical device. [Learn more about UI elements and selectors](ui-elements.md).

UI elements captured on the physical device are located under the **Computer** parent. UI elements captured on a virtual desktop are located under an **RDP** or **Citrix** parent. Every virtual desktop has its own individual tree. A numeric prefix helps you to distinguish virtual desktops of the same type.

:::image type="content" source="media\virtual-desktops\ui-elements-rdp.png" alt-text="Screenshot of some UI elements captured on an RDP virtual desktop.":::

> [!NOTE]
> When you capture a UI element in a virtual desktop, virtual app or RemoteApp, it is linked to the details(IP, Name, etc.) of the machine at the time of capture. If you want to interact with the same UI element on a different machine, you will need to capture it again on that machine.

## Communication between Power Automate for desktop and Power Automate agent for virtual desktops if syncing

### Basic information

An automation agent is a specialized agent that is sent to the remote desktop after the initial communication with the control agent is complete. It provides specific functionality for UI automation for the version of Power Automate Desktop that requests it.

The Automation Agent Storage Directory refers to the default path where automation agents are stored. By default, this path is '%LOCALAPPDATA%\Microsoft\Power Automate Desktop\RDP Automation Agents\'. However, if the 'PAD_RDP_STORAGE_DIRECTORY' property is defined on the machine, then the path becomes '%PAD_RDP_STORAGE_DIRECTORY%\Microsoft\Power Automate Desktop\RDP Automation Agents\'.

### Communication phases

The following table and diagram depicts the different phases of communication:

|Phase  |Description  |
|---------|---------|
|Initial handshake     |  The first communication between Power Automate for desktop and the Power Automate agent for virtual desktops. The versions of Power Automate for desktop and Power Automate agent for virtual desktops aren't the same.       |
|Sync     |    This phase occurs when the user chooses to sync the versions of Power Automate for desktop and Power Automate agent for virtual desktops.    |
|Retry handshake     |   After the sync process is complete, the handshake between Power Automate for desktop and the Power Automate agent for virtual desktops is retried.      |
|Automation     |   The runtime of UI automation actions performed on the remote machine through the Power Automate agent for virtual desktops.      |

:::image type="content" source="media\virtual-desktops\agent-sync.png" alt-text="Screenshot of communication between Power Automate for desktop and Power Automate agent for virtual desktops" lightbox="media/virtual-desktops/agent-sync.png":::

## Known issues and limitations

- **Issue:** Virtual desktop automation is available only in Windows RDP, RemoteApp, Citrix Desktop, and Citrix Virtual Apps. Other virtual desktop platforms aren't supported.
  
  **Workaround:** None

- **Issue:** Power Automate agent for virtual desktops isn't compatible with Windows 10 Home and Windows 11 Home.
  
  **Workaround:** None. Remote desktop connection isn't supported in these Windows editions.

- **Issue:** Encounter the 'Error communicating with Power Automate for desktop' message when Power Automate agent for virtual desktop is launched in Citrix Desktop even though you have installed Power Automate for desktop and Power Automate agent for virtual desktops correctly and met all prerequisites.
  
  **Workaround:**  
  Check the **Virtual channel allow list policy** setting in your Citrix configuration.
  - If the Citrix VDA version is earlier than 2407:
    - The Virtual channel Allow list policy on Citrix is by default either enabled or set to default. However, if this policy isn't disabled, the Power Automate agent can't communicate with Power Automate for desktop. Contact your Citrix administrators to disable this policy, as keeping it set to Default isn't sufficient.
  - If the Citrix VDA version is 2407 or later:
    - Configure a different policy. The older **Virtual channel Allow list** can remain set to Default. Configure the new policy **Virtual channel allow list for DVC** and add the following values:
      - `C:\Program Files (x86)\Power Automate agent for virtual desktops\PAD.RDP.ControlAgent.exe,Microsoft.Flow.RPA.Desktop.UIAutomation.RDP.DVC.Plugin,PAD\CONTROL`
      - `C:\Users\*\AppData\Local\Microsoft\Power Automate Desktop\RDP Automation Agents\*\PAD.RDP.AutomationAgent.exe,Microsoft.Flow.RPA.Desktop.UIAutomation.RDP.DVC.Plugin,PAD\UIA`
    - Restart the Citrix machines after applying the policy.

- **Issue:** Virtual desktop automation isn't supported in Power Automate installed through the Microsoft store.
  
  **Workaround:** Download and install the Microsoft Visual C++ Redistributable, which installs Microsoft C and C++ (MSVC) runtime libraries.
  - [Download the x86 version](https://aka.ms/vs/17/release/vc_redist.x86.exe).
  - [Download the x64 version](https://aka.ms/vs/17/release/vc_redist.x64.exe).

- **Issue:** When a flow is running, an element isn't found if the virtual desktop window is minimized.
  
  **Workaround:** Use a **Focus window** action on the virtual desktop window before deploying UI automation actions to interact with the virtual desktop.

- **Issue:** When you're using the recorder and the virtual desktop window is maximized, the **Populate text field in window** and **Send keys** actions might not work as expected.
  
  **Workaround:** Make sure the virtual desktop window isn't maximized while you're recording.

- **Issue:** UI automation of Java applets running on virtual desktops isn't supported.
  
  **Workaround:** None

- **Issue:** Citrix UI automation doesn't work if you're using Citrix Desktop and Citrix App in the same session.
  
  **Workaround:** None

- **Issue:** Defining a window on virtual desktops using the **Window instance/handle** or **Window title/class** options isn't supported.
  
  **Workaround:** None

[!INCLUDE[footer-include](../includes/footer-banner.md)]
