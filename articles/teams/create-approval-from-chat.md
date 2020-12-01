---
title: Create an approval from a chat or channel | Microsoft Docs
description: Learn how to create an approval from a chat or channel.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/30/2020
ms.author: hamenon
---

# Create an approval from a chat or channel

With the new Approvals experience in Teams you can create an approval from any chat or channel from the compose box in Teams.

## Start an approval in a chat or channel

Follow these steps to create an approval in a chat or channel in Microsoft Teams.

1. Sign into [Microsoft Teams](https://teams.microsoft.com)

2. Navigate to the chat or channel in which you want to send out the approval.

3. Select the approvals icon under the compose box
![Start an approval in chat](../media/native-approvals-in-teams/approvals-compose-box.png)

4. Clicking on the icon will trigger a modal dialog where you can enter the details of the approval
![Approvals form](../media/native-approvals-in-teams/approvals-dialog-box.png)

5. Enter the details of the approval you want to send along with who you need the approval from.

>[!TIP]
>By default the approvers input is restricted to the roster of the team or chat you are sending the approval in.

6. **Optional**: You can also include a file with your approval if you wish. To do so click on the *Add attachment* option in the Approval form. Any file uploaded is automatically stored in your OneDrive/SharePoint folder, just like other files shared on Teams.

![Add attachment to approvals](../media/native-approvals-in-teams/approval-attach.png)


7. Once the details of the approval have been entered hit send. A card is created and sent in the chat or channel that you are in.

![Approvals card](../media/native-approvals-in-teams/approvals-card.png)

## Custom responses for Approvals

If you want to customize the actions for an approval you can use the **Custom responses** option to change the action to anything you wish. To do so follow the same steps mentioned above and toggle the custom responses option in the Approvals form.

![Custom responses](../media/native-approvals-in-teams/custom-responses.png)

>[!TIP]
>If you want to add more than two custom responses, you will need to use a flow to send the approval instead. [Learn more about custom responses in approvals](../create-approval-response-options.md).


## Known issues

Currently all the approvals created using this native Teams experience are created in your organizations default environment.

