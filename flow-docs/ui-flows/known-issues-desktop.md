---
title: Known issues in desktop UI flows | Microsoft Docs
description: List of known issues in the Preview release of UI flows.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/24/2019
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# List of known issues is the Preview release of Desktop UI flows

[This topic is pre-release documentation and is subject to change.]


It is recommended to have the apps that you want to record already launched and
in a maximized state before you start recording.

UI flows will launch a new instance of the applications upon each test or run.
It is recommended to add a **Close** action at the end of your UI flow.

Duplicate actions may be created depending on the type of application and the
speed of your recording. You can review and delete actions by selecting “**…**”.

![](../media/known-issues-desktop/60755d5ba679a56d7d2ca2ede5a19103.png)

Right clicks may not played back correctly. In such case, while recording, click
left to focus UI flows on the target User Interface element then right click.

If UI flows no longer records or playbacks Windows applications after installing
a new version, [uninstall](#uninstall-ui-flows) the previous version before
installing a new one.

## Unsupported application types

-   Interactions on Windows (File explorer, startup menu, task bar, etc.).

-   Web browsers (Chrome, IE, Edge, Edge Chromium, Firefox, Mozilla, etc.).
    Please instead refer to [Create a Web UI flow](#edit-a-web-ui-flow) to
    automate websites.

-   Java applications

-   Click once applications

-   Applications with a web view such as Electron applications

-   Office 2016 and earlier

## Unsupported configurations

-   Multi-screen

-   Recording through a virtual machine client (Remote Desktop, Citrix, etc.),
    either with the UI flow app running on the host device or on the virtual
    machine. None are supported.

-   Moving an application to another screen during a recording session.

-   Multiple instances of an application where the main window titles are
    identical.

-   Application windows with identical titles – e.g. for Microsoft Outlook:
    multiple “Untitled – Message (HTML)” new mail windows active at the same
    time.

-   Applications that span across multiple monitors.

-   Concurrent recording sessions on a given device.

-   Concurrent playback sessions on a given device. In case of simultaneous UI
    flow run, the first one will take precedence and the subsequent ones fill
    fail until the first one is completed.

-   Playback on a machine with different keyboard layout than the one it was
    initially recorded on.

-   Recording on a device or Windows session while the Browser with Microsoft
    Flow is on a different device or Windows session.

## Unsupported action types & behaviors (will not be recorded)

-   Double click

-   Mouse move

-   Mouse hover

-   Click and drag

-   Touch or pen input

-   Open app before recording

-   Closed app before playback starts

## Unreliable application behaviors and workarounds

## Next steps

