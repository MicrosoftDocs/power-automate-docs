---
title: Errors | Microsoft Docs
description: Errors
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

# Errors

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

While developing and executing flows, users may encounter two different kinds of errors: **design time** and **run time** errors.

The **design time** errors are associated with the configuration of the deployed actions. This kind of error appears while developing the flow and prevent it from running. An empty mandatory field or the use of an undefined variable may cause this kind of error.

![A design time error.](media\errors\design-time-error.png)

The **run time** errors or exceptions come up when the flow is running. These errors cause the flow to fail unless an exception handling behavior has been set. An invalid file path can cause this kind of error. 

![A run time error.](media\errors\run-time-error.png)

When an action throws an error, the platform displays an error icon next to it and a pop-up pane with relevant error information. 

The **Errors** pane is split into three columns:

- **Subflow**: The name of the subflow containing the action that threw the error.
- **Action**: The line number of the action that threw the error.
- **Error**: The error message.

If the occurred error is a **design time** error, the platform also displays a short description of the error inside the action. 

![An error description inside an action.](media\errors\error-action.png)