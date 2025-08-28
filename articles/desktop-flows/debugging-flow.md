---
title: Debugging a desktop flow
description: Use the flow designer's debugging options to debug flows.
author: mattp123

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: concept-article
ms.date: 08/28/2025
ms.author: nimoutzo
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Debug a desktop flow



It is common to have to debug flows in case there are any changes in the system or if a desktop flow cannot run because it contains errors. 
<!--note from editor: It would be good to link to the topics about these things. -->

Debug a desktop flow using the following tools:
* [Errors Pane](errors.md)
* [Breakpoints](#adding-breakpoints)
* [Stepping mode](#step-over-and-step-out)
* [Run flow action by action](#run-a-desktop-flow-by-action)
* [Set the Run delay](#the-status-bar)

## Run, stop, and pause in flow designer

Select **Run** or press **F5** to run the flow. When the flow runs, **Run** becomes **Pause**. Select **Pause** or press **Ctrl + Pause** while the flow is running to pause and inspect any changes up to that point. Select **Run** while the flow is paused to resume it. The **Run next action** button and the **F10** shortcut run the flow action by action and pause it after each action completes. The **Stop** button and the **Shift + F5** shortcut stop the flow completely.

![Screenshot of the toolbar.](media/run-stop-pause/toolbar.png)

## Adding breakpoints

Click to the left of the running order number in the workspace to place a breakpoint in the flow, which appears as a red dot. Add a breakpoint to specify at which action to pause the flow. Resume running the flow by selecting **Run** or **Run next action**. Select the breakpoint to remove it.

![Screenshot of an added breakpoint.](media/adding-breakpoints/add-breakpoint.png)

## Run a desktop flow by action

The **Run next action** button runs the flow action by action. After each action is completed, the flow is paused. Open the variables pane to check the value of any variable at the point where it's paused. This feature is useful for debugging.

## Step over and step out
Power Automate for Desktop provides two additional debugging options—step over and step out—to improve control and visibility during flow execution.

To utilize these new debugging features, users must first enable stepping mode. This is done by navigating to the Debug menu located in the designer toolbar. 

![Screenshot of Stepping mode.](media/step-over-step-out/enable_stepping_mode.png)

Once stepping mode is activated, two additional options become available within the flow designer:
- Step over, which can be triggered using the keyboard shortcut F11.
- Step out, which can be triggered using the keyboard shortcut Shift+F11.

![Screenshot of step over and step out options in designer.](media/step-over-step-out/options_in_designer.png)

These options are only enabled when the flow is either not currently executing or is in a paused state. A flow enters a paused state under the following circumstances:
- The user manually selects a pause option.
- The user selects 'Run next action' option.
- Execution reaches a predefined breakpoint.
- The step over option is applied during execution.
- The step out option is applied during a subflow execution except for the Main subflow.

### Behavior of the step over option
The step over command allows users to execute actions one at a time while maintaining control over the flow’s progression. When used before a 'Run subflow' action, it executes the entire subflow and then pauses at the next action following it. For all other actions, step over simply runs the current action and pauses at the next one.

### Behavior of the step out option
The step out command is used to exit an executing subflow and return to its caller. If applied during a subflow, it completes that subflow and pauses after the corresponding 'Run subflow' action in the parent flow. When used in the Main subflow, step out behaves like the standard 'Run' command, allowing execution to continue uninterrupted.

## The status bar

The status bar on the bottom of the window shows the status of the flow and the number of the selected actions. Additionally, it shows the total number of actions and subflows in the current flow. 

The **Run delay** field defines the time that the flow waits after running each action in the flow designer. You can modify the default value to increase or decrease the milliseconds that the flow waits.

The status bar also displays the number of errors, if any are present. Select the **Errors** option to pop up the **Errors pane**. 

If you search inside the flow, the status bar shows an additional field containing the number of the results. Select this field to pop up the **Find in code** pane.

![Screenshot of the status bar.](media/status-bar/status-bar.png)

## Run from here

To run the flow starting from a specific action, right-click the action and select **Run from here**. This ignores all previous actions and runs the flow from the selected action onwards.

![Screenshot of the Run from here option.](media/run-stop-pause/run-from-here.png)

## Power Automate reserved keywords

A certain amount of words are being used in the core of Power Automate and can't be used during development in the variable, subflow, label or error block names.
The list of these words is displayed below.

A - E|F - J|K - R|S - Z
----|-----|-----|-----
action | FALSE | label | set
and | for | loop | step
block | foreach | main | switch
call | from | mod | then
case | function | next | throw
default | global | no | times
disable | goto | not | to
else | if | on | TRUE
end | in | or | wait
error | input | output | while
exit |  | repeat | xor
|  |  |  | yes




[!INCLUDE[footer-include](../includes/footer-banner.md)]
