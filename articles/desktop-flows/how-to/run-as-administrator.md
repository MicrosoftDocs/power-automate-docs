---
title: Run Power Automate with elevated rights | Microsoft Docs
description: Run Power Automate with elevated rights
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 03/11/2022
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Run Power Automate with elevated rights

While creating desktop flows, some actions may need to access resources with elevated rights, such as files and applications. To run these actions successfully, launch Power Automate as administrator:

> [!IMPORTANT]
> You should launch Power Automate as administrator to run desktop flows through the flow designer or the console. If you trigger desktop flows through the cloud, the deployed UI automation actions can't interact with applications with elevated rights.

1. Before launching Power Automate, ensure that the application is closed and doesn't appear on the Windows system tray.

1. Right-click on the Power Automate icon and select **Run as administrator**. 

1. To confirm that Power Automate is launched with administrator rights, open the Windows Task Manager, navigate to the **Details** tab, and check that Power Automate runs with elevated privileges.

    ![Screenshot of the Power Automate processes in the Windows Task Manager.](media/run-as-administrator/task-manager.png)



    