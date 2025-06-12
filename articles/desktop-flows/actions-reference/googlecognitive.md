---
title: Google cognitive actions reference
description: See all the available Google cognitive actions.
author: mattp123

ms.service: power-automate
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

# Google cognitive actions

Google cognitive services allow you to process unstructured data through machine learning and simplify complicated tasks like text analysis and computer vision.

You can implement this functionality in your desktop flows using the Google cognitive group of actions.

All Google cognitive actions require an API key that authorizes you to use the respective services. You can manage your API keys in the **APIs & services** section of the Cloud Console.

:::image type="content" source="media/google-cognitive/analyze-entities-action.png" alt-text="Screenshot of the Analyze entities action.":::

## <a name="analyzesentimentgoogle"></a> Analyze sentiment

Invokes the Google Cloud Natural Language service named 'Analyze Sentiment'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|[Text value](../variable-data-types.md#text-value)||The Google Cloud API key to be used for this API call|
|Document type|N/A|Plain text, HTML|Plain text|The type of document to transmit|
|Provide document|N/A|From file, From GCS|From file|Specify whether the document will be provided by a full path or a Google Cloud Storage URI|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The full path (folder plus filename) of the document to transmit|
|GCS Content URI|No|[Text value](../variable-data-types.md#text-value)||The URI of the image residing on Google Cloud Storage|
|Language|Yes|[Text value](../variable-data-types.md#text-value)||The language of the text|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="analyzesentimentgoogle_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

## <a name="analyzeentitiesgoogle"></a> Analyze entities

Invokes the Google Cloud Natural Language service named 'Analyze Entities'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|[Text value](../variable-data-types.md#text-value)||The Google Cloud API key to be used for this API call|
|Document type|N/A|Plain text, HTML|Plain text|The type of the document to transmit|
|Provide file|N/A|From file, From GCS|From file|Specify whether the document will be provided by a full path or a Google Cloud Storage URI|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The full path (folder plus filename) of the document to transmit|
|GCS URL|No|[Text value](../variable-data-types.md#text-value)||The URI of the document residing on Google Cloud Storage|
  |Language|Yes|[Text value](../variable-data-types.md#text-value)||The language of the text|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="analyzeentitiesgoogle_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

## <a name="analyzesyntaxgoogle"></a> Analyze syntax

Invokes the Google Cloud Natural Language service named 'Analyze Syntax'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|[Text value](../variable-data-types.md#text-value)||The Google Cloud API key to be used for this API call|
|Document type|N/A|Plain text, HTML|Plain text|The type of document to transmit|
|Provide document|N/A|From file, From GCS|From file|Specify whether the document will be provided by a full path or a Google Cloud Storage URI|
|File path|No|[File](../variable-data-types.md#files-and-folders)||The full path (folder plus filename) of the document to transmit|
|GCS Content URI|No|[Text value](../variable-data-types.md#text-value)||The URI of the image residing on Google Cloud Storage|
|Language|Yes|[Text value](../variable-data-types.md#text-value)||The language of the text|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="analyzesyntaxgoogle_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

## <a name="labeldetectiongoogle"></a> Label detection

Invokes the Google Cloud Vision service named 'Label Detection'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|[Text value](../variable-data-types.md#text-value)||The Google Cloud API key to be used for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a Google Cloud Storage URI|
|Image file|No|[File](../variable-data-types.md#files-and-folders)||The full path (folder plus filename) of the image file to transmit|
|GCS Image URI|No|[Text value](../variable-data-types.md#text-value)||The URI of the image residing on Google Cloud Storage|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="labeldetectiongoogle_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

## <a name="landmarkdetectiongoogle"></a> Landmark detection

Invokes the Google Cloud Vision service named 'Landmark Detection'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|[Text value](../variable-data-types.md#text-value)||The Google Cloud API key to be used for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a Google Cloud Storage URI|
|Image file path|No|[File](../variable-data-types.md#files-and-folders)||The full path (folder plus filename) of the image file to transmit|
|GCS Image URI|No|[Text value](../variable-data-types.md#text-value)||The URI of the image residing on Google Cloud Storage|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="landmarkdetectiongoogle_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

## <a name="textdetectiongoogle"></a> Text Detection

Invokes the Google Cloud Vision service named 'Text Detection'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|[Text value](../variable-data-types.md#text-value)||The Google Cloud API key to be used for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a Google Cloud Storage URI|
|Image file|No|[File](../variable-data-types.md#files-and-folders)||The full path (folder plus filename) of the image file to transmit|
|GCS Image URI|No|[Text value](../variable-data-types.md#text-value)||The URI of the image residing on Google Cloud Storage|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="textdetectiongoogle_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

## <a name="logodetectiongoogle"></a> Logo detection

Invokes the Google Cloud Vision service named 'Logo Detection'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|[Text value](../variable-data-types.md#text-value)||The Google Cloud API key to be used for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a Google Cloud Storage URI|
|Image file|No|[File](../variable-data-types.md#files-and-folders)||The full path (folder plus filename) of the image file to transmit|
|GCS Image URI|No|[Text value](../variable-data-types.md#text-value)||The URI of the image residing on Google Cloud Storage|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="logodetectiongoogle_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

## <a name="imagepropertiesdetectiongoogle"></a> Image properties detection

Invokes the Google Cloud Vision service named 'Image Properties Detection'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|[Text value](../variable-data-types.md#text-value)||The Google Cloud API key to be used for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a Google Cloud Storage URI|
|Image file|No|[File](../variable-data-types.md#files-and-folders)||The full path (folder plus filename) of the image file to transmit|
|GCS Image URI|No|[Text value](../variable-data-types.md#text-value)||The URI of the image residing on Google Cloud Storage|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="imagepropertiesdetectiongoogle_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

## <a name="safesearchdetectiongoogle"></a> Safe search detection

Invokes the Google Cloud Vision service named 'Safe Search Detection'.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|[Text value](../variable-data-types.md#text-value)||The Google Cloud API key to be used for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a Google Cloud Storage URI|
|Image file|No|[File](../variable-data-types.md#files-and-folders)||The full path (folder plus filename) of the image file to transmit|
|GCS Image URI|No|[Text value](../variable-data-types.md#text-value)||The URI of the image residing on Google Cloud Storage|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response results|
|StatusCode|[Numeric value](../variable-data-types.md#numeric-value)|The status code returned|

### <a name="safesearchdetectiongoogle_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
