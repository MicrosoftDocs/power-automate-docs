---
title: Trigger actions reference 
description: Discover how to use trigger actions.
author: yiannismavridis

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 07/02/2026
ms.author: iomavrid
ms.reviewer: dmartens
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Triggers actions

In this module, you find an action that allows you to set up one or more triggers that monitor mouse click or keyboard events to target UI elements.

The flow pauses until one of the configured monitored events takes place. When an event occurs, the flow run continues with the trigger block's nested actions. The order in which you configure the triggers doesn't affect the action's behavior.

The action's shared parameters apply to all the triggers you configure in the action:

* If you set the scheduling mode to **One time**, the trigger's nested actions run only once after any one of the monitored events occurs. If you set the mode to **Sequential**, the flow run returns to the top of the trigger block instead, waiting for another event to take place.
* Set a timeout limit to avoid waiting infinitely and force a timeout error. The respective rule in the action's error handling behavior can handle this error.

> [!NOTE]
> Using an 'Exit loop' action within the trigger's block also allows the flow to exit event monitoring.

## <a name="waitfortriggeraction"></a> UI element event trigger

Sets up an event trigger on the selected UI element.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Trigger name|Yes|[Text value](../variable-data-types.md#text-value)||The name of this trigger|
|UI element|No|[UI element](../ui-elements.md)||Select the UI element that the event trigger monitors|
|Event|N/A|Mouse click, Keyboard|Mouse click|Select the event type of the trigger|
|Key modifiers|Yes|Combination of keys Win, Ctrl, Shift, Alt||Specify the combination of optional key modifiers that the trigger requires|
|Mouse button|No|Left, Middle, Right||Select the mouse button to use in the trigger|
|Key|No|A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, NumPad 0, NumPad 1, NumPad 2, NumPad 3, NumPad 4, NumPad 5, NumPad 6, NumPad 7, NumPad 8, NumPad 9, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, Space, Enter, Backspace, Home, Delete, Page Up, Page Down, Tab, Caps Lock, Num Lock, Left, Right, Up, Down, Escape, Insert||Specify the shortcut key to use in the trigger|
|Trigger mode|No|Press, Release||Select whether the trigger activates upon pressing or releasing the mouse button or shortcut key|
|Include nested elements|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|When enabled, the trigger also fires when a nested element inside the selected element is clicked or focused (for example a label inside a button)|
|Scheduling mode|N/A|One time, Sequential|One time|Specify the scheduling mode of the trigger|
|Fail with timeout error|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether you want the trigger to wait indefinitely or fail after a set time period|
|Duration|No|[Text value](../variable-data-types.md#text-value)|0|The time duration in seconds, after which the timeout error occurs|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|TriggerEventInstanceHandle|TriggerEventInstanceHandle|Retrieve the instance handle of the trigger event|

### <a name="waitfortriggeraction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|UI element event trigger failed|Indicates a problem when the trigger fired|
|UI element event trigger failed with timeout error|Indicates a timeout error while monitoring the events|
