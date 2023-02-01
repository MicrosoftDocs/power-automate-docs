---
title: Build an approval loop with Microsoft Dataverse | Microsoft Docs
description: Create an table, a cloud flow, and an app that work together so that reviewers can approve or reject files added to Dropbox.
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
ms.date: 02/01/2023
ms.author: deonhe
ms.reviewer: gtrantzas
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Build an approval loop by using Power Automate and Dataverses

Dataverse can give you a way to build flows that have information stored in a database independent of a cloud flow. The best example of this is with approvals. If you store the status of the approval in an table, your flow can work on top of it.

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

    :::image type="content" source="media/common-data-model-approve/tables-menu.png" alt-text="Screenshot of the Tables option in the Power Apps navigation menu.":::

1. Select **New table** and then **New table**.

    :::image type="content" source="media/common-data-model-approve/new-table.png" alt-text="Screenshot of the option to create a new table.":::

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

1. Open the [Power Automate portal](https://flow.microsoft.com).
2. Maximize your browser window if it isn't already maximized, and then click or tap **Sign in** near the upper-right corner.
   
    ![Sign-in button for Power Automate.](./media/common-data-model-approve/signin-flow.png)
3. In the top right menu you select the environment that you created the database in powerapps.com.
   
    **Note**: if you do not select the same environment then you will not see your table.
4. Near the upper-left corner, click or tap **My flows**.
   
    ![My flows button.](./media/common-data-model-approve/myflows-button.png)
5. Near the upper-right corner, click or tap **Create new flow**.
   
    ![Create new flow button.](./media/common-data-model-approve/create-flow.png)

## Start when a file is added
1. In the box that contains **Search for more triggers**, type or paste **Dropbox**, and then click or tap **Dropbox - when a file is created**.
   
    ![Create trigger.](./media/common-data-model-approve/create-trigger.png)
2. Under **Folder**, click or tap the folder icon, and then browse to the folder where files will be added.
   
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

    **Note**: To make testing the flow easier, specify your own address. You can change it when the flow is ready for actual use.

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

1. At the top of the screen, type or paste a name for the flow that you're creating, and then click or tap **Create Flow**.
   
    ![Save flow.](./media/common-data-model-approve/save-flow.png)
2. Click or tap **Close** and then click or tap **Done**.
3. In Dropbox, add at least two files to the folder that you specified: one to test approval and one to test rejection.

## Build the app
1. Sign in to [powerapps.com](https://make.powerapps.com), and then click or tap **New app** near the bottom of the left navigation bar.
   
    ![Create an app in a browser.](./media/common-data-model-approve/new-app-button.png)
2. In the dialog box that appears, click or tap the option to open either Power Apps Studio for Windows or Power Apps Studio for the web.
3. If you opened Power Apps Studio for Windows, click or tap **New** in the left navigation bar.
4. Under **Create an app from your data**, click or tap **Phone layout** in the **Microsoft Dataverse** tile.
   
    ![Create app.](./media/common-data-model-approve/afd-cdm.png)
5. In the **Search** box, type or paste **Review**.
   
    ![Search for an table.](./media/common-data-model-approve/search-entities.png)
6. Under **Choose an table**, click or tap **Review Dropbox Files**.
   
    ![Choose an table.](./media/common-data-model-approve/choose-entity.png)
7. Near the lower-right corner, click or tap **Connect**.
   
    ![Connect button.](./media/common-data-model-approve/connect-button.png)
8. If the opening screen of intro tour appears, take the tour to get familiar with Power Apps (or click or tap **Skip**).
   
    ![Intro tour.](./media/common-data-model-approve/quick-tour.png)
   
    You can always take the tour later by clicking or tapping the question-mark icon near the upper-left corner and then clicking or tapping **Take the intro tour**.
9. (optional) Near the bottom of the screen, drag the slider to increase the zoom so the app is easier to see.
   
    ![Zoom control.](./media/common-data-model-approve/zoom-control.png)

## Customize the app
1. In the right navigation bar, click or tap the layout that includes a header and a description.
   
    ![Choose layout.](./media/common-data-model-approve/choose-layout.png)
2. On the **BrowseScreen**, click or tap just under the search bar to select the larger text-box control.
   
    ![Select header.](./media/common-data-model-approve/select-header.png)
3. In the right-hand pane, open the lower list by clicking or tapping its down arrow.
   
    ![Open dropdown.](./media/common-data-model-approve/open-dropdown.png)
4. In the lower list, click or tap **Title** so show the file name of the added files.
   
    ![Set heading data.](./media/common-data-model-approve/set-heading.png)
5. In the right-hand pane, open the upper list, and then click or tap **Status** to show the status of each file.
   
    ![Set body data.](./media/common-data-model-approve/set-body.png)

## Test the overall solution
1. In Power Apps, open Preview mode by clicking or tapping the play button near the upper-left corner.
   
    ![Open Preview mode.](./media/common-data-model-approve/open-preview.png)
2. For the first file in the list, click or tap the arrow to show details about that file.
   
    ![Open Details screen.](./media/common-data-model-approve/open-details.png)
3. In the upper-right corner, click or tap the pencil icon to change details about the file.
   
    ![Open Edit screen.](./media/common-data-model-approve/edit-record.png)
4. In the **Status** box, type or paste **Approved**.
   
    ![Approve a file.](./media/common-data-model-approve/change-status.png)
5. In the upper-right corner, click or tap the checkmark icon to save your changes and return to the details screen.
   
    ![Save changes.](./media/common-data-model-approve/save-record.png)
   
    In a few minutes, you'll receive email stating that the file was approved.
6. In the upper-right corner, click or tap the back button to return to the browse screen.
   
    ![Return to browse screen.](./media/common-data-model-approve/back-arrow.png)
7. For the other file in the list, click or tap the arrow to show details about that file.
   
    ![Open Details screen.](./media/common-data-model-approve/open-details.png)
8. In the upper-right corner, click or tap the pencil icon to change details about the file.
   
    ![Open Edit screen.](./media/common-data-model-approve/edit-record.png)
9. In the **Status** box, type or paste **Rejected** (or anything except **Approved**, including **Aproved** or **Approoved**).
   
    ![Reject file.](./media/common-data-model-approve/reject-file.png)
10. In the upper-right corner, click or tap the checkmark icon to save your changes and return to the details screen.
    
     ![Save changes.](./media/common-data-model-approve/save-record.png)
    
     In a few minutes, you'll receive email stating that the file was rejected, and the file will be deleted from Dropbox.



[!INCLUDE[footer-include](includes/footer-banner.md)]