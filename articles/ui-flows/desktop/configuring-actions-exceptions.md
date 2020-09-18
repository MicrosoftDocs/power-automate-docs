---
title: Configuring action exceptions | Microsoft Docs
description: Configuring action exceptions
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

# Configuring action exceptions

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

When an action throws an exception, the flow stops its execution by default. To configure a custom error handling behavior for an action, select the **On error** option in its properties.

![The on On error option in the action.](media/configuring-actions-exceptions/on-error-option-action.png)

The dialog box first option is the **Retry action if an error occurs** checkbox, which makes the flow execute the action one more time after two seconds.

![The Retry action checkbox in the action.](media/configuring-actions-exceptions/retry-action.png)

To continue the flow's execution, even if the retry option fails, select the **Continue flow run** option. Through the ​drop-down list, you can:

- **Go to next action**: Executes the following action in order.
- **Repeat action**: Repeats the action until it runs successfully. 
- **Go to label**: Continues the execution from a point defined by a **Label** action.

![The continue flow run option in the action.](media/configuring-actions-exceptions/continue-flow-run.png)

Power Automate Desktop offers two additional error handling options. Select the **New rule** button to:
- **Set variable**: Sets the desired value to a specified variable.
- **Run subflow**: Executes a specified subflow. 

![The New rule option in the action.](media/configuring-actions-exceptions/new-rule.png)

If different errors require different error handling behaviors, select the **Advanced** option and configure each possible error separately. 