---
title: CyberArk | Microsoft Docs
description: CyberArk Actions Reference
author: olegmelnykov
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 12/02/2020
ms.author: olmelnyk
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# CyberArk



Connect to CyberArk and retrieve passwords

|<!-- --> |
|-----|
|[Get password from CyberArk](#getpasswordbase)|



### <a name="getpasswordbase"></a> Get password from CyberArk
Retrieves a password for a specific application from CyberArk

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server address|No|Text value||The base URI for the web request|
|Application ID|No|Text value||The application ID to use for the web request|
|Safe|No|Text value||The safe on CyberArk in which the application belongs|
|Folder|No|Text value||The folder necessary for the web request query|
|Object|No|Text value||The object necessary for the web request query|
|Extra data|Yes|Text value||The extra data (if any) for the web request's query|
|Accept untrusted certificates|N/A|Boolean value|False|Specifies whether to accept untrusted certificates|
|Certificate location|N/A|Don't use certificate, Load certificate from Windows Store, Load certificate from file|Don't use certificate|Specifies how to load (if needed) the certificate for the request|
|Use only valid certificates|N/A|Boolean value|False|Specifies whether to load only valid certificates from the store|
|Store certificate path|No|Text value||The path of the certificate in the certificate store|
|Certificates path|No|File||The path of the certificate selected from the store|
|Certificate password|No|Encrypted value||The password for the certificate file|
|Timeout|Yes|Numeric value|30|The waiting time (in seconds) to get results from CyberArk|

##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|Custom object|The API response result|
|CyberArkPassword|Encrypted value|The password retrieved from CyberArk|

##### <a name="getpasswordbase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to send web request|Indicates a problem sending the web request|
|Timeout expired|Indicates that the request timed out|
|Error response from web request|Indicates that the web request returned an error response|



[!INCLUDE[footer-include](../../includes/footer-banner.md)]