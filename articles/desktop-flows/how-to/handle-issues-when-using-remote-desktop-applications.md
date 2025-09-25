---
title: Using Power Automate for desktop with remote desktop applications
description: Provides a resolution for the issues that Power Automate for desktop faces when using remote desktop applications.
author: yiannismavridis
ms.author: iomavrid
ms.reviewer: matp
ms.topic: conceptual
ms.date: 09/23/2025
ms.custom: sap:Desktop flows\Working with Power Automate for desktop
---
# Using Power Automate for desktop with remote desktop applications

This article provides the policy when issues occur when you use certain remote desktop applications with Power Automate for desktop.

You might experience an issue where Power Automate for desktop becomes unresponsive or appears to freeze when accessed through certain remote desktop applications.

The issue can occur when using certain remote access tools such as TeamViewer or Quick Assist. This happens because injecting non-Microsoft libraries into Power Automate for desktop isn't supported. Remote desktop software that relies on such techniques can interfere with Power Automate’s normal operation, leading to performance issues or application freezes.

Example of injected library from TeamViewer:

:::image type="content" source="media/using-remote-desktop-applications/remote-access-injected-library.png" alt-text="Injected library from TeamViewer.":::

To resolve this issue, avoid using remote desktop solutions that inject libraries into the target system. Instead, use alternative remote access tools, like [Remote Desktop Connection](/windows-server/remote/remote-desktop-services/remotepc/remote-desktop-allow-access), which don't interfere with Power Automate’s runtime environment. This helps ensure stable and responsive behavior when you work remotely.
