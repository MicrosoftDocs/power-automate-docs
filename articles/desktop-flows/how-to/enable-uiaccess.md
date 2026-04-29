---
title: Enable UI Access to automate elevated applications
description: Learn how to enable UI Access in Power Automate for desktop to automate applications that run with elevated privileges.
author: iopanag
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 04/28/2026
ms.author: iopanag
search.audienceType: 
  - flowmaker
  - enduser
  - flowadmin
  - admin
---
# Enable UI Access to automate elevated applications

Power Automate for desktop runs with the same user rights as the user who starts it. If the user attempts to automate an application started with higher privileges (for example, run as administrator), interacting with that application through UI Automation fails due to Windows security protections. To automate elevated applications, you can enable UI Access mode for Power Automate for desktop. In this mode, the UI Automation component starts with UI Access privileges, allowing it to interact with elevated applications without requiring Power Automate for desktop itself to run as administrator.

> [!NOTE]
> - UI Access feature is available for Power Automate for desktop version 2.68 and later.

## How to enable UI Access

UI Access is disabled by default. If you want to enable it, you can set the following value in Windows Registry of the machine that needs to automate elevated applications:

| Hive | Key | Name | Type |
|---|---|---|---|
| HKEY_LOCAL_MACHINE | SOFTWARE\Wow6432Node\Microsoft\Power Automate Desktop\Global | UseUIAccessAutomationServer | DWORD |

***Value***

- **1**: UI Access is enabled for Power Automate.

## How to disable UI Access

To disable UI Access, follow the same registry instructions and set the value to **0**.

## Limitations

When UI Access is enabled, capturing UI Elements by hovering and Ctrl+Click isn't working as expected when the application is elevated. In order to capture UI Elements in such application use the [Inspect](../inspect-ui-elements.md) instead.

## Security considerations

When you enable UI Access, the UI Automation component of Power Automate runs at Medium+ integrity level, which allows it to interact with elevated applications. Be aware that this configuration permits a lower-privileged application (Power Automate) to automate higher-privileged applications, which may introduce security risks in your environment.