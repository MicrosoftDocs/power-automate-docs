---
title: Trigger approvals from a SharePoint document library in Power Automate
description: Learn how to create an approval flow that triggers when new files are added to a SharePoint library in Power Automate.
suite: flow
author: HeatherOrt
contributors:
  - HeatherOrt
  - elaizabenitez
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 03/25/2025
ms.author: heortaol
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Trigger approvals from a SharePoint document library

This article shows you how to create an approval flow for new documents (invoices) when they're added to a SharePoint document library. Once they're added, you can attach documents to the approval request.  
  
In the approval process, every time a new invoice is added to a SharePoint library, a request is sent for someone to review its contents. If they approve the request, the invoice files are moved to a folder.

To learn how to trigger approvals from a SharePoint document library, check out this short video:

[!VIDEO https://www.microsoft.com/videoplayer/embed/RE4Q6Qv]

For more detailed instructions, follow the procedures in this article.

## Create a flow from a template

Before you start, you need to create some folders in Sharepoint. Then, you can create a flow from a template in Power Automate.

1. On the navigation pane in SharePoint, select **Documents**.
1. Create two folders, such as **Incoming Invoices** and **Reviewed Invoices**.
1. On the navigation pane in [Power Automate](https://make.powerautomate.com), select **Templates**.
1. In the **Search templates** field, begin typing **Start an approval for new file to move it to a different folder**. When the template appears in the search results, select it.

    This template provides us with a flow that is configured to set up an approval process for a SharePoint document library.

1. Confirm that all the connections listed have a green checkmark, and then select **Continue**. A cloud flow is created.

    You might need to sign in or create to see the green checkmarks.

    :::image type="content" source="media/trigger-sharepoint-library/approvals-template.png" alt-text="Screenshot of the 'Start an approval for new file to move it to a different folder' template in Power Automate.":::

## Update the trigger parameters

Continue by updating the trigger input parameters.

1. Select the trigger card.
1. In the **Site Address** field, select the SharePoint site that contains your list.

    If the SharePoint site doesn’t appear on the list, type in your SharePoint site URL.

1. In the **Library Name** field, select the library in your SharePoint site where the folders reside.
1. Under **Advanced parameters**, select **Show all** to display the **Folder** input parameter.
1. In the **Folder** field, select the folder icon, and then select the folder where you'll upload the incoming files to be reviewed through an approval request.
1. Close the **Parameters** panel.

## Add an action

Add an action that allows you to retrieve the content of the file.

1. Select the plus sign (**+**) below the trigger.
1. In the **Search for an action or connector** field, enter **sharepoint get file content**.
1. Scroll down to find and select the **Get File Content** action.

## Configure the flow

1. In the **Get File Content** action screen, **Parameters** tab, update the following input
parameters:

    1. In the **Site Address** field, select the same SharePoint site that contains your
  list.

        If the SharePoint site doesn’t appear on the list, type in your SharePoint site URL.

    1. In the **File Identifier** field, type a forward slash (**/**) and select the thunderbolt icon to load the dynamic content picker.
    1. In the dynamic content picker **Search** field, start typing **identifier**. When it appears in the list, select **Identifier**.

1. In the designer, select the **Start and wait for an approval** action and update the following input parameters:

    1. In the **Title** field, enter a title for the approval request, such as *A new
  file needs your view and approval*.
    1. In the **Assigned to** field, select a user to be the approver of the approval request, such as yourself.
    1. In the **Details** field, enter details for the approval request for the approver, such as *Please approve this file -* .
  
        You can also include the file name including the extension by selecting the **File name with extension** property from the trigger using the dynamic content picker.

    1. In the **Item link** field, use the dynamic content picker to find and select the **Link to
  item** property from the trigger.
    1. In the **Item link description** field, use the dynamic content picker to find and select the **Name** property from the trigger.

1. In the designer, select the **Apply to each** action. This action loops through each response of the approvers for the approval request. In this example, only one approver was added, so the flow processes only one response.

    :::image type="content" source="media/trigger-sharepoint-library/apply-to-each.png" alt-text="Screenshot of the 'Apply to each' action in the designer.":::

1. In the designer, select the **Condition** action. This action checks whether the **Approver Response** value from the first responder equals `Approve`.

    The condition action has two branches that represent a set of actions to be executed if the condition is met (**True**) or not met (**False**). When the file is approved, the **True** branch processes the two actions, which creates the file in the second folder, and deletes the existing file in the original folder. Otherwise, if the file is rejected, the **False** branch processes with no further automation.

     :::image type="content" source="media/trigger-sharepoint-library/condition.png" alt-text="Screenshot of the 'Condition' action in the designer.":::

1. In the designer, select the **Create file** action and update the following input parameters:
    1. In the **Site Address** field, select the SharePoint site that contains your list. If the SharePoint site doesn’t appear on the list, type your SharePoint site URL.
    1. In the **Folder** **Path** field, select the folder where you plan to put the incoming files to be reviewed with an approval.
    1. In the **File Name** field, use the dynamic content picker to find and select the **File name with extension property** from the trigger.
    1. In the **File Content** field, use the dynamic content picker to find and select the **File Content** property from the **Get File Content** action.

1. In the designer, select the **Delete file** action and update the following input parameters.
    1. In the **Site Address** field, select the SharePoint site that contains your list.
  If the SharePoint site doesn’t appear on the list, type in your SharePoint site URL.
    1. In the **File Identifier** field, use the dynamic content picker to select the **File Identifier** property from the trigger.

## Test your flow

You're done configuring the flow. You can now test it.

1. On the menu bar, select **Save**. You might get a warning message from the Flow checker. You can dismiss it.
1. Once the flow is saved, select **Test**.
1. Select **Manually** > **Test**.

    Power Automate indicates to you when the flow is in test mode.

    \[14_TestRunning.jpg\]

1. When it's in test mode, upload a new file to the **Incoming Invoices** folder in the SharePoint document library that you specified earlier.

    The flow continues to run the test.

## Respond to the approval request

The person to whom you assigned the approval now receives the approval request in various places where they can approve or reject it. The file to review is provided as a hyperlink for easy reference.

### By email  

The email looks like the following screenshot with a hyperlink to the file in SharePoint.

If the email doesn't display correctly, make sure you have the latest updates in your Outlook app, or use the web version of Outlook.

:::image type="content" source="media/trigger-sharepoint-library/email.png" alt-text="Screenshot of the 'Approvals' screen in Power Automate.":::

### In Power Automate maker portal, in Approvals section

The approver gets a list of their approval requests in the **Received** tab. When the request is selected, the **Respond** panel appears where the approver can review the request, including select the link which loads the SharePoint file to review in a new browser tab.

1. Scroll down the **Respond** panel and in the **Choose your response** dropdown list, select **Approve**.
1. Select **Confirm**.

    :::image type="content" source="media/trigger-sharepoint-library/response.png" alt-text="Screenshot of the 'Respond' panel in Power Automate.":::

    Once the request is approved or rejected, the flow test run continues. If the request was approved, the **True** branch processes. Otherwise, the **False* branch processes.

    Since the request in this example was approved, the file uploaded in the original folder was deleted and created in the other folder.

## Related information

- Create [approval flows](modern-approvals.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]
