---
title: Cognitive | Microsoft Docs
description: Cognitive Actions Reference
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

# Cognitive

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Perform cognitive operations using Google, Microsoft or IBM services

|<!-- --> |
|-----|
|[Analyze sentiment](#analyzesentimentgoogle)|
|[Analyze entities](#analyzeentitiesgoogle)|
|[Analyze syntax](#analyzesyntaxgoogle)|
|[Label detection](#labeldetectiongoogle)|
|[Landmark detection](#landmarkdetectiongoogle)|
|[Text Detection](#textdetectiongoogle)|
|[Logo detection](#logodetectiongoogle)|
|[Image properties detection](#imagepropertiesdetectiongoogle)|
|[Safe search detection](#safesearchdetectiongoogle)|
|[Convert document](#convertdocumentibm)|
|[Translate](#translateibm)|
|[Identify language](#identifylanguage)|
|[Analyze tone](#analyzetoneibm)|
|[Classify Image](#classifyimageibm)|
|[Spell check](#spellcheck)|
|[Analyze image](#analyzeimagemicrosoft)|
|[Describe image](#describeimagemicrosoft)|
|[OCR](#ocrmicrosoft)|
|[Tag image](#tagimagemicrosoft)|
|[Detect language](#detectlanguage)|
|[Key phrases](#keyphrases)|
|[Sentiment](#sentiment)|

## Google
Google's cognitive actions
## Natural language
Reveal the structure and meaning of text
### <a name="analyzesentimentgoogle"></a> Analyze sentiment
Invokes the Google Cloud Natural Language service named 'Analyze Sentiment'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|Text value||The Google Cloud API key to be used for this API call|
|Document type|N/A|Plain text, HTML|Plain text|The type of document to transmit|
|Provide document|N/A|From file, From GCS|From file|Specify whether the document will be provided by a full path or a Google Cloud Storage URI|
|File path|No|File||The full path (folder plus filename) of the document to transmit|
|GCS Content URI|No|Text value||The URI of the image residing on Google Cloud Storage|
|Language|Yes|Text value||The language of the text|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="analyzesentimentgoogle_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

### <a name="analyzeentitiesgoogle"></a> Analyze entities
Invokes the Google Cloud Natural Language service named 'Analyze Entities'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|Text value||The Google Cloud API key to be used for this API call|
|Document type|N/A|Plain text, HTML|Plain text|The type of the document to transmit|
|Provide file|N/A|From file, From GCS|From file|Specify whether the document will be provided by a full path or a Google Cloud Storage URI|
|File path|No|File||The full path (folder plus filename) of the document to transmit|
|GCS URL|No|Text value||The URI of the document residing on Google Cloud Storage|
|Language|Yes|Text value||The language of the text|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="analyzeentitiesgoogle_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

### <a name="analyzesyntaxgoogle"></a> Analyze syntax
Invokes the Google Cloud Natural Language service named 'Analyze Syntax'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|Text value||The Google Cloud API key to be used for this API call|
|Document type|N/A|Plain text, HTML|Plain text|The type of document to transmit|
|Provide document|N/A|From file, From GCS|From file|Specify whether the document will be provided by a full path or a Google Cloud Storage URI|
|File path|No|File||The full path (folder plus filename) of the document to transmit|
|GCS Content URI|No|Text value||The URI of the image residing on Google Cloud Storage|
|Language|Yes|Text value||The language of the text|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="analyzesyntaxgoogle_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

## Vision
Assign labels to images and classify them into predefined categories. Detect objects, faces, and read printed and handwritten text
### <a name="labeldetectiongoogle"></a> Label detection
Invokes the Google Cloud Vision service named 'Label Detection'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|Text value||The Google Cloud API key to be used for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a Google Cloud Storage URI|
|Image file|No|File||The full path (folder plus filename) of the image file to transmit|
|GCS Image URI|No|Text value||The URI of the image residing on Google Cloud Storage|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="labeldetectiongoogle_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

### <a name="landmarkdetectiongoogle"></a> Landmark detection
Invokes the Google Cloud Vision service named 'Landmark Detection'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|Text value||The Google Cloud API key to be used for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a Google Cloud Storage URI|
|Image file path|No|File||The full path (folder plus filename) of the image file to transmit|
|GCS Image URI|No|Text value||The URI of the image residing on Google Cloud Storage|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="landmarkdetectiongoogle_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

### <a name="textdetectiongoogle"></a> Text Detection
Invokes the Google Cloud Vision service named 'Text Detection'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|Text value||The Google Cloud API key to be used for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a Google Cloud Storage URI|
|Image file|No|File||The full path (folder plus filename) of the image file to transmit|
|GCS Image URI|No|Text value||The URI of the image residing on Google Cloud Storage|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="textdetectiongoogle_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

### <a name="logodetectiongoogle"></a> Logo detection
Invokes the Google Cloud Vision service named 'Logo Detection'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|Text value||The Google Cloud API key to be used for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a Google Cloud Storage URI|
|Image file|No|File||The full path (folder plus filename) of the image file to transmit|
|GCS Image URI|No|Text value||The URI of the image residing on Google Cloud Storage|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="logodetectiongoogle_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

### <a name="imagepropertiesdetectiongoogle"></a> Image properties detection
Invokes the Google Cloud Vision service named 'Image Properties Detection'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|Text value||The Google Cloud API key to be used for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a Google Cloud Storage URI|
|Image file|No|File||The full path (folder plus filename) of the image file to transmit|
|GCS Image URI|No|Text value||The URI of the image residing on Google Cloud Storage|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="imagepropertiesdetectiongoogle_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

### <a name="safesearchdetectiongoogle"></a> Safe search detection
Invokes the Google Cloud Vision service named 'Safe Search Detection'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|Text value||The Google Cloud API key to be used for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a Google Cloud Storage URI|
|Image file|No|File||The full path (folder plus filename) of the image file to transmit|
|GCS Image URI|No|Text value||The URI of the image residing on Google Cloud Storage|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="safesearchdetectiongoogle_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|
|Request timeout expired|Indicates that the timeout expired while performing the request|

## IBM
IBM's cognitive actions
## Document conversion
Translate non-structured documents like fax, email, pdf, etc. into an EDI or other structured formats
### <a name="convertdocumentibm"></a> Convert document
Invokes the IBM service named 'Convert Document'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Username|No|Text value||The username to be used for this call|
|Password|No|Text value||The password to use for this call|
|Version date|No|Text value||The release date of the API to use|
|File path|No|File||The path to the file to analyze|
|Mime type|N/A|text/html, text/xhtml+xml, application/pdf, application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document|text/html|The MIME type of the file|
|Conversion target|N/A|Answer units, Normalized HTML, Normalized text|Answer units|The output format of the conversion|
|Answer units|Yes|Text value||The heading levels as a comma-separated string|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The results of the API call|
|StatusCode|Numeric value|The status code of the  API call|


##### <a name="convertdocumentibm_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## Language translator
Translate documents, apps, and webpages
### <a name="translateibm"></a> Translate
Invokes the IBM service named 'Translate'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|Text value||The API key to use for this call|
|Version date|No|Text value||The release date of the API to use|
|Service endpoint location|N/A|US South, US East, Europe, Australia, Japan, UK, Korea|US East|The account's service location. Can be seen through IBM "Manage" in the resources section|
|Instance ID|No|Text value||The Instance ID of the service.|
|Translate mode|N/A|Model ID, Source and target|Model ID|Specify the mode to be used for this call|
|Model ID|No|Text value||The unique model_id of the translation model that will be used to translate the text|
|Source|No|Text value||The source language of the text|
|Target|No|Text value||The translation target language in 2 or 5 letter language code|
|Text|No|List of Text values||The text to send or list of words to be separately translated|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The results of the API call|
|StatusCode|Numeric value|The status code returned|


##### <a name="translateibm_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

### <a name="identifylanguage"></a> Identify language
Invokes the IBM service named 'Identify Language'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|Text value||The API key to use for this call|
|Version date|No|Text value||The release date of the API to use|
|Service endpoint location|N/A|US South, US East, Europe, Australia, Japan, UK, Korea|US East|The account's service location. Can be seen through IBM "Manage" in the resources section|
|Instance ID|No|Text value||The Instance ID of the service.|
|Text|No|Text value||The text to analyze|
|Content type|Yes|Text value|text/plain|The format of the requested values|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The results of the API call|
|StatusCode|Numeric value|The status code of the  API call|


##### <a name="identifylanguage_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## Tone analyzer
Detect emotional and language tones in written text
### <a name="analyzetoneibm"></a> Analyze tone
Invokes the IBM service named 'Analyze Tone'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|Text value||The API key to use for this call|
|Version date|No|Text value||The release date of the API to use|
|Service endpoint location|N/A|US South, US East, Europe, Australia, Japan, UK, Korea|US East|The account's service location. Can be seen through IBM "Manage" in the resources section|
|Instance ID|No|Text value||The Instance ID of the service.|
|Provide text|N/A|From text, From file|From text|Specify how the text to be analyzed will be provided|
|Text|No|Text value||The text to analyze|
|File path|No|File||The path to the file to analyze|
|Content type|N/A|text/plain, text/html, application/json|text/plain|The content type of the text that will be sent|
|Tones|Yes|Text value||The tone with which the results will be filtered (optional)|
|Sentences|Yes|Text value||Specify whether to remove the sentence analysis|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The results of the API call|
|StatusCode|Numeric value|The status code of the  API call|


##### <a name="analyzetoneibm_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## Visual recognition
Find meaning in visual content. Analyze images for scenes, objects, and other content
### <a name="classifyimageibm"></a> Classify Image
Invokes the IBM service named 'Classify Image'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|API key|No|Text value||The API key to use for this call|
|Version date|No|Text value||The release date of the API to use|
|Service endpoint location|N/A|US South, Europe, Korea|US South|The account's service location. Can be seen through IBM "Manage" in the resources section|
|Instance ID|No|Text value||The Instance ID of the service.|
|Provide image|N/A|From file, From GCS|From file|Specify how the image will be provided|
|Image file path|No|File||The path to the image to be analyzed|
|Image URL|No|Text value||The URL of the image to be analyzed|
|Owners|Yes|Text value|me|The classifiers to be used as a comma separated list|
|Classifier IDs|Yes|Text value|default|The classifier Ids to be used as a comma separated list|
|Threshold|Yes|Text value||The minimum score a class must have to be displayed in the response as a floating value|
|Language|Yes|Text value||The language of the output|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The results of the API call|
|StatusCode|Numeric value|The status code of the  API call|


##### <a name="classifyimageibm_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## Microsoft
Microsoft's cognitive actions
## Bing spell check
Correct spelling errors, recognize the difference among names, brand names, and slang, as well as understand homophones
### <a name="spellcheck"></a> Spell check
Invokes the Microsoft Cognitive service named 'Bing Spell Check'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Subscription key|No|Text value||The subscription key to use for this API call|
|Text|No|List of Text values||The text or the list of texts to send|
|Mode|Yes|Text value||Specify the spell-check mode|
|Mkt|Yes|Text value||For proof mode, the only supported language codes are: en-us, es-es, pt-br. For spell mode, all language codes are supported|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="spellcheck_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## Computer vision
Analyze images and extract data 
### <a name="analyzeimagemicrosoft"></a> Analyze image
Invokes the Microsoft Cognitive service named 'Analyze Image'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be use for this API call|
|Subscription key|No|Text value||The subscription key to use for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a URL address|
|Image file|No|File||The full path (folder plus filename) of the image file to transmit|
|Image URL|No|Text value||The URL address of an image|
|Visual features|Yes|Text value||A text value indicating what visual feature types to return. Multiple values should be comma-separated. For example: categories, tags, description|
|Details|Yes|Text value||A text value indicating which domain-specific details to return. Multiple values should be comma-separated|
|Language|Yes|Text value||A text value indicating which language to return. The service will return recognition results in the specified language|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|Τhe status code returned|


##### <a name="analyzeimagemicrosoft_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

### <a name="describeimagemicrosoft"></a> Describe image
Invokes the Microsoft Cognitive service named 'Describe Image'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be use for this API call|
|Subscription key|No|Text value||The subscription key to use for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a URL address|
|Image file|No|File||The full path (folder plus filename) of the image file to transmit|
|Image URL|No|Text value||The URL address of an image|
|Max candidates|Yes|Text value||The maximum number of candidate descriptions to be returned. The default is 1|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="describeimagemicrosoft_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

### <a name="ocrmicrosoft"></a> OCR
Invokes the Microsoft Cognitive service named 'OCR'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be use for this API call|
|Subscription key|No|Text value||The subscription key to use for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a URL address|
|Image file|No|File||The full path (folder plus filename) of the image file to transmit|
|Image URL|No|Text value||The URL address of an image|
|Language|Yes|Text value||The BCP-47 language code of the text to detect in the image|
|Detect orientation|Yes|Text value||Specify whether to detect the text orientation in the image|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="ocrmicrosoft_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

### <a name="tagimagemicrosoft"></a> Tag image
Invokes the Microsoft Cognitive service named 'Tag Image'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be use for this API call|
|Subscription key|No|Text value||The subscription key to use for this API call|
|Provide image|N/A|From file, From GCS|From file|Specify whether the image will be provided by a full path or a URL address|
|Image file|No|File||The full path (folder plus filename) of the image file to transmit|
|Image URL|No|Text value||The URL address of an image|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="tagimagemicrosoft_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

## Text Analytics
Detect sentiment, key phrases, named entities and language from text
### <a name="detectlanguage"></a> Detect language
Invokes the Microsoft Cognitive service named 'Text Analytics - Detect Language'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be use for this API call|
|Subscription key|No|Text value||The subscription key to use for this API call|
|Text|No|Text value||The text to analyze|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="detectlanguage_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

### <a name="keyphrases"></a> Key phrases
Invokes the Microsoft Cognitive service named 'Text Analytics - Key Phrases'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be use for this API call|
|Subscription key|No|Text value||The subscription key to use for this API call|
|Text|No|List of Text values||The text or the list of texts to analyze|
|Language|Yes|Text value||The language of the text(s)|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="keyphrases_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|

### <a name="sentiment"></a> Sentiment
Invokes the Microsoft Cognitive service named 'Text Analytics - Sentiment'

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server location|N/A|West US, West US 2, East US, East US 2, West Central US, South Central US, West Europe, North Europe, Southeast Asia, East Asia, Australia East, Brazil South, Canada Central, Central India, UK South, Japan East|West US|The server location to be use for this API call|
|Subscription key|No|Text value||The subscription key to use for this API call|
|Text|No|List of Text values||Text|
|Language|Yes|Text value||The 2 letter ISO 639-1 representation of the language of the text(s)|
|Timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before it fails|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response results|
|StatusCode|Numeric value|The status code returned|


##### <a name="sentiment_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Request timeout expired|Indicates that the timeout expired while performing the request|
|Failed to Invoke cognitive services|Indicates a problem while trying to invoke Cognitive Services|


