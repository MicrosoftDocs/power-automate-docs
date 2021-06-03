---
title: Add images to email messages | Microsoft Docs
description: Add images to email messages
author: georgiostrantzas
ms.service: power-automate
ms.topic: article
ms.date: 06/03/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Add images to email messages

Power Automate Desktop enables users to include images in their emails by attaching them or embedding them to the email body.

## Attach images to email messages

To attach images to an email, use the **Attachment(s)** field in the **Send email**, **Send email message through Outlook**, **Respond to Outlook message**, and **Send Exchange email message** actions.

You can populate the **Attachment(s)** field with file paths or a variable containing files. To populate multiple file paths, enclose them in double quotes (**""**) and separate them by a space character.

![Two example paths in the Attachment(s) field of the Send email action.](media/add-images-email-messages/attach-images-email.png)

## Embed images to email messages

Apart from attaching images to emails, Power Automate Desktop allows you to embed images to email bodies using HTML.

To embed an image, check the **Body is HTML** option in the appropriate email action and populate the **Body** field with the following code:

> [!NOTE]
> After copying the following code, replace the **image-url** placeholder with the URL of the image you want to embed or a variable containing it.

```
<html>
    <body>
        <img src="image-url">
    </html>
</body>
 ```

 ![The populated HTML code in the Send email action.](media/add-images-email-messages/emded-images-email.png)