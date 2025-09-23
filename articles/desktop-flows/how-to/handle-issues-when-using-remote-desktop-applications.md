---
title: Handle ssues with Power Automate for desktop when using remote desktop applications
description: Provides a resolution for the issues that Power Automate for desktop faces when using remote desktop applications.
ms.reviewer: iomavrid
ms.date: 09/23/2025
ms.custom: sap:Desktop flows\Working with Power Automate for desktop
---
# Handle issues with Power Automate for desktop when using remote desktop applications

This article provides a resolution for issues occurring when using remote desktop applications with Power Automate for desktop.

## Symptoms

* Power Automate for desktop becomes unresponsive or appears to freeze when accessed via remote desktop applications.
* The issue is often observed when using third-party remote access tools such as TeamViewer or Quick Assist.

## Cause

Injecting third-party libraries into Power Automate for desktop is not a supported scenario. Remote desktop software that relies on such techniques may interfere with Power Automate’s normal operation, leading to performance issues or application freezes.

Example of injected library from TeamViewer:

:::image type="content" source="media/handle-issues-when-using-remote-desktop-applications/teamviewer-injected-library.png" alt-text="Injected library from TeamViewer.":::

## Resolution

Avoid using remote desktop solutions that inject libraries into the target system. Instead, use alternative remote access tools that do not interfere with Power Automate’s runtime environment. This helps ensure stable and responsive behavior when working remotely.
