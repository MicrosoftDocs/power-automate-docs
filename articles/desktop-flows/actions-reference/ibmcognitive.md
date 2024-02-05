---
title: IBM cognitive actions reference
description: See all the available IBM cognitive actions.
author: mattp123

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/23/2022
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# IBM cognitive actions

IBM cognitive services are machine learning algorithms that use artificial intelligence to perform complex operations, such as language tone analysis and visual recognition.

Desktop flows enable you to use these services through the IBM cognitive actions.

All IBM cognitive actions require an API key that you can create and manage through the IBM Cloud console. Additionally, they require the release date of the used API and the service endpoint location.

:::image type="content" source="media/ibm-cognitive/translate-action.png" alt-text="Screenshot of the Translate action.":::

## <a name="convertdocumentibm"></a> Convert document

Invokes the IBM service named 'Convert Document'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Username|No|[Text value](../variable-data-types.md#text-value)||The username to be used for this call|
|Password|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The password to use for this call|
|Version date|No|[Text value](../variable-data-types.md#text-value)||The release date of the API to use|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The path to the file to analyze|
|Mime type|N/A|text/html, text/xhtml+xml, application/pdf, application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document|text/html|The MIME type of the file|
|Conversion target|N/A|Answer units, Normalized HTML, Normalized text|Answer units|The output format of the conversion|
|Answer units|Yes|[Text value](../variable-data-types.md#text-value)||The heading levels as a comma-separated string|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The results of the API call|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code of the  API call|

### <a name="convertdocumentibm_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## <a name="translateibm"></a> Translate

Invokes the IBM service named 'Translate'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|[Text value](../variable-data-types.md#text-value)||The API key to use for this call|
|Version date|No|[Text value](../variable-data-types.md#text-value)||The release date of the API to use|
|Service endpoint location|N/A|US South, US East, Europe, Australia, Japan, UK, Korea|US East|The account's service location. Can be seen through IBM "Manage" in the resources section|
|Instance ID|No|[Text value](../variable-data-types.md#text-value)||The Instance ID of the service.|
|Translate mode|N/A|Model ID, Source and target|Model ID|Specify the mode to be used for this call|
|Model ID|No|[Text value](../variable-data-types.md#text-value)||The unique model_id of the translation model that will be used to translate the text|
|Source|No|[Text value](../variable-data-types.md#text-value)||The source language of the text|
|Target|No|[Text value](../variable-data-types.md#text-value)||The translation target language in 2 or 5 letter language code|
|Text|No|[List](../variable-data-types.md#list) of [Text values](../variable-data-types.md#text-value)||The text to send or list of words to be separately translated|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The results of the API call|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="translateibm_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## <a name="identifylanguage"></a> Identify language

Invokes the IBM service named 'Identify Language'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|[Text value](../variable-data-types.md#text-value)||The API key to use for this call|
|Version date|No|[Text value](../variable-data-types.md#text-value)||The release date of the API to use|
|Service endpoint location|N/A|US South, US East, Europe, Australia, Japan, UK, Korea|US East|The account's service location. Can be seen through IBM "Manage" in the resources section|
|Instance ID|No|[Text value](../variable-data-types.md#text-value)||The Instance ID of the service.|
|Text|No|[Text value](../variable-data-types.md#text-value)||The text to analyze|
|Content type|Yes|[Text value](../variable-data-types.md#text-value)|text/plain|The format of the requested values|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The results of the API call|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code of the  API call|

### <a name="identifylanguage_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## <a name="analyzetoneibm"></a> Analyze tone

Invokes the IBM service named 'Analyze Tone'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|[Text value](../variable-data-types.md#text-value)||The API key to use for this call|
|Version date|No|[Text value](../variable-data-types.md#text-value)||The release date of the API to use|
|Service endpoint location|N/A|US South, US East, Europe, Australia, Japan, UK, Korea|US East|The account's service location. Can be seen through IBM "Manage" in the resources section|
|Instance ID|No|[Text value](../variable-data-types.md#text-value)||The Instance ID of the service.|
|Provide text|N/A|From text, From file|From text|Specify how the text to be analyzed will be provided|
|Text|No|[Text value](../variable-data-types.md#text-value)||The text to analyze|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The path to the file to analyze|
|Content type|N/A|text/plain, text/html, application/json|text/plain|The content type of the text that will be sent|
|Tones|Yes|[Text value](../variable-data-types.md#text-value)||The tone with which the results will be filtered (optional)|
|Sentences|Yes|[Text value](../variable-data-types.md#text-value)||Specify whether to remove the sentence analysis|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The results of the API call|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code of the  API call|

### <a name="analyzetoneibm_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## <a name="classifyimageibm"></a> Classify Image

Invokes the IBM service named 'Classify Image'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|[Text value](../variable-data-types.md#text-value)||The API key to use for this call|
|Version date|No|[Text value](../variable-data-types.md#text-value)||The release date of the API to use|
|Service endpoint location|N/A|US South, Europe, Korea|US South|The account's service location. Can be seen through IBM "Manage" in the resources section|
|Instance ID|No|[Text value](../variable-data-types.md#text-value)||The Instance ID of the service.|
|Provide image|N/A|From file, From GCS|From file|Specify how the image will be provided|
|Image file path|No|[File](../variable-data-types.md#files-and-folders)||The path to the image to be analyzed|
|Image URL|No|[Text value](../variable-data-types.md#text-value)||The URL of the image to be analyzed|
|Owners|Yes|[Text value](../variable-data-types.md#text-value)|me|The classifiers to be used as a comma separated list|
|Classifier IDs|Yes|[Text value](../variable-data-types.md#text-value)|default|The classifier Ids to be used as a comma separated list|
|Threshold|Yes|[Text value](../variable-data-types.md#text-value)||The minimum score a class must have to be displayed in the response as a floating value|
|Language|Yes|[Text value](../variable-data-types.md#text-value)||The language of the output|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The results of the API call|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code of the  API call|

### <a name="classifyimageibm_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
