---
title: Safe stop
description: Learn how to use the safe stop functionality to stop a running desktop flow in a graceful manner.
author: NikosMoutzourakis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 06/11/2025
ms.author: nimoutzo
ms.reviewer: danamartens
contributors:
- NikosMoutzourakis
search.audienceType: 
  - flowmaker
  - enduser
---

# Safe stop
The Safe stop feature in Power Automate for Desktop enables users to halt the execution of a desktop flow in a controlled and secure manner. Unlike abrupt terminations, Safe stop ensures that the flow completes its current action and executes a predefined set of cleanup steps before stopping. This helps maintain data 
integrity and avoids leaving systems in an inconsistent state.


# How It Works
To use Safe Stop, two components must be configured:
- Triggering Safe Stop:
  - Safe Stop can be initiated in two ways:
    - From the Power Automate portal: Navigate to the Run Details page of a running desktop flow and click the Safe Stop button. :::image type="content" source="media/safe-stop/safe-stop-portal.png" alt-text="Screenshot of button to safe stop a desktop flow execution through the Power Automate portal.":::
    - From the PAD Designer: Use the dropdown on the Stop button and select Safe Stop. 
      - This option is especially useful during debugging or when a flow needs to be halted gracefully in the designer without disrupting the environment. :::image type="content" source="media/safe-stop/safe-stop-designer.png" alt-text="Screenshot of button to safe stop a desktop flow execution through the Power Automate for desktop designer.":::
- Handling Safe Stop in the Flow:
  - Within the desktop flow, insert the If safe stop is requested action (found under the Flow Control module). This action checks whether a Safe Stop has been requested. If so, it executes the block of actions defined within it.
    - The action includes a Stop the flow parameter:
      - If set to true, the flow stops automatically after the block is executed.
      - If set to false, the user must explicitly insert a Stop Flow action to terminate execution.
  - This allows flexibility in defining what should happen when a Safe Stop is triggered—such as saving files, closing connections, or logging status—before the flow ends.

# Best Practices
- Place the If safe stop is requested action at logical checkpoints in your flow where cleanup or rollback might be necessary.
- Use the Stop the flow parameter thoughtfully to control whether the flow should end immediately or continue after handling the stop request.
- Consider using Safe Stop during development and testing to safely interrupt flows without losing context or corrupting data.

# Limitations
- Safe Stop must be triggered before the If safe stop is requested action is reached in the flow. If the action is bypassed or not yet executed, the stop request will not take effect until the next checkpoint.
- This feature is not a pause or resume mechanism. Once triggered and executed, the flow will stop as defined.
