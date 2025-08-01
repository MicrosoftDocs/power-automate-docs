---
title: Install Power Automate browser extensions
description: Learn how to install Power Automate for desktop browser extensions.
author: mattp123
ms.topic: how-to
ms.date: 08/01/2025
ms.author: pefelesk
ms.reviewer: matp
contributors:
- NikosMoutzourakis
search.audienceType: 
  - flowmakers
  - enduser
ms.subservice: desktop-flow
ms.service: power-automate
ms.custom:
  - bap-template
  - sfi-image-nochange
---

# Install Power Automate browser extensions

To automate web-related tasks, Power Automate provides a built-in Automation browser that's set up for you and works out of the box.

Power Automate also supports the four most popular browsers: Microsoft Edge, Internet Explorer, Google Chrome, and Mozilla Firefox. These browsers need extra setup and extensions or WebDrivers to work with Power Automate for desktop.

## Install browser extensions

When installation of Power Automate for desktop is complete, the installer prompts you to install the Power Automate extension for your browser. The links in the installer send you to the appropriate extension store.

:::image type="content" source="media/desktop-flows-setup/screen.png" alt-text="Screenshot of the Power Automate for desktop installation success confirmation.":::

If you skip the automatic installation of the browser extension, you can do it yourself later. Use the following links or go through the **Tools** > **Browser extensions** options in the [flow designer](flow-designer.md).

For Power Automate for desktop v2.27 or later:

