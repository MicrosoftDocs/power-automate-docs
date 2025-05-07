---
title: Migration to Manifest V3 
description: Learn about the deprecation of Manifest V2 and migration to Manifest V3.
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 02/09/2023
ms.author: nimoutzo
ms.reviewer: matp
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Migration to Manifest V3

After a certain date that the respective products will announce, Google Chrome and Microsoft Edge browsers will no longer run Manifest V2 extensions. Until December 2022, the Power Automate browser extensions for both browsers were based on Manifest V2. Therefore, the web extensions must be migrated to Manifest V3 to be functional after the deprecation date (TBD).

A manifest file is the blueprint of an extension. It includes information such as the version number and the title of the extension and permissions it needs to run. Migrating from Manifest V2 to V3 will bring several structural changes to how browsers handle the extensions. Manifest V3 extensions enjoy enhancements in security, privacy, and performance. They can also use more contemporary open web technologies such as service workers and promises.

## Manifest V2 deprecation plan

> [!div class="mx-tableFixed"]
> | Timeframe | Microsoft Partner Center and Chrome Web Store changes | Microsoft Edge and Google Chrome changes |
> |-----------|-------------------------------------------------------|------------------------------------------|
> | July 2022 | No longer accepts new Manifest V2 extensions with visibility set as Hidden or Public. | No change |
> |TBD <br> Google Chrome, TBD <br> Microsoft Edge |No longer accepts updates to existing Manifest V2 extensions. Developers can submit updates for migrating a V2 extension to V3. |Both browsers will stop running Manifest V2 extensions. Enterprises can allow Manifest V2 extensions to run on both browsers using Enterprise policies. |
> |TBD <br> Google Chrome, TBD <br> Microsoft Edge |No change | Manifest V2 extensions will no longer function in both browsers even with the use of Enterprise policy. |

Chromium has revised the timelines for Manifest V2 sunset. We'll independently decide on Manifest V3 migration timelines for Microsoft Edge add-ons and share an update in this article. We continue to analyze the concerns raised by the extension developers and explore the optimal path for the Microsoft Edge add-ons ecosystem. Meanwhile, refer to the [Chromium timelines](https://developer.chrome.com/docs/extensions/mv3/mv2-sunset) for planning your extension's migration.

For more information, go to:

- [Manifest V2 support timeline](https://developer.chrome.com/docs/extensions/mv3/mv2-sunset/)
- [Overview and timelines for migrating to Manifest V3](/microsoft-edge/extensions-chromium/developer-guide/manifest-v3)

## Power Automate plan for deprecating Manifest V2 and migrating to V3

A new browser extension, **Microsoft Power Automate**, was released in December 2022. The extension follows the Manifest V3 standard, taking advantage of its benefits. The extension is compatible with Power Automate for desktop v2.27 (December 2022 release) or later. After the deprecation date (TBD), you should upgrade to Power Automate for desktop v2.27 (or later) and install the new extension.

The old web extension will continue to exist after the release of the new one. It will be renamed to **Microsoft Power Automate (Legacy)** and continue using Manifest V2. If you want to keep Power Automate for desktop v2.26 or earlier installed, use the legacy web extension until the deprecation date (TBD).  

After then, enterprise users have two options:

- Upgrade to Power Automate for desktop v2.27 or later and use the new browser extension.

- (Only for enterprises) Use Enterprise policies to allow Manifest V2 extensions to run on Microsoft Edge/Google Chrome. By enabling it, you may use Power Automate for desktop v2.26 or earlier and the legacy web extension until a date that will be announced by the respective products and will be a few months after the deprecation date (end of extension date). After the end of extension date (TBD), everyone must upgrade to Power Automate for desktop v2.27 or later.

After the deprecation date (TBD), users without the Enterprise policy applied must upgrade to Power Automate for desktop v2.27 or later and use the new browser extension.

## Run JavaScript function on web page action

> [!IMPORTANT]
> Due to security limitations issued by Mozilla Firefox, you can't use the **Run JavaScript function on web page** action with an instance of it. For this action, use one of the other browser options in your desktop flow.

Due to limitations in the way Manifest V3 works, injecting JavaScript on a web page is impossible when Developer tools are disabled by Group Policy, making the action not functional.

If you upgrade to Power Automate for desktop v2.27 or later and use the new browser extension, the **Run JavaScript function on web page** action will be functional with the use of its debugger capability.

The action won't be impacted if you use the legacy browser extension and Power Automate for desktop v2.26 or earlier.

When the action runs, you'll see a **"Microsoft Power Automate" started debugging this browser** message with no real effect on the execution.

> [!NOTE]
> The new version of the browser extension requires the browser's Developer tools to be enabled. The extension uses its debugger capabilities to run the JavaScript code of the respective action.

To ensure that Developer tools aren't disabled in Microsoft Edge, go to [Microsoft Edge - Policies](/deployedge/microsoft-edge-policies#developertoolsavailability).

To ensure that Developer tools aren't disabled in Google Chrome, go to [Chrome Enterprise policy](https://chromeenterprise.google/policies/#DeveloperToolsAvailability).

## Upgrade to Power Automate for desktop v2.27 (or later) and the new browser extension

With the December 2022 release of Power Automate for desktop, you're able to download and upgrade as usual.

The new browser extensions will be installed automatically during Power Automate installation. If you want to install them manually, go to [Install Power Automate browser extensions](install-browser-extensions.md).

## Extend the usage of Manifest V2 extensions

If you want to wait to install the new version of the browser extension, you can extend the use of the Manifest V2 extensions until the end of extension date (TBD). You can extend the use through an enterprise group policy. However, by the end of the extension date (TBD), you'll have to upgrade to the new version of the extension.

Google hasn't yet officially announced the way to enable the enterprise policy.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
