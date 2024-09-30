---
title: Create a cloud flow to view Dataverse long term retained data
description: This article explains how you can create a cloud flow to view Microsoft Dataverse long term retained data.
author: Mattp123
ms.author: angieandrews
ms.service: powerapps
ms.topic: how-to 
ms.date: 09/25/2024
ms.custom: template-how-to 
---
# Create a cloud flow to view Dataverse long term retained data

Microsoft Dataverse supports custom retention policies to securely retain unlimited data long term in a cost-efficient way. While Dataverse can support your business growth with no limit on active data, you might want to consider moving inactive data to the Dataverse long term retention store. After doing so, you can create a cloud flow to view read-only rows in long term data retention in Microsoft Dataverse.

The cloud flow described here creates and sends an email that includes an Excel file containing the retained data. If there are retained attachments associated with rows from Dataverse, they're also included as links in the Excel file. For more about the privileges required to run this flow, go to [View long term retained data in Microsoft Dataverse](/power-apps/maker/data-platform/data-retention-view)

Creating the flow requires the following high level steps:

1. Pass query parameters in FetchXML to create an Excel file with retained data, using a Dataverse action named **Create Excel from RetainedData**.
1. Set a condition to determine if the Excel file has been created. Download the Excel file. Pass the required retrieval criteria parameters (table and FetchXML).
1. When the Excel file has been created:
   - Set an action to download the Excel file.
   - Set an action to send an email to recipients with the Excel file attached.
   - Set an action to delete the Excel file from the Dataverse system table. This step is recommended to avoid Excel documents consuming database storage.

> [!TIP]
> If you don’t see an email after running a flow successfully, check your junk mail folder.

## Create the query and download FetchXML

1. Sign into [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc), and then select **Settings** > **Advanced settings**.
1. On the **Dynamics 365 Settings** page, select **Advanced Find** (filter icon) on the command bar.
1. At the top of the Advanced Find pane, select **Change to retained data**.
1. Create the query you want to retrieve the retained data. More information: [Advanced find in model-driven apps](/power-apps/user/advanced-find)
1. In Advanced Find on the **Advanced Find** tab, select **Download Fetch XML**.

## Create the flow

The following steps show you how to use an instant flow to create the Excel file and send it as an attachment to someone in email. You can also use similar steps to create a scheduled cloud flow.

1. On the [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc) home page, select **Flows** on the left navigation pane.
1. Select **New flow**, and then select **Instant cloud flow**.
1. Enter a name for the flow, and then select **Manually trigger a flow**.
1. Select **Create**.
1. Select **New step**, and then on the **Choose an operation** step, select **Microsoft Dataverse**.
1. For the action, select **Perform a background operation**.
   :::image type="content" source="media/data-retention-flow/data-retention-flow1.png" alt-text="For the action, select perform background operation.":::

1. Enter the following information: 
   - **Catalog**: **Microsoft Dataverse Common**
   - **Category**: **Retained Data**
   - **Table name**: **(none)**
   - **Action name**: Select **Enter custom value** and then enter `Create Excel from RetainedData`
   - **FetchXml**: Paste in the FetchXML created earlier from the advanced find query.
   - LayoutXML: Leave blank
   :::image type="content" source="media/data-retention-flow/data-retention-flow2.png" alt-text="Create action that includes your retained data query FetchXML":::
1. Select **New step**.
1. For **Choose an operation**, select **Condition**, and then select the **Expression** tab.
1. Add the following expression:
   - `outputs('Perform_a_background_operation_(preview)')?['body/backgroundOperationStatusCode’]`
   - **is equal to**: *30*
   :::image type="content" source="media/data-retention-flow/data-retention-flow3.png" alt-text="Add expression to flow.":::
1. In the **If yes** box, select **Add an action**.
1. On the **Actions** tab, select **Download a file or an image**.
1. Select the following values:
   - **Table name**: **RetainedData Excels**
   - **Row ID**: Select **Add dynamic content**, and then select **ExportRetainedDataResponse ExportedExcelID**
   - **Column name**: **ExcelContent**
   :::image type="content" source="media/data-retention-flow/data-retention-flow4.png" alt-text="Add values for Excel download file":::

1. Select **Add action** to add another action that sends an email with the Excel file attachment.
1. For **Choose an operation**,  select **Office 365 Outlook**, and the for the action select **Send an email (V2)**.
1. Enter the following required values for the email.
   - **To**: Enter a valid email address for the email recipient.
   - **Subject**: Enter the email subject, such as *Retained Accounts from 2020*.
   - **Body**: Enter text for the email body, such as *Attached are the retained accounts from 2020*.
   - **Attachments Name -1**: Enter a name for the attachment, such as *accountsretained2020.xls*.
   - **Attachments content**: On the **Add dynamic content** tab, select **File or image content**.
   :::image type="content" source="media/data-retention-flow/data-retention-flow5.png" alt-text="Set values for email with Excel attachment":::
1. Select add an action  to delete the Excel file created and saved in the Dataverse table **RetainedData excels**:
   - Select an operation> **Microsoft Dataverse**.
   - Under **Actions**, select **Delete a row**.
   - Choose the following values:
      - **Table name**: **RetainedData Excels**
      - **Row ID**: Select **Add dynamic content**, and then select **ExportRetainedDataResponse ExportedExcelID**.
1. Select **Save**
1. Run the flow.

The email recipients receive an email with the attached Excel worksheet containing the retained data rows.

## See also

[Dataverse long term data retention overview](/power-apps/maker/data-platform/data-retention-overview)
