---
title: Receive push notifications in the Power Automate mobile app for Android
description: Learn how to receive push notifications in the Microsoft Power Automate mobile app for Android.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
manager: tapanm
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/19/2022
ms.author: kewaiss
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Receive push notifications

The Power Automate mobile app for Android allows you to receive push notifications on your mobile device. The list of push notifications you've received was previously called Activity Feed.

To view push notifications and alerts from your flows, select the bell icon at the top of the screen.

:::image type="content" source="../media/android/notifications-1.png" alt-text="Screenshot of part of the Power Automate mobile app for Android screen, with the notification bell icon highlighted.":::

Push notifications that arrived since the last time you opened the app appear in the **New** list. Other push notifications appear in the **Older** list.

A timestamp indicates how long ago the push notification arrived. For instance, **5 m** means the push notification arrived five minutes ago. Push notifications are removed from the **Older** list after 14 days.

:::image type="content" source="../media/android/notifications.png" alt-text="Screenshot of notifications in the Power Automate mobile app for Android.":::

You’ll receive push notifications from flows that were created using either the Microsoft [Notifications](/connectors/flowpush/) connector or the [Approvals](/connectors/approvals/) connector.

The **Notifications** screen shows push notifications from the current environment only. To view push notifications from a different environment, [select the environment](overview-mobile.md#change-environments).

## Filter your push notifications

By default, the **Notifications** screen shows all the push notifications you've received.

To show only push notifications that are related to a flow, select **From flows** at the top of the **Notifications** screen.

To show only push notifications of errors that occurred when a flow ran, select **Run status** at the top of the **Notifications** screen.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
