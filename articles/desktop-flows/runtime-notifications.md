---
title: Runtime notifications
description: See the different types of Power Automate for desktop runtime notifications.
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 02/16/2023
ms.author: pefelesk
ms.reviewer: matp
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Runtime notifications

> [!NOTE]
> Runtime notifications are displayed when a flow is run directly from the console. When a flow is run from the portal, Power Automate doesn't display notifications.

Power Automate provides two different types of notifications while running desktop flows, depending on the user's preferences.

Through the **Monitoring/Notifications** option of the console settings, you can choose between the integrated Windows notifications, the flow monitoring window, or disabling the notifications.

The **Windows notifications** option displays a Windows notification pop-up when a desktop flow is running, paused, stopped, finished running successfully, or encountered an error. Additionally, the notification pop-up enables users to pause or stop the flow through the respective buttons.

:::image type="content" source="media\runtime-notifications\notification-window.png" alt-text="Screenshot of a notification window.":::

The **Flow monitoring window** option provides the same functionality as the Windows notifications, while it offers some extra functionality.

Instead of displaying separate notifications for each desktop flow, the monitoring window displays the state of all running flows in a single window. Further, it shows which subflow and action are running at any given time for each desktop flow. If an error occurs, you can copy the error details directly through the monitoring window for easier debugging.

> [!NOTE]
> When Power Automate pop-up dialogs appear, like input variable dialogs or update notifications, users can't interact with the flow monitoring window until they close the displayed dialog.

:::image type="content" source="media\runtime-notifications\flow-monitoring-window.png" alt-text="Screenshot of the flow monitoring window.":::

[!INCLUDE[footer-include](../includes/footer-banner.md)]
