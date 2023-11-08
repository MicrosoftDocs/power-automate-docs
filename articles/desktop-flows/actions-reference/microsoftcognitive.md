---
title: Microsoft cognitive actions reference
description: See all the available Microsoft cognitive actions.
author: Mattp123
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/08/2023
ms.author: dipapa
ms.reviewer: matp
contributors:
- jpapadimitriou
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---
# Microsoft cognitive actions

Azure Cognitive Services enables you to accelerate decision-making using artificial intelligence without requiring machine learning expertise.

> [!IMPORTANT]
> Azure is retiring [Azure Cognitive Services Text Analytics v2.x on 29 February 2024](https://azure.microsoft.com/updates/we-are-retiring-azure-cognitive-services-text-analytics-v2x-on-29-february-2024/). This library is used by the **Microsoft Cognitive Text Analytics actions**. After February 29, 2024 those actions will no longer be supported in desktop flows and will not be operational.

Desktop flows provide a wide variety of Microsoft cognitive actions that allow you to integrate this functionality into your desktop flows. Text analysis, computer vision, and spell-checking are all tasks that Microsoft cognitive actions can perform.

All Microsoft cognitive actions require a subscription key that validates your subscription for a service or group of services. The keys are available in the Azure portal for each resource you've created.

:::image type="content" source="media/microsoft-cognitive/spell-check-action.png" alt-text="Screenshot of the Spell check action.":::

## <a name="spellcheck"></a> Spell check

Invokes the Microsoft Cognitive service named 'Bing Spell Check.'

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Subscription key|No|[Text value](../variable-data-types.md#text-value)||The subscription key to use for this API call|
|Text|No|[List](../variable-data-types.md#list) of [Text values](../variable-data-types.md#text-value)||The text or the list of texts to send|
|Mode|Yes|[Text value](../variable-data-types.md#text-value)||Specify the spell-check mode|
|Mkt|Yes|[Text value](../variable-data-types.md#text-value)||For proof mode, the only supported language codes are: en-us, es-es, pt-br. For spell mode, all language codes are supported|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="spellcheck_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## <a name="analyzeimagemicrosoft"></a> Analyze image

Invokes the Microsoft Cognitive service named 'Analyze Image.'

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be used for this API call|
|Subscription key|No|[Text value](../variable-data-types.md#text-value)||The subscription key to use for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a URL address|
|Image file|No|[File](../variable-data-types.md#files-and-folders)||The full path (folder plus filename) of the image file to transmit|
|Image URL|No|[Text value](../variable-data-types.md#text-value)||The URL address of an image|
|Visual features|Yes|[Text value](../variable-data-types.md#text-value)||A text value indicating what visual feature types to return. Multiple values should be comma-separated. For example: categories, tags, description|
|Details|Yes|[Text value](../variable-data-types.md#text-value)||A text value indicating which domain-specific details to return. Multiple values should be comma-separated|
|Language|Yes|[Text value](../variable-data-types.md#text-value)||A text value indicating which language to return. The service will return recognition results in the specified language|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="analyzeimagemicrosoft_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## <a name="describeimagemicrosoft"></a> Describe image

Invokes the Microsoft Cognitive service named 'Describe Image.'

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be used for this API call|
|Subscription key|No|[Text value](../variable-data-types.md#text-value)||The subscription key to use for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a URL address|
|Image file|No|[File](../variable-data-types.md#files-and-folders)||The full path (folder plus filename) of the image file to transmit|
|Image URL|No|[Text value](../variable-data-types.md#text-value)||The URL address of an image|
|Max candidates|Yes|[Text value](../variable-data-types.md#text-value)||The maximum number of candidate descriptions to be returned. The default is 1|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="describeimagemicrosoft_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## <a name="ocrmicrosoft"></a> OCR

Invokes the Microsoft Cognitive service named 'OCR.'

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be used for this API call|
|Subscription key|No|[Text value](../variable-data-types.md#text-value)||The subscription key to use for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a URL address|
|Image file|No|[File](../variable-data-types.md#files-and-folders)||The full path (folder plus filename) of the image file to transmit|
|Image URL|No|[Text value](../variable-data-types.md#text-value)||The URL address of an image|
|Language|Yes|[Text value](../variable-data-types.md#text-value)||The BCP-47 language code of the text to detect in the image|
|Detect orientation|Yes|[Text value](../variable-data-types.md#text-value)||Specify whether to detect the text orientation in the image|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="ocrmicrosoft_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## <a name="tagimagemicrosoft"></a> Tag image

Invokes the Microsoft Cognitive service named 'Tag Image.'

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be used for this API call|
|Subscription key|No|[Text value](../variable-data-types.md#text-value)||The subscription key to use for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a URL address|
|Image file|No|[File](../variable-data-types.md#files-and-folders)||The full path (folder plus filename) of the image file to transmit|
|Image URL|No|[Text value](../variable-data-types.md#text-value)||The URL address of an image|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="tagimagemicrosoft_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## <a name="detectlanguage"></a> Detect language

Invokes the Microsoft Cognitive service named 'Text Analytics - Detect Language.'

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be used for this API call|
|Subscription key|No|[Text value](../variable-data-types.md#text-value)||The subscription key to use for this API call|
|Text|No|[Text value](../variable-data-types.md#text-value)||The text to analyze|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="detectlanguage_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## <a name="keyphrases"></a> Key phrases

Invokes the Microsoft Cognitive service named 'Text Analytics - Key Phrases.'

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be used for this API call|
|Subscription key|No|[Text value](../variable-data-types.md#text-value)||The subscription key to use for this API call|
|Text|No|[List](../variable-data-types.md#list) of [Text values](../variable-data-types.md#text-value)||The text or the list of texts to analyze|
|Language|Yes|[Text value](../variable-data-types.md#text-value)||The language of the text(s)|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="keyphrases_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## <a name="sentiment"></a> Sentiment

Invokes the Microsoft Cognitive service named 'Text Analytics - Sentiment.'

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be used for this API call|
|Subscription key|No|[Text value](../variable-data-types.md#text-value)||The subscription key to use for this API call|
|Text|No|[List](../variable-data-types.md#list) of [Text values](../variable-data-types.md#text-value)||Text|
|Language|Yes|[Text value](../variable-data-types.md#text-value)||The two letter ISO 639-1 representation of the language of the text(s)|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="sentiment_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
