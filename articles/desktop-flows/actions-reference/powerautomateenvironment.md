---
title: Power Automate environment actions reference 
description: Discover how to use Power Automate environment actions retrieve environment variables.
author: yiannismavridis

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 02/19/2026
ms.author: iomavrid
ms.reviewer: dmartens
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

In this module, you find actions that allow you to retrieve environment variables that are available in your environment, offering direct integration with the corresponding components.

You can retrieve environment variables of the following types: Text values, numeric values, Boolean values, JSON as text values, and secrets as text values that are enforced to be sensitive. The secret values are only retrieved at runtime and aren't logged.

## <a name="retrieveenvironmentvariable"></a> Retrieve environment variable

Retrieves a Power Automate environment variable.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Environment variable|No|[Text value](../variable-data-types.md#text-value)||Select the environment variable whose value will be retrieved|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|EnvironmentVariableValue|*Depends on the selected environment variable type*|Retrieve the Power Automate environment variable value|

### <a name="retrieveenvironmentvariable_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Retrieve environment variable failed|Indicates a problem while retrieving the environment variable|
