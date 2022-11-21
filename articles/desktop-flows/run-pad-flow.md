---
title: Run a Power Automate desktop flow
description: Run a flow in the Power Automate desktop console
author: georgiostrantzas

ms.subservice: desktop-flow
ms.topic: article
ms.date: 10/26/2022
ms.author: gtrantzas
ms.reviewer: marleon
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
- Adityajain2408
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Run attended and unattended desktop flows


## Troubleshoot failures

> [!IMPORTANT]
> Gateways for desktop flows are now deprecated except for China region. Switch to our machine-management capabilities. [Learn more](manage-machines.md#switch-from-gateways-to-direct-connectivity)

1. If your unattended desktop flow fails with the **cannot create new session** message, follow these steps to resolve the issue:

    - On Windows 10 or Windows 11, confirm that you don’t have an active user session locked or unlocked on your target device.
    - On Windows Server 2016, Windows Server 2019, or Windows Server 2022, confirm you haven’t reached the maximum number of active user sessions that's configured for your device. Desktop flows won’t be able to run if it can't create new sessions.

1. If the **gateway status** is **offline**, confirm that the device is turned on and connected to the Internet. You may also [troubleshoot the gateway](/data-integration/gateway/service-gateway-tshoot).

1. If the **gateway status** is **online**, try the following actions:

   - Confirm the desktop flows app and services are running on your device.

   - Restart the service on your device.