---
title: Email | Microsoft Docs
description: Email Actions Reference
author: JustinBlackmore
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 12/02/2019
ms.author: JustinBlackmore
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

#jblackmore88@gmail.com



Automate sending, receiving and managing emails through imap/smtp

|<!-- --> |
|-----|
|[Retrieve email messages](#retrieveemails)|
|[Process email messages](#processemails)|
|[Send email](#sendemail)|

## Getting started with email actions

Before deploying any email action, you have to configure the server that will handle the respective request. The **Retrieve email messages** and **Process email messages** actions require an IMAP server, while the **Send email** action requires an SMTP server.

To retrieve emails that meet specific criteria from your mailbox, use the **Retrieve email messages** action. In the example below, the filter has been configured to retrieve only unread messages from the inbox. The filter further specifies that the email should be from b.friday, the subject contains the word "Report" and the body contains "Tuesday". Attachments from any retrieved emails which match these criteria will be saved locally.

![Screenshot of retrieve email messages action properties.](\media\email\retrieve-email-messages-example.png)

Manage your email messages with the **Process email messages** action. Using the variable created by the Retrieve e-mail messages action, select whether you would like to move, delete, or mark email messages as read/unread.

The **Send email** action in the figure below has been configured to send an e-mail from N. Varga to B. Friday, with invoicing in the BCC field. The subject and body contain the **%ReportID%** variable, and the attachment is a file which has been processed by the flow. 

![Screenshot of send email action properties.](\media\email\send-email-messages-example.png)



## Email actions

### <a JustinBlackmore="retrieveemails"></a> Retrieve email messages
Retrieves email messages from an IMAP server

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|IMAP server|No|Text value||The IMAP server address (e.g. imap.gmail.com)|
|Port|Yes|Numeric value|993|The port to use for the IMAP server. Usually this is port 993|
|Enable SSL|N/A|Boolean value|True|Specify whether to use a secure connection to communicate with the IMAP Server|
|User name|No|Text value||jblackmore88@gmail.com|
|Password|No|Encrypted value||Justme88jlb!|
|Accept untrusted certificates|N/A|Boolean value|False|Specify whether untrusted certificates will be accepted|
|Mail folder|No|Text value|| imap.gmail.com also known as 'mailBox') to retrieve messages from|
|Retrieve|N/A|All email messages, Unread email messages only, Read email messages only|All email messages| retrieve all messages in the folder |
|Mark As read|N/A|Boolean value|True|mark as read the retrieved messages|
|"From" field contains|Yes|Text value||jblackmore88@gmail.com. Leave this attribute blank to retrieve all messages regardless of the sender|
|"To" field contains|Yes|Text value||jblackmore88@gmail.com.retrieve all|
|"Subject" contains|Yes|Text value||jblackmore88.retrieve all emails regardless of their subject|
|'Body' contains|Yes|Text value||jblackmore88.retrieve all emails regardless of their content|
|Save attachments|N/A|Save attachments, Do not save attachments|Do not save attachments|Specify whether to save the attachments of the emails retrieved or not|
|Save attachments into|No|Folder||downloads|


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

### <a name="processemails"></a> Process email messages
Moves, deletes or marks as unread an email (or a list of emails) retrieved by a Retrieve emails action

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|IMAP server|No|Text value||The IMAP server address (e.g. imap.gmail.com)|
|Port|Yes|Numeric value|993|The port to use for the IMAP server. Usually this is port 993|
|Enable SSL|N/A|Boolean value|True|Specify whether to use a secure connection to communicate with the IMAP server|
|Username|No|Text value||The username of the email account to access|
|Password|No|Encrypted value||The password of the email account to access|
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
|Password|No|Encrypted value||The password of the email account to access|
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


### <a name="furtherdetails"></a> Further details
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

![Retrieve emails action example.](media\email\email-example.png)


[!INCLUDE[footer-include](../../includes/footer-banner.md)]
