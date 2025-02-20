---
title: Power Automate secret variables actions reference (preview)
description: Discover how to use Power Automate secret variables actions to securely retrieve sensitive data. Integrate CyberArk credentials in your desktop flows.
author: yiannismavridis

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/07/2024
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

# Power Automate secret variables actions (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

In this module, you find actions that allow you to safely retrieve sensitive data that are available in your environment, offering direct integration with the corresponding components.

You can retrieve CyberArk-based credentials and [use them in desktop flows (preview)](../create-cyberark-credential.md#use-the-credential-in-a-desktop-flow-action-preview) securely. The credential values are only retrieved at runtime and aren't logged. Credential type variables are enforced to be sensitive.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## <a name="getcredentialaction"></a> Get credential

Retrieves the values of a credential created through Power Automate's portal page for this environment.

> [!NOTE]
> This action isn't available in sovereign clouds yet.

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
