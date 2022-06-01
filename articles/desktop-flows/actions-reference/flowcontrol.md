---
title: Flow control | Microsoft Docs
description: Flow control Actions Reference
author: mariosleon

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 12/02/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Flow control



Control the automation flow

[Comment](#comment)  
[End](#end)  
[Exit subflow](#exitfunction)  
[Get last error](#getlasterror)  
[Go to](#goto)  
[Label](#label)  
[On block error](#block)  
[Run subflow](#callfunction)  
[Stop flow](#exit)  
[Wait](#wait)  

## Getting started with flow control

Flow control refers to controlling the order in which actions and subflows run. Power Automate enables flow control through the flow control actions.

**Labels** are used to create points of reference for the **Go to** action to direct the flow to. In the figure below, the flow is directed to a label earlier in the flow to repeat a series of actions.

![Screenshot of a deployed label action in a flow.](\media\flowcontrol\label-example.png)

The **Run subflow** action interrupts the subflow in which it is placed and runs another subflow. When the second subflow completes, the flow reverts to the original subflow to continue running. In the figure below, the subflow **Calculate Discount** has been created to run multiple times throughout the runtime of the flow, to avoid repeating the same code.

![Screenshot of a deployed Run subflow action.](\media\flowcontrol\subflows-example.png)


## Flow control actions

### <a name="comment"></a> Comment
User comment

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Comment|Yes|[Text value](../variable-data-types.md#text-value)||User comment|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="comment_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="end"></a> End


##### Input Parameters
- This action doesn't require any input

##### Variables Produced
- This action doesn't produce any variables

##### <a name="end_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="exitfunction"></a> Exit subflow
Exits current subflow and returns to the point it was called from

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
- This action doesn't produce any variables

##### <a name="exitfunction_onerror"></a> Exceptions
- This action doesn't include any exceptions


### <a name="getlasterror"></a> Get last error
Retrieves the last error that occured in the flow

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Clear error|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|After the error is stored in the variable, it's cleared so that next time the error is retrieved, it won't retrieve the same error value|

##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|LastError|[Error](../variable-data-types.md#error)|The details of the error that last occured in the flow|

##### <a name="getlasterror_onerror"></a> Exceptions
- This action doesn't include any exceptions

### <a name="goto"></a> Go to
Transfers the flow of execution to another point, indicated by a label

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Go to label|No|[Text value](../variable-data-types.md#text-value)||Label in the flow|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="goto_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="label"></a> Label
Acts as the destination of a 'go to' statement

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Label name|No|[Text value](../variable-data-types.md#text-value)||Label in the program|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="label_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="block"></a> On block error
Marks the beginning of a block to handle actions errors

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Name|No|[Text value](../variable-data-types.md#text-value)||The name of the Exception Block for Visual purposes only.|
|Capture unexpected logic errors|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Expand the scope of error handling, also capturing logical errors in the flow, for example, diving a number by zero or trying to access an item from an out of bounds position.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="block_onerror"></a> Exceptions
- This action doesn't include any exceptions

### <a name="callfunction"></a> Run subflow
Run a subflow specifying any required arguments

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Subflow name|No|[Subflow](../designer-workspace.md#setting-up-subflows)||The name of the subflow to call|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="callfunction_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="exit"></a> Stop flow
Terminates the flow

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|End flow|No|Successfully, With error message|Successfully|Terminate the execution of the flow, either successfully or with an error|
|Error message|No|[Text value](../variable-data-types.md#text-value)||The error message to return to the flow caller upon exit|

##### Variables Produced
- This action doesn't produce any variables

##### <a name="exit_onerror"></a> Exceptions
- This action doesn't include any exceptions

### <a name="wait"></a> Wait
Suspends the execution of the flow for a specified amount of seconds

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Duration|No|[Numeric value](../variable-data-types.md#numeric-value)||Time duration in seconds|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="wait_onerror"></a> Exceptions
- This action doesn't include any exceptions

[!INCLUDE[footer-include](../../includes/footer-banner.md)]