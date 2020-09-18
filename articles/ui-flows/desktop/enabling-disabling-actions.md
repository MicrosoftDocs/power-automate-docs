---
title: Enabling and disabling actions | Microsoft Docs
description: Enabling and disabling actions
author: georgiostrantzas
ms.service: flow
ms.topic: article
ms.date: 09/22/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Enabling and disabling actions

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

To disable or enable an action, right-click on it and select **Disable action** or **Enable Action**, respectively. 

![The disable action option.](media\enabling-disabling-actions\enable-disable-action.png)

Disabling an action allows you to remove it from the flow without erasing it. This feature is commonly applied to test different versions of a flow and decide which one is the most efficient. 

When an action is disabled, all variables defined in it are hidden from the **Variables** pane. If the hidden variables are used in other actions, the flow may throw an error. 

In the example below, two actions threw an error because they contain variables defined in a disabled action.

![An example in which disabling an action hides some varibales.](media\enabling-disabling-actions\enable-disable-action-variables.png)