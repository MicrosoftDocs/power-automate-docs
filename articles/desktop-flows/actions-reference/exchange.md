---
title: Exchange Server actions reference
description: See all the available Exchange Server actions.
author: mattp123

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 10/24/2023
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

# Exchange Server actions

> [!WARNING]
> This group of actions is intended for Exchange Server automation scenarios. To automate Exchange Online, use the corresponding Office 365 cloud connectors in cloud flows.

The Exchange Server actions enable you to connect to an Exchange server and manage your correspondence.

Exchange Server actions require a connection to an Exchange server that you can establish using the **Connect to Exchange server** action.

The following example contains a manually populated server address rather than using auto-discovery. The credentials are set to **user defined**, so the domain, username, and password are manually entered. A set timeout in the **Advanced** section allows the action to return an error if a connection hasn't been established within the specified time frame.

:::image type="content" source="media/exchange/connect-to-exchange-server-example.png" alt-text="Screenshot of the Connect to Exchange server action.":::

To retrieve emails from an exchange server, use the **Retrieve Exchange email messages** action. The following example retrieves email messages from a custom folder named **Receipts**. The filters contain variables that have been previously defined in the desktop flow. The action will save all attachments locally to the specified folder.

:::image type="content" source="media/exchange/retrieve-exchange-emails-example.png" alt-text="Screenshot of the Retrieve Exchange email messages action.":::

The **Process Exchange email messages** action processes email messages retrieved by the **Retrieve Exchange email messages** action. Use this action to move, delete, or mark email messages as read.

## <a name="connecttoexchangeserver"></a> Connect to Exchange server

