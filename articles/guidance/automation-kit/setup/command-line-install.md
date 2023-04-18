---
title: Install the Automation Kit using the command line
description: Learn how to install the Automation Kit using the command line.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
contributors:
  - Grant-Archibald-MS
  - v-aangie
editor: ''
ms.custom: guidance
ms.devlang: na
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/21/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Install the Automation Kit using the command line

To install the latest version of the Automation Kit using the command line, follow the steps in this article. If you're unable to use the command line tools, you can use the manual steps  in [Set up the Automation Kit](./main.md) and [Set up satellites](./satellite.md).

1. Ensure that you have [enabled the Power Apps component framework feature](/power-apps/developer/component-framework/component-framework-for-canvas-apps#enable-the-power-apps-component-framework-feature) in the environments that you want to install the Automation Kit for both Main and Satellite. environments.

1. Ensure that the [Creator Kit](https://appsource.microsoft.com/product/dynamics-365/microsoftpowercatarch.creatorkit1?tab=Reviews) is installed into the target environment

1. Open the latest release from the [Automation Kit](https://github.com/microsoft/powercat-automation-kit/releases) GitHub releases.

1. From the **Assets** section, download **AutomationKitInstall.zip** by selecting it.

1. On **Windows Explorer**, select the downloaded **AutomationKitInstall.zip** and open the **Properties** dialog.

1. Select **Unblock**.

1. Select **AutomationKitInstall.zip** and use context menu to **Extract All**.

1. Ensure that you have the [Power Platform CLI](/power-platform/developer/cli/introduction) installed.

1. Execute the PowerShell script using the following command line.

```cmd
cd AutomationKitInstall
powershell Install_AutomationKit.ps1
```

>[!NOTE]
>
>Depending on your PowerShell execution policy, you might need to run the following command.

```cmd
Unblock-File Install_AutomationKit.ps1
```

10. The PowerShell script will prompt you to create an installation configuration file using [Automation Kit for Power Platform&mdash;Setup](https://microsoft.github.io/powercat-automation-kit/get-started/setup).

    The setup configuration pages will provide you the following components:

    - Select configuration for main or satellite solutions.
  
    - Select users to assign to security groups.
  
    - Create connections required to install the solution.
  
    - Define environment variables.
  
    - (Optional) Define if sample data should be imported.

    - (Optional) Enable Power Automate flows contained in the solutions to be enabled.

1. After you complete the website setup steps, copy downloaded **automation-kit-main-install.json** or **automation-kit-satellite-install.json** file to the **AutomationKitInstall** folder in step 9.

1. Once the file is downloaded, the script will prompt for **y** to install the main solution and **n** to install satellite solution.

    The install will upload start the install with the defined settings.
