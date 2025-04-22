---
title: SAP GUI automation actions reference for Power Automate for desktop
description: Learn about the available SAP automation actions in Power Automate for desktop flows.
author: NikosMoutzourakis
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 03/07/2025
ms.author: nimoutzo
ms.reviewer: matp
contributors:
- jpapadimitriou
- Yiannismavridis
- PetrosFeleskouras
- DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---
# SAP automation actions

Our group of actions for SAP automation provides a set of tools to help streamline and automate your SAP workflows. With these actions, you can easily launch the SAP GUI app, create new sessions, select menu items, start and end transactions, and more.

With the actions of the SAP automation group, you can easily interact with SAP UI elements by clicking on them, filling in text fields, and extracting their data. Just enter the SAP UI element ID attribute value. If you don't know the ID value, you can use the Power Automate for desktop UI element picker to capture the required SAP element and retrieve its ID value. When you capture an SAP UI element in this way, only the element's ID value is recovered, and no UI element is added to the desktop flow's UI element repository.

Our SAP automation actions can also be integrated seamlessly with other actions available in Power Automate for desktop, including the UI automation group of actions. This group of actions allows you to capture all SAP GUI UI elements and add them to the desktop flow's UI element repository. By combining our SAP GUI automation actions with the UI automation group of actions, you can create powerful RPA workflows that automate even the most complex SAP processes.

> [!NOTE]
> Power Automate for desktop supports automation with SAP GUI version 750 or later.

## <a name="saplogin"></a> Launch SAP

Open the SAP GUI application and connect to an SAP system.

For connection mode:

- The server description option allows you to connect with an SAP system through the SAP name or IP address. To do this, you need the necessary login credentials and access permissions. The server description is a human-readable name or description of the SAP system.
- The server connection string option allows you to connect with an SAP system through a connection string. The server connection string typically includes the server ‘s name or IP address, the instance number, and the system ID. The server connection string is a specific format for identifying and connecting to an SAP system.

For multiple logon options:

- Terminate this logon option terminates the specific action’s login.
- Continue this logon and end any other logons option replaces the existing SAP instance with the specific logon.
- Continue this logon without ending any other logons in the system option creates a new SAP session.

> [!NOTE]
> SAP GUI doesn't allow more than six active connections (sessions) to an SAP system.

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
|SAP GUI login action fails|Indicates a problem logging in to an SAP GUI system.|

## <a name="attachtorunning"></a> Attach

Attach the running SAP GUI application to an SAP instance.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Attach mode|No|Foreground or last activated, Window title|Window title|Specifies the mode for attaching the SAP instance to a window. If Foreground or last activated option is selected, the SAP instance is attached to the SAP session in the foreground. If there's no SAP session in the foreground, it attaches to the last SAP session that was launched and isn't closed yet.|
|Window title|Yes|Text||Specifies the title of the SAP window to which the instance is attached. The window title can be selected from the drop-down list of existing SAP sessions or entered manually.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|`SAPInstance`|SAP instance|The SAP instance to use with SAP automation actions. The SAP instance refers to the specific SAP window.|

### <a name="attachtorunning_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Attach to SAP error|Indicates a problem attaching to an SAP instance.|

## <a name="createnewsession"></a> Create new SAP session

Creates a new SAP session based on the same SAP instance.

> [!NOTE]
> SAP GUI doesn't allow more than six active connections (sessions) to an SAP system.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|`SAPInstance`|No|SAP instance||Select the variable that holds the SAP instance you want to work with. This variable should be defined in a previous SAP login action.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|`SAPInstance`|SAP instance|The SAP instance to use with SAP automation actions. The SAP instance refers to the specific SAP window.|

### <a name="createnewsession_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Create new SAP session action fails |Indicates a problem creating a new SAP session.|

## <a name="selectnavigationbaritem"></a> Select SAP navigation item

Select an SAP menu item in the application toolbar of the SAP window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|`SAPInstance`|No|SAP instance| |Select the variable that holds the SAP instance you want to work with. Define this variable in a previous SAP login action.|
|Navigation item name|No|[Text value](../variable-data-types.md#text-value)||The name of the item in the navigation toolbar to select, such as 'System'. You can also specify an option from a submenu by using the '>' symbol to indicate the parent-child relationship. For example, 'Program > Execute' means that the 'Execute' option, which is part of the submenu under 'Program', is selected.|

### Variables produced

This action doesn't produce any variables.

### <a name="selectnavigationbaritem_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|SAP GUI select navigation toolbar item error |Indicates a problem selecting a navigation toolbar item.|

## <a name="sapselectmenuitem"></a> Select SAP menu item

Select an SAP menu item in the window tool bar. Enter the name of the item in the respective input parameter manually, in the same language as the SAP GUI screen is being displayed.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|`SAPInstance`|No|SAP instance||Select the variable that holds the SAP instance you want to work with. This variable should be defined in a previous SAP login action.|
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
|`SAPInstance`|No|SAP instance||Select the variable that holds the SAP instance you want to work with. This variable should be defined in a previous SAP login action.|

### Variables produced

This action doesn't produce any variables.

### <a name="closesapconnection_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Close SAP session action fails|Indicates a problem closing an SAP session.|

## <a name="starttransaction"></a> Start SAP transaction

Opens a specific transaction code in existing session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|`SAPInstance`|No|SAP instance||Select the variable that holds the SAP instance you want to work with. This variable should be defined in a previous SAP login action.|
|Transaction code|No|[Text value](../variable-data-types.md#text-value)||The transaction code that you desire to execute.|

### Variables produced

This action doesn't produce any variables.

### <a name="starttransaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Start SAP transaction action fails |Indicates a problem starting an SAP transaction.|

## <a name="endtransaction"></a> End SAP transaction

Closes the SAP transaction in a specific SAP instance and returns to the SAP easy access menu. An SAP transaction must be started before for the specific SAP session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|`SAPInstance`|No|SAP instance||Select the variable that holds the SAP instance you want to work with. This variable should be defined in a previous SAP login action.|

### Variables produced

This action doesn't produce any variables.

### <a name="endtransaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|End SAP transaction action fails |Indicates a problem ending an SAP transaction.|

## <a name="clicksapguielement"></a> Click SAP UI element

Interacts through click action on any UI element of an SAP window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|`SAPInstance`|No|SAP instance||Select the variable that holds the SAP instance you want to work with. This variable should be defined in a previous SAP login action.|
|Element type|No|Basic SAP element, Checkbox, Label, Drop-down list|Basic SAP element|Select the SAP element type that you need to interact with. The ‘Click SAP element’ option performs a click action on any SAP element as buttons, radio buttons, tabs, text fields, trees.|
|SAP element ID|No|Numeric||The SAP element’s ID. This parameter determines the UI element in SAP that action interacts with. You can use the below button for indication the SAP UI element in the SAP screen or insert the value manually.|
|Set SAP checkbox state to|Yes|Checked, Unchecked|Checked|Specify whether the checkbox becomes checked or unchecked.|
|SAP element ID|No|Numeric||The SAP element’s ID. This parameter determines the UI element in SAP that action interacts with. You can use the below button for indication the SAP UI element in the SAP screen or insert the value manually.|
|SAP label operation|Yes|Expand, Collapse, Choose|Expand|Specify whether to expand or collapse the SAP label.|
|Drop-down option value|Yes|[Text value](../variable-data-types.md#text-value)||Specify the drop-down option is selected.|

### Variables produced

This action doesn't produce any variables.

### <a name="clicksapguielement_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Click Sap GUI Element error|Indicates that the click failed.|

## <a name="getsapelementdetail"></a> Get details of SAP UI element

Gets the value of an SAP UI element's attribute in an SAP window.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|`SAPInstance`|No|SAP instance||Select the variable that holds the SAP instance you want to work with. This variable should be defined in a previous SAP login action.|
|SAP element ID|No|Numeric||The SAP element’s ID. This parameter determines the UI element in SAP that action interacts with. You can use the below button for indication the SAP UI element in the SAP screen or insert the value manually.|
|Attribute name|No|[Text value](../variable-data-types.md#text-value)|Own text|The attribute whose value is retrieved.|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|AttributeValue|[Text value](../variable-data-types.md#text-value)|The value of the SAP UI element's attribute.|

### <a name="getsapelementdetail_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Get SAP element detail error|Indicates a problem retrieving the UI element's attribute.|

## <a name="populatetextfield"></a> Populate SAP text field in element

Fills a text box in an SAP window with the specified text.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|`SAPInstance`|No|SAP instance||Select the variable that holds the SAP instance you want to work with. This variable should be defined in a previous SAP login action.|
|SAP element ID|No|Numeric||The SAP element’s ID. This parameter determines the UI element in SAP that action interacts with. You can use the below button for indication the SAP UI element in the SAP screen or insert the value manually.|
|Text to fill in|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The text to fill in the SAP text field|
|If field isn't empty|Yes|Replace text, Append text|Replace text|Specify whether to replace existing content, or to append.|

### Variables produced

This action doesn't produce any variables.

### <a name="populatetextfield_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Populate Sap Text Field Value error|Indicates a problem populating the specified SAP text field.|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
