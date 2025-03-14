---
title: Boost process-centric observability with process map
description: Enhance your automation's observability  and troubleshooting efficiency story with the Automation Center's new process map
ms.topic: conceptual
ms.date: 03/14/2025
ms.author: appapaio
ms.reviewer: dmartens
contributors:
  - DanaMartens
author: rpapostolis
ms.collection: conceptual
search.audienceType: 
  - admin
  - coe
  - maker
---

# Process map (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

## Creating a process map

## View process map

> [!NOTE]
> Preview features in the Automation Center, such as the process map (preview), can now be turned off via the Power Platform Admin settings for the environment.

## Known issues and limitations

- Child desktop flow runs are currently not shown in the map.
- You must be an Environment maker or have similar permissions in your environment to see and create process maps.
- Parallelization, such a **Apply each**with concurrency setting or **RunAfter** customization in cloud flow are not supported. Child runs will be presented in the order they were defined in the flow.
- Dynamic Flow selection using a formula instead of the standard picker is not supported, such children will be ignored.
- We will not load more than 100 child runs for a given run (if flow A runs 150 instances of flow B, we will load the first 100 and continue the recursion).
- Beyond a depth of 50, the child process map will not be recomputed if the dependent flow is updated.
- The Process Map takes some time to update after a flow update, and there is currently no indicator of that.
