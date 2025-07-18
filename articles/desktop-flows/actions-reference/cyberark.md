---
title: CyberArk actions reference
description: See all the available CyberArk actions.
author: jpapadimitriou
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 05/30/2024
ms.author: dipapa
ms.reviewer: matp
contributors:
- jpapadimitriou
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
- DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
ms.custom: sfi-image-nochange
---

# CyberArk actions

CyberArk offers an identity security platform that secures human and machine identities from end-to-end. Power Automate enables you to retrieve credentials from CyberArk through the **Get password from CyberArk** action.

> [!NOTE]
> To retrieve credentials from CyberArk, Power Automate issues web requests to CyberArk’s Central Credential Provider web service (AIMWebService).

To find the required information to populate the action, see the following instructions:

- **Application ID**: To find the application ID, open CyberArk Password Vault on a web browser and navigate to the **Applications** tab. Select **Components**, open the  **Private Ark** application, and then select the desired **Vault**. You can add **Owners** here.

- **Safe**: Populate the name of the safe displayed in PrivateArk Client.

- **Folder** and **Object**: Select a safe in PrivateArk Client, and populate the folder name displayed on the left pane and the object name displayed in the main list.

:::image type="content" source="media/cyberark/get-password-cyberark-action.png" alt-text="Screenshot of the Get password from CyberArk action.":::

## <a name="getpasswordbase"></a> Get password from CyberArk

Retrieves a password for a specific application from CyberArk.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Server address|No|[Text value](../variable-data-types.md#text-value)||The base URI for the web request to connect. For example, `https://yourservice.skytap.com:111`|
|Application ID|No|[Text value](../variable-data-types.md#text-value)||The application ID to use for the web request. </br></br>To find the application ID, open CyberArk Password Vault on a web browser and navigate to the **Applications** tab. Select **Components**, open the **Private Ark** application, and then select the desired Vault. You can add Owners here.|
|Safe|No|[Text value](../variable-data-types.md#text-value)||The safe on CyberArk in which the application belongs|
|Folder|No|[Text value](../variable-data-types.md#text-value)||The folder necessary for the web request query|
|Object|No|[Text value](../variable-data-types.md#text-value)||The object necessary for the web request query|
|Extra data|Yes|[Text value](../variable-data-types.md#text-value)||The extra data (if any) for the web request's query|
|Accept untrusted certificates|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to accept untrusted certificates|
|Certificate location|N/A|Don't use certificate, Load certificate from Windows Store, Load certificate from file|Don't use certificate|Specifies how to load (if needed) the certificate for the request|
|Use only valid certificates|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to load only valid certificates from the store|
|Store certificate path|No|[Text value](../variable-data-types.md#text-value)||The path of the certificate in the certificate store. The certificate is represented by its serial number. The path should use the following format:</br></br> (local path to certificate)/(certificate serial)|
|Certificates path|No|[File](../variable-data-types.md#files-and-folders)||The path of the certificate.|
|Certificate password|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The password for the certificate file|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The waiting time (in seconds) to get results from CyberArk|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|JSONResponse|[Custom object](../variable-data-types.md#custom-object)|The API response result|
|CyberArkPassword|Encrypted value|The password retrieved from CyberArk|

### <a name="getpasswordbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to send web request|Indicates a problem sending the web request|
|Timeout expired|Indicates that the request timed out|
|Error response from web request|Indicates that the web request returned an error response|

### Known issues

- NTLM Authentication is currently not supported for web requests in Power Automate for desktop.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
