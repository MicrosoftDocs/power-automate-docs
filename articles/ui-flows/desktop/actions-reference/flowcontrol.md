---
title: Flow Control | Microsoft Docs
description: Flow Control Actions Reference
author: mariosleon
ms.service: flow
ms.topic: article
ms.date: 09/30/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Flow Control

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Run a subflow specifying any required arguments

|<!-- --> |
|-----|
|[Comment](#comment)|
|[End](#end)|
|[Exit subflow](#exitfunction)|
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
|Name|Yes|Text value||The name of the error block|
|Operation|No|Continue Flow Run, Throw Error|Throw Error|The type of rule to enforce if an error occurs inside the block|
|To|No|*|N/A|The value to assign to the variable|
|Run subflow|No|Subflow|N/A|The name of the subflow|
|Mode|No|Go to next action, Repeat action, Go to beginning of block, Go to end of block|Go to next action|The operation to perform if an error occurs inside the block|

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

