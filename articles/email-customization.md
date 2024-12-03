---
title: Customize email in flows with Power Automate
description: Learn how to use email in flows with Microsoft 365, email, or mail notification.
suite: flow
author: kisubedi
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 10/09/2024
ms.author: kisubedi
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
ms.collection: bap-ai-copilot
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

[!INCLUDE[copilot-designer-note](./includes/copilot-designer-note.md)]

# [Classic designer](#tab/classic-designer)

### Option 1: Write HTML directly into the flow

1. Select the **\</\>** button inside the rich text editor in the Power Automate designer. 

    :::image type="content" source="./media/email/html-button.png" alt-text="Screenshot of the button you can use to enter HTML into the body of the email.":::

1. Enter any HTML content into the body of the email.

### Option 2: Copy HTML from an Outlook email

Alternatively, if you don't know&mdash;or don't feel like playing with&mdash;HTML, follow these steps:

1. Create an email in Outlook, styling it with colors, content placeholders, images, and tables.
1. Send the email to yourself.
1. Open the email you sent to yourself in Outlook. Be sure to use a new window; don't use the preview window in Outlook.
1. On the **Message** tab, select **More commands** (**...**) > **Actions** > **Other Actions** > **View Source**.

    :::image type="content" source="./media/email/other-actions.png" alt-text="Screenshot that displays the steps to view the 'Other Actions' menu in Outlook.":::

   The HTML representation of the email opens in your text editor.

1. Find **\<html\>** in the file.
1. Copy the content between **\<html\>** and **\</html\>**.
1. Back in [Power Automate](https://make.powerautomate.com), select the **\</\>** button in the rich text editor of the **Send an email (V2)** action, and then paste the contents that you copied from Outlook.
1. Select **Save** at the bottom of the flow steps to save your flow.
1. Be sure to test your flow to confirm that it works as intended.

# [Edit with Copilot](#tab/edit-with-copilot) 

[!INCLUDE [cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

In the Edit with Copilot designer, you can simply format the email body with rich controls like bold, italics, headers, and more.

:::image type="content" source="./media/email/copilot-format.png" alt-text="Screenshot of the formatting options in the body.":::

---

## Add an image to your email

Outlook takes the image you included in your email and converts it to plain text. Instead of copying/pasting the plain text into Power Automate, follow these steps: 

1. Upload the image to cloud-based storage, such as Google Drive or OneDrive for Business.
1. Get the anonymous visitor URL to the image. 
1. In the Power Automate **Send an email** action, do the following:
    1. Go to the HTML section of the rich text editor.
    1. Look for **\<image src=** in the HTML.
    1. Change the value of the **src** property to the URL of the image from the cloud-based storage provider where you uploaded the image.

       Your **src** should be similar to: **\<image src="https://url/to/your/images.png"/\>**.

   > [!IMPORTANT]
   > Inline images are limited to a size of 100 KB. This might affect the quality of the image.

## Send email to a distribution list

The **Send an email** action can send messages to an email-enabled security group or distribution list. Each member of the email-enabled security group or distribution list receives the email in their group mailbox rather than their own mailbox.

Alternatively, follow these steps if you want users to receive the email in their mailbox.

1. Add the [Get group members](/connectors/azuread/#get-group-members) action from the [Microsoft Entra ID](/connectors/azuread/) connector, and then select the distribution list.
1. Under the action **Microsoft Entra ID-Get group members**, add an **Apply to each** action.
1. Inside the **Apply to each** action, add the **Send an email** action, and then add the group members from the **Get group members** action as dynamic content in the **To** field.

    :::image type="content" source="./media/email/group-members-flow.png" alt-text="Screenshot of a cloud flow that gets all group members and then sends email to each member.":::

## Send automatic replies from a shared mailbox

You can do this in the web version of Outlook.

1. Sign in to the web version of Outlook at [https://outlook.office365.com](https://outlook.office365.com/) with your Office 365 credentials.
1. Select your profile image (or placeholder image) in the upper-right corner.
1. Select **Open another mailbox**.
1. Enter the name or email address of the shared mailbox, and then select it.
1. Select **Settings** in the upper-right corner, and then select **Automatic replies**.
1. Configure your automatic reply.

### Change the date and time format of an email

By default, the email you receive shows the Coordinated Universal Time (UTC) time zone. However, your users might want to change it to their local time zone. For instructions, go to  [Converting time zone in Microsoft Power Automate](https://support.microsoft.com/help/4557244/converting-time-zone-in-microsoft-power-automate) to convert the time zone.

## Related information

- [Overview of using email with flows](email-overview.md)
- [Create flows to manage email](create-email-flows.md)
- [Create flows for popular email scenarios](email-top-scenarios.md)
- [Training: Create flows to manage email (module)](create-email-flows.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]