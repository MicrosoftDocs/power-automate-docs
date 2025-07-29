---
title: Install Power Automate browser extensions
description: Learn how to install Power Automate for desktop browser extensions.
author: mattp123
ms.topic: how-to
ms.date: 02/02/2023
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

Power Automate also supports the four most popular browsers: Microsoft Edge, Internet Explorer, Google Chrome, and Mozilla Firefox. These browsers need extra setup and extensions to work with Power Automate.

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

# Set up up WebDrivers 
Web automation can also be performed using WebDriver as an alternative to browser extensions. To use this method, you need to manually install the appropriate WebDriver for your browser and ensure it matches the browser version. This section provides setup instructions for each supported browser.

>[!Important]
> - Power Automate for desktop will only detect WebDrivers placed in the folder: %LocalAppData%\Microsoft\Power Automate Desktop\WebDrivers. Make sure the executable is not renamed and is not nested inside additional subfolders.
> - Only WebDrivers built for the x64 architecture are supported.

## Set up WebDriver for Mozilla Firefox
To use WebDriver with Mozilla Firefox, setup the geckodriver utility:

1. Check your Firefox version
- Open Firefox and go to: about:support
- Look for the "Version" value under the "Application Basics" section.

2. Download the matching geckodriver
- Go to the official page for geckodriver: https://firefox-source-docs.mozilla.org/testing/geckodriver/index.html 
- Find a version that supports your Firefox version (typically, the latest geckodriver supports recent versions of Firefox).
- Click the appropriate download link that is of win x64 architecture.

3. Setup the Geckodriver
- Extract the contents of the archive.
- Copy the geckodriver.exe file into: %LocalAppData%\Microsoft\Power Automate Desktop\WebDrivers


## Set up WebDriver for Google Chrome
To use WebDriver with Google Chrome, set up a ChromeDriver version that matches your browser version.

1. Check your Google Chrome version
- Open Chrome and go to: chrome://settings/help
- Note the version number (e.g., 138.0.7204.169). 

2. Download the matching ChromeDriver
- Go to the official ChromeDriver page: https://developer.chrome.com/docs/chromedriver
- On the downloads page, click the version that matches the version of your Chrome browser (typically the three first numbers of the version must match).
- Click the appropriate download link that is of win x64 architecture.

3.	Setup the ChromeDriver
- After downloading the ZIP file, extract it.
- Copy the chromedriver.exe file into the following folder: %LocalAppData%\Microsoft\Power Automate Desktop\WebDrivers

## Set up the WebDriver for Microsoft Edge
To use WebDriver as the browser interaction method for Microsoft Edge, you must install the Microsoft Edge WebDriver that matches your browser version:

1.	Check your Microsoft Edge version
- Open Microsoft Edge and navigate to: edge://settings/help
- Note the four-part version number of your browser (e.g., 138.0.3351.109).
2.	Download the matching WebDriver
- Go to the official Microsoft Edge WebDriver download page: https://developer.microsoft.com/microsoft-edge/tools/webdriver/
- In the Downloads section find the version number that matches your Edge version (typically the three first numbers of the version must match).
- Click the appropriate download link that is of win x64 architecture. 
- If you need an older version, click go to full directory under the Recent versions section to browse and download older releases.
3.	Set up the WebDriver
- After downloading the WebDriver extract the contents of the ZIP file.
- Copy the msedgedriver.exe file into the following folder on your machine: %LocalAppData%\Microsoft\Power Automate Desktop\WebDrivers


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
