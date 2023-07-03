---
title: Office 365 Outlook 
description: Learn about the available Office 365 Outlook actions.
author: jpapadimitriou
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 29/06/2023
ms.author: jpapadimitriou
ms.reviewer: 
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Office 365 Outlook (preview)

The Office 365 Outlook (preview) group of actions allows the utilization of the [Office 365 Outlook connector](/connectors/office365) from within desktop flows, alleviating the need to create a cloud flow in order to use its actions. This connector is the same as the one used across Power Automate cloud flows, PowerApps, and Logic Apps. It uses the same parameters and returns the same type of data.

## Prerequisites and limitations

- You need an Attended RPA license.

- Sharing desktop flows with Office 365 Outlook (preview) cloud actions isn't supported. Co-owners won't be able to run such desktop flows unless they overwrite the connection references with their own. **Users** with read access are unable to run such flows.

- Data loss prevention policies (DLP) that include Office 365 Outlook (preview) cloud actions aren't enforced within desktop flows. Machine administrators can disable the Office 365 Outlook (preview) actions by modifying the [appropriate registry setting](../governance.md#prevent-power-automate-for-desktop-from-running-flows-containing-cloud-connectors).


## Why should I use Office 365 Outlook (preview) actions inside desktop flows instead of cloud flows?

Users can still combine Office 365 Outlook (preview) actions with the **Run a flow built with Power Automate for desktop** action. However, Office 365 Outlook (preview) actions inside desktop flows improve performance and ease of use for users who need to loop between cloud and desktop actions.



## Sending an email with attachments with Office 365 Outlook (preview) in desktop flows

This section presents an example on how to use send an email with attachments in your desktop flows, using Office 365 Outlook (preview) actions.

> [!NOTE]
> In order to include file attachments in your emails, using the respective Office 365 Outlook (preview), you need to convert those files using the **Convert file to binary data** action and then use the variable containing the binary data to the **Send and Email(v2)** action, when adding a file attachment.


Convert the file to attach in binary data using the Convert file to binary data action: 

 :::image type="content" source="media\office365outlook\img2.png" alt-text="Screenshot of the Convert file to binary data action.":::

Then open the Send an Email(v2) action from Office 365 Outlook (preview) group of actions and go to the advanced section, and in the Attachments parameter click the **Edit** button. 

 :::image type="content" source="media\office365outlook\img1.png" alt-text="Screenshot of the Send an Email(v2) action.":::

 In **Edit list** window, click on the plus button to create a new item and input the respective values that describe the file to be attached in the new item presented.  

 :::image type="content" source="media\office365outlook\img3.png" alt-text="Screenshot of the Edit list window for attachments.":::

 > [!NOTE]
 > Notice how the %BinaryData% variable is utilized in the attachment entry - in the **ContentBytes** property.


 When all the respective files to be attached are finalized, click on **Save** to close the Edit list window and return to the Send an Email(v2) action configuration. 

  :::image type="content" source="media\office365outlook\img4.png" alt-text="Screenshot of theSend an Email(v2) action with attachments.":::