- [Microsoft Edge](https://microsoftedge.microsoft.com/addons/detail/microsoft-power-automate/kagpabjoboikccfdghpdlaaopmgpgfdc)
- [Google Chrome](https://chrome.google.com/webstore/detail/microsoft-power-automate/ljglajjnnkapghbckkcmodicjhacbfhk)
- [Mozilla Firefox](https://addons.mozilla.org/en-US/firefox/addon/microsoft-power-automate/)

For Power Automate for desktop v2.26 or earlier (legacy):

- [Microsoft Edge](https://microsoftedge.microsoft.com/addons/detail/microsoft-power-automate/njjljiblognghfjfpcdpdbpbfcmhgafg)
- [Google Chrome](https://chrome.google.com/webstore/detail/microsoft-power-automate/gjgfobnenmnljakmhboildkafdkicala)

### Alternative ways to install browser extensions

After Power Automate for desktop version 2.27, the Microsoft Edge, Google Chrome, and Mozilla Firefox browser extensions are part of the installation. Find the extension files in the following path: **C:\Program Files (x86)\Power Automate Desktop\BrowserExtensions**.

#### Install extension for Microsoft Edge

1. Go to **Edge extensions** through the browser's settings or enter **edge://extensions/** in the address bar.

1. Make sure that **Developer mode** is turned on.

1. While you are on the Edge extension page, drag and drop the extension file in the area.

#### Install extension for Google Chrome

1. Go to **Chrome extensions** through the browser's settings or enter **chrome://extensions/** in the address bar.

1. Make sure that **Developer mode** is turned on.

1. While you are on the Chrome extension page. drag and drop the extension file in the area.

#### Install extension for Mozilla Firefox

1. Go to the **Firefox Add-ons Manager** through the browser's settings or enter **about:addons** in the address bar.

1. Select the gear icon, and then select **Install Add-on From File…**.

1. Browse to the browser extension folder of your Power Automate installation.

1. Select **Open**, and then select **Add**.

Alternatively, you can launch Mozilla Firefox and drag the extension file to the browser window.

# Set up WebDrivers

You can perform web automation with WebDriver as an alternative to browser extensions. To use this method, manually install the appropriate WebDriver for your browser and ensure it matches the browser version. This section provides setup instructions for each supported browser.

> [!IMPORTANT]
> - Power Automate for desktop detects WebDrivers placed in the folder: `%LocalAppData%\Microsoft\Power Automate Desktop\WebDrivers`. Make sure you don't rename the executable and don't nest it inside additional subfolders.
> - Only WebDrivers built for the x64 architecture are supported.

## Set up WebDriver for Mozilla Firefox

To use WebDriver with Mozilla Firefox, set up the geckodriver utility:

1. Check your Firefox version
    1. Open Firefox and go to `about:support` in the address bar.
    1. Look for the **Version** value under the **Application Basics** section.

1. Download the matching Geckodriver
    1. Go to the official page for geckodriver: [https://firefox-source-docs.mozilla.org/testing/geckodriver/index.html](https://firefox-source-docs.mozilla.org/testing/geckodriver/index.html)
    1. Find a version that supports your Firefox version (typically, the latest Geckodriver supports recent versions of Firefox).
    1. Select the appropriate Geckodriver download link that's for the win-x64 architecture.

1. Set up the Geckodriver
    1. Extract the contents of the archive.
    1. Create a new folder named **WebDrivers** under the following directory: **AppData\Local\Microsoft\Power Automate Desktop**
    1. Copy the Geckodriver.exe file into the folder you created: "AppData\Local\Microsoft\Power Automate Desktop\WebDrivers"

## Set up WebDriver for Google Chrome

To use WebDriver with Google Chrome, set up a ChromeDriver version that matches your browser version.

1. Check your Google Chrome version
    1. Open Chrome and go to `chrome://settings/help` in the address bar.
    1. Note the version number (for example, 138.0.7204.169).

1. Download the matching ChromeDriver
    1. Go to the official ChromeDriver page: [https://developer.chrome.com/docs/chromedriver](https://developer.chrome.com/docs/chromedriver).
    1. On the downloads page, select the version that matches the version of your Chrome browser (typically the first three numbers of the version must match).
    1. Select the appropriate ChromeDriver download link that is for the win-x64 architecture.

1. Set up the ChromeDriver
    1. After downloading the ZIP file, extract it.
    1. Create a new folder named **WebDrivers** in the following directory: `AppData\Local\Microsoft\Power Automate Desktop`.
    1. Copy the `chromedriver.exe` file into the folder you just created: `AppData\Local\Microsoft\Power Automate Desktop\WebDrivers`.

## Set up the WebDriver for Microsoft Edge

To use WebDriver as the browser interaction method for Microsoft Edge, you must install the Microsoft Edge WebDriver that matches your browser version:

1. Check your Microsoft Edge version
    1. Open Microsoft Edge and go to `edge://settings/help` in the address bar.
    1. Note the four-part version number of your browser (for example, 138.0.3351.109).
    1. Download the matching WebDriver
    1. Go to the official Microsoft Edge WebDriver download page: [https://developer.microsoft.com/microsoft-edge/tools/webdriver/](https://developer.microsoft.com/microsoft-edge/tools/webdriver/)
    1. In the Downloads section, find the version number that matches your Edge version (typically the first three numbers of the version must match).
    1. Select the appropriate WebDriver download link for the win-x64 architecture
    1. If you need an older version, select **go to full directory** under the Recent versions section to browse and download older releases.
1. Set up the WebDriver
    1. After downloading the WebDriver, extract the contents of the ZIP file.
    1. Create a new folder named **WebDrivers** under the following directory: **AppData\Local\Microsoft\Power Automate Desktop**
    1. Copy the **msedgedriver.exe** file into the following folder on your machine: **AppData\Local\Microsoft\Power Automate Desktop\WebDrivers**

# Set up browsers

To make sure that your browser works as expected with Power Automate, you'll need to turn off a couple of features.

- Microsoft Edge: Go to **Settings** > **System** and turn off **Continue running background apps when Microsoft Edge is closed**.

- Google Chrome: Go to **Settings** > **Advanced** > **System** and turn off **Continue running background apps when Google Chrome is closed**.

- Mozilla Firefox: Firefox alerts that freeze the browser and prevent users from switching to other tabs or windows may affect your desktop flows. Turn off this feature.

  1. Enter **about:config** in the address bar.
  1. Search for the **prompts.tab_modal.enabled** preference in the list and change it to **false**.

- Internet Explorer: By default, Internet Explorer works in protected mode to prevent any external application from controlling it. While Power Automate can still work with this setting turned on, it won't be able to clear the browser's cache or cookies. Turn off protected mode.

  1. Select the **gear icon**, and then select **Internet options**.
  1. Navigate to **Security** > **Internet** and turn off **Enable Protected Mode**. Repeat the same step for the **Local intranet** and **Trusted sites** zones.

        :::image type="content" source="media/install-browser-extensions/internet-explorer-internet-protected-mode.png" alt-text="Screenshot of the security tab in Internet Explorer options.":::

  1. Select **OK**.

- Internet Explorer for servers: To use Internet Explorer in Windows Servers, you must turn off **Internet Explorer Enhanced Security Configuration**. This feature prohibits all desktop flows from properly launching an Internet Explorer or Automation browser instance through the **Launch new Internet Explorer** action. Additionally, it prevents web helpers from working as expected.

  1. Launch **Server Manager** and select the **Local Server** tab.

  1. Select **Internet Explorer Enhanced Security Configuration**.

  1. Turn off **IEESC** for both administrators and users.

      :::image type="content" source="media/install-browser-extensions/internet-explorer-servers.png" alt-text="Screenshot of the IEESC feature in the Internet Explorer Local server settings.":::

  1. Select **OK**.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
