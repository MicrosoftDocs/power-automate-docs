---
title:  Update UI flows app and connections from previous releases | Microsoft Docs
description:  Update UI flows app and connections from previous releases.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''

ms.devlang: na
ms.subservice: desktop-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/03/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Upgrade UI flows app and connections from previous releases

We modified several underlying components and added several features in the February release with unattended support. You'll need to update your local UI flows app and your gateway connections to use these new features, including the unattended features.

### What does it mean for my existing UI flows?

No action is required until you either update the UI flows app or the connection to the gateway. You must update both at the same time.

### How do I upgrade?

1.  Download the [latest UI flows app](https://go.microsoft.com/fwlink/?linkid=2102613&clcid=0x409) and install it on your device(s).

1.  For each device on which you have installed the UI flows app:

    1. Sign into [Power Automate](https://powerautomate.microsoft.com).
    1. Expand **Data** on the left side of the screen.
    1. Select **Connections**.
    1. Edit the UI flows connection(s) that target your device.
    1. Enter your credentials for the connection, and then save it.

    >[!IMPORTANT]
    >Be sure you use the right credentials as outlined in [Setup UI flows connections and machine credentials](install.md#setup-desktop-flows-connections-and-machine-credentials). Using the correct credentials ensures that your connection updates and uses the code paths for the generally available UI flows.

## Next steps

- Learn how to [set up UI flows](setup.md). 
- Learn more about the [different types of flows](..\flow-types.md) you can use to automate your workflows.




[!INCLUDE[footer-include](../includes/footer-banner.md)]