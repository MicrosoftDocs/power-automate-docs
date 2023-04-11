---
title: Build an approval loop with Microsoft Dataverse
description: Create a table, a cloud flow, and an app that work together so that reviewers can approve or reject files added to Dropbox.
services: ''
suite: flow
documentationcenter: na
author: msftman
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/22/2023
ms.author: deonhe
ms.reviewer: gtrantzas
search.audienceType: 
  - flowmaker
  - enduser
---

# Build an approval loop by using Power Automate and Dataverse

Dataverse can give you a way to build flows that have information stored in a database independent of a cloud flow. The best example of this is with approvals. If you store the status of the approval in a table, your flow can work on top of it.

In this example, you'll create an approval process that starts when a user adds a file to Dropbox. When the file is added, information about it appears in an app, where a reviewer can approve or reject the change. When the reviewer approves or rejects the change, notification mail is sent, and rejected files are deleted from Dropbox.

By following the steps in this section, you'll build:

* a **custom table** that will contain information about each file added to Dropbox and whether the file's status is approved, rejected, or pending.
* a **flow** that adds information to the custom table when a file is added to Dropbox, sends mail when the file is approved or rejected, and deletes rejected files. These steps demonstrate how to build such a cloud flow from scratch, but you can create a similar flow from a template.
* an **app** in which a reviewer can approve or reject files added to Dropbox. You'll use Power Apps to generate this app automatically based on the columns in the custom table.

## Prerequisites

* Sign up for [Power Automate](sign-up-sign-in.md) and [Power Apps](https://powerapps.microsoft.com/tutorials/signup-for-powerapps/).
* Create connections to Dropbox and Office 365 Outlook, as [Manage your connections](https://powerapps.microsoft.com/tutorials/add-manage-connections/) describes.

## Build the table

1. Sign in to [powerapps.com](https://make.powerapps.com).

1. In the left navigation bar, select **Tables**.

1. Select **New table** and then **New table**.

1. Specify a display name and a plural name for the new table. In this example, both names are **ReviewDropboxFiles**. Optionally, you can add a description.

    :::image type="content" source="media/common-data-model-approve/new-table-dialog.png" alt-text="Screenshot of the New Table dialog.":::

1. Select **Save** to save the table.

## Add columns to the table

1. Select the **ReviewDropboxFiles** table in the **Tables** page, and then select **New** > **Column**.

    :::image type="content" source="media/common-data-model-approve/new-column.png" alt-text="Screenshot of the New column option.":::

1. Create a new column named **Approver** with the following properties:

    * Set **Display Name** to **Approver**.
    * Set **Data type** to **Single line of text**.
    * Set **Format** to **Email**.
    * Set **Required** to **Business required**.

    :::image type="content" source="media/common-data-model-approve/approver-column.png" alt-text="Screenshot of the Approver column.":::

1. Create a new column named **Status** with the following properties:

    * Set **Display Name** to **Status**.
    * Set **Data type** to **Single line of text**.
    * Set **Format** to **Text**.
    * Set **Required** to **Business required**.

    :::image type="content" source="media/common-data-model-approve/status-column.png" alt-text="Screenshot of the Status column.":::

1. Create a new column named **File identifier** with the following properties:

    * Set **Display Name** to **File identifier**.
    * Set **Data type** to **Single line of text**.
    * Set **Format** to **Text**.
    * Set **Required** to **Business required**.

    :::image type="content" source="media/common-data-model-approve/file-identifier-column.png" alt-text="Screenshot of the File identifier column.":::

## Sign in and create a cloud flow

1. Open the [Power Automate portal](https://make.powerautomate.com).

1. Select the environment in which you previously created the Database table. If you don't select the same environment, your table won't be available.

1. Go to **Create** > **Build your own**.

## Start when a file is added

1. Under **Choose a connector**, search for **Dropbox**, and select the appropriate card.

1. Select the **When a file is created** action.

1. Select **Next**, and then **Skip to building your own flow**.

1. In the designer, select the **When a file is created** action, select the folder icon, and then browse to the folder where files will be added.

    ![Choose folder.](./media/common-data-model-approve/folder-icon.png)

## Add data to the table

1. In the designer, select **New step** and search for the **Add a new row** Dataverse action.

1. Configure the action as presented in the following screenshot:

    1. In the **Table name** drop-down menu, select the **ReviewDropboxFiles** table.

    1. In the **Approver** field, enter the email address of the person who will review the files.

    1. In the **File identifier** field, select **File identifier** from the **Dynamic content** list.

    1. In the **Name** field, select **File name** from the **Dynamic content** list.

    1. In the **Status** field, enter **Pending**.

    :::image type="content" source="media/common-data-model-approve/add-new-row-action.png" alt-text="Screenshot of the configured Add a new row Dataverse action.":::

## Check whether the file has been reviewed

1. Under the **Add a new row** action, select **New step** and search for the **Do until** action.

1. Configure the **Do until** action as presented in the following screenshot:

    1. Select the left box in the action and select **Status** from the **Dynamic content** list.

    1. In the middle drop-down menu, select **is not equal to**.

    1. In the right box, enter **Pending**.

    :::image type="content" source="media/common-data-model-approve/do-until-action.png" alt-text="Screenshot of the configured Do until action.":::

1. Inside the **Do until** action, select **Add an action** and search for the **Get a row by ID** Dataverse action.

1. Configure the **Get a row by ID** action as presented in the following screenshot:

    1. In the **Table name** drop-down menu, select the **ReviewDropboxFiles** table.

    1. In the **Row ID** field, select **File identifier** from the **Dynamic content** list.

    :::image type="content" source="media/common-data-model-approve/get-row-by-id-action.png" alt-text="Screenshot of the configured Get a row by ID Dataverse action.":::

## Check whether the item has been approved

1. Under the **Do until** action, select **New step** and search for the **Condition** action.

1. Configure the **Condition** action as presented in the following screenshot:

    1. Select the left box in the action and select **Status** from the **Dynamic content** list.

    1. In the middle drop-down menu, select **is equal to**.

    1. In the right box, enter **Approved**.

    :::image type="content" source="media/common-data-model-approve/condition-action.png" alt-text="Screenshot of the configured Condition action.":::

## Send notification mail

1. Under the **If yes** action, select **Add an action** and search for the **Send an email (V2)** Office 365 Outlook action.

1. Configure the **Send an email (V2)** action as presented in the following screenshot:

    1. In the **To** field, enter the email address of the person whom you want to notify when an item is accepted.

        > [!TIP]
        > **Note**: To make testing the flow easier, specify your own address. You can change it when the flow is ready for actual use.

    1. In the **Subject** field, select **File name** from the **Dynamic content** list.

    1. In the **Body** field, enter **The item has been approved.**.

    :::image type="content" source="media/common-data-model-approve/send-email-action-approval.png" alt-text="Screenshot of the configured Send an email (V2) action for approved file.":::

1. Under the **If no** action, repeat the step 2, but specify the body of the email message as **The item has been rejected.**

    :::image type="content" source="media/common-data-model-approve/send-email-action-rejection.png" alt-text="Screenshot of the configured Send an email (V2) action for rejected file.":::

## Delete rejected files

1. Under the **Send an email (V2)** action for the rejection mail, select **Add an action** and search for the **Delete file** Dropbox action.

1. In the **File** field, select **File identifier** from the **Dynamic content** list.

    :::image type="content" source="media/common-data-model-approve/delete-file-action.png" alt-text="Screenshot of the configured Delete file action for rejected file.":::

## Save the flow

1. At the top of the screen, enter a name for the created cloud flow, and select **Save**.

1. In Dropbox, add at least two files to the folder that you specified: one to test approval and one to test rejection.

## Build the app

1. Sign in to [powerapps.com](https://make.powerapps.com).

1. Go to the **Create** page and then select **Dataverse**.

1. Select your Dataverse connection, and then the **ReviewDropboxFiles** table.

    > [!NOTE]
    > If this is your first time, you're prompted to create a connection to Dataverse.

    :::image type="content" source="media/common-data-model-approve/selected-dataverse-table.png" alt-text="Screenshot of the selected Dataverse table.":::

1. If the **Welcome to Power Apps Studio** dialog box appears, you can follow it or skip it.

## Customize the app

At this step, the app should contain three screens to browse, see the details and edit the entries, respectively.

To add or remove fields from a screen:

1. Select the desired screen on the **Tree view**.

1. Select the root element of the screen.

1. Select **Edit** in the right pane.

:::image type="content" source="media/common-data-model-approve/edit-fields.png" alt-text="Screenshot of the option to edit fields.":::

The current example contains the following fields for each screen:

* In the browse screen, there are fields for the **Name** and **Status** columns of the Dataverse table.
* In the details screen, there are fields for the **Name**, **Status**, **File identifier**, and **Approver** columns of the Dataverse table.
* In the edit screen, there's a field for the **Name** column and an edit text field for the **Status** column of the Dataverse table.

## Test the overall solution

1. In Power Apps, open the preview mode selecting the play button on the toolbar.

    :::image type="content" source="media/common-data-model-approve/preview-app-button.png" alt-text="Screenshot of the button to preview the app.":::

1. Select the arrow next to the first file in the list to see the details about it.

1. Select the pencil icon to change the details of the file.

1. In the **Status** box, enter **Approved** and select the checkmark icon to save your changes. In a few minutes, you'll receive an email stating that the file was approved.

1. Repeat the previous steps but enter **Rejected** (or anything except **Approved**) in the **Status** field. In a few minutes, you'll receive an email stating that the file was rejected, and the file will be deleted from Dropbox.

[!INCLUDE[footer-include](includes/footer-banner.md)]
