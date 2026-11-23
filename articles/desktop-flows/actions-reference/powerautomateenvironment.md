---
title: Power Automate environment actions reference 
description: Discover how to use Power Automate environment actions retrieve environment variables.
author: yiannismavridis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/23/2026
ms.author: iomavrid
ms.reviewer: smurkute
contributors:
search.audienceType: 
  - flowmaker
  - enduser
ms.custom:
- ai-gen-docs-bap
- ai-gen-description
- ai-seo-date:10/29/2024
---

# Power Automate environment actions

In this module, you find actions that allow you to retrieve environment variables that are available in your environment. These actions offer direct integration with the corresponding components, as well as environment and flow metadata.

You can retrieve environment variables of the following types: Text values, numeric values, Boolean values, JSON as text values, and secrets as sensitive values (text values that are enforced to be sensitive). The secret values are only retrieved at runtime and aren't logged.

## <a name="getenvironmentmetadataaction"></a> Get environment metadata

Retrieves metadata about the current Power Platform environment including environment ID and name.

### Input parameters

This action doesn't accept any parameters.

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|EnvironmentId|[Text value](../variable-data-types.md#text-value)|The unique identifier (GUID) of the Power Platform environment|
|EnvironmentName|[Text value](../variable-data-types.md#text-value)|The display name of the Power Platform environment|

### <a name="getenvironmentmetadataaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't get environment metadata|Indicates a problem while retrieving the environment metadata|

## <a name="getflowmetadataaction"></a> Get flow metadata

Retrieves metadata about the current desktop flow, including the flow name, flow ID, current subflow name, and run ID.

### Input parameters

This action doesn't accept any parameters.

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|FlowName|[Text value](../variable-data-types.md#text-value)|The display name of the desktop flow|
|FlowId|[Text value](../variable-data-types.md#text-value)|The unique identifier (GUID) of the desktop flow|
|CurrentSubflowName|[Text value](../variable-data-types.md#text-value)|The name of the subflow that's currently running|
|RunId|[Text value](../variable-data-types.md#text-value)|The unique identifier (GUID) of the current desktop flow run|

### <a name="getflowmetadataaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't get flow metadata|Indicates a problem while retrieving the flow metadata|

## <a name="retrieveenvironmentvariable"></a> Retrieve environment variable

Retrieves a Power Automate environment variable.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Environment variable|No|[Text value](../variable-data-types.md#text-value)||Select the environment variable whose value the action retrieves.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|EnvironmentVariableValue|*Depends on the selected environment variable type*|Retrieve the Power Automate environment variable value.|

### <a name="retrieveenvironmentvariable_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Retrieve environment variable failed|Indicates a problem while retrieving the environment variable.|

## <a name="retrieveenvironmentvariables"></a> Retrieve environment variables

Retrieves multiple Power Automate environment variables.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Environment variables|No|[Text value](../variable-data-types.md#text-value)||Select the environment variables whose values the action retrieves.|
|Return partial results on failure|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|When enabled, the action retrieves the values it can and returns the names of any environment variables that failed. When disabled, the action fails if it can't retrieve any environment variable.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|EnvironmentVariables|[Custom object](../variable-data-types.md#custom-object)|The retrieved Power Automate environment variable values|

### <a name="retrieveenvironmentvariables_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Retrieve environment variables failed|Indicates a problem while retrieving the environment variables|
