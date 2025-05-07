---
title: Handle errors in desktop flows
description: See how to handle errors and warnings in your desktop flows
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 01/20/2025
ms.author: iomavrid
ms.reviewer: matp
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Handle errors in desktop flows

During developing and running, you may encounter errors and warnings in your desktop flows. This article presents the different error and warning types, the **Errors** pane, and the available error handling functionality.

## Desktop flows error types

Desktop flows can cause two kinds of errors:

- **Design-time errors** are associated with the configuration of the deployed actions. These errors appear during development and prevent desktop flows from running. For example, an empty mandatory field or an undefined variable can cause this type of error.

- **Run-time errors**, also known as exceptions, occur during execution and make desktop flows fail. For example, an invalid file path can cause this kind of error. Use any of the [available error-handling options](#configure-error-handling-functionality) to prevent your desktop flows from failing.

When an action throws an error, the flow designer displays an icon next to it and a pop-up pane with relevant information. If the error occurred is a design-time error,  the flow designer also displays an error description in the action's modal.

:::image type="content" source="media/errors/example-errors.png" alt-text="Screenshot of some errors in the errors pane.":::

## Desktop flows warnings

Apart from errors, the flow designer displays warnings that indicate non-critical issues in your desktop flows. Warnings don't prevent desktop flows from running but indicate possible unwanted functionality, such as infinite recursions of subflows.

:::image type="content" source="media/errors/example-warning.png" alt-text="Screenshot of a warning in the errors pane.":::

## Review errors and warnings using the errors pane

The errors pane is the flow designer's component responsible for displaying information regarding occurred errors and warnings.

It consists of four columns:

- **Type**: Indicates if the displayed item is an error or warning.
- **Description**: A description of the occurred error or warning.
- **Subflow**: The name of the subflow that contains the erroneous action or the action that causes the warning.
- **Line**: The line number of the erroneous action or the action that causes the warning.

The pane also provides filters to display errors, warnings, and/or items related to specific subflows.

:::image type="content" source="media/errors/errors-pane-filters.png" alt-text="Screenshot of the available filter in the errors pane.":::

To see additional information regarding a design-time error or warning, double-click the respective item in the errors pane. Once you do so, a dialog will display information about:

- **Location**: The subflow, line and action that caused the design-time error or warning.
- **Error message**: The message of the occurred design-time error or warning.

:::image type="content" source="media/errors/design-time-error.png" alt-text="Screenshot of the design-time error dialog.":::

To see additional information regarding a runtime error, double-click the respective item in the errors pane. Once you do so, a dialog will display information about:

- The message of the occurred error or warning.
- **Location**: The subflow, line and action that caused the error or warning.
- Possible remediation steps to resolve the issue that occurred (currently only applicable to Excel actions' errors).
- **Error details**: The error's correlation ID, as well as a long, technical description of the occurred runtime error.

:::image type="content" source="media/errors/error-details-with_remediation_steps.png" alt-text="Screenshot of the error details dialog.":::

## Configure error-handling functionality

Power Automate enables you to configure error-handling functionality for single actions and blocks of actions in your desktop flows.

### Handle errors of single actions

By default, desktop flows stop their execution when an error occurs. To configure a custom error-handling functionality for a specific action, select On error in its modal.

:::image type="content" source="media/errors/on-error-option-action.png" alt-text="Screenshot of the On error option in the action.":::

The first available option is the **Retry action if an error occurs** checkbox. This option makes the flow run the action a set number of times after a set number of seconds. The default value is one retrying with an interval of two seconds.

:::image type="content" source="media/errors/retry-action.png" alt-text="Screenshot of the Retry action checkbox in the action.":::

To keep your desktop flow running even if the retry option fails, select **Continue flow run**. Through the displayed ​drop-down list, you can:

- **Go to next action**: Runs the following action in order.
- **Repeat action**: Repeats the action until it runs successfully.
- **Go to label**: Run the desktop flow from a point defined by a **Label** action.

:::image type="content" source="media/errors/continue-flow-run.png" alt-text="Screenshot of the continue flow run option in the action.":::

Desktop flows offer two more error handling options. Select **New rule** to:

- **Set variable**: Sets the specified value to a selected variable.
- **Run subflow**: Runs a specified subflow.

:::image type="content" source="media/errors/new-rule.png" alt-text="Screenshot of the New rule option in the action.":::

If different errors require different error handling functionality, select **Advanced** and configure each possible error separately.

### Handle errors of group of actions

Some scenarios may require you to implement the same error-handling functionality for several actions in your desktop flows.

Instead of configuring each action separately, deploy the **On block error** action and configure a common error handling behavior for all the actions inside the block.

This action offers the same options as the **On error** settings of single actions but also lets you capture unexpected logic errors, such as trying to access a list item from an out-of-bounds position. Other options include providing a name for this block, as well as selecting to continue the flow run from the beginning or the end of the block, after an error occurs.

> [!NOTE]
> If a retry policy is set and an error occurs, retrying will take place from the beginning of the block.
> 
> If all block retries fail, then the actions specified in block's 'Exception handling mode' will apply.
> 
> Individual error handling/retries from actions within the error block take precedence from block error retries.

:::image type="content" source="media/errors/on-block-error-action.png" alt-text="Screenshot of the On block error action.":::

## Retrieve occurred errors in desktop flows

To retrieve the latest occurred error in a desktop flow and use it in later actions, use the **Get last error** action.

This action returns an error type variable that provides six different properties: the name, the location and the index of the action that failed, the subflow that contains this action, and the details and the message of the action.

To avoid retrieving the same error value later in your desktop flow, enable the **Clear error** option that clears the last error after storing it in the variable.

:::image type="content" source="media\errors\get-last-error-action.png" alt-text="Screenshot of the Get last error action.":::

[!INCLUDE[footer-include](../includes/footer-banner.md)]
