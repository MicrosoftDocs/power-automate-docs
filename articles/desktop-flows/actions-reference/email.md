---
title: Email actions reference
description: See all the available email actions.
author: mattp123

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

# Email actions

Before deploying any email action, you have to configure the server that will handle the requests. The **Retrieve email messages** and **Process email messages** actions require an IMAP server, while the **Send email** action requires an SMTP server.

Common IMAP ports:

* 143 (non-encrypted and TLS)
* 993 (secure IMAP)

Common IMAP servers:

* imap-mail.outlook.com (Outlook.com)
* outlook.office365.com (Office365.com)
* imap.mail.yahoo.com (Yahoo mail)
* imap.gmail.com (Google mail)

Common SMTP ports:

* 25 (non-encrypted)
* 587 (non-encrypted and TLS)
* 465 (SSL)

Common SMTP servers:

* smtp-mail.outlook.com (Outlook.com)
* smtp.office365.com (Office365.com)
* smtp.mail.yahoo.com (Yahoo mail)
* smtp.gmail.com (Google mail)

:::image type="content" source="media/email/email-example.png" alt-text="Screenshot of the IMAP server settings of the Retrieve emails action.":::

To retrieve emails that meet specific criteria, use the **Retrieve email messages** action. The following example retrieves only unread messages from the inbox.

The filter further specifies that the email should be from **b.friday**, the subject should contain **Report**, and the body should contain **Tuesday**. The action will save locally all attachments that match the specified criteria.

:::image type="content" source="media/email/retrieve-email-messages-example.png" alt-text="Screenshot of the Retrieve email messages action.":::

Manage your emails with the **Process email messages** action that requires the variable created by the **Retrieve email messages** action. You can select whether to move, delete, or mark email messages as read/unread.

The following **Send email** action below sends an email from **N. Varga** to **B. Friday**, with **invoicing** in the BCC field. The subject and body contain the **%ReportID%** variable, while the attachment is a file that the flow has processed before.

:::image type="content" source="media/email/send-email-messages-example.png" alt-text="Screenshot of the Send email action.":::

## <a name="retrieveemails"></a> Retrieve email messages

