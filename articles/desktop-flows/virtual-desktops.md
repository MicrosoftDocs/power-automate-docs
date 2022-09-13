---
title: Automate on virtual desktops (preview)
description: Learn how to build automated workflows on Citrix and RDP virtual desktops.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 09/08/2022
ms.author: gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Automate on virtual desktops (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

With the Power Automate agent for virtual desktops, you can automate processes on virtual desktops just as easily as you can on physical devices. If your virtual desktop uses Citrix or Microsoft Remote Desktop Protocol (RDP), you can [capture UI elements](ui-elements.md), [deploy UI automation actions](actions-reference/uiautomation.md), and [create desktop flows using the recorder](recording-flow.md), just like on your physical desktop.

> [!IMPORTANT]
> This is a preview feature. [!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]

The Power Automate agent for virtual desktops must be running both while you're designing a flow and when the flow runs. The agent starts automatically when a user logs in to the virtual desktop. If it isn't running on your virtual desktop, launch the agent manually.  

## Prerequisites

- Your physical device and virtual machine must be running Windows 10 Pro, Windows 10 Enterprise, Windows 11 Pro, Windows 11 Enterprise, Windows Server 2016, Windows Server 2019, or Windows Server 2022.

- Make sure the Citrix or RDP connection to the virtual desktop is closed and then [install Power Automate on your physical device](https://go.microsoft.com/fwlink/?linkid=2137322).

## Install the Power Automate agent for virtual desktops

1. [Download the Power Automate agent for virtual desktops](https://go.microsoft.com/fwlink/?linkid=2188766).

    Alternatively, launch the Power Automate desktop designer and select **Tools** > **Power Automate for virtual desktops (Preview)**.

1. Copy the installer to your Citrix or RDP virtual desktop.

1. As an administrator, run the installer.

    :::image type="content" source="media\virtual-desktops\virtual-desktops-agent-installer.png" alt-text="Screenshot of the Power Automate agent for virtual desktops installer.":::

    When the installation is complete, make sure the agent appears in the virtual desktop's notification area.

If you notice the agent isn't running, restart it using the shortcut in the notification area. If you encounter an error, refer to [Resolve Power Automate agent for virtual desktops issues](troubleshoot.md#resolve-power-automate-agent-for-virtual-desktops-issues).

## Sync Power Automate and agent for virtual desktops versions

To automate on virtual desktops, the versions of Power Automate and Power Automate agent for virtual desktops must be the same. If they're different when you start recording or capturing UI elements, select **Sync** when you're prompted to sync them.

:::image type="content" source="media\virtual-desktops\virtual-desktops-agent-sync-dialog.png" alt-text="Screenshot of the prompt to sync Power Automate and Power Automate agent for virtual desktops.":::

If the versions are out of sync when a desktop flow is running, Power Automate will sync them automatically.

> [!NOTE]
> The DLLs of the synced agent are stored in **C:\Users\\*username*\AppData\Local\Microsoft\Power Automate Desktop\RDP Automation Agents**.

## Distinguish UI elements captured on virtual desktops

Generated selectors of windows and UI elements are the same regardless of whether they were captured on a physical device or a virtual desktop. Visual indications and the tree structure in the UI elements pane help you to distinguish UI elements captured on virtual desktops from those captured on a physical device. [Learn more about UI elements and selectors](ui-elements.md).

UI elements captured on the physical device are located under the **Computer** parent. UI elements captured on a virtual desktop are located under an **RDP** parent. Every virtual desktop has its own individual tree. A numeric prefix helps you to distinguish virtual desktops of the same type.
<!--NOTE: Would the parent be called "Citrix" if that was the kind of virtual desktop it was on?-->

:::image type="content" source="media\virtual-desktops\ui-elements-rdp.png" alt-text="Screenshot of some UI elements captured on an RDP virtual desktop.":::

## Known issues and limitations

- **Issue:** Virtual desktop automation is available only in Windows RDP, Citrix Desktop, and Citrix Virtual Apps. Other virtual desktop platforms aren't supported.

    **Workaround:** None

- **Issue:** Power Automate agent for virtual desktops isn't compatible with Windows 10 Home and Windows 11 Home.

    **Workaround:** None. Remote desktop connection isn't supported in these Windows editions.

- **Issue:** Virtual desktop automation isn't supported in Power Automate installed through the Microsoft store.

    **Workaround:** Download and install the Microsoft Visual C++ Redistributable, which installs Microsoft C and C++ (MSVC) runtime libraries.
  - [Download the x86 version](https://aka.ms/vs/17/release/vc_redist.x86.exe).
  - [Download the x64 version](https://aka.ms/vs/17/release/vc_redist.x64.exe).

- **Issue:** Citrix and RDP automation doesn't support the use of web automation actions.

    **Workarounds:** [Treat web components as desktop UI elements](desktop-automation.md), [use mouse, keyboard, and OCR actions](how-to/automate-using-mouse-keyboard-ocr.md), or [automate using images](images.md).

- **Issue:** When a flow is running, an element isn't found if the virtual desktop window is minimized.

    **Workaround:** Use a **Focus window** action on the virtual desktop window before deploying UI automation actions to interact with the virtual desktop.

- **Issue:** When you're using the recorder and the virtual desktop window is maximized, the **Populate text field in window** and **Send keys** actions might not work as expected.

    **Workaround:** Make sure the virtual desktop window isn't maximized while you're recording.

- **Issue:** UI automation of Java applets running on virtual desktops isn't supported.

    **Workaround:** None

- **Issue:** Citrix UI automation doesn't work if you're using Citrix Desktop and Citrix App in the same session.<!--NOTE: I can't confirm that these are the correct product names. Please double-check. Thanks!-->

    **Workaround:** None

- **Issue:** Defining a window on virtual desktops using the **Window instance/handle** or **Window title/class** options isn't supported.

    **Workaround:** None

[!INCLUDE[footer-include](../includes/footer-banner.md)]