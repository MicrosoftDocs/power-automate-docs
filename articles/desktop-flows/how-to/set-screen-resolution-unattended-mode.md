---
title: Set screen resolution on unattended mode | Microsoft Docs
description: Set screen resolution on unattended mode
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 07/16/2021
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Set screen resolution on unattended mode

In some scenarios, Power Automate may run unattended flows in a lower resolution than the one used to develop the flows. As a result, some UI elements could be hidden from the screen and cause flows to fail.

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

    Alternatively to restarting your machine, you can restart the Power Automate service. To restart the Power Automate service, launch Windows Task Manager, right-click on the Power Automate process and select **End task**.

    ![Screenshot of the Windows Task Manager.](media/set-screen-resolution-unattended-mode/task-manager.png)