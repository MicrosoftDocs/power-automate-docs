---
title: HTTP | Microsoft Docs
description: HTTP Actions Reference
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 12/02/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# HTTP

Communicate with web applications and services directly

You can find more information on how to use the web actions [here](../automation-web.md)


|<!-- --> |
|-----|
|[Download from web](#downloadfromweb)|
|[Invoke SOAP web service](#invokesoapserviceaction)|
|[Invoke web service](#invokewebservicebase)|

## Getting started with web actions

HTTP actions enable users to interact with APIs and send web requests that perform various operations, such as uploading and downloading data and files.

To send an API request, like POST, GET, PUT, or DELETE, you can use the **Invoke web service** action. 

In the action's properties, you have to populate the service's URL and the appropriate HTTP method. Additionally, you have to choose the request and response content type, such as XML and JSON.

The **Custom headers** and **Request body** fields depend on the API, and you have to configure them as described in its documentation.

![Screenshot of the Invoke web service action.](media\web\invoke-web-service-action.png)

If the webserver requires authentication, you can populate your credentials in the appropriate fields of the action's **Advanced** settings.

![Screenshot of the advanced settings of the Invoke web service action.](media\web\invoke-web-service-action-advanced.png)

The results of the web service request are stored in a variable named **WebServiceResponse**. If the results are files, you can select to save them locally on your desktop.

To download text or files from the web, you can use the **Download from web action**. This action requires you to populate the URL of the web page or the file and select the appropriate HTTP method.

![Screenshot of the Download from web action action.](media\web\download-from-web-action.png)

If the webserver requires authentication, you can populate your credentials in the appropriate fields of the action's **Advanced** settings.

![Screenshot of the advanced settings of Download from web action action.](media\web\download-from-web-action-advanced.png)

The downloaded text is stored in a variable named **WebPageText**. If you use the action to download files, you can select to save them locally on your desktop.

> [!NOTE]
> Apart from the HTTP actions, Power Automate enables users to interact with web application through the browser automation actions. You can find more information about browser automation actions in [Browser automation](webautomation.md).

## HTTP actions

### <a name="downloadfromweb"></a> Download from web
Downloads text or a file from the web and stores it

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|URL|No|Text value||The web page or file's URL|
|Method|N/A|GET, POST|GET|Specify how to retrieve a website's information. GET should be used when all information needed is in the URL, and POST to enter more information (passwords, etc)|
|Post parameters|No|Datatable||The POST parameters in the form of a datatable with two columns|
|Save response|N/A|Get text into variable (for web pages), Save to disk (for files)|Get text into variable (for web pages)|Specify how the returned data will be saved|
|File name|N/A|Keep original file name (specify only destination folder), Specify full path (destination folder + custom file name)|Keep original file name (specify only destination folder)|Specify whether to keep the original file name of the downloaded file or specify a new name|
|Destination folder|No|Folder||The folder where the file returned from the web server will be saved|
|Destination file path|No|File||The full path (folder plus filename) where the file returned by the web server will be stored|
|Connection timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before giving up|
|Follow redirection|N/A|Boolean value|True|Specify whether to allow the web server to redirect you to another web page or website|
|Clear cookies|N/A|Boolean value|False|Specify whether to clear all cookies created by similar actions during this automation|
|User agent|Yes|Text value|Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20100312 Firefox/3.6|Specify which browser identity to be seen as. Some web servers will not allow access unless a browser identity is chosen|
|Encoding|N/A|Auto - detect, IBM037 : IBM EBCDIC (US-Canada), IBM437 : OEM United States, IBM500 : IBM EBCDIC (International), ASMO-708 : Arabic (ASMO 708), DOS-720 : Arabic (DOS), ibm737 : Greek (DOS), ibm775 : Baltic (DOS), ibm850 : Western European (DOS), ibm852 : Central European (DOS), IBM855 : OEM Cyrillic, ibm857 : Turkish (DOS), IBM00858 : OEM Multilingual Latin I, IBM860 : Portuguese (DOS), ibm861 : Icelandic (DOS), DOS-862 : Hebrew (DOS), IBM863 : French Canadian (DOS), IBM864 : Arabic (864), IBM865 : Nordic (DOS), cp866 : Cyrillic (DOS), ibm869 : Greek, Modern (DOS), IBM870 : IBM EBCDIC (Multilingual Latin-2), windows-874 : Thai (Windows), cp875 : IBM EBCDIC (Greek Modern), shift_jis : Japanese (Shift-JIS), gb2312 : Chinese Simplified (GB2312), ks_c_5601-1987 : Korean, big5 : Chinese Traditional (Big5), IBM1026 : IBM EBCDIC (Turkish Latin-5), IBM01047 : IBM Latin-1, IBM01140 : IBM EBCDIC (US-Canada-Euro), IBM01141 : IBM EBCDIC (Germany-Euro), IBM01142 : IBM EBCDIC (Denmark-Norway-Euro), IBM01143 : IBM EBCDIC (Finland-Sweden-Euro), IBM01144 : IBM EBCDIC (Italy-Euro), IBM01145 : IBM EBCDIC (Spain-Euro), IBM01146 : IBM EBCDIC (UK-Euro), IBM01147 : IBM EBCDIC (France-Euro), IBM01148 : IBM EBCDIC (International-Euro), IBM01149 : IBM EBCDIC (Icelandic-Euro), utf-16 : Unicode, utf-16BE : Unicode (Big-Endian), windows-1250 : Central European (Windows), windows-1251 : Cyrillic (Windows), Windows-1252 : Western European (Windows), windows-1253 : Greek (Windows), windows-1254 : Turkish (Windows), windows-1255 : Hebrew (Windows), windows-1256 : Arabic (Windows), windows-1257 : Baltic (Windows), windows-1258 : Vietnamese (Windows), Johab : Korean (Johab), macintosh : Western European (Mac), x-mac-japanese : Japanese (Mac), x-mac-chinesetrad : Chinese Traditional (Mac), x-mac-korean : Korean (Mac), x-mac-arabic : Arabic (Mac), x-mac-hebrew : Hebrew (Mac), x-mac-greek : Greek (Mac), x-mac-cyrillic : Cyrillic (Mac), x-mac-chinesesimp : Chinese Simplified (Mac), x-mac-romanian : Romanian (Mac), x-mac-ukrainian : Ukrainian (Mac), x-mac-thai : Thai (Mac), x-mac-ce : Central European (Mac), x-mac-icelandic : Icelandic (Mac), x-mac-turkish : Turkish (Mac), x-mac-croatian : Croatian (Mac), utf-32 : Unicode (UTF-32), utf-32BE : Unicode (UTF-32 Big-Endian), x-Chinese-CNS : Chinese Traditional (CNS), x-cp20001 : TCA Taiwan, x-Chinese-Eten : Chinese Traditional (Eten), x-cp20003 : IBM5550 Taiwan, x-cp20004 : TeleText Taiwan, x-cp20005 : Wang Taiwan, x-IA5 : Western European (IA5), x-IA5-German : German (IA5), x-IA5-Swedish : Swedish (IA5), x-IA5-Norwegian : Norwegian (IA5), us-ascii : US-ASCII, x-cp20261 : T.61, x-cp20269 : ISO-6937, IBM273 : IBM EBCDIC (Germany), IBM277 : IBM EBCDIC (Denmark-Norway), IBM278 : IBM EBCDIC (Finland-Sweden), IBM280 : IBM EBCDIC (Italy), IBM284 : IBM EBCDIC (Spain), IBM285 : IBM EBCDIC (UK), IBM290 : IBM EBCDIC (Japanese katakana), IBM297 : IBM EBCDIC (France), IBM420 : IBM EBCDIC (Arabic), IBM423 : IBM EBCDIC (Greek), IBM424 : IBM EBCDIC (Hebrew), x-EBCDIC-KoreanExtended : IBM EBCDIC (Korean Extended), IBM-Thai : IBM EBCDIC (Thai), koi8-r : Cyrillic (KOI8-R), IBM871 : IBM EBCDIC (Icelandic), IBM880 : IBM EBCDIC (Cyrillic Russian), IBM905 : IBM EBCDIC (Turkish), IBM00924 : IBM Latin-1, EUC-JP : Japanese (JIS 0208-1990 and 0212-1990), x-cp20936 : Chinese Simplified (GB2312-80), x-cp20949 : Korean Wansung, cp1025 : IBM EBCDIC (Cyrillic Serbian-Bulgarian), koi8-u : Cyrillic (KOI8-U), iso-8859-1 : Western European (ISO), iso-8859-2 : Central European (ISO), iso-8859-3 : Latin 3 (ISO), iso-8859-4 : Baltic (ISO), iso-8859-5 : Cyrillic (ISO), iso-8859-6 : Arabic (ISO), iso-8859-7 : Greek (ISO), iso-8859-8 : Hebrew (ISO-Visual), iso-8859-9 : Turkish (ISO), iso-8859-13 : Estonian (ISO), iso-8859-15 : Latin 9 (ISO), x-Europa : Europa, iso-8859-8-i : Hebrew (ISO-Logical), iso-2022-jp : Japanese (JIS), csISO2022JP : Japanese (JIS-Allow 1 byte Kana), iso-2022-jp : Japanese (JIS-Allow 1 byte Kana - SO/SI), iso-2022-kr : Korean (ISO), x-cp50227 : Chinese Simplified (ISO-2022), euc-jp : Japanese (EUC), EUC-CN : Chinese Simplified (EUC), euc-kr : Korean (EUC), hz-gb-2312 : Chinese Simplified (HZ), GB18030 : Chinese Simplified (GB18030), x-iscii-de : ISCII Devanagari, x-iscii-be : ISCII Bengali, x-iscii-ta : ISCII Tamil, x-iscii-te : ISCII Telugu, x-iscii-as : ISCII Assamese, x-iscii-or : ISCII Oriya, x-iscii-ka : ISCII Kannada, x-iscii-ma : ISCII Malayalam, x-iscii-gu : ISCII Gujarati, x-iscii-pa : ISCII Punjabi, utf-7 : Unicode (UTF-7), utf-8 : Unicode (UTF-8)|Auto - detect|The encoding used for the web page. If the Auto-detect option is chosen, the encoding to be used will be specified by the web server|
|Accept untrusted certificates|N/A|Boolean value|False|Specify whether untrusted certificates will be accepted|
|Use credentials|N/A|Boolean value|False|Specify whether the web server requires authentication. This property refers to HTTP authentication (that is, when the browser displays a popup window asking for user name and password)|
|User name|No|Text value||The user name for the web server|
|Password|No|Encrypted value||The password for the web server|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|DownloadedFile|File|The downloaded file|
|WebPageText|Text value|The web page text|


##### <a name="downloadfromweb_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Directory doesn't exist|Indicates that a required directory doesn't exist|
|Download from web error|Indicates a problem downloading from web|

### <a name="invokesoapserviceaction"></a> Invoke SOAP web service
Invokes a method from a SOAP web service

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Endpoint|No|Text value||The endpoint of the web service|
|Custom headers|Yes|Text value||The custom headers to be included in the request that will be sent to the web service
|Request body|No|Text value||The body of the request that will be sent to the web service
|Connection timeout|No|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server
|Follow redirection|N/A|Boolean value|True|Specify whether to allow the web server to redirect you to another web service
|Clear cookies|N/A|Boolean value|False|Specify whether to clear all cookies previously created by similar actions during this flow
|Fail on error status|N/A|Boolean value|False|Specify whether the responses of the invoked web service that denote errors will be processed as if they were normal responses (suppressing all exceptions) or will result in the related exceptions
|User agent|No|Text value|Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20100312 Firefox/3.6|Specify which browser identity to be seen as. Some web servers will not allow access unless a browser identity is chosen
|User agent|Yes|Text value|Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20100312 Firefox/3.6|Specify which browser identity to be seen as. Some web servers will not allow access unless a browser identity is chosen
|Encoding|N/A|Auto - detect, IBM037 : IBM EBCDIC (US-Canada), IBM437 : OEM United States, IBM500 : IBM EBCDIC (International), ASMO-708 : Arabic (ASMO 708), DOS-720 : Arabic (DOS), ibm737 : Greek (DOS), ibm775 : Baltic (DOS), ibm850 : Western European (DOS), ibm852 : Central European (DOS), IBM855 : OEM Cyrillic, ibm857 : Turkish (DOS), IBM00858 : OEM Multilingual Latin I, IBM860 : Portuguese (DOS), ibm861 : Icelandic (DOS), DOS-862 : Hebrew (DOS), IBM863 : French Canadian (DOS), IBM864 : Arabic (864), IBM865 : Nordic (DOS), cp866 : Cyrillic (DOS), ibm869 : Greek, Modern (DOS), IBM870 : IBM EBCDIC (Multilingual Latin-2), windows-874 : Thai (Windows), cp875 : IBM EBCDIC (Greek Modern), shift_jis : Japanese (Shift-JIS), gb2312 : Chinese Simplified (GB2312), ks_c_5601-1987 : Korean, big5 : Chinese Traditional (Big5), IBM1026 : IBM EBCDIC (Turkish Latin-5), IBM01047 : IBM Latin-1, IBM01140 : IBM EBCDIC (US-Canada-Euro), IBM01141 : IBM EBCDIC (Germany-Euro), IBM01142 : IBM EBCDIC (Denmark-Norway-Euro), IBM01143 : IBM EBCDIC (Finland-Sweden-Euro), IBM01144 : IBM EBCDIC (Italy-Euro), IBM01145 : IBM EBCDIC (Spain-Euro), IBM01146 : IBM EBCDIC (UK-Euro), IBM01147 : IBM EBCDIC (France-Euro), IBM01148 : IBM EBCDIC (International-Euro), IBM01149 : IBM EBCDIC (Icelandic-Euro), utf-16 : Unicode, utf-16BE : Unicode (Big-Endian), windows-1250 : Central European (Windows), windows-1251 : Cyrillic (Windows), Windows-1252 : Western European (Windows), windows-1253 : Greek (Windows), windows-1254 : Turkish (Windows), windows-1255 : Hebrew (Windows), windows-1256 : Arabic (Windows), windows-1257 : Baltic (Windows), windows-1258 : Vietnamese (Windows), Johab : Korean (Johab), macintosh : Western European (Mac), x-mac-japanese : Japanese (Mac), x-mac-chinesetrad : Chinese Traditional (Mac), x-mac-korean : Korean (Mac), x-mac-arabic : Arabic (Mac), x-mac-hebrew : Hebrew (Mac), x-mac-greek : Greek (Mac), x-mac-cyrillic : Cyrillic (Mac), x-mac-chinesesimp : Chinese Simplified (Mac), x-mac-romanian : Romanian (Mac), x-mac-ukrainian : Ukrainian (Mac), x-mac-thai : Thai (Mac), x-mac-ce : Central European (Mac), x-mac-icelandic : Icelandic (Mac), x-mac-turkish : Turkish (Mac), x-mac-croatian : Croatian (Mac), utf-32 : Unicode (UTF-32), utf-32BE : Unicode (UTF-32 Big-Endian), x-Chinese-CNS : Chinese Traditional (CNS), x-cp20001 : TCA Taiwan, x-Chinese-Eten : Chinese Traditional (Eten), x-cp20003 : IBM5550 Taiwan, x-cp20004 : TeleText Taiwan, x-cp20005 : Wang Taiwan, x-IA5 : Western European (IA5), x-IA5-German : German (IA5), x-IA5-Swedish : Swedish (IA5), x-IA5-Norwegian : Norwegian (IA5), us-ascii : US-ASCII, x-cp20261 : T.61, x-cp20269 : ISO-6937, IBM273 : IBM EBCDIC (Germany), IBM277 : IBM EBCDIC (Denmark-Norway), IBM278 : IBM EBCDIC (Finland-Sweden), IBM280 : IBM EBCDIC (Italy), IBM284 : IBM EBCDIC (Spain), IBM285 : IBM EBCDIC (UK), IBM290 : IBM EBCDIC (Japanese katakana), IBM297 : IBM EBCDIC (France), IBM420 : IBM EBCDIC (Arabic), IBM423 : IBM EBCDIC (Greek), IBM424 : IBM EBCDIC (Hebrew), x-EBCDIC-KoreanExtended : IBM EBCDIC (Korean Extended), IBM-Thai : IBM EBCDIC (Thai), koi8-r : Cyrillic (KOI8-R), IBM871 : IBM EBCDIC (Icelandic), IBM880 : IBM EBCDIC (Cyrillic Russian), IBM905 : IBM EBCDIC (Turkish), IBM00924 : IBM Latin-1, EUC-JP : Japanese (JIS 0208-1990 and 0212-1990), x-cp20936 : Chinese Simplified (GB2312-80), x-cp20949 : Korean Wansung, cp1025 : IBM EBCDIC (Cyrillic Serbian-Bulgarian), koi8-u : Cyrillic (KOI8-U), iso-8859-1 : Western European (ISO), iso-8859-2 : Central European (ISO), iso-8859-3 : Latin 3 (ISO), iso-8859-4 : Baltic (ISO), iso-8859-5 : Cyrillic (ISO), iso-8859-6 : Arabic (ISO), iso-8859-7 : Greek (ISO), iso-8859-8 : Hebrew (ISO-Visual), iso-8859-9 : Turkish (ISO), iso-8859-13 : Estonian (ISO), iso-8859-15 : Latin 9 (ISO), x-Europa : Europa, iso-8859-8-i : Hebrew (ISO-Logical), iso-2022-jp : Japanese (JIS), csISO2022JP : Japanese (JIS-Allow 1 byte Kana), iso-2022-jp : Japanese (JIS-Allow 1 byte Kana - SO/SI), iso-2022-kr : Korean (ISO), x-cp50227 : Chinese Simplified (ISO-2022), euc-jp : Japanese (EUC), EUC-CN : Chinese Simplified (EUC), euc-kr : Korean (EUC), hz-gb-2312 : Chinese Simplified (HZ), GB18030 : Chinese Simplified (GB18030), x-iscii-de : ISCII Devanagari, x-iscii-be : ISCII Bengali, x-iscii-ta : ISCII Tamil, x-iscii-te : ISCII Telugu, x-iscii-as : ISCII Assamese, x-iscii-or : ISCII Oriya, x-iscii-ka : ISCII Kannada, x-iscii-ma : ISCII Malayalam, x-iscii-gu : ISCII Gujarati, x-iscii-pa : ISCII Punjabi, utf-7 : Unicode (UTF-7), utf-8 : Unicode (UTF-8)	|Auto - detect|The encoding used for the web service response. If the auto-detect option is chosen, the encoding to be used will be specified by the web service
|Accept untrusted certificates|N/A|Boolean value|False|Specify whether untrusted certificates will be accepted
|HTTP Authentication|N/A|Boolean value|False|Specify whether the web server requires HTTP authentication (that is, the browser displays a popup window asking for a username and password)
|User name|No|Text value||The user name for the web server
|Password|No|Encrypted value||The password for the web server

##### <a name="invokesoapserviceaction_builder"></a> Request Builder Parameters
|Argument|Accepts|Description|
|-----|-----|-----|
|WSDL|File|The Web Services Decription Language (WSDL) document to build the request with
|Service|Text value|The service to invoke
|Port|Text value|The port to invoke the service
|SOAP version|Text value|The version of the SOAP service
|Operation|Text value|The operation to invoke the service
|Request envelope|Text value|The envelope to send in the request to invoke the service

##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|SoapServiceResponseHeaders|List of Text values|The HTTP headers of the response|
|SoapServiceResponse|Text value|The web service response text|
|StatusCode|Numeric value|The status code returned|

##### <a name="invokesoapserviceaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invoke SOAP service error|Indicates a problem invoking the SOAP service|
|Invalid header in custom headers|Indicates that some custom headers were invalid|


### <a name="invokewebservicebase"></a> Invoke web service
Invokes a web service by sending data and retrieves the response from the web service

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|URL|No|Text value||The web service's URL|
|Method|N/A|GET, POST, CONNECT, HEAD, PUT, DELETE, OPTIONS, TRACE, PATCH|GET|The HTTP method to be used to invoke the web service|
|Accept|Yes|Text value|application/xml|The acceptable content type for the response of the web service|
|Content type|Yes|Text value|application/xml|The content type of the request that will be sent to the web service|
|Custom headers|Yes|Text value||The custom headers to be included in the request that will be sent to the web service|
|Request body|Yes|Text value||The body of the request that will be sent to the web service|
|Save response|N/A|Get text into variable (for web pages), Save to disk (for files)|Get text into variable (for web pages)|Specify how the returned data will be saved|
|File name|N/A|Keep original file name (specify only destination folder), Specify full path (destination folder + custom file name)|Keep original file name (specify only destination folder)|Specify whether to keep the original file name of the downloaded file or specify a new name|
|Destination folder|No|Folder||The folder where the file returned by the web service will be saved|
|Destination file path|No|File||The full path (folder plus filename) where the file returned by the web service will be stored|
|Connection timeout|Yes|Numeric value|30|The time (in seconds) that the agent should wait for a connection to be established with the server, before giving up|
|Follow redirection|N/A|Boolean value|True|Specify whether to allow the web server to redirect you to another web service|
|Clear cookies|N/A|Boolean value|False|Specify whether to clear all cookies created by similar actions during this automation before this action|
|Fail on error status|N/A|Boolean value|False|Specify whether the responses of the invoked web service that denote errors will be processed as if they were normal responses (suppressing all exceptions) or will result in the related exceptions|
|Encode request body|N/A|Boolean value|True|Specify whether the body of request should be URL-encoded before invoking|
|User agent|Yes|Text value|Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20100312 Firefox/3.6|Specify which browser identity to be seen as. Some web servers will not allow access unless a browser identity is chosen|
|Encoding|N/A|Auto - detect, IBM037 : IBM EBCDIC (US-Canada), IBM437 : OEM United States, IBM500 : IBM EBCDIC (International), ASMO-708 : Arabic (ASMO 708), DOS-720 : Arabic (DOS), ibm737 : Greek (DOS), ibm775 : Baltic (DOS), ibm850 : Western European (DOS), ibm852 : Central European (DOS), IBM855 : OEM Cyrillic, ibm857 : Turkish (DOS), IBM00858 : OEM Multilingual Latin I, IBM860 : Portuguese (DOS), ibm861 : Icelandic (DOS), DOS-862 : Hebrew (DOS), IBM863 : French Canadian (DOS), IBM864 : Arabic (864), IBM865 : Nordic (DOS), cp866 : Cyrillic (DOS), ibm869 : Greek, Modern (DOS), IBM870 : IBM EBCDIC (Multilingual Latin-2), windows-874 : Thai (Windows), cp875 : IBM EBCDIC (Greek Modern), shift_jis : Japanese (Shift-JIS), gb2312 : Chinese Simplified (GB2312), ks_c_5601-1987 : Korean, big5 : Chinese Traditional (Big5), IBM1026 : IBM EBCDIC (Turkish Latin-5), IBM01047 : IBM Latin-1, IBM01140 : IBM EBCDIC (US-Canada-Euro), IBM01141 : IBM EBCDIC (Germany-Euro), IBM01142 : IBM EBCDIC (Denmark-Norway-Euro), IBM01143 : IBM EBCDIC (Finland-Sweden-Euro), IBM01144 : IBM EBCDIC (Italy-Euro), IBM01145 : IBM EBCDIC (Spain-Euro), IBM01146 : IBM EBCDIC (UK-Euro), IBM01147 : IBM EBCDIC (France-Euro), IBM01148 : IBM EBCDIC (International-Euro), IBM01149 : IBM EBCDIC (Icelandic-Euro), utf-16 : Unicode, utf-16BE : Unicode (Big-Endian), windows-1250 : Central European (Windows), windows-1251 : Cyrillic (Windows), Windows-1252 : Western European (Windows), windows-1253 : Greek (Windows), windows-1254 : Turkish (Windows), windows-1255 : Hebrew (Windows), windows-1256 : Arabic (Windows), windows-1257 : Baltic (Windows), windows-1258 : Vietnamese (Windows), Johab : Korean (Johab), macintosh : Western European (Mac), x-mac-japanese : Japanese (Mac), x-mac-chinesetrad : Chinese Traditional (Mac), x-mac-korean : Korean (Mac), x-mac-arabic : Arabic (Mac), x-mac-hebrew : Hebrew (Mac), x-mac-greek : Greek (Mac), x-mac-cyrillic : Cyrillic (Mac), x-mac-chinesesimp : Chinese Simplified (Mac), x-mac-romanian : Romanian (Mac), x-mac-ukrainian : Ukrainian (Mac), x-mac-thai : Thai (Mac), x-mac-ce : Central European (Mac), x-mac-icelandic : Icelandic (Mac), x-mac-turkish : Turkish (Mac), x-mac-croatian : Croatian (Mac), utf-32 : Unicode (UTF-32), utf-32BE : Unicode (UTF-32 Big-Endian), x-Chinese-CNS : Chinese Traditional (CNS), x-cp20001 : TCA Taiwan, x-Chinese-Eten : Chinese Traditional (Eten), x-cp20003 : IBM5550 Taiwan, x-cp20004 : TeleText Taiwan, x-cp20005 : Wang Taiwan, x-IA5 : Western European (IA5), x-IA5-German : German (IA5), x-IA5-Swedish : Swedish (IA5), x-IA5-Norwegian : Norwegian (IA5), us-ascii : US-ASCII, x-cp20261 : T.61, x-cp20269 : ISO-6937, IBM273 : IBM EBCDIC (Germany), IBM277 : IBM EBCDIC (Denmark-Norway), IBM278 : IBM EBCDIC (Finland-Sweden), IBM280 : IBM EBCDIC (Italy), IBM284 : IBM EBCDIC (Spain), IBM285 : IBM EBCDIC (UK), IBM290 : IBM EBCDIC (Japanese katakana), IBM297 : IBM EBCDIC (France), IBM420 : IBM EBCDIC (Arabic), IBM423 : IBM EBCDIC (Greek), IBM424 : IBM EBCDIC (Hebrew), x-EBCDIC-KoreanExtended : IBM EBCDIC (Korean Extended), IBM-Thai : IBM EBCDIC (Thai), koi8-r : Cyrillic (KOI8-R), IBM871 : IBM EBCDIC (Icelandic), IBM880 : IBM EBCDIC (Cyrillic Russian), IBM905 : IBM EBCDIC (Turkish), IBM00924 : IBM Latin-1, EUC-JP : Japanese (JIS 0208-1990 and 0212-1990), x-cp20936 : Chinese Simplified (GB2312-80), x-cp20949 : Korean Wansung, cp1025 : IBM EBCDIC (Cyrillic Serbian-Bulgarian), koi8-u : Cyrillic (KOI8-U), iso-8859-1 : Western European (ISO), iso-8859-2 : Central European (ISO), iso-8859-3 : Latin 3 (ISO), iso-8859-4 : Baltic (ISO), iso-8859-5 : Cyrillic (ISO), iso-8859-6 : Arabic (ISO), iso-8859-7 : Greek (ISO), iso-8859-8 : Hebrew (ISO-Visual), iso-8859-9 : Turkish (ISO), iso-8859-13 : Estonian (ISO), iso-8859-15 : Latin 9 (ISO), x-Europa : Europa, iso-8859-8-i : Hebrew (ISO-Logical), iso-2022-jp : Japanese (JIS), csISO2022JP : Japanese (JIS-Allow 1 byte Kana), iso-2022-jp : Japanese (JIS-Allow 1 byte Kana - SO/SI), iso-2022-kr : Korean (ISO), x-cp50227 : Chinese Simplified (ISO-2022), euc-jp : Japanese (EUC), EUC-CN : Chinese Simplified (EUC), euc-kr : Korean (EUC), hz-gb-2312 : Chinese Simplified (HZ), GB18030 : Chinese Simplified (GB18030), x-iscii-de : ISCII Devanagari, x-iscii-be : ISCII Bengali, x-iscii-ta : ISCII Tamil, x-iscii-te : ISCII Telugu, x-iscii-as : ISCII Assamese, x-iscii-or : ISCII Oriya, x-iscii-ka : ISCII Kannada, x-iscii-ma : ISCII Malayalam, x-iscii-gu : ISCII Gujarati, x-iscii-pa : ISCII Punjabi, utf-7 : Unicode (UTF-7), utf-8 : Unicode (UTF-8)|Auto - detect|The encoding used for the web service response. If the auto-detect option is chosen, the encoding to be used will be specified by the web service|
|Accept untrusted certificates|N/A|Boolean value|False|Specify whether untrusted certificates will be accepted|
|HTTP Authentication|N/A|Boolean value|False|Specify whether the web server requires authentication. This property refers to HTTP authentication (that is, when the browser displays a popup window asking for user name and password)|
|User name|No|Text value||The user name for the web server|
|Password|No|Encrypted value||The password for the web server|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|WebServiceResponseHeaders|List of Text values|The HTTP headers of the response|
|DownloadedFile|File|The downloaded file|
|WebServiceResponse|Text value|The web service response text|
|StatusCode|Numeric value|The status code returned|

##### <a name="invokewebservicebase_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invoke web service error|Indicates a problem invoking the web service|
|Directory doesn't exist|Indicates that a required directory doesn't exist|
|Invalid header in custom headers|Indicates that some custom headers were invalid|




[!INCLUDE[footer-include](../../includes/footer-banner.md)]