Open a new connection to an Exchange server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Exchange server version|N/A|Exchange 2010, Exchange 2010 SP1, Exchange 2010 SP2, Exchange 2013, Exchange 2013 SP1|Exchange 2013 SP1|The version of the Exchange server|
|Connection type|N/A|Auto discovery, Exchange server address|Auto discovery|Specifies how to connect to the Exchange server|
|Server address|No|[Text value](../variable-data-types.md#text-value)||The Exchange server address|
|Email address|No|[Text value](../variable-data-types.md#text-value)||The Exchange account email address|
|Credentials|N/A|Exchange default, User defined|Exchange default|Specifies the way to provide the user's Exchange credentials|
|Domain|Yes|[Text value](../variable-data-types.md#text-value)||The Exchange account domain. To extract the account domain from the username, left this field empty|
|Username|No|[Text value](../variable-data-types.md#text-value)||The Exchange account username|
|Password|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The Exchange account password|
|Timeout|Yes|[Numeric value](../variable-data-types.md#numeric-value)|30|The time in seconds to wait for the connection to be established before the action fails|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ExchangeConnection|[Exchange connection](../variable-data-types.md#connections)|The specific Exchange connection for use with later Exchange actions|

### <a name="connecttoexchangeserver_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to connect to the Exchange server|Indicates a problem connecting to the Exchange server|

## <a name="retrieveexchangemessages"></a> Retrieve Exchange email messages

Retrieve email messages from the specified Exchange server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Exchange connection|No|[Exchange connection](../variable-data-types.md#connections)||The Exchange connection. Create an Exchange connection with the 'Connect to Exchange server' action|
|Mailbox type|N/A|Personal, Shared|Personal|The type of the mailbox to retrieve email messages from|
|Shared mailbox address|No|[Text value](../variable-data-types.md#text-value)||The address of the shared mailbox to retrieve email messages from|
|Retrieve email messages from custom folder|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to retrieve email messages from a custom folder or a predefined Exchange folder|
|Exchange folder|N/A|Inbox, Deleted items, Drafts, Outbox, Sent items, Junk email|Inbox|A predefined Exchange folder to retrieve email messages from|
|Mail folder|No|[Text value](../variable-data-types.md#text-value)|Inbox|The name or path (e.g. folder1\folder2) of the mail-folder to retrieve email messages from|
|Retrieve|N/A|All email messages, Unread email messages only, Read email messages only|Unread email messages only|Specifies whether to retrieve all email messages in the folder or only the unread ones|
|Mark as read|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specifies whether to mark as read the retrieved email messages or leave them as is|
|From contains|Yes|[Text value](../variable-data-types.md#text-value)||The full email address of the sender to retrieve messages from. Leave this attribute blank to retrieve all messages regardless of the sender|
|To contains|Yes|[Text value](../variable-data-types.md#text-value)||The full email address(es) of the recipient(s) (separated by space if more than one) for the email messages to retrieve. Leave this attribute blank to retrieve all email messages regardless of the recipient(s)|
|Subject contains|Yes|[Text value](../variable-data-types.md#text-value)||The key phrase to find within the email subject. Leave this attribute blank to retrieve all email messages regardless of their subject|
|Body contains|Yes|[Text value](../variable-data-types.md#text-value)||The key phrase to find within the email body. Leave this attribute blank to retrieve all email messages regardless of their content|
|Attachments|N/A|Save attachments, Do not save attachments|Do not save attachments|Specifies whether to save the attachments of the email messages retrieved or not|
|Save attachments into|No|[Folder](../variable-data-types.md#files-and-folders)||The folder to save the attachments into|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|RetrievedEmails|[List](../variable-data-types.md#list) of [Exchange mail messages](../variable-data-types.md#exchange)|The retrieved email messages for later processing as a list of Exchange mail messages objects|

### <a name="retrieveexchangemessages_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to save attachments|Indicates a problem saving the attachments|
|Specified mail-folder doesn't exist|Indicates that the specified mail folder doesn't exist|
|Failed to retrieve email messages|Indicates a problem retrieving the email messages|

## <a name="sendmessage"></a> Send Exchange email message

Create and send a new email message.

The **Send Exchange email message** action creates and sends a new email message upon connecting to an Exchange server. Before adding this action, add the **Connect to Exchange server** action to set up a connection to your Exchange server first. The output of this action is the %ExchangeConnection% variable that should be used as input to the **Send Exchange email message** action.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Exchange connection|No|[Exchange connection](../variable-data-types.md#connections)||The Exchange connection. Create an Exchange connection with the 'Connect to Exchange server' action|
|From|No|[Text value](../variable-data-types.md#text-value)||The sender's email address|
|Sender display name|Yes|[Text value](../variable-data-types.md#text-value)||The sender's display name|
|To|No|[Text value](../variable-data-types.md#text-value)||The email(s) of the recipient(s). To enter more than one email, separate the list of addresses by semi-colons|
|CC|Yes|[Text value](../variable-data-types.md#text-value)||The email(s) of the CC recipient(s). To enter more than one email, separate the list of addresses by semi-colons|
|BCC|Yes|[Text value](../variable-data-types.md#text-value)||The email(s) of the BCC (hidden) recipient(s). To enter more than one email, separate the list of addresses by semi-colons|
|Subject|Yes|[Text value](../variable-data-types.md#text-value)||The subject of the email|
|Body|Yes|[Text value](../variable-data-types.md#text-value)||The text of the body|
|Body is HTML|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to interpret the body of the email as HTML coding|
|Attachment(s)|Yes|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)||The full path of any attachment(s). Enclose multiple files in double quotes (") and separate them by a space character|

### Variables produced

This action doesn't produce any variables.

### <a name="sendmessage_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Attachment not found|Indicates that the specified attachment(s) don't exist|
|Failed to send email|Indicates a problem sending the email|

## <a name="processexchangemessages"></a> Process Exchange email messages

Move, delete or mark as unread an email message (or a list of email messages).

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Exchange connection|No|[Exchange connection](../variable-data-types.md#connections)||The Exchange connection. Create an Exchange connection with the 'Connect to Exchange server' action|
|Email message(s) to process|No|[List](../variable-data-types.md#list) of [Exchange mail messages](../variable-data-types.md#exchange)||The email message(s) to process. Use a variable populated by a 'Retrieve Exchange email messages' action|
|Operation|N/A|Delete email messages from server, Mark email messages as unread, Move email messages to mail folder|Move email messages to mail folder|Specifies which operation to perform on the specified email messages|
|Mailbox type|N/A|Personal, Shared|Personal|The type of the mailbox to retrieve email messages from|
|Shared mailbox address|No|[Text value](../variable-data-types.md#text-value)||The address of the shared mailbox to retrieve email messages from|
|Move to custom folder|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specifies whether to move email messages to a custom folder or a predefined Exchange folder|
|Exchange folder|N/A|Inbox, Deleted items, Drafts, Outbox, Sent items, Junk email|Inbox|A predefined Exchange folder to move email messages from|
|Mail folder|No|[Text value](../variable-data-types.md#text-value)|Inbox|The name or path (e.g. folder1\folder2) of the mail-folder to move email messages to|

### Variables produced

This action doesn't produce any variables.

### <a name="processexchangemessages_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Specified mail-folder doesn't exist|Indicates that the specified mail folder doesn't exist|
|Failed to process email messages|Indicates a problem processing the specified email messages|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
