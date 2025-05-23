---
title: Run Power Automate with elevated rights
description: See how to run Power Automate with elevated rights.s
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 11/09/2022
ms.author: pefelesk
ms.reviewer: matp
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Run Power Automate with elevated rights

During desktop flow development, some actions may need to access resources with elevated rights, such as files and applications. To run these actions successfully, launch Power Automate as administrator:

> [!IMPORTANT]
>
> - To run desktop flows through the flow designer or the console to interact with applications running with elevated rights, launch Power Automate as an administrator.
> - When a desktop flow is triggered by a cloud flow, the actions contained in the desktop flow that require elevated privileges won't have any effect. Therefore, Power Automate won't be able to access applications that run with elevated rights.

1. Before launching Power Automate, ensure that the application is closed, and doesn't appear on the Windows system tray.

1. Right-click on the Power Automate icon and select **Run as administrator**.

1. To confirm that Power Automate is launched with administrator rights, open Windows Task Manager, navigate to the **Details** tab, and check that Power Automate runs with elevated privileges.

    :::image type="content" source="media/run-power-automate-elevated-rights/task-manager.png" alt-text="Screenshot of the Power Automate processes in Windows Task Manager.":::
