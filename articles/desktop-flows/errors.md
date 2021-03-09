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

# Manage errors



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

If you want to implement an error handling behavior, you can use the **Get last error** action to retrieve the latest occurred error and use it in other actions in the flow. 

![The Get last error action.](media\errors\get-last-error-action.png)

## The error detail view

To find more information about a thrown exception, navigate to the **Errors** pane and double-click on the respective error. Once you do so, the **Error details** dialog box will appear. This dialog box displays information about:

1. **Location**: The subflow and the action that threw the error.
2. **Error message**: The error message.
3. **Error details**: A long description of the error. These details give a clear message about why the error happened and what the cause is.

![The Error details dialog box](media\error-detail-view\error-details.png)

[!INCLUDE[footer-include](../includes/footer-banner.md)]