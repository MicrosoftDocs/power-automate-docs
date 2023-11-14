---
title: SAP GUI actions reference for Power Automate for desktop
description: Learn about the available SAP GUI actions in Power Automate for desktop flows.
author: NikosMoutzourakis
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/06/2023
ms.author: nimoutzo
ms.reviewer: matp
contributors:
- jpapadimitriou
- Yiannismavridis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---
# SAP GUI actions

Our group of actions for SAP GUI automation provides a set of tools to help streamline and automate your SAP workflows. With these actions, you can easily launch the SAP GUI app, create new sessions, select menu items, start and end transactions, and more.

Additionally, these actions can be seamlessly integrated with the other actions available in Power Automate for desktop, including the UI automation group of actions. This group of actions enables you to interact with all SAP GUI UI elements, such as clicking, inserting text, and extracting data. By combining our SAP GUI automation actions with the UI automation group of actions, you create powerful RPA workflows that automate even the most complex SAP processes.

> [!NOTE]
> Power Automate for desktop supports automation with SAP GUI version 750 or later.

## <a name="saplogin"></a> Launch SAP

Open the SAP GUI application and connect to a SAP system.

For connection mode:

- The server description option allows you to connect with a SAP system through the SAP name or IP address. To do this, you need the necessary login credentials and access permissions. The server description is a human-readable name or description of the SAP system.
- The server connection string option allows you to connect with a SAP system through a connection string. The server connection string typically includes the server ‘s name or IP address, the instance number, and the system ID. The server connection string is a specific format for identifying and connecting to a SAP system.

For multiple logon options:

- Terminate this logon option terminates the specific action’s login.
- Continue this logon and end any other logons option replaces the existing SAP instance with the specific logon.
- Continue this logon without ending any other logons in the system option creates a new SAP session.

> [!NOTE]
> SAP GUI doesn't allow more than six active connections (sessions) to a SAP system.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Connection mode|N/A|Server description and server connection string|Server description|Specify how to connect to the SAP GUI server.|
|Login mode|N/A|Manual login and single sign-on (SSO)|Manual login|Specify how to log in to the SAP GUI server, either log in to the server by manually entering your username and password or using single sign-on (SSO).|
|Server description|Yes|[Text value](../variable-data-types.md#text-value)||Specifies SAP system name or IP address for connection.|
|Connection string|Yes|[Text value](../variable-data-types.md#text-value)||Specifies the connection string for the SAP GUI server. The connection string is a unique identifier that specifies the server's name, system number, and other connection details.|
|Client|No|[Text value](../variable-data-types.md#text-value)||Specifies the SAP client number for connection.|
|Username|No|[Text value](../variable-data-types.md#text-value)||Specifies the SAP user ID for login.|
|Password|Yes|[Text value](../variable-data-types.md#text-value)||Specifies the SAP user password for login.|
|Language|No|[Text value](../variable-data-types.md#text-value)||Specifies the SAP login language for the user interface.|
|Multiple logon options|No|Terminate this logon, continue this logon and end any other logons, Continue this logon without ending any other logons in the system|Terminate this logon|Multiple logon options specify how the SAP system behaves when the user tries to log in when they're already logged in.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|`SAPInstance`|SAP instance|The SAP instance to use with SAP automation actions. The SAP instance refers to the specific SAP window.|
|`CurrentSAPLoginTerminated`|[Boolean value](../variable-data-types.md#boolean-value)|Whether the SAP login being performed with the specific action is terminated or not.|
|`OtherSAPLoginTerminated`|[Boolean value](../variable-data-types.md#boolean-value)|Whether the other SAP logins are terminated or not.|

### <a name="saplogin_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|SAP GUI login action fails|Indicates a problem logging in to a SAP GUI system.|

## <a name="createnewsession"></a> Create new SAP session

Creates a new SAP session based on the same SAP instance.

> [!NOTE]
> SAP GUI doesn't allow more than six active connections (sessions) to a SAP system.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|`SAPInstance`|No|SAP instance|Select the variable that holds the SAP instance you want to work with. This variable should have been defined in a previous SAP login action.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|`SAPInstance`|SAP instance|The SAP instance to use with SAP automation actions. The SAP instance refers to the specific SAP window.|

### <a name="createnewsession_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Create new SAP session action fails |Indicates a problem creating a new SAP session.|

## <a name="sapselectmenuitem"></a> Select SAP menu item

Select a SAP menu item in the window tool bar. Enter the name of the item in the respective input parameter manually, in the same language as the SAP GUI screen is being displayed.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|`SAPInstance`|No|SAP instance|Select the variable that holds the SAP instance you want to work with. This variable should have been defined in a previous SAP login action.|
|Menu item name|No|[Text value](../variable-data-types.md#text-value)||The name of the menu item in the toolbar to be selected, such as ‘Save’. Insert the name of the menu item as it's displayed in the machine’s SAP installation.|

### Variables produced

This action doesn't produce any variables.

### <a name="sapselectmenuitem_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Select SAP menu item action fails |Indicates a problem selecting a menu item.|

## <a name="closesapconnection"></a> Close SAP connection

Close the SAP connection of the selected SAP instance. Note that all instances related to the specific connection will be terminated.  

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|`SAPInstance`|No|SAP instance|Select the variable that holds the SAP instance you want to work with. This variable should have been defined in a previous SAP login action.|

### Variables produced

This action doesn't produce any variables.

### <a name="closesapconnection_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Close SAP session action fails|Indicates a problem closing a SAP session.|

## <a name="starttransaction"></a> Start SAP transaction

Opens a specific transaction code in existing session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|`SAPInstance`|No|SAP instance|Select the variable that holds the SAP instance you want to work with. This variable should have been defined in a previous SAP login action.|
|Transaction code|No|[Text value](../variable-data-types.md#text-value)||The transaction code that you desire to execute.|

### Variables produced

This action doesn't produce any variables.

### <a name="starttransaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Start SAP transaction action fails |Indicates a problem starting a SAP transaction.|

## <a name="endtransaction"></a> End SAP transaction 

Closes the SAP transaction in a specific SAP instance and returns to the SAP easy access menu. A SAP transaction must be started before for the specific SAP session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|`SAPInstance`|No|SAP instance|Select the variable that holds the SAP instance you want to work with. This variable should have been defined in a previous SAP login action.|

### Variables produced

This action doesn't produce any variables.

### <a name="endtransaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|End SAP transaction action fails |Indicates a problem ending a SAP transaction.|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]