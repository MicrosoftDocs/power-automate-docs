---
title: Set up the automation kit scheduler
description: Learn how to set up the automation kit scheduler.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
editor: ''
ms.custom: guidance
ms.topic: how-to
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/04/2023
ms.author: macarrer
ms.reviewer: angieandrews
---

# Set up the automation kit scheduler

The Automation Kit scheduler was included up to the May 2023 release.

> [!NOTE]
> After the June 2023 release the scheduler, functionality has been moved to the new [Control Center](./control-center.md).

When you install the managed Power Platform scheduler solution, make sure you follow these required steps.

1. Ensure the Power Apps component framework is enabled by following the steps in [Enable the Power Apps component framework feature](/power-apps/developer/component-framework/component-framework-for-canvas-apps#enable-the-power-apps-component-framework-feature").

1. Install the [Creator Kit](https://appsource.microsoft.com/product/dynamics-365/microsoftpowercatarch.creatorkit1) from App Source into the target environment.

1. In the **Assets** section in the latest GitHub release of the [automation kit](https://github.com/microsoft/powercat-automation-kit/releases) file, download **AutomationKitScheduler_*_managed.zip** by selecting it.

1. Import the downloaded AutomationKitScheduler_*_managed.zip file.

    To learn how to import, go to [Import solutions](/power-apps/maker/data-platform/import-update-export-solutions).
