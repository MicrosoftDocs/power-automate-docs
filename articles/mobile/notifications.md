---
title: Receive notifications in the Power Automate mobile app
description: Learn how to receive notifications in the Microsoft Power Automate mobile app.
services: ''
suite: flow
documentationcenter: na
author: natalie-pienkowska
contributors:
  - natalie-pienkowska
  - kartikraop
  - v-aangie
editor: ''
tags: ''
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 06/05/2023
ms.author: jamiller
ms.reviewer: angieandrews
---

# Receive notifications

The Power Automate mobile app allows you to receive notifications on your mobile device. You'll get a notification whenever you run a flow that uses either the Microsoft [Notifications](/connectors/flowpush/) connector or the [Approvals](/connectors/approvals/) connector. You'll also get a notification when a flow encounters a run error.

The list of notifications you've received was previously called Activity Feed.

To view all notifications that correspond to your flows, select the bell icon at the top of the screen.

:::image type="content" source="../media/mobile/notifications-1.png" alt-text="Screenshot of part of the Power Automate mobile app screen, with the notification bell icon highlighted.":::

Notifications that arrived since the last time you opened the app appear in the **New** list. Other notifications appear in the **Older** list.

A timestamp indicates how long ago the notification arrived. For instance, **5 m** means the notification arrived five minutes ago. Notifications are removed from the **Older** list after 14 days.

:::image type="content" source="../media/mobile/notifications.png" alt-text="Screenshot of notifications in the Power Automate mobile app.":::

The **Notifications** screen shows notifications from the current environment only. To view notifications from a different environment, [select the environment](overview-mobile.md#change-environments).

## Filter your notifications

By default, the **Notifications** screen shows all the notifications you've received.

To show only notifications that are related to push notifications sent from a flow, select **From flows** at the top of the **Notifications** screen.

To show only notifications of errors that occurred when a flow ran, select **Run status** at the top of the **Notifications** screen.

## Related information

[Power Automate mobile app overview](overview-mobile.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
