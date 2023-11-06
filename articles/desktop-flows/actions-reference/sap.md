---
title: SAP GUI actions reference
description: Learn about the available SAP GUI actions in desktop flows.
author: nikosmoutzourakis
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/06/2023
ms.author: Nikosmoutzourakis
ms.reviewer: gtrantzas
contributors:
- jpapadimitriou
- Yiannismavridis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# SAP GUI actions

Our new group of actions for SAP GUI automation provides a set of tools to help streamline and automate your SAP workflows. With these actions, you can easily launch the SAP GUI app, create new sessions, select menu items, start and end transactions, and more.

Additionally, these actions can be seamlessly integrated with the other actions available in Power Automate for desktop, including the UI automation group of actions. This group of actions enables you to interact with all SAP GUI UI elements, such as clicking, inserting text, and extracting data. By combining our SAP GUI automation actions with the UI automation group of actions, you can create powerful RPA workflows that automate even the most complex SAP processes.

> [!NOTE]
> Power Automate for desktop supports automation with SAP GUI version 750 or later.





## <a name="saplogin"></a> Launch SAP

Launching SAP GUI application and connect to a SAP system. 

For connection mode:
- Server description option will allow the user to connect with a SAP system through its name or its IP address. To do this, you will need to have the necessary login credentials and access permissions. The server description is a human-readable name or description of the SAP system.
- Server connection string option will allow the user to connect with a SAP system through a connection string. The server connection string typically includes the server ‘s name or IP address, the instance number, and the system ID. Server connection string is a specific format for identifying and connecting to a SAP system. 

For multiple logon options:
- Terminate this logon option terminates the specific action’s login.
- Continue this logon and end any other logons option will replace the existing SAP instance with the specific logon.
- Continue this logon without ending any other logons in the system option will create a new SAP session. 

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Connection mode|N/A|Server description and Server connection string|Server description|Specify how to connect to the SAP GUI server.|
|Login mode|N/A|Manual Login and Single sign-on (SSO)|Manual Login|Specify how to log in to the SAP GUI server, either log in to the server by manually entering your username and password or using Single Sign-On (SSO).|
|Server description|Yes|[Text value](../variable-data-types.md#text-value)||Specifies SAP system name or IP address for connection.|
|Connection string|Yes|[Text value](../variable-data-types.md#text-value)||Specify the connection string for the SAP GUI server. The connection string is a unique identifier that specifies the server's name, system number, and other connection details.|
|Client|No|[Text value](../variable-data-types.md#text-value)||Specifies SAP client number for connection.|
|Username|No|[Text value](../variable-data-types.md#text-value)||Specifies SAP user ID for login.|
|Password|Yes|[Text value](../variable-data-types.md#text-value)||Specifies SAP user password for login.|
|Language|No|[Text value](../variable-data-types.md#text-value)||Specifies SAP login language for user interface.|
|Multiple logon options|No|Terminate this logon, Continue this logon and end any other logons, Continue this logon without ending any other logons in the system|Terminate this logon|Multiple logon options specify how SAP system behaves when user tries to log in when it is already logged in.|


### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|SAPInstance|SAP Instance|The SAP instance to use with SAP automation actions. The SAP instance refers to the specific SAP window.|
|CurrentSAPLoginTerminated|[Boolean value](../variable-data-types.md#boolean-value)|Whether the SAP login being performed with the specific action is terminated or not.|
|OtherSAPLoginTerminated|[Boolean value](../variable-data-types.md#boolean-value)|Whether the other SAP logins are terminated or not.|

### <a name="saplogin_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|SAP GUI login action fails|Indicates a problem logging in a SAP GUI system.|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]

