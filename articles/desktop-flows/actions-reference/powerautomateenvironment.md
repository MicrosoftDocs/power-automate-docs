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

Retrieves the values of a credential created through Power Automate's portal page for this environment.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Credential|No|[Text value](../variable-data-types.md#text-value)||The credential whose values are retrieved|
|Timeout|No|[Numeric value](../variable-data-types.md#numeric-value)|0|The maximum waiting time (in seconds) to get the credential|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Credential|[Credential](../variable-data-types.md#credentials)|The content of the retrieved credential|

### <a name="getcredentialaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to get credential|Indicates a problem while retrieving the credential|
|Invalid credentials configuration|Indicates that the credentials configuration is invalid|
|Credential timed out|Indicates that the request timed out|
|Failed to contact credentials vault|Indicates that there was a failure in contacting the credentials vault|
