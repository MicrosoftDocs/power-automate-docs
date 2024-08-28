---
title: Set screen resolution on unattended mode
description: Set screen resolution on unattended mode
author: fredgGitHub
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 03/04/2024
ms.author: iomavrid
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---
# Set screen resolution on unattended mode

In some scenarios, Power Automate might run unattended flows in a lower resolution than the one used to develop the flows. As a result, some UI elements could be hidden from the screen, while any images captured might not be identified at runtime under a different resolution. This might cause flows to fail. In such cases, you can follow one of the two approaches explained in this article to adjust the screen resolution used for unattended flows accordingly.

> [!NOTE]
> The screen resolution can be adjusted per target machine, not per flow. If you need one of your unattended flows to run in another resolution, a different target machine needs to be used.

## With Windows registry

Set the screen resolution for unattended flows using the Window registry. This method can be used with Power Automate flows starting with version 2.35.

> [!IMPORTANT]
> Setting the **ScreenResolutionEnabled** registry key to 1 overrides the settings in the UIFlowService.exe.config file. The registry settings for screen resolution persist after an upgrade of Power Automate Desktop, the **UIFlowService.exe.config** file is overwritten with default values during upgrades.

Open the registry editor (Windows key + R, and type 'regedit'), and then set the following values.

| Hive | Key | Name | Type | Description |
|---|---|---|---|---|
| HKEY_LOCAL_MACHINE | SOFTWARE\WOW6432Node\Microsoft\Power Automate Desktop\Global\Screen | ScreenResolutionEnabled | DWORD | If set to '1', will enable the custom resolution settings. |
| HKEY_LOCAL_MACHINE | SOFTWARE\WOW6432Node\Microsoft\Power Automate Desktop\Global\Screen | Width | DWORD | Set the screen resolution width. |
| HKEY_LOCAL_MACHINE | SOFTWARE\WOW6432Node\Microsoft\Power Automate Desktop\Global\Screen | Height | DWORD | Set the screen resolution height. |
| HKEY_LOCAL_MACHINE | SOFTWARE\WOW6432Node\Microsoft\Power Automate Desktop\Global\Screen | Scale | DWORD | Set the screen resolution scale. |

When editing DWORD values, be sure to select the decimal base (hexadecimal is selected by default), to avoid having your values interpreted as hexadecimal which will result in incorrect resolution settings.

   ![Screenshot of the registry DWORD edit window with decimal base selected.](media/set-screen-resolution-unattended-mode/WidthRegDwordDecimalBase.png)

## With UIFlowService.exe.config file

> [!IMPORTANT]
> The **UIFlowService.exe.config** file is overwritten with default values during upgrades and screen resolution settings will therefore be reset. We recommend setting the resolution with registry settings instead.

To change the resolution in which unattended flows are run by editing the UIFlowService.exe.config:

1. Go to **C:\Program Files (x86)\Power Automate Desktop**, and then open the **UIFlowService.exe.config** file.

1. Set the value of the **Microsoft.Flow.RPA.UIFlowService.ScreenDefaultResolutionEnabled** element to **true**.

    ``` XML
    <add key="Microsoft.Flow.RPA.UIFlowService.ScreenDefaultResolutionEnabled" value="true" />
    ```

1. Change the values of the following elements to the proper screen resolution width, height, and scale, respectively. The following code sets the default resolution to 1920 x 1,080 pixels.

    ``` XML
    <add key="Microsoft.Flow.RPA.UIFlowService.ScreenDefaultResolutionWidth" value="1920" />
    <add key="Microsoft.Flow.RPA.UIFlowService.ScreenDefaultResolutionHeight" value="1080" />
    <add key="Microsoft.Flow.RPA.UIFlowService.ScreenDefaultResolutionScale" value="100" />
    ```
   ![Screenshot of the appropriate keys in the UIFlowService.exe.config file.](media/set-screen-resolution-unattended-mode/ui-flow-service-file.png)

1. Restart the **UIFlowService** service.

   To restart the service, start Windows Task Manager, select the **Services** tab, right-click the **UIFlowService** service, and then select **Restart**.

   ![Screenshot of the Windows Task Manager.](media/set-screen-resolution-unattended-mode/task-manager.png)

  > [!NOTE]
  > An alternative to restarting the UIFlowService is to restart your machine.

