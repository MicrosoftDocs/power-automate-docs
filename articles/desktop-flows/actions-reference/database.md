---
title: Database actions reference
description: See all the available database actions.
author: cochamos
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 02/21/2025
ms.author: cochamos
ms.reviewer: matp
ms.collection: bap-ai-copilot
contributors:
- jpapadimitriou
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Database actions

To connect to a database, use the **Open SQL connection** action. A connection string specifies all information necessary to connect to a database, such as the driver, the database, server names, and the username and password.

The following connection string connects to an Excel database:

```Connection string
Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\myFolder\myExcelFile.xlsx;Extended Properties="Excel 12.0 Xml;HDR=YES";
```

The following connection string connects to an Access database:

```Connection string
Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\myFolder\myAccessFile.accdb; Persist Security Info=False;
```

> [!NOTE]
> Power Automate for desktop is a 64-bit application. Only 64-bit installed drivers are available for selection in the **Open SQL connection** action.

## Configure a connection string manually

To manually build a connection string:

1. Select **Build connections string** to open the **Data Link Properties** dialog. The data link tool helps you compose the required connection string step by step.

2. Once you access the wizard, select the correct driver for the database under **Provider**.

    :::image type="content" source="media\database\data-link-properties-provider-tab.png" alt-text="Screenshot of the Data Link Properties tab.":::

3. Next, under the **Connection** tab, enter the remaining details such as the server name, the username, password, and database name. Select **Test Connection** to test that the connection string connects successfully.

    :::image type="content" source="media\database\data-link-properties-connection-tab.png" alt-text="Screenshot of the data link properties connection tab.":::

4. Specify a connection timeout and other network settings in the **Advanced** tab.

    :::image type="content" source="media\database\data-link-properties-advanced-tab.png" alt-text="Screenshot of the data link properties advanced tab.":::

## <a name="connect"></a> Open SQL connection

Open a new connection to a database.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Connection string|No|[Text value](../variable-data-types.md#text-value)||The connection string to use to connect to the database|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|SQLConnection|[SQL connection](../variable-data-types.md#connections)|A handle for the new SQL connection|

### <a name="connect_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't connect to data source|Indicates a problem connecting to the data source|
|Invalid connection string|Indicates that the specified connection string is invalid|

## <a name="executesqlstatement"></a> Execute SQL statement

Connect to a database and execute a SQL statement.

To execute an SQL query, use the **Execute SQL statement** action. Begin by providing a valid connection to the respective database. Select the desired option in the **Get connection by** property. You can either provide an **SQL connection variable** (you can create one by using the **Open SQL connection** action) or by providing the **Connection string**. Then input the SQL query you want to execute in the **SQL statement** property. You can also modify the timeout seconds of the action or leave the default option (30 seconds).

## Natural language to script powered by copilot (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Natural language to script is a new copilot capability added in Power Automate for desktop. It lets you quickly generate scripts used in the execute SQL statement action by providing a description in natural language.

> [!IMPORTANT]
> [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]

### Availability by region

Currently, natural language to script in Power Automate for desktop is only available in environments located in the United States.

### Availability by account type

Currently, natural language to script in Power Automate for desktop is only available for users with a work or school account.

> [!NOTE]
> If your environment is in the region where this feature is available and you still can't experience the copilot in Power Automate for desktop experience, contact your tenant administrator. They might have turned off the copilot functionality.

### How to generate scripts using copilot and natural language

To generate SQL code in the execute SQL statement select  **Generate script with Copilot**.

:::image type="content" source="media\scripting\sql_action1.png" alt-text="Screenshot of the execute SQL statement action with the Generate script with Copilot button highlighted":::

The create prompt screen opens where you type your natural language prompt.

:::image type="content" source="media\scripting\sql_action2.png" alt-text="Screenshot of the execute SQL statement action with the prompt dialog open":::

To create a SQL script, write your prompt and select **Generate**. If you need to re-create it, you can change the prompt and select **Regenerate**. Otherwise, select **Use this script** to go back to the main action window, where you can modify your prompt and add any necessary variables.

:::image type="content" source="media\scripting\sql_action3.png" alt-text="Screenshot of the Generate Script with Copilot dialog open, that shows a generated SQL statement":::

> [!IMPORTANT]
> Make sure that you always review the content generated by the AI model.

### Help us improve this feature

Send feedback by selecting the thumb up or thumb down icon underneath the AI-generated content. Once you do, a feedback dialog appears, which you can use to submit feedback to Microsoft.
:::image type="content" source="media\scripting\feedback_dialog1.png" alt-text="Animated gif that shows the copilot answering a user's question from the designer.":::

> [!NOTE]
> If you can't see the dialog, your tenant admin might have turned it off. More information: [Disabling the user feedback functionality](#disabling-the-user-feedback-functionality)

### Disabling the user feedback functionality

As a tenant admin you can prevent your users from sending feedback to Microsoft by disabling the `disableSurveyFeedback` tenant setting. Find more information about viewing and setting tenant settings here:

- [List tenant settings (preview)](/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings)
- [Set TenantSettings](/powershell/module/microsoft.powerapps.administration.powershell/set-tenantsettings)

### Data subject rights requests on user feedback

Tenant administrators can view, export, and delete the feedback provided by their users by signing in to the [Microsoft 365 admin center](https://admin.microsoft.com), and then selecting **Health** > **Product feedback**.

### AI with Power Automate resources

- [FAQ for Generating scripts with natural language](../../faqs-copilot-nl-to-code.md)
- [Responsible AI FAQs for Power Automate](../../responsible-ai-overview.md)
- [FAQ for Copilot data security and privacy in Microsoft Power Platform](/power-platform/faqs-copilot-data-security-privacy)

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Get connection by|N/A|Connection string, [SQL connection variable]|SQL connection variable|Specifies whether to create a new connection from a given connection string or select an already open connection|
|SQL connection|No|[SQL connection](../variable-data-types.md#connections)||The handle for the new SQL connection|
|Connection string|No|[Text value](../variable-data-types.md#text-value)||The connection string to use to connect to the database|
|SQL statement|No|[Text value](../variable-data-types.md#text-value)||The SQL statement to execute to the database|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The maximum amount of time to wait for a result from the database|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|QueryResult|[Datatable](../variable-data-types.md#datatable)|The result from the database in the form of a data table, with rows and columns|

### <a name="executesqlstatement_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't connect to data source|Indicates a problem connecting to the data source|
|Invalid connection string|Indicates that the specified connection string is invalid|
|Error in SQL statement|Indicates there's an error in the given SQL statement|

## <a name="close"></a> Close SQL connection

Close an open connection to a database.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|SQL connection|No|[SQL connection](../variable-data-types.md#connections)||The handle for the new SQL connection|

### Variables produced

This action doesn't produce any variables.

### <a name="close_onerror"></a> Exceptions

This action doesn't include any exceptions.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
