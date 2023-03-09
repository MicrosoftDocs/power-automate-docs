---
title: AI Builder actions actions reference (preview)
description: Learn about the available AI Builder action.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 03/09/2023
ms.author: gtrantzas
ms.reviewer: cochamos
contributors:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# AI Builder actions

## <a name="callgpt"></a> Create text with GPT on Azure OpenAI Service

Get a response from Azure OpenAI Service.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Instructions|No|[Text value](../variable-data-types.md#text-value)||Provide instructions for the GPT model to perform a task|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|PredictV2Response|||
|PredictV2TextResponse|||

### <a name="callgpt_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Endpoint failure|Indicates an endpoint failure|
