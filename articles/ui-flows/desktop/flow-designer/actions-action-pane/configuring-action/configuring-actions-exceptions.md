---
title: Configuring action exceptions | Microsoft Docs
description: Configuring action exceptions
author: georgiostrantzas
ms.service: flow
ms.topic: article
ms.date: 02/26/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Configuring action exceptions

When an action throws an exception, the flow stops its execution by default. To configure a custom error handling behavior for an action, select the **On error** option in its properties.

The dialog's first option is the **Retry action if an error occurs** checkbox, which makes the flow execute the action one more time after two seconds.

To continue the flow's execution, even if the retry option fails, select the **Continue flow run** option. Through the appeared dropbox, you can:

- **Go to next action**: Executes the following action in order.
- **Repeat action**: Repeats the action until it runs successfully. 
- **Go to label**: Continues the execution from a point defined by a **Label** action.

**Power Desktop Automation** offers two additional error handling options. Select the **New role** button to:
- **Set variable**: Sets the wished value to a specified variable.
- **Run subflow**: Executes a specified subflow. 

If different errors require different error handling behaviors, select the **Advanced** option and configure each possible error separately. 