---
title: Use image recognition on machines with different screen resolutions | Microsoft Docs
description: Use image recognition on machines with different screen resolutions
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 06/08/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Use image recognition on machines with different screen resolutions

When you capture images in Power Automate Desktop, the stored images are affected by the source machine's screen resolution and DPI scaling.

In cases where flows perform image recognition on different screens or machines, you must ensure that all the screens have the exact screen resolution.

To achieve this functionality, you can use the **Set screen resolution** action to change the screen resolution of the target machines.

The new resolution has to be the same as the source machine from which the image was captured. To find the resolution of the source machine, use a temporary **Get screen resolution** action or check the Windows display settings.

> [!NOTE]
> Before using image recognition, ensure that DPI scaling stays the same among the screens. The use of varying DPI scalings may cause the flow to fail.

![The Set screen resolution action.](media/image-recognition-screen-resolution/set-screen-resolution.png)

If you want to roll back to the original resolution later in the flow, add a **Get screen resolution** before the **Set screen resolution** action.

When all the image recognition procedures are completed, use the retrieved values and a second **Set screen resolution** action to set the screen back to the original resolution.

![The Set screen resolution action configured to roll back to the original resolution.](media/image-recognition-screen-resolution/set-screen-resolution-roll-back.png)