---
title: Learn the differences between attended and unattended UI flows. | Microsoft Docs
description: Learn the differences between attended and unattended UI flows.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
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

# Compare unattended and attended UI flows

When you create UI flows, you can configure them to run either in **attended** or **unattended** mode. Unattended mode is best for aplications that do not need to be supervised by a human.

When running flows unattended, UI flows automatically signs into the target devices that run Windows 10, Windows Server 2016, or Windows Server 2019. Once the automation completes, UI flows signs out from the device and reports its activity in Power Automate.

When you add a UI flow to a flow, you choose whether you want your UI flow to run attended or unattended. Here are some key differences between attended and unattended runs:

## Attended mode

1. UI flows expects an unlocked user session on target devices.
1. The target session must use the same user credentials you used in the gateway connection for that UI flow.

1. When an attended UI flow run starts on the target machine we recommend that nobody interacts with your device until the run finishes.

## Unattended mode

1. UI flows creates, manages and then releases the user sessions on the target devices.

1. Unattended UI flows runs will run on devices, even if the screen is locked.

1. Windows 10 devices cannot run unattended if there are any active sessions on the device (even a locked one). You will receive this error: *Cannot execute UI flow. There is a locked or inactive user session on the target device*.

1. On Windows Server, if you have a locked session open with the same user as the UI flow is supposed to run as, you will receive the same error: *Cannot execute UI flow. There is a locked or inactive user session on the target device*.

## Next steps

- Learn how to [set up UI flows](setup.md). 
- Learn more about the [different types of flows](..\getting-started.md#types-of-flows) you can use to automate your workflows.


