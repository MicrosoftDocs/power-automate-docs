---
title: Using browsers and managing extensions | Microsoft Docs
description: Using browsers and managing extensions
author: georgiostrantzas
ms.service: flow
ms.topic: article
ms.date: 09/09/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Using browsers and managing extensions

To automate web-related tasks, **Power Automate Desktop** provides the **Automation browser** that is preconfigured and works out of the box. 

Besides the **Automation browser**, the platform supports the four most popular browsers: **Microsoft Edge**, **Internet Explorer**, **Google Chrome**, and **Mozilla Firefox**. These browsers need additional configuration or/and browser extensions to work.

## Configuring Internet Explorer

By default, **Internet Explorer** works in protected mode to prevent any external application from controlling it.

To disable this mode and allow **Power Automate Desktop** to handle the browser:

1. Launch **Internet Explorer**, select the **gear icon**, and choose **Internet options** in the menu.

1. In the **Internet options** dialog, navigate to the **Security** tab, select **Internet** zone, and disable the **Enable Protected Mode** option.

1. Repeat the same step for the **Local intranet** and **Trusted sites** zones.

1. Select **Apply** and **OK** to save the change and close the dialog.

## Configuring Internet Explorer for servers

To use Internet Explorer in Windows Servers, you have to disable the **Internet Explorer Enhanced Security Configuration** feature.

This feature prohibits all flows from properly launching an **Internet Explorer** or **Automation browser** instance via the **Launch New Internet Explorer** action. Additionally, it prevents web helpers from working as expected. 

To disable the **IEESC** feature:

1. Launch the **Server Manager** and navigate to the **Local Server** tab.

1. Select the **IE Enhanced Security Configuration** option to open the respective configuration dialog.

1. Disable the **IEESC** feature for both administrators and users.

1. Select **OK** to apply the changes.

## Configuring Microsoft Edge

To use **Microsoft Edge** to automate web-related tasks, you have to install the respective browser extension.

To install the extension:

1. Launch **Flow Designer**, navigate to **Tools** -> **Browser extensions**, and select **Microsoft Edge**.

1. In the extension's webpage, select **Get** to install the extension. 

1. In the pop-up dialog, select **Add extension** to confirm the installation. 

To ensure that **Microsoft Edge** works as expected with **Power Automate Desktop**, disable running background apps when Edge is closed. 

To disable this option, navigate to **Settings** -> **System** and select the slider icon next to **Continue running background apps when Microsoft Edge is closed**.

## Configuring Google Chrome

To use **Google Chrome** in **Power Automate Desktop** flows, you have to install the respective browser extension.

To install the extension:

1. Launch **Flow Designer**, navigate to **Tools** -> **Browser extensions**, and select **Google Chrome**.

1. In the appeared webpage, select **Add to Chrome** to install the extension. 

1. In the pop-up dialog, select **Add extension** to confirm the installation. 

To ensure that **Google Chrome** works as expected with **Power Automate Desktop**, disable running background apps when Chrome is closed. 

To disable this option, navigate to **Settings** -> **Advanced** -> **System** and select the slider icon next to **Continue running background apps when Google Chrome is closed**.

## Configuring Mozilla Firefox

To use **Mozilla Firefox** in **Power Automate Desktop** flows, you have to install the respective browser extension.

To install the extension:

1. Launch **Flow Designer**, navigate to **Tools** -> **Browser extensions**, and select **Firefox**.

1. In the launched browser dialog, select **Add** to install the extension. 

1. In the appeared dialog, select **Okay, Got it** to confirm the installation.

Firefox alerts that freeze the browser and prevent users from switching to other tabs or windows may impact flows' functionality. 

To disable this feature:

1. Populate the URL bar with the phrase **about:config**.

1. Search for the **prompts.tab_modal.enabled** preference in the resulting list and change it to **false**.





