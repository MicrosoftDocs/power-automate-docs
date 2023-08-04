---
title: Set screen resolution on unattended mode
description: Set screen resolution on unattended mode
author: georgiostrantzas

ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 07/16/2021
ms.author: marleon
ms.reviewer: gtrantzas
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Set screen resolution on unattended mode
In some scenarios, Power Automate may run unattended flows in a lower resolution than the one used to develop the flows. As a result, some UI elements could be hidden from the screen and cause flows to fail.

## With Registry (starting with version 2.35)

> [!NOTE]
> Setting the **ScreenResolutionEnabled** registry key to 1 will override the settings in the UIFlowService.exe.config file. The registry settings for screen resolution will persist after an upgrade of Power Automate Desktop, the **UIFlowService.exe.config** file is overwritten with default values during upgrades.

Open the registry editor (windows key + R, and type 'regedit') and set the following values.

| Hive | Key | Name | Type | Description |
|---|---|---|---|---|
| HKEY_LOCAL_MACHINE | SOFTWARE\Microsoft\Power Automate Desktop\Screen | ScreenResolutionEnabled | DWORD | If set to '1', will enable the custom resolution settings. |
| HKEY_LOCAL_MACHINE | SOFTWARE\Microsoft\Power Automate Desktop\Screen | Width | DWORD | Set the screen resolution width. |
| HKEY_LOCAL_MACHINE | SOFTWARE\Microsoft\Power Automate Desktop\Screen | Height | DWORD | Set the screen resolution height. |
| HKEY_LOCAL_MACHINE | SOFTWARE\Microsoft\Power Automate Desktop\Screen | Scale | DWORD | Set the screen resolution scale. |

## With UIFlowService.exe.config file

To change the resolution in which unattended flows are run:

1. Navigate to **C:\Program Files (x86)\Power Automate Desktop** and open the **UIFlowService.exe.config** file.

1. Set the value of the **Microsoft.Flow.RPA.UIFlowService.ScreenDefaultResolutionEnabled** key to **true**.

    ``` XML
    <add key="Microsoft.Flow.RPA.UIFlowService.ScreenDefaultResolutionEnabled" value="true" />
    ```

1. Change the values of the following keys to the proper screen resolution width, height, and scale, respectively. The following code sets the default resolution to 1920 x 1080 pixels.

    ``` XML
    <add key="Microsoft.Flow.RPA.UIFlowService.ScreenDefaultResolutionWidth" value="1920" />
    <add key="Microsoft.Flow.RPA.UIFlowService.ScreenDefaultResolutionHeight" value="1080" />
    <add key="Microsoft.Flow.RPA.UIFlowService.ScreenDefaultResolutionScale" value="100" />
    ```
   ![Screenshot of the appropriate keys in the UIFlowService.exe.config file.](media/set-screen-resolution-unattended-mode/ui-flow-service-file.png)

1. Restart your machine.

    Alternatively to restarting your machine, you can restart the **UIFlowService** service. To restart the service, launch Windows Task Manager, navigate to the **Services** tab, right-click on the **UIFlowService** service, and select **Restart**.

    ![Screenshot of the Windows Task Manager.](media/set-screen-resolution-unattended-mode/task-manager.png)
