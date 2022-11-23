---
title: Flow control actions reference
description: See all the available flow control actions.
author: georgiostrantzas

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/23/2022
ms.author: gtrantzas
ms.reviewer: marleon
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Flow control actions

Flow control is the act of controlling the order in which actions and subflows run. Power Automate enables you to implement flow control through the flow control actions.

**Labels** are used to create points of reference for the **Go to** action that changes the running point of the desktop flow. The following example directs the flow to a label earlier in the flow to repeat a series of actions.

:::image type="content" source="media/flowcontrol/label-example.png" alt-text="Screenshot of a deployed Label action.":::

The **Run subflow** action interrupts the subflow in which it's placed and runs another subflow. When the second subflow completes, the flow reverts to the original subflow to continue running. The following example runs the **Calculate Discount** subflow multiple times throughout the runtime of the flow to avoid repeating the same code.

:::image type="content" source="media/flowcontrol/subflows-example.png" alt-text="Screenshot of the deployed Run subflow action.":::

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
|Capture unexpected logic errors|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Expand the scope of error handling, also capturing logical errors in the flow, for example, dividing a number by zero or trying to access an item from an out of bounds position.|

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

Suspends the execution of the flow for a specified amount of seconds.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Duration|No|[Numeric value](../variable-data-types.md#numeric-value)||Time duration in seconds|

### Variables produced

This action doesn't produce any variables.

### <a name="wait_onerror"></a> Exceptions

This action doesn't include any exceptions.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
