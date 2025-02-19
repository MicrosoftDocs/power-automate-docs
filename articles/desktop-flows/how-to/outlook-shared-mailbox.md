---
title: Use a shared Outlook mailbox in email automations
description: Use a shared Outlook mailbox in email automations
author: mattp123

ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 06/03/2021
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

# Use a shared Outlook mailbox in email automations

Shared mailboxes allow groups of people to monitor and send emails from public email aliases. When a group user replies to messages sent to a shared mailbox, the email appears to be from the shared address, not from the individual user.

To retrieve emails from a shared mailbox, use the **Retrieve email messages from Outlook** action and populate the name of the mailbox in the **Account** field.

![Screenshot of the configured Retrieve email messages from Outlook action for a shared mailbox.](media/outlook-shared-mailbox/retrieve-email-messages-outlook-shared-mailbox.png)

To send emails through a shared mailbox, use the **Send email message through Outlook** action. 

In the action's properties, select **Other mailbox** in the **Send email message from** drop-down menu, and populate the name or address of the shared mailbox in the **Send from** field. Additionally, populate the **Account** field with the address of your main account.

![Screenshot of the configured Send email message through Outlook action for a shared mailbox.](media/outlook-shared-mailbox/send-email-message-outlook-shared-mailbox.png)
