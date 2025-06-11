---
title: Flow control actions reference
description: Learn about the available flow control actions in desktop flows.
author: kewaiss
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 06/11/2025
ms.author: nimoutzo
ms.reviewer: matp
contributors:
- Yiannismavridis
search.audienceType: 
  - flowmaker
  - enduser
---

# Flow control actions

Flow control is the act of controlling the order in which actions and subflows run. Power Automate enables you to implement flow control through the flow control actions.

The **If safe stop is requested** action is used in conjunction with the Safe Stop capability available in the Power Automate portal, where it can be triggered from the desktop flow run details page, or be triggered directly within the flow designer, for debugging purposes, to enable controlled termination of a running flow. [More information here](../safe-stop.md).

**Labels** are used to create points of reference for the **Go to** action that changes the running point of the desktop flow. The following example directs the flow to a label earlier in the flow to repeat a series of actions.

:::image type="content" source="media/flowcontrol/label-example.png" alt-text="Screenshot of a deployed Label action.":::

The **Run subflow** action interrupts the subflow in which it's placed and runs another subflow. When the second subflow completes, the flow reverts to the original subflow to continue running. The following example runs the **Calculate Discount** subflow multiple times throughout the runtime of the flow to avoid repeating the same code.

:::image type="content" source="media/flowcontrol/subflows-example.png" alt-text="Screenshot of the deployed Run subflow action.":::

To visually organize your actions into groups for easier management, enclose them between a **Region** and an **End region** action, and give the region a distinctive name.

These actions don't have any functional effect, but they help group and organize actions for maintenance and readability purposes. For example, you can collapse and expand a region to help focus attention where needed.

You can only use the **Region** and **End region** actions as pairs, and they must belong to the same scope to interlock correctly. If one of the two actions belongs to another group of actions, such as a loop or a conditional, the actions can't form a proper region.

> [!NOTE]
> If you create multiple regions in a subflow, there's no predetermined mapping between specific **Region** and **End region** actions. Instead, the last **Region** action will try to form a pair with the first available **End region** action that follows.

## <a name="ifsafestopaction"></a> If safe stop requested

Checks whether safe stop is requested for the specific flow.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Stop the flow|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Indicates whether the flow's execution should be terminated after the completion of the specific block of actions or if the execution should continue. Note that if you choose to continue execution, you need to manually add a Stop Flow action to terminate the flow|

### Variables produced

This action doesn't produce any variables.

### <a name="comment_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="comment"></a> Comment

User comment.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Comment|Yes|[Text value](../variable-data-types.md#text-value)||User comment|

### Variables produced

This action doesn't produce any variables.

### <a name="comment_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="end"></a> End

Signifies the end of a block.

### Input parameters

This action doesn't require any input.

### Variables produced

This action doesn't produce any variables.

### <a name="end_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="endregion"></a> End region

Marks the end of a group of actions.

### Input parameters

This action doesn't require any input.

### Variables produced

This action doesn't produce any variables.

### <a name="end_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="exitfunction"></a> Exit subflow

Exits current subflow and returns to the point it was called from.

### Input parameters

This action doesn't require any input.

### Variables produced

This action doesn't produce any variables.

### <a name="exitfunction_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="getlasterror"></a> Get last error

Retrieves the last error that occurred in the flow.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Clear error|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|After the error is stored in the variable, it's cleared so that next time the error is retrieved, it won't retrieve the same error value|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|LastError|[Error](../variable-data-types.md#error)|The details of the error that last occurred in the flow|

### <a name="getlasterror_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="goto"></a> Go to

Transfers the flow of execution to another point, indicated by a label.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Go to label|No|[Text value](../variable-data-types.md#text-value)||Label in the flow|

### Variables produced

This action doesn't produce any variables.

### <a name="goto_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="label"></a> Label

Acts as the destination of a 'go to' statement.

From version 2.46 and on, labels can also be used in a different scope than the corresponding **Go to** action (for example, in a conditional block), except error blocks, loops, and/or other subflows.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Label name|No|[Text value](../variable-data-types.md#text-value)||Label in the program|

### Variables produced

This action doesn't produce any variables.

### <a name="label_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="block"></a> On block error

Marks the beginning of a block to handle actions errors.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Name|No|[Text value](../variable-data-types.md#text-value)||The name of the Exception Block for Visual purposes only.|
|Retry policy|N/A|None, Fixed, Exponential|None|The rules based on which retries are performed. Delays are estimated in seconds.|
|Capture unexpected logic errors|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Expand the scope of error handling, also capturing logical errors in the flow, for example, dividing a number by zero or trying to access an item from an out of bounds position.|

### Variables produced

This action doesn't produce any variables.

### <a name="block_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="region"></a> Region

Marks the beginning of a group of actions.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Name|Yes|[Text value](../variable-data-types.md#text-value)||The name of the region.|

### Variables produced

This action doesn't produce any variables.

### <a name="block_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="callfunction"></a> Run subflow

Run a subflow specifying any required arguments.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Subflow name|No|[Subflow](../designer-workspace.md#setting-up-subflows)||The name of the subflow to call|
|Input as expression|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Define whether the input should be handled as an expression. If enabled, variables and expressions can be used to dynamically determine the subflow during runtime.|

### Variables produced

This action doesn't produce any variables.

### <a name="callfunction_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="exit"></a> Stop flow

Terminates the flow.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|End flow|No|Successfully, With error message|Successfully|Terminate the execution of the flow, either successfully or with an error|
|Error message|No|[Text value](../variable-data-types.md#text-value)||The error message to return to the flow caller upon exit|

### Variables produced

This action doesn't produce any variables.

### <a name="exit_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="wait"></a> Wait

Suspends the execution of the flow for a specified number of seconds.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Duration|No|[Numeric value](../variable-data-types.md#numeric-value)||Time duration in seconds|

### Variables produced

This action doesn't produce any variables.

### <a name="wait_onerror"></a> Exceptions

This action doesn't include any exceptions.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
