---
title: Run a Power Automate Desktop flow | Microsoft Docs
description: Run a flow in the Power Automate Desktop console
author: olegmelnykov
ms.service: flow
ms.topic: article
ms.date: 09/22/2020
ms.author: olmelnyk
ms.reviewer: olmelnyk
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Run a Power Automate Desktop flow

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

To run a desktop flow from the console, either select it and then select **Run**, or right-click on the desktop flow and select **Start**.

![Select run flow button](\media\run-pad-flow\run-flow.png)

Flows running from the console will run from beginning to end without the Run delay. Running flows from the console will also ignore any breakpoints placed in the flow designer.

## Runtime notifications

A notification popup appears by default when a desktop flow is downloading or running, when it is cancelled, when it finishes running successfully, or when it encounters an error:

![Notification window](\media\run-pad-flow\notification-window.png)