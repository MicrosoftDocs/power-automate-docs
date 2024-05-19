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
- On top of Data loss prevention policies (DLP) for Office 365 Outlook, machine administrators can disable the Office 365 Outlook actions by modifying the [appropriate registry setting](../governance.md#prevent-power-automate-for-desktop-from-running-flows-containing-cloud-connectors).

## Sending an email with attachments with Office 365 Outlook in desktop flows

This section presents an example of how to send an email with attachments in your desktop flows, using Office 365 Outlook actions.

> [!NOTE]
> In order to include file attachments in your emails, using the respective Office 365 Outlook, you need to convert those files using the **Convert file to binary data** action and then use the variable containing the binary data to the **Send and Email(v2)** action, when adding a file attachment.


Convert the file to attach in binary data using the Convert file to binary data action: 

:::image type="content" source="media\office365outlook\img1.png" alt-text="Screenshot of the Convert file to binary data action.":::

Then open the Send an Email(v2) action from Office 365 Outlook group of actions and go to the advanced section, and in the Attachments parameter select the **Edit** button. 

:::image type="content" source="media\office365outlook\img2.png" alt-text="Screenshot of the Send an Email(v2) action.":::

### Adding a fixed amount of attachments

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

### Adding a dynamic amount of attachments

When you are not aware of the total amount of file attachments you want to include in an email you must use the following approach: 

- Create a new list. This list will contain the attachments to be sent. 
- Each file attachment must be represented by a custom object. Each custom object must have the two properties comprising an attachment, **'Name'** and **'ContentBytes'**.
- Once the list is complete you must pass it as an input to the **Attachments** property of the **Office 365 Outlook** action.

#### Example 
Your desktop flow receives a list containing a dynamic amount of filepaths as an input.
You want to attach those files to an email. 
You begin by creating a new list to store the files to be sent. 

:::image type="content" source="media\office365outlook\img7.png" alt-text="Screenshot of the Create new list action.":::

>[!NOTE]
> You then need to loop through the inputted list containing the filepaths, convert them to binary data and add the custom object representing each file to the attachments list.

Add a **For each** action to loop through the desktop flow input list. During each loop, the current item is a filepath, pointing to the actual file.

:::image type="content" source="media\office365outlook\img8.png" alt-text="Screenshot of the For each action.":::

Convert the current file to binary data so that it can be utilized by cloud connector actions.

:::image type="content" source="media\office365outlook\img9.png" alt-text="Screenshot of the Convert file to binary data action where the CurrentItem is converted to binary data.":::

The name of the file is needed for the respective property representing it. Use the **Get file path part** action to retrieve the name of the current file.

:::image type="content" source="media\office365outlook\img10.png" alt-text="Screenshot of the Get file path part action where the file name of the CurrentItem is retrieved":::

You must then add the custom object representing the respective file in the list of file attachments. To do that use the **Add item to list** action and in the **Item** property you must input the custom object through this syntax: 

```robin
{'Name': %variable holding the file name%, 'ContentBytes': %variable containing the binary data%}
```
:::image type="content" source="media\office365outlook\img11.png" alt-text="Screenshot of the Add item to list action":::

Finally pass the list of file attachments as an input to the **Attachments** property of the **Send an email (V2)** action.

:::image type="content" source="media\office365outlook\img12.png" alt-text="Screenshot of the Send an email (V2) action configured to use a list of custom objects in the attachments property":::

Your action layout should be similar to this:
:::image type="content" source="media\office365outlook\img13.png" alt-text="Screenshot of the example overview on how to use a list of attachments in the Send an email (V2) action":::