---
title: Debugging a desktop flow | Microsoft Docs
description: Use the flow designer's debugging options to debug flows.
author: olegmelnykov
ms.service: power-automate
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

# Debug a desktop flow



It is common to have to debug flows in case there are any changes in the system or if a desktop flow cannot run because it contains errors. 
<!--note from editor: It would be good to link to the topics about these things. -->

Debug a desktop flow using the following tools:
* [Errors Pane](errors.md)
* [Breakpoints](#adding-breakpoints)
* [Run flow action by action](#run-a-desktop-flow-by-action)
* [Set the Run delay](#the-status-bar)

## Run, stop, and pause in flow designer

Select **Run** to run the flow. When the flow runs, **Run** becomes **Pause**. Select **Pause** while the flow is running to pause and inspect any changes up to that point. Select **Run** while the flow is paused to resume it. The **Run next action** button runs the flow action by action and pauses it after each action completes. The **Stop** button stops the flow completely.

![View the toolbar](\media\run-stop-pause\toolbar.png)

## Adding breakpoints

Click to the left of the running order number in the workspace to place a breakpoint in the flow, which appears as a red dot. Add a breakpoint to specify at which action to pause the flow. Resume running the flow by selecting **Run** or **Run next action**. Select the breakpoint to remove it.

![add breakpoint](\media\adding-breakpoints\add-breakpoint.png)

## Run a desktop flow by action

The **Run next action** button runs the flow action by action. After each action is completed, the flow is paused. Open the variables pane to check the value of any variable at the point where it's paused. This feature is useful for debugging.

## The status bar

The status bar on the bottom of the Window shows the status of the flow and the number of selected actions. Additionally, it shows the total number of actions and subflows in the current flow. The Run delay shows the amount of time that the flow waits for after running each action in the flow designer. Select the delay and use the slider to adjust the value in milliseconds to change this value. The status bar also shows the number of Errors, if any are present. Select the Errors to pop up the Errors pane. Using **Search inside the flow** shows an additional element with the number of results. Select the number of results to pop up the Find in code pane.

![status bar](\media\status-bar\status-bar.png)

## Run from here

To run the flow starting from a specific action, right-click the action and select **Run from here**. This ignores all previous actions and runs the flow from the selected action onwards.

![run from here](\media\run-stop-pause\run-from-here.png)

## Power Automate Desktop reserved keywords

A certain amount of words are being used in the core of Power Automate Desktop and can't be used during development in the variable, subflow, label or error block names.
The list of these words is displayed below.

|<!-- --> |<!-- --> |<!-- --> |<!-- --> |
|----|----|----|----|
|action|false|loop|step|
|and|for|main|switch|
|block|foreach|mod|then|
|call|from|next|throw|
|case|function|no|times|
|default|global|not|to|
|disable|goto|on|true|
|else|if|or|wait|
|end|in|output|while|
|error|input|repeat|xor|
|exit|label|set|yes|


[!INCLUDE[footer-include](../includes/footer-banner.md)]