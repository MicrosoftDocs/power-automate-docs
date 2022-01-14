---
title: Using browsers and managing extensions | Microsoft Docs
description: Using browsers and managing extensions
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 09/22/2020
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Use browsers and manage extensions



To automate web-related tasks, Microsoft Power Automate provides the **Automation browser** that is preconfigured and works out of the box. 

Besides the **Automation browser**, the platform supports the four most popular browsers: **Microsoft Edge**, **Internet Explorer**, **Google Chrome**, and **Mozilla Firefox**. These browsers need additional configuration or/and browser extensions to work.

> [!IMPORTANT]
> To work with Microsoft edge, make sure you have a Chromium-based version installed. Older versions are not supported. 

## Configuring Internet Explorer

By default, **Internet Explorer** works in protected mode to prevent any external application from controlling it.

While Power Automate can still work with this setting enabled, it will not be able to clear the browser's cache or cookies.

To disable protected mode and allow Power Automate to clear the browser's cache and cookies:

1. Launch **Internet Explorer**, select the **gear icon**, and choose **Internet options** in the menu.

    ![Screenshot of the Internet Explorer options.](media/using-browsers/internet-explorer-options.png)

1. In the **Internet options** dialog box, navigate to the **Security** tab, select **Internet** zone, and disable the **Enable Protected Mode** option. Repeat the same step for the **Local intranet** and **Trusted sites** zones.

    ![Screenshot of the security tab in the Internet Explorer options.](media/using-browsers/internet-explorer-internet-protected-mode.png) 
    
    ![Screenshot of the Local intranet and Trusted sites zones in the Internet Explorer options.](media/using-browsers/internet-explorer-local-intranet-protected-mode.png)

1. Select **Apply** and **OK** to save the change and close the dialog box.

## Configuring Internet Explorer for servers

To use Internet Explorer in Windows Servers, you have to disable the **Internet Explorer Enhanced Security Configuration** feature.

This feature prohibits all flows from properly launching an **Internet Explorer** or **Automation browser** instance via the **Launch new Internet Explorer** action. Additionally, it prevents web helpers from working as expected. 

To disable the **IEESC** feature:

1. Launch the **Server Manager** and navigate to the **Local Server** tab.

1. Select the **Internet Explorer Enhanced Security Configuration** option to open the respective configuration dialog box.

1. Disable the **IEESC** feature for both administrators and users.

    ![Screenshot of the IEESC feature in the Local server settings.](media/using-browsers/internet-explorer-servers.png)

1. Select **OK** to apply the changes.

## Configuring Microsoft Edge

To use **Microsoft Edge** to automate web-related tasks, you have to install the respective browser extension.

To install the extension:

1. Launch **Flow Designer**, navigate to **Tools** -> **Browser extensions**, and select **Microsoft Edge**.

    ![Screenshot of the Microsoft Edge extension option in the flow designer.](media/using-browsers/edge-extension-option.png)

1. In the extension's webpage, select **Get** to install the extension. 

   ![Screenshot of the Get option in the extension's page.](media/using-browsers/edge-get-extension.png)

1. In the pop-up dialog box, select **Add extension** to confirm the installation. 

   ![Screenshot of the Add extension option in the extensions page.](media/using-browsers/edge-add-extension.png)

To ensure that **Microsoft Edge** works as expected with Power Automate, disable running background apps when Edge is closed. 

To disable this option, navigate to **Settings** -> **System** and select the **slider** next to **Continue running background apps when Microsoft Edge is closed**.

![Screenshot of the Microsoft Edge settings.](media/using-browsers/edge-options.png)

## Configuring Google Chrome

To use **Google Chrome** in Power Automate flows, you have to install the respective browser extension.

To install the extension:

1. Launch **Flow Designer**, navigate to **Tools** -> **Browser extensions**, and select **Google Chrome**.

    ![Screenshot of the Google Chrome extension option in the flow designer.](media/using-browsers/chrome-extension-option.png)

1. In the appeared webpage, select **Add to Chrome** to install the extension. 

   ![Screenshot of the Add to Chrome option in the extension's page.](media/using-browsers/chrome-add-extension.png)

1. In the pop-up dialog box, select **Add extension** to confirm the installation. 

   ![Screenshot of the extension installation options page.](media/using-browsers/chrome-add-extension-confirmation.png)

To ensure that **Google Chrome** works as expected with Power Automate, disable running background apps when Chrome is closed. 

To disable this option, navigate to **Settings** -> **Advanced** -> **System** and select the **slider** next to **Continue running background apps when Google Chrome is closed**.

![Screenshot of the Google Chrome settings.](media/using-browsers/chrome-options.png)

## Configuring Mozilla Firefox

To use **Mozilla Firefox** in Power Automate flows, you have to install the respective browser extension.

To install the extension:

1. Launch **Flow Designer**, navigate to **Tools** -> **Browser extensions**, and select **Firefox**.

    ![Screenshot of the Firefox extension option in the flow designer.](media/using-browsers/firefox-extension-option.png)

1. In the launched browser dialog box, select **Add** to install the extension. 

   ![Screenshot of the Add option in the extension's page.](media/using-browsers/firefox-add-extension.png)

1. In the appeared dialog box, select **Okay, Got it** to confirm the installation.

   ![Screenshot of the Okay, got it option in the extension's page.](media/using-browsers/firefox-add-extension-confirmation.png)

Firefox alerts that freeze the browser and prevent users from switching to other tabs or windows may impact flows' functionality. 

To disable this feature:

1. Populate the **URL bar** with the phrase **about:config**.

1. Search for the **prompts.tab_modal.enabled** preference in the resulting list and change it to **false**.

    ![Screenshot of the prompts.tab_modal.enabled preference in Firefox.](media/using-browsers/firefox-options.png)

## Using the actual Internet Explorer vs the Automation browser

Although **Automation browser** is based on **Internet Explorer**, it provides some features and limitations that increase automation effectiveness.

1. **Automation browser** works out of the box, while **Internet Explorer** requires additional configuration. Security configurations may be unwanted in organizations with strict security policies that prohibit manual changes. 

1. The **Click download link on web page** action works with the **Automation browser** whatever the **Internet Explorer** version. For the actual **Internet Explorer**, the action requires version 8 or below.

1. **Automation browser** suppresses all message dialog boxes that may pop up unhindered in the actual **Internet Explorer**. If this feature is undesirable, apply the **(ShowDialogs)** suffix at the end of the URL in the **Launch new Internet Explorer** action.

1. **Automation browser** doesn't support tabs or opening links in windows. When the user clicks on a link, the browser opens it in the same window/instance.

1. **Automation browser** has a small performance advantage because it doesn't load unnecessary elements and add-ons like the actual **Internet Explorer** does.





[!INCLUDE[footer-include](../includes/footer-banner.md)]