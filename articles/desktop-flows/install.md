---
title: Install Power Automate
description: See how to install Power Automate on your device.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 12/06/2022
ms.author: gtrantzas
ms.reviewer: pefelesk
contributors:
search.app: 
  - Flow 
search.audienceType: 
  - flowmaker
  - enduser
---

# Install Power Automate

Before installing Power Automate, make sure that your device meets the [system requirements](requirements.md).

You can download and install Power Automate through an MSI installer or Microsoft Store. Both options provide the same functionality and features, but the Microsoft Store installation doesn't require users to have admin rights to install.

>[!IMPORTANT]
>
>- Although deploying MSI and Microsoft Store installations on the same machine is possible, duplicate installations may cause issues and aren't recommended.
>- By default, Power Automate for desktop honors the proxy settings specified in Windows. To override this configuration, refer to [Power Automate for desktop using a proxy server](governance.md#configure-power-automate-for-desktop-to-interact-with-a-corporate-proxy-server).

## Install Power Automate using MSI installer

1. [Download the Power Automate installer](https://go.microsoft.com/fwlink/?linkid=2102613).

1. Run the **Setup.Microsoft.PowerAutomate.exe** file.

   **Note**: This file is likely in your **Downloads** folder after you downloaded it in the previous step.

1. Follow the instructions in the **Power Automate for desktop setup** installer to complete the installation.

1. Make your selections for each feature for the installation to complete.

    The installer allows you to install two different applications on your device.

    - **Power Automate for desktop** is the app to build your desktop flows. With it, you can create, edit, and run your automations. To learn more about the desktop flow designer, go to [Power Automate desktop flow designer](./flow-designer.md).

    - **Power Automate machine runtime app** allows you to connect your machine to the Power Automate cloud and harness the full power of your robotic process automation (RPA). To learn more about machine management, go to [Manage machines](./manage-machines.md).

    Additionally, you can:

    - Add the WebDriver and ChromeDriver components to run desktop flows created with Selenium IDE. To learn more about how to install Selenium IDE, go to [Selenium IDE](#install-selenium-ide-optional).

    - Install the required files for UI automation in Java applets. Before installing, close all Java-related processes.

    During installation, you can also change the default options if you don't want to send usage data to Microsoft. To do so, uncheck **Optional data collection**. To find more information about data collection, go to [Data collection](diagnostic-data.md).

    >[!IMPORTANT]
    >Sharing usage data with Microsoft may help the support department solve Power Automate issues.

    :::image type="content" source="media/desktop-flows-setup/installer-checkboxes.png" alt-text="Screenshot of the installation details.":::

## Install Power Automate through Microsoft Store

1. There are three ways to find Power Automate in Microsoft Store.

    - Launch Microsoft Store and search for **Power Automate for desktop**.

    - Open a browser and go to [this Microsoft Store page](https://www.microsoft.com/store/productId/9NFTCH6J7FHV). Then, select **Get in Store app** to launch Microsoft Store on your device.

    - Go to the [Power Automate product page](https://flow.microsoft.com/desktop/) and select the appropriate option for installing.

1. After Microsoft Store is open, select **Get** to download and install Power Automate.

## Install an on-premises data gateway

> [!IMPORTANT]
> Gateways for desktop flows are now deprecated except for China region. Switch to our machine-management capabilities. To learn more, go to [Switch from gateways to direct connectivity](manage-machines.md#switch-from-gateways-to-direct-connectivity).

Power Automate enables you to [trigger your desktop flows from cloud flows](trigger-desktop-flows.md). To take advantage of this feature, you need to install an on-premises data gateway on your device.

On-premises data gateways establish the required cloud connectivity and must be installed on each device on which you'll trigger desktop flows. They aren't required if you only want to create, edit, and test your desktop flows on these devices.

When you install an on-premises data gateway, it defaults to the region that Power Automate uses.

To find more information regarding on-premises data gateways, go to [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).

## Install Selenium IDE (optional)

Selenium IDE is an open source tool that enables you to record and playback human interactions on websites.

With desktop flows, you can run Selenium IDE scripts from Power Automate and keep them stored securely (with appropriate IT governance) in Dataverse.

To install Selenium IDE:

1. Install and enable the Windows recorder (v1) extension for [Microsoft Edge](https://go.microsoft.com/fwlink/?linkid=2151412) or [Google Chrome](https://go.microsoft.com/fwlink/?linkid=2150930).

1. Download and install the [Selenium IDE extension](https://go.microsoft.com/fwlink/?linkid=2107665) for Microsoft Edge (version 80 or later) or Google Chrome.

    For Microsoft Edge, select **Allow extensions from other stores** in the browser settings, and then select **Add to Chrome** in the extension page.

## Uninstall Power Automate

1. Open the **Start** menu > **Settings** > **Apps**.

1. Search for **Power Automate**, and then select it.

1. Select **Uninstall**.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
