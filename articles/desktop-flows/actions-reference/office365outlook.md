---
title: Office 365 Outlook 
description: Learn about the available Office 365 Outlook actions.
author: jpapadimitriou
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 06/29/2023
ms.author: dipapa
ms.reviewer: 
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Office 365 Outlook

The Office 365 Outlook group of actions allows the utilization of the [Office 365 Outlook connector](/connectors/office365) from within desktop flows, alleviating the need to create a cloud flow in order to use its actions. This connector is the same as the one used across Power Automate cloud flows, Power Apps, and Logic Apps. It uses the same parameters and returns the same type of data.

## Prerequisites and limitations

- You need an Attended RPA license.
- Data loss prevention policies (DLP) that include Office 365 Outlook cloud actions aren't enforced within desktop flows. Machine administrators can disable the Office 365 Outlook actions by modifying the [appropriate registry setting](../governance.md#prevent-power-automate-for-desktop-from-running-flows-containing-cloud-connectors).


## Why should I use Office 365 Outlook actions inside desktop flows instead of cloud flows?

Users can still combine Office 365 Outlook actions with the **Run a flow built with Power Automate for desktop** action. However, Office 365 Outlook actions inside desktop flows improve performance and ease of use for users who need to loop between cloud and desktop actions.



## Sending an email with attachments with Office 365 Outlook in desktop flows

This section presents an example of how to send an email with attachments in your desktop flows, using Office 365 Outlook actions.

> [!NOTE]
> In order to include file attachments in your emails, using the respective Office 365 Outlook, you need to convert those files using the **Convert file to binary data** action and then use the variable containing the binary data to the **Send and Email(v2)** action, when adding a file attachment.


Convert the file to attach in binary data using the Convert file to binary data action: 

:::image type="content" source="media\office365outlook\img1.png" alt-text="Screenshot of the Convert file to binary data action.":::

Then open the Send an Email(v2) action from Office 365 Outlook group of actions and go to the advanced section, and in the Attachments parameter select the **Edit** button. 

:::image type="content" source="media\office365outlook\img2.png" alt-text="Screenshot of the Send an Email(v2) action.":::

In **Attachments** window, there is already an item existing in the list. 
Click on "More" to configure it to contain the desired attachment. 

:::image type="content" source="media\office365outlook\img3.png" alt-text="Screenshot of the Attachments window.":::

Modify the **Name** property with the name of the file to be attached and modify the **ContentBytes** to point to the **binary data** representing the respective file.

 > [!NOTE]
 > Notice how the %BinaryData% variable is utilized in the attachment entry - in the **ContentBytes** property.

:::image type="content" source="media\office365outlook\img4.png" alt-text="Screenshot of the item details in the Attachments window.":::
 
You can add more attachments by clicking on the plus button.

:::image type="content" source="media\office365outlook\img5.png" alt-text="Screenshot of the add more button in the Attachments window."::: 


 When all the respective files to be attached are finalized, select on **Save** to close the **Attachments** window and return to the Send an Email(v2) action configuration. 

  :::image type="content" source="media\office365outlook\img6.png" alt-text="Screenshot of theSend an Email(v2) action with attachments.":::