Retrieves email messages from an IMAP server.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|IMAP server|No|[Text value](../variable-data-types.md#text-value)||The IMAP server address (e.g. imap.gmail.com)|
|Port|Yes|[Numeric value](../variable-data-types.md#numeric-value)|993|The port to use for the IMAP server. Usually this port is 993|
|Enable SSL|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to use a secure connection to communicate with the IMAP Server|
|User name|No|[Text value](../variable-data-types.md#text-value)||The username of the email account to access|
|Password|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The password of the email account to access|
|Accept untrusted certificates|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether untrusted certificates will be accepted|
|Mail folder|No|[Text value](../variable-data-types.md#text-value)||The name of the IMAP mail-folder (also known as 'mailBox') to retrieve messages from|
|Retrieve|N/A|All email messages, Unread email messages only, Read email messages only|All email messages|Specify whether to retrieve all messages in the folder or only the unread ones|
|Mark As read|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to mark as read the retrieved messages or leave them as is|
|"From" field contains|Yes|[Text value](../variable-data-types.md#text-value)||The full email address of the sender whose messages will be retrieved. Leave this attribute blank to retrieve all messages regardless of the sender|
|"To" field contains|Yes|[Text value](../variable-data-types.md#text-value)||The full email address(es) of the recipient(s) (separated by space if more than one) for the messages that will be retrieved. Leave this attribute blank to retrieve all messages regardless of the recipient(s)|
|"Subject" contains|Yes|[Text value](../variable-data-types.md#text-value)||The key phrase to find within the email subject. Leave this attribute blank to retrieve all emails regardless of their subject|
|'Body' contains|Yes|[Text value](../variable-data-types.md#text-value)||The key phrase to find within the email body. Leave this attribute blank to retrieve all emails regardless of their content|
|Save attachments|N/A|Save attachments, Do not save attachments|Do not save attachments|Specify whether to save the attachments of the emails retrieved or not|
|Save attachments into|No|[Folder](../variable-data-types.md#files-and-folders)||The folder to save the attachments|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|RetrievedEmails|[List](../variable-data-types.md#list) of [Mail Messages](../variable-data-types.md#email)|The retrieved emails for later processing as a list of mail message objects|

### <a name="retrieveemails_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to connect to IMAP server|Indicates that there was a problem connecting to the IMAP server|
|Failed to authenticate to the IMAP server|Indicates a problem authenticating to the specified IMAP server|
|Specified mail-folder doesn't exist|Indicates that the specified mail folder wasn't found|
|Failed to save attachments|Indicates a problem saving the attachments|
|Failed to retrieve emails|Indicates a problem retrieving the emails|

## <a name="processemails"></a> Process email messages

Moves, deletes or marks as unread an email (or a list of emails) retrieved by a Retrieve emails action.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|IMAP server|No|[Text value](../variable-data-types.md#text-value)||The IMAP server address (e.g. imap.gmail.com)|
|Port|Yes|[Numeric value](../variable-data-types.md#numeric-value)|993|The port to use for the IMAP server. Usually this port is 993|
|Enable SSL|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether to use a secure connection to communicate with the IMAP server|
|Username|No|[Text value](../variable-data-types.md#text-value)||The username of the email account to access|
|Password|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The password of the email account to access|
|Accept Untrusted Certificates|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether untrusted certificates will be accepted|
|Email(s) to process|No|[List](../variable-data-types.md#list) of [Mail Messages](../variable-data-types.md#email)||The email or list of emails to process. This parameter should contain a variable populated by a Retrieve emails action|
|Operation|N/A|Delete emails from server, Mark emails as unread, Move emails to mail folder, Mark emails as unread and move to mail folder|Move emails to mail folder|The operation you want to perform on the specified email messages|
|Mail folder|No|[Text value](../variable-data-types.md#text-value)||The name of the mail folder to which the emails will be moved|

### Variables produced

This action doesn't produce any variables.

### <a name="processemails_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to connect to IMAP server|Indicates that there was a problem connecting to the IMAP server|
|Specified mail-folder doesn't exist|Indicates that the specified mail folder wasn't found|
|Failed to process emails|Indicates a problem with processing the specified emails|

## <a name="sendemail"></a> Send email

Creates and sends a new email message.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|SMTP server|No|[Text value](../variable-data-types.md#text-value)||The SMTP server address|
|Server port|Yes|[Numeric value](../variable-data-types.md#numeric-value)|25|The port to use for the server. Usually this port is 25|
|Enable SSL|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether or not to communicate with the server through a secure connection|
|SMTP Server needs authentication|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether the server requires authentication|
|User name|No|[Text value](../variable-data-types.md#text-value)||The username of the email account to access|
|Password|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The password of the email account to access|
|Accept untrusted certificates|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether untrusted certificates will be accepted|
|From|No|[Text value](../variable-data-types.md#text-value)||The sender's email address|
|Sender display name|Yes|[Text value](../variable-data-types.md#text-value)||The sender's display name|
|To|No|[Text value](../variable-data-types.md#text-value)||The email(s) of the recipient(s). If more than one email is entered, the list of addresses should be separated by semi-colons|
|CC|Yes|[Text value](../variable-data-types.md#text-value)||The email(s) of the Cc recipient(s). If more than one email is entered, the list of addresses should be separated by semi-colons|
|BCC|Yes|[Text value](../variable-data-types.md#text-value)||The email(s) of the BCC (hidden) recipient(s). If more than one email is entered, the list of addresses should be separated by semi-colons|
|Subject|Yes|[Text value](../variable-data-types.md#text-value)||The subject of the email|
|Body|Yes|[Text value](../variable-data-types.md#text-value)||The body of the email|
|Body Is HTML|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether the body of the email will be interpreted as HTML coding|
|Attachment(s)|Yes|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)||The full path of any attachment(s), or a file or a list of files. Multiple files should be enclosed in double quotes (") and separated by a space character|

### Variables produced

This action doesn't produce any variables.

### <a name="sendemail_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid email address|Indicates that the specified email address is invalid|
|Failed to send email|Indicates a problem sending the email|
|Attachment not found|Indicates that the specified attachment(s) weren't found|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
