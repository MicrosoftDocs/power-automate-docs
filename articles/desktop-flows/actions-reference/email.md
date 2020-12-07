---
title: Email | Microsoft Docs
description: Email Actions Reference
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

# Email

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Automate sending, receiving and managing emails through imap/smtp

|<!-- --> |
|-----|
|[Retrieve emails](#retrieveemails)|
|[Process emails](#processemails)|
|[Send email](#sendemail)|

### <a name="retrieveemails"></a> Retrieve emails
Retrieves email messages from an IMAP server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|IMAP server|No|Text value||The IMAP server address (e.g. imap.gmail.com)|
|Port|Yes|Numeric value|993|The port to use for the IMAP server. Usually this is port 993|
|Enable SSL|N/A|Boolean value|True|Specify whether to use a secure connection to communicate with the IMAP Server|
|User name|No|Text value||The username of the email account to access|
|Password|No|Text value||The password of the email account to access|
|Accept untrusted certificates|N/A|Boolean value|False|Specify whether untrusted certificates will be accepted|
|Mail folder|No|Text value||The name of the IMAP mail-folder (also known as 'mailBox') to retrieve messages from|
|Retrieve|N/A|All email messages, Unread email messages only, Read email messages only|All email messages|Specify whether to retrieve all messages in the folder or only the unread ones|
|Mark As read|N/A|Boolean value|True|Specify whether to mark as read the retrieved messages or leave them as is|
|"From" field contains|Yes|Text value||The full email address of the sender whose messages will be retrieved. Leave this attribute blank to retrieve all messages regardless of the sender|
|"To" field contains|Yes|Text value||The full email address(es) of the recipient(s) (separated by space if more than one) for the messages that will be retrieved. Leave this attribute blank to retrieve all messages regardless of the recipient(s)|
|"Subject" contains|Yes|Text value||The key phrase to find within the email subject. Leave this attribute blank to retrieve all emails regardless of their subject|
|'Body' contains|Yes|Text value||The key phrase to find within the email body. Leave this attribute blank to retrieve all emails regardless of their content|
|Save attachments|N/A|Save attachments, Do not save attachments|Do not save attachments|Specify whether to save the attachments of the emails retrieved or not|
|Save attachments into|No|Folder||The folder to save the attachments|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|RetrievedEmails|List of Mail Messages|The retrieved emails for later processing as a list of mail message objects|


##### <a name="retrieveemails_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to connect to IMAP server|Indicates that there was a problem connecting to the IMAP server|
|Failed to authenticate to the IMAP server|Indicates a problem authenticating to the specified IMAP server|
|Specified mail-folder doesn't exist|Indicates that the specified mail folder wasn't found|
|Failed to save attachments|Indicates a problem saving the attachments|
|Failed to retrieve emails|Indicates a problem retrieving the emails|

### <a name="processemails"></a> Process emails
Moves, deletes or marks as unread an email (or a list of emails) retrieved by a Retrieve emails action

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|IMAP server|No|Text value||The IMAP server address (e.g. imap.gmail.com)|
|Port|Yes|Numeric value|993|The port to use for the IMAP server. Usually this is port 993|
|Enable SSL|N/A|Boolean value|True|Specify whether to use a secure connection to communicate with the IMAP server|
|Username|No|Text value||The username of the email account to access|
|Password|No|Text value||The password of the email account to access|
|Accept Untrusted Certificates|N/A|Boolean value|False|Specify whether untrusted certificates will be accepted|
|Email(s) to process|No|List of Mail Messages||The email or list of emails to process. This should be a variable populated by a Retrieve emails action|
|Operation|N/A|Delete emails from server, Mark emails as unread, Move emails to mail folder, Mark emails as unread and move to mail folder|Move emails to mail folder|The operation you want to perform on the specified email messages|
|Mail folder|No|Text value||The name of the mail folder to which the emails will be moved|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="processemails_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Failed to connect to IMAP server|Indicates that there was a problem connecting to the IMAP server|
|Specified mail-folder doesn't exist|Indicates that the specified mail folder wasn't found|
|Failed to process emails|Indicates a problem with processing the specified emails|

### <a name="sendemail"></a> Send email
Creates and sends a new email message

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|SMTP server|No|Text value||The SMTP server address|
|Server port|Yes|Numeric value|25|The port to use for the server. Usually this is port 25|
|Enable SSL|N/A|Boolean value|False|Specify whether or not to communicate with the server through a secure connection|
|SMTP Server needs authentication|N/A|Boolean value|False|Specify whether the server requires authentication|
|User name|No|Text value||The username of the email account to access|
|Password|No|Text value||The password of the email account to access|
|Accept untrusted certificates|N/A|Boolean value|False|Specify whether untrusted certificates will be accepted|
|From|No|Text value||The sender's email address|
|Sender display name|Yes|Text value||The sender's display name|
|To|No|Text value||The email(s) of the recipient(s). If more than one email is entered, the list of addresses should be separated by semi-colons|
|CC|Yes|Text value||The email(s) of the Cc recipient(s). If more than one email is entered, the list of addresses should be separated by semi-colons|
|BCC|Yes|Text value||The email(s) of the BCC (hidden) recipient(s). If more than one email is entered, the list of addresses should be separated by semi-colons|
|Subject|Yes|Text value||The subject of the email|
|Body|Yes|Text value||The body of the email|
|Body Is HTML|N/A|Boolean value|False|Specify whether the body of the email will be interpreted as HTML coding|
|Attachment(s)|Yes|List of Files||The full path of any attachment(s), or a file or a list of files. Multiple files should be enclosed in double quotes (") and separated by a space character|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="sendemail_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invalid email address|Indicates that the specified email address is invalid|
|Failed to send email|Indicates a problem sending the email|
|Attachment not found|Indicates that the specified attachment(s) were not found|


