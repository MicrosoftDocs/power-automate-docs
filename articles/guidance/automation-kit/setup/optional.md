---
title: Optional setup steps depending on your configuration | Microsoft Docs
description: Optional setup steps depending on your configuration.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
editor: ''
ms.custom: guidance

ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/18/2022
ms.author: macarrer
ms.reviewer: angieandrews
---

# Disable syncing of desktop flows script (optional)

By default, the Desktop flows definition script is stored inside the **Desktop Flow Definition** table. This field could contain sensitive information.

>[!WARNING]
>System Administrators and higher can view the definition tables and fields by default.

Follow these steps in the environment in that contains the solution to disable sync.

1. Select the **Solutions** tab.
1. Select the Default Solution and click Environment Variables.
1. Find and then select **Store Extracted Script**.
1. Under **Current value**, click **New value**.
1. Change to **No**.
1. Select **Save**.

>[!NOTE]
>You must stop and then start all flows in an environment after you make changes to environment variables for the flows to get the new environment variable values. [See Limitations](../limitations.md).

>[!IMPORTANT]
>The script field isn't synced back to main due to security. You can extend the Automation Kit to configure your environment to sync data back to main, if needed.
