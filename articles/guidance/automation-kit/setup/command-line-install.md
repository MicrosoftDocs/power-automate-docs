---
title: Command Line Install of the Automation Kit | Microsoft Docs
description: Command Line Install of the Automation Kit.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
manager: marcsc
editor: ''
ms.custom: guidance

ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/07/2022
ms.author: grarchib
---

# Command Line Install

To install the latest version of the Automation Kit using the command line, you can use the following steps below. If you are unable to use the command line tools, you can use the manual steps documented in [Main](./main.md) and [Satellite](./satellite.md).

1. Ensure that you have <a ref='/power-apps/developer/component-framework/component-framework-for-canvas-apps#enable-the-power-apps-component-framework-feature' target="_blank">Enable the Power Apps component framework feature</a> in the environments that you want to install the Automation Kit for both Main and Satellite environments.

1. Ensure that the <a href="https://appsource.microsoft.com/product/dynamics-365/microsoftpowercatarch.creatorkit1?tab=Reviews" target="_blank">Creator Kit installed</a> into the environments hat you wish to install into

1. Open the latest release from the <a href="https://github.com/microsoft/powercat-automation-kit/releases" target="_blank">Automation Kit GitHub Releases</a>

1. Download the **AutomationKitInstall.zip** from the Assets section

1. In the Windows Explorer, select the downloaded **AutomationKitInstall.zip** and open the properties dialog

1. Select the **Unblock** button

1. Select **AutomationKitInstall.zip** and use context menu to **Extract All**

1. Ensure that you have the <a href="/power-platform/developer/cli/introduction" target="_blank">Power Platform CLI</a> installed

1. Execute the PowerShell script using the following command line

```cmd
cd AutomationKitInstall
powershell Install_AutomationKit.ps1
```

NOTE:

1. Depending on your PowerShell execution policy, you may need to run the following command

```cmd
Unblock-File Install_AutomationKit.ps1
```

1. The PowerShell script will prompt you to create an installation configuration file using [Install Setup](/get-started/setup). The setup configuration pages will provide you the following

    - Select configuration for main or satellite solutions
    - Select users to assign to security groups
    - Create connections required to install the solution
    - Define environment variables
    - Optionally define if sample data should be imported
    - Optionally Enable Power Automate Flows contained in the solutions should be enabled

1. After you complete the website setup steps you can copy downloaded **automation-kit-main-install.json** or **automation-kit-satellite-install.json** file to the **AutomationKitInstall** folder above

1. Once the file is downloaded the script will prompt for **y** to install the main solution, **n** to install satellite solution

1. The install will then upload start the install with the defined settings
