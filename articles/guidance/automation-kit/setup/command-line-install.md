---
title: Install the automation kit using the command line
description: Learn how to install the automation kit using the command line.
suite: flow
author: Grant-Archibald-MS
contributors:
  - Grant-Archibald-MS
  - v-aangie
ms.custom: guidance
ms.topic: conceptual
ms.date: 07/01/2024
ms.author: macarrer
ms.reviewer: angieandrews
---

# Install the automation kit using the command line

To install the latest version of the automation kit using the command line, follow the steps in this article. If you're unable to use the command line tools, you can use the manual steps  in [Set up the automation kit](./main.md) and [Set up satellites](./satellite.md).

1. Ensure that you have [enabled the Power Apps component framework feature](/power-apps/developer/component-framework/component-framework-for-canvas-apps#enable-the-power-apps-component-framework-feature) in the environments that you want to install the automation kit for both main and satellite environments.

1. Ensure that the [Creator Kit](https://appsource.microsoft.com/product/dynamics-365/microsoftpowercatarch.creatorkit1?tab=Reviews) is installed into the target environment

1. Open the latest release from the [automation kit](https://github.com/microsoft/powercat-automation-kit/releases) GitHub releases.

1. From the **Assets** section, download **AutomationKitInstall.zip** by selecting it.

1. On **Windows Explorer**, select the downloaded **AutomationKitInstall.zip** and open the **Properties** dialog.

1. Select **Unblock**.

1. Select **AutomationKitInstall.zip** > **Extract All**.

    A folder named **AutomationKitInstall** will be automatically created. You'll use this folder in step 11.

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

10. The PowerShell script will prompt you to create an installation configuration file using the [Automation Kit for Power Platform&mdash;Setup](https://microsoft.github.io/powercat-automation-kit/get-started/setup) pages (English version).

    If you'd like to view the automation kit for Power Platform pages in a language other than English, choose from the following AI generated versions:

    [Danish](https://microsoft.github.io/powercat-automation-kit/da/get-started/setup/), [Dutch (Netherlands)](https://microsoft.github.io/powercat-automation-kit/nl/get-started/setup/), [French](https://microsoft.github.io/powercat-automation-kit/es/get-started/setup/), [German](https://microsoft.github.io/powercat-automation-kit/da/get-started/setup/), [Italian](https://microsoft.github.io/powercat-automation-kit/it/get-started/setup/), [Japanese](https://microsoft.github.io/powercat-automation-kit/ja/get-started/setup/), [Korean](https://microsoft.github.io/powercat-automation-kit/ko/get-started/setup/), [Norwegian](https://microsoft.github.io/powercat-automation-kit/nb/get-started/setup/), [Polish](https://microsoft.github.io/powercat-automation-kit/pl/get-started/setup/), [Simplified Chinese](https://microsoft.github.io/powercat-automation-kit/th/get-started/setup/) [Spanish](https://microsoft.github.io/powercat-automation-kit/es/get-started/setup/), [Swedish](https://microsoft.github.io/powercat-automation-kit/sv/get-started/setup/), [Thai](https://microsoft.github.io/powercat-automation-kit/th/get-started/setup/).

    The setup configuration pages will provide you the following components:

    - Select configuration for main or satellite solutions.
  
    - Select users to assign to security groups.
  
    - Create connections required to install the solution.
  
    - Define environment variables.
  
    - (Optional) Define if sample data should be imported.

    - (Optional) Enable Power Automate flows contained in the solutions to be enabled.

1. After you complete the website setup steps, copy downloaded **automation-kit-main-install.json** or **automation-kit-satellite-install.json** file to the **AutomationKitInstall** folder.

    The **AutomationKitInstall** folder was automatically created when you extracted files in step 7.

1. Once the file is downloaded, the script will prompt for **y** to install the main solution and **n** to install satellite solution.

    The install will upload start the install with the defined settings.
