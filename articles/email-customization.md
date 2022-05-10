---
title: Customize email in flows with Power Automate | Microsoft Docs
description: How to use email in flows with Microsoft 365 or email or mail notification
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/16/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Customize email in flows

Here are the top how-to scenarios for email in Microsoft Power Automate, with examples of how to achieve them.

1. Send a [beautifully formatted email](#send-a-beautifully-formatted-email).

1. [Add an image](#add-an-image-to-your-email) to your email.

1. Send [email to a distribution list](#send-email-to-a-distribution-list).

1. Send automatic replies from a [shared mailbox](#send-automatic-replies-from-a-shared-mailbox).

1. Change the [date and time format](#change-the-date-and-time-format-of-an-email) of an email.

## Send a beautifully formatted email

You can use HTML to beautify your email. Following are two options that you can use to beautify your messages with HTML.

### Option 1: Write HTML directly into the flow

1. Select the **\</\>** button inside the rich text editor in the Power Automate designer. 

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the button you can use to enter HTML into the body of the email.](./media/email/html-button.png "Button you can use to enter HTML into the body of the email.")

1. Enter any HTML content into the body of the email.

### Option 2: Copy HTML from an Outlook email

Alternatively, if you don't know—or don't feel like playing with—HTML, follow these steps:

1. Create an email in Outlook, styling it with colors, content placeholders, images, and tables.
1. Send the email to yourself.
1. Open the email you sent to yourself in Outlook. Be sure to use a new window; don't use the preview window in Outlook.
1. On the **Message** tab, select **More commands** (**...**) > **Actions** > **Other Actions** > **View Source**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot that displays the steps to view the **other actions** menu in Outlook.](./media/email/other-actions.png "View other actions")

   The HTML representation of the email opens in your text editor. 

1. Find **\<html\>** in the file. 
1. Copy the content between **\<html\>** and **\</html\>**. 
1. Back in [Power Automate](https://flow.microsoft.com), select the **\</\>** button in the rich text editor of the **Send an email (V2)** action, and then paste the contents that you copied from Outlook.
1. Select **Save** at the bottom of the flow steps to save your flow.
1. Be sure to test your flow to confirm that it works as intended.

## Add an image to your email

Outlook takes the image you included in your email and converts it to plain text. Instead of copying/pasting the plain text into Power Automate, follow these steps: 

1. Upload the image to cloud-based storage, such as Google Drive or OneDrive for Business.
1. Get the anonymous visitor URL to the image. 
1. In the Power Automate **Send an email** action, do the following:
    1. Go to the HTML section of the rich text editor.
    1. Look for **\<image src=** in the HTML.
    1. Change the value of the **src** property to the URL of the image from the cloud-based storage provider where you uploaded the image.

       Your **src** should be similar to: **\<image src="https://url/to/your/images.png"/\>**.

   >[!IMPORTANT]
   >Inline images are limited to a size of 100 KB. This might affect the quality of the image.

## Send email to a distribution list

The **Send an email** action can send messages to an email-enabled security group or distribution list. Each member of the email-enabled security group or distribution list receives the email in their group mailbox rather than their own mailbox.

Alternatively, follow these steps if you want users to receive the email in their mailbox.

1. Add the [Get group members](/connectors/azuread/#get-group-members) action from the [Azure AD](/connectors/azuread/) connector, and then select the distribution list.

1. Under the action **Azure AD-Get group members**, add an **Apply to each** action.

1. Inside the **Apply to each** action, add the **Send an email** action, and then add the group members from the **Get group members** action as dynamic content in the **To** field.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of a cloud flow that gets all group members and then sends email to each member.](./media/email/group-members-flow.png "Cloud flow that gets all group members and then sends email to each member")

## Send automatic replies from a shared mailbox

You can do this in the web version of Outlook.

1.  Sign in to the web version of Outlook at [https://outlook.office365.com](https://outlook.office365.com/) with your Office 365 credentials.

1.  Select your profile image (or placeholder image) in the upper-right corner.

1.  Select **Open another mailbox**.

1.  Enter the name or email address of the shared mailbox, and then select it.

1.  Select **Settings** in the upper-right corner, and then select **Automatic replies**.

1.  Configure your automatic reply.

### Change the date and time format of an email 

By default, the email you receive shows the Coordinated Universal Time (UTC) time zone. However, your users might want to change it to their local time zone. For instructions, go to  [Converting time zone in Microsoft Power Automate](https://support.microsoft.com/help/4557244/converting-time-zone-in-microsoft-power-automate) to convert the time zone.

### More information

[Overview of using email with flows](email-overview.md)  
[Create flows to manage email](create-email-flows.md)  
[Create flows for popular email scenarios](email-top-scenarios.md)  


[!INCLUDE[footer-include](includes/footer-banner.md)]
