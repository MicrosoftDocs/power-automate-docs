---
title: Power Automate secret variables actions reference
description: See all the available Power Automate secret variables actions.
author: yiannismavridis

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 10/24/2024
ms.author: yiannismavridis
ms.reviewer: yiannismavridis
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Power Automate secret variables (Preview) actions

In this module, you will find actions that allow you to safely retrieve sensitive data that are available in your environment, offering direct integration with the corresponding components.

Currently, you are able to retrieve CyberArk-based credentials and use them in desktop flows in a secure way, as the credential values are only retrieved at runtime and are not logged (credential type variables are enforced to be sensitive).

## <a name="getcredentialaction"></a> Get credential (Preview)

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
