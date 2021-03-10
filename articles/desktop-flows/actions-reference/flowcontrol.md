---
title: Flow control | Microsoft Docs
description: Flow control Actions Reference
author: mariosleon
ms.service: flow
ms.topic: article
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

|<!-- --> |
|-----|
|[Comment](#comment)|
|[End](#end)|
|[Exit subflow](#exitfunction)|
|[Get last error](#getlasterror)|
|[Go to](#goto)|
|[Label](#label)|
|[On block error](#block)|
|[Run subflow](#callfunction)|
|[Stop flow](#exit)|

### <a name="comment"></a> Comment
User comment

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Comment|Yes|Text value||User comment|


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
- This action doesn't require any input

##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|LastError|Error|The details of the error that last occured in the flow|

##### <a name="getlasterror_onerror"></a> Exceptions
- This action doesn't include any exceptions

### <a name="goto"></a> Go to
Transfers the flow of execution to another point, indicated by a label

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Go to label|No|Text value||Label in the flow|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="goto_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="label"></a> Label
Acts as the destination of a 'go to' statement

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Label name|No|Text value||Label in the program|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="label_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="block"></a> On block error
Marks the beginning of a block to handle actions errors

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Name|No|Text value||The name of the Exception Block for Visual purposes only.|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="block_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="callfunction"></a> Run subflow
Run a subflow specifying any required arguments

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Subflow name|No|Subflow||The name of the subflow to call|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="callfunction_onerror"></a> Exceptions
- This action doesn't include any exceptions
### <a name="exit"></a> Stop flow
Terminates the flow

##### Input Parameters
- This action doesn't require any input

##### Variables Produced
- This action doesn't produce any variables

##### <a name="exit_onerror"></a> Exceptions
- This action doesn't include any exceptions



[!INCLUDE[footer-include](../../includes/footer-banner.md)]