---
title: Run desktop flows concurrently
description: See how to run desktop flows concurrently on machines running Windows Server.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 02/15/2023
ms.author: pefelesk
ms.reviewer: gtrantzas
contributors:
search.app: 
  - Flow 
search.audienceType: 
  - flowmaker
  - enduser
---

# Run desktop flows concurrently

> [!IMPORTANT]
> Gateways for desktop flows are now deprecated except for the China region. Switch to our machine-management capabilities. [Learn more about the switch from gateways to direct connectivity.](manage-machines.md#switch-from-gateways-to-direct-connectivity)

Windows Server (2016, 2019, and 2022) allows multiple users to sign in simultaneously on the same machine. Power Automate uses this OS capability to run multiple desktop flows simultaneously, allowing organizations to reduce infrastructure costs.

> [!NOTE]
> Running multiple concurrent desktop flows by the same user isn't supported. You need to have different users running desktop flows simultaneously to benefit from this feature.

Replicate the following steps to run multiple desktop flows concurrently on a single machine:

1. Set up a Windows Server 2016, 2019, or 2022 device with the latest version of Power Automate installed.

1. Use two or more user accounts to create desktop flow connections targeting this device. To find more information about desktop flow connections, go to [Create desktop flow connections](desktop-flow-connections.md).

Power Automate automatically scales the number of concurrent desktop flow runs to the supported maximum. If the machine's capacity is exceeded, the remaining runs wait as described in [Run desktop flows sequentially](run-desktop-flows-sequentially.md).

> [!IMPORTANT]
> If you want to use more than two parallel user sessions on Windows Server, you must turn on Remote Desktop Services (RDS). To learn more about RDS, go to [License your RDS deployment with client access licenses](/windows-server/remote/remote-desktop-services/rds-client-access-license).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
