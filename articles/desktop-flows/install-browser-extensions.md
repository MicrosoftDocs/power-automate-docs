---
title: Install Power Automate browser extensions
description: See how to install Power Automate browser extensions.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 12/02/2022
ms.author: gtrantzas
ms.reviewer: pefelesk
contributors:
- NikosMoutzourakis
search.app: 
  - Flow 
search.audienceType: 
  - flowmakers
  - enduser
---

# Install Power Automate browser extensions

To automate web-related tasks, Power Automate provides the built-in Automation browser that is preconfigured and works out of the box. Besides the Automation browser, it also supports the four most popular browsers: Microsoft Edge, Internet Explorer, Google Chrome, and Mozilla Firefox. These browsers need extra configuration and/or browser extensions to work.

## Install browser extensions

When Power Automate installation is complete, the installer will prompt you to install the appropriate extension for your browser. The links inside the installer send you to the store of each extension.

:::image type="content" source="media/desktop-flows-setup/screen.png" alt-text="Screenshot of the installation success dialog.":::

If you skip the installation of the browser extensions, you can do it manually later using the following links or through the **Tools** > **Browser extensions** options in the flow designer.

For Power Automate for desktop v2.27 or later:

- [Microsoft Edge](https://microsoftedge.microsoft.com/addons/detail/microsoft-power-automate/kagpabjoboikccfdghpdlaaopmgpgfdc)
- [Google Chrome](https://chrome.google.com/webstore/detail/microsoft-power-automate/ljglajjnnkapghbckkcmodicjhacbfhk)
- [Mozilla Firefox](https://addons.mozilla.org/en-US/firefox/addon/microsoft-power-automate/)

For Power Automate for desktop v2.26 or earlier (Legacy):

- [Microsoft Edge](https://microsoftedge.microsoft.com/addons/detail/microsoft-power-automate/njjljiblognghfjfpcdpdbpbfcmhgafg)
- [Google Chrome](https://chrome.google.com/webstore/detail/microsoft-power-automate/gjgfobnenmnljakmhboildkafdkicala)

## Configure Microsoft Edge

To ensure that **Microsoft Edge** works as expected with Power Automate, disable running background apps when Microsoft Edge is closed.

To disable this option, go to **Settings** > **System** and disable **Continue running background apps when Microsoft Edge is closed**.

## Configure Google Chrome

To ensure that **Google Chrome** works as expected with Power Automate, disable running background apps when Chrome is closed.

To disable this option, go to **Settings** > **Advanced** > **System** and disable **Continue running background apps when Google Chrome is closed**.

## Configure Mozilla Firefox

Firefox alerts that freeze the browser and prevent users from switching to other tabs or windows may affect your desktop flows. To disable this feature:

1. Populate the URL bar with the phrase **about:config**

1. Search for the **prompts.tab_modal.enabled** preference in the list and change it to **false**.

## Configure Internet Explorer

By default, Internet Explorer works in protected mode to prevent any external application from controlling it. While Power Automate can still work with this setting enabled, it won't be able to clear the browser's cache or cookies.

To disable protected mode and allow Power Automate to clear the browser's cache and cookies:

1. Launch Internet Explorer, select the **gear icon**, and choose **Internet options** in the menu.

1. In the **Internet options** dialog, navigate to **Security** > **Internet**, and disable **Enable Protected Mode**. Repeat the same step for the **Local intranet** and **Trusted sites** zones.

    :::image type="content" source="media/install-browser-extensions/internet-explorer-internet-protected-mode.png" alt-text="Screenshot of the security tab in the Internet Explorer options":::

1. Select **Apply** and **OK** to save the change and close the dialog.

## Configure Internet Explorer for servers

To use Internet Explorer in Windows Servers, you have to disable the **Internet Explorer Enhanced Security Configuration** feature. This feature prohibits all desktop flows from properly launching an Internet Explorer or Automation browser instance via the **Launch new Internet Explorer** action. Additionally, it prevents web helpers from working as expected.

To disable the IEESC feature:

1. Launch **Server Manager** and select the **Local Server** tab.

1. Select **Internet Explorer Enhanced Security Configuration** to open the respective configuration dialog.

1. Disable the **IEESC** feature for both administrators and users.

    :::image type="content" source="media/install-browser-extensions/internet-explorer-servers.png" alt-text="Screenshot of the IEESC feature in the Local server settings.":::

1. Select **OK** to apply the changes.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
