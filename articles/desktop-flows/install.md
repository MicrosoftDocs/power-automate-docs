---
title: Install Power Automate
description: Learn how to install Power Automate for desktop on your device.
author: georgiostrantzas
ms.topic: how-to
ms.date: 02/24/2023
ms.author: pefelesk
ms.reviewer: gtrantzas
contributors:
search.audienceType: 
  - flowmaker
  - enduser
ms.subservice: desktop-flow
ms.service: power-automate
ms.custom: bap-template
---

# Install Power Automate

>[!WARNING]
> We've identified a potential issue with Power Automate for desktop where your runs may fail after the June 13th 2023 Windows updates.
> Details about the update: [.NET Framework June 2023 Security and Quality Rollup - .NET Blog (microsoft.com)](https://devblogs.microsoft.com/dotnet/dotnet-framework-june-2023-security-and-quality-rollup/)
> 
> **How does this affect me?:**
> - Desktop Flows may start to fail with the error “CredentialAuthenticationFailed” or “GeneralScriptExecutionError” 
> - All Power Automate for desktop versions 2.28 or higher may be impacted.
> 
> **What action do I need to take?:**
>
> Upgrade PAD to the latest version: [2.33]( https://go.microsoft.com/fwlink/?linkid=2102613) 
>
> If you need to stick to an older version, patched updates will be provided for the versions below:
> - [2.28](https://go.microsoft.com/fwlink/?linkid=2239808)
> - [2.29](https://go.microsoft.com/fwlink/?linkid=2239591)
> - [2.30](https://go.microsoft.com/fwlink/?linkid=2239716)
> - [2.31](https://go.microsoft.com/fwlink/?linkid=2239809)
> - [2.32](https://go.microsoft.com/fwlink/?linkid=2239592)

Before you install Power Automate on your device, make sure that it meets the [system requirements](requirements.md).

> [!IMPORTANT]
>
> - Selenium IDE is deprecated and will no longer work after February 28th, 2023.
> - Windows recorder (V1) is deprecated and no longer works.
> - Migrate your flows created with these solutions to Power Automate for desktop or delete them.

You can download and install Power Automate [using an MSI installer](#install-power-automate-using-the-msi-installer) or [from Microsoft Store](#install-power-automate-from-microsoft-store). Microsoft Store installation doesn't require you to have admin rights on your device.

You should choose one option only. Duplicate installations on the same machine may cause issues and isn't recommended.

By default, Power Automate for desktop honors the proxy settings specified in Windows. To override this configuration, refer to [Power Automate for desktop using a proxy server](governance.md#configure-power-automate-for-desktop-to-interact-with-a-corporate-proxy-server).

## Install Power Automate using the MSI installer

1. [Download the Power Automate installer](https://go.microsoft.com/fwlink/?linkid=2102613). Save the file to your desktop or Downloads folder.

1. Run the **Setup.Microsoft.PowerAutomate.exe** file.

1. Follow the instructions in the **Power Automate for desktop setup** installer.

1. Make your selections for each feature:

    - **Power Automate for desktop** is the app you use to build, edit, and run desktop flows.

    - **Machine-runtime app** allows you to connect your machine to the Power Automate cloud and harness the full power of robotic process automation (RPA). [Learn more about machine management](./manage-machines.md).

    <!-- EDITOR'S NOTE: If Selenium IDE is no longer supported, this article shouldn't talk about installing it. -->
    - Install required files for UI automation in Java applets. Close all Java-related processes before you install these files.

    - Clear **Optional data collection** if you don't want to send usage data to Microsoft to help us troubleshoot issues with Power Automate. [Learn more about data collection](diagnostic-data.md).

      :::image type="content" source="media/desktop-flows-setup/installer-checkboxes.png" alt-text="Screenshot of Power Automate for desktop installation details.":::

1. Select the check box to agree to the terms of use, and then select **Install**.

## Install Power Automate from Microsoft Store

1. Find Power Automate in Microsoft Store:

    - Launch Microsoft Store and search for **Power Automate for desktop**.

    - Open a browser and go to [this Microsoft Store page](https://www.microsoft.com/store/productId/9NFTCH6J7FHV). Then, select **Get in Store app** to launch Microsoft Store on your device.

    - Go to the [Power Automate product page](https://make.powerautomate.com/desktop/) and select the appropriate option for installing.

1. After Microsoft Store is open, select **Get** to download and install Power Automate.

## Install an on-premises data gateway

> [!NOTE]
> Gateways for desktop flows are deprecated except for China region. Switch to our machine-management capabilities. Learn more about [switching from gateways to direct connectivity](manage-machines.md#switch-from-gateways-to-direct-connectivity).

Power Automate enables you to [trigger your desktop flows from cloud flows](trigger-desktop-flows.md). To take advantage of this feature, you need to install an on-premises data gateway on your device.

On-premises data gateways establish the required cloud connectivity and must be installed on each device on which you'll trigger desktop flows. They aren't required if you only want to create, edit, and test your desktop flows on these devices.

When you install an on-premises data gateway, it defaults to the region that Power Automate uses. [Learn how to install an on-premises data gateway](/data-integration/gateway/service-gateway-install).

## Install Selenium IDE (optional)

> [!IMPORTANT]
>
> Selenium IDE is deprecated and will no longer work after February 28th, 2023. Migrate your flows to Power Automate for desktop or delete them.

Selenium IDE is an open source tool that enables you to record and playback human interactions on websites. With desktop flows, you can run Selenium IDE scripts from Power Automate and keep them stored securely (with appropriate IT governance) in Dataverse.

1. Install and enable the Windows recorder (v1) extension for [Microsoft Edge](https://go.microsoft.com/fwlink/?linkid=2151412) or [Google Chrome](https://go.microsoft.com/fwlink/?linkid=2150930).

1. Download and install the [Selenium IDE extension](https://go.microsoft.com/fwlink/?linkid=2107665) for Microsoft Edge (version 80 or later) or Google Chrome.

    For Microsoft Edge, select **Allow extensions from other stores** in the browser settings, and then select **Add to Chrome** in the extension page.

## Uninstall Power Automate

1. Open the **Start** menu > **Settings** > **Apps**.

1. Search for **Power Automate**, and then select it.

1. Select **Uninstall**.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
