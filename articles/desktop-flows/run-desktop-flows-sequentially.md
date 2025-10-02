---
title: Run desktop flows sequentially
description: See how to run multiple desktop flows on the same machine sequentially.
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 10/02/2025
ms.author: pefelesk
ms.reviewer: matp
contributors:
  - iomavrid
search.audienceType: 
  - flowmaker
  - enduser
---

# Run desktop flows sequentially

Power Automate enables you to schedule multiple desktop flows to run on one or more devices. If you trigger more than one desktop flow on the same device:

1. The first desktop flow runs on the target machine based on priority and time requested.

1. The other desktop flows are added to a queue and get marked as **Queued**.

1. When a desktop flow run completes, the next desktop flow starts running based on priority and time requested. This desktop flow is marked as **Next to run**.

You can [view the state of the queues in real time](monitor-desktop-flow-queues.md#view-run-queue-for-a-machine-or-machine-group) and manually [change the order](monitor-desktop-flow-queues.md#actions-on-a-run) of the desktop flows in them at runtime, either by changing the priority or moving them to the top of the queue.

> [!IMPORTANT]
>
> - A time-out occurs when desktop flows don’t run within 12 hours after being requested.
> - The presented orchestration rules apply to desktop flow runs scheduled by any user on the same device.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
