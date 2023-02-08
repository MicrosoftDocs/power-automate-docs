---
title: SharePoint (preview)
description: SharePoint (preview) Actions Reference
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 01/17/2023
ms.author: dipapa
ms.reviewer: gtrantzas
contributors:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# SharePoint (preview)

The SharePoint (preview) group of actions allows the utilization of the [SharePoint connector](/connectors/sharepointonline) from within desktop flows, alleviating the need to create a cloud flow in order to use its actions. This connector is the same as the one used across Power Automate cloud flows, PowerApps, and Logic Apps. It uses the same parameters and returns the same type of data.

## Prerequisites and limitations

- During preview, you need an Attended RPA license.

- Sharing desktop flows with SharePoint cloud actions isn't supported. Co-owners won't be able to run such desktop flows unless they overwrite the connection references with their own. **Users** with read access are unable to run such flows.

- Data loss prevention policies (DLP) that include SharePoint cloud actions aren't enforced within desktop flows. During preview, machine administrators can disable the SharePoint actions by modifying the [appropriate registry setting](../governance.md#prevent-power-automate-for-desktop-from-running-flows-containing-cloud-connectors).

- Refrain from modifying a response’s properties directly as it may lead to an erroneous state after future updates. Instead, opt for storing the properties you want to utilize (from the response retrieved) directly into separate variables.

## Why should I use SharePoint actions inside desktop flows instead of cloud flows?

Users can still combine SharePoint actions with the **Run a flow built with Power Automate for desktop** action. However, SharePoint actions inside desktop flows improve performance and ease of use for users who need to loop between cloud and desktop actions.

## List of SharePoint actions

- [Create sharing link for a file or folder](/connectors/sharepointonline/#create-sharing-link-for-a-file-or-folder)
- [Copy file](/connectors/sharepointonline/#copy-file)
- [Move file](/connectors/sharepointonline/#move-file)
- [Copy folder](/connectors/sharepointonline/#copy-folder)
- [Move folder](/connectors/sharepointonline/#move-folder)
- [Create file](/connectors/sharepointonline/#create-file)
- [List folder](/connectors/sharepointonline/#list-folder)
- [Check out file](/connectors/sharepointonline/#check-out-file)
- [Discard check out](/sharepointonline/#discard-check-out)
- [Check in file](/sharepointonline/#check-in-file)
- [Get list views](/connectors/sharepointonline/#get-list-views)
- [Get all lists and libraries](/connectors/sharepointonline/#get-all-lists-and-libraries)
- [Get file metadata](/connectors/sharepointonline/#get-file-metadata)
- [Update file](/connectors/sharepointonline/#update-file)
- [Delete file](/connectors/sharepointonline/#delete-file)
- [Get file metadata using path](/connectors/sharepointonline/#get-file-metadata-using-path)
- [Get folder metadata](/connectors/sharepointonline/#get-folder-metadata)
- [Get folder metadata using path](/connectors/sharepointonline/#get-folder-metadata-using-path)
- [Get file content using path](/connectors/sharepointonline/#get-file-content-using-path)
- [Get file content](/connectors/sharepointonline/#get-file-content)
- [List root folder](/connectors/sharepointonline/#list-root-folder)
- [Extract folder](/connectors/sharepointonline/#extract-folder)
- [Get lists](/connectors/sharepointonline/#get-lists)

## Getting started with SharePoint actions in desktop flows

This section presents examples on how to use SharePoint actions in your desktop flows.

### How to download the content of a SharePoint folder

> [!IMPORTANT]
> Before replicating the following steps, ensure that you are familiar with [lists](../variable-data-types.md#list), [custom objects](../variable-data-types.md#custom-object), [loops](../use-loops.md), [conditionals](../use-conditionals.md), and the [percentage notation](../variable-manipulation.md).

1. Ensure that you've installed the [latest version of Power Automate for desktop](../install.md).

1. Create a new desktop flow.

1. If the identifier of the target folder is unknown, use the **Get folder metadata using path** SharePoint action to retrieve it. This action requires the folder's path and produces a custom object containing the folder's metadata. You can access the identifier using the **Id** property.

    :::image type="content" source="media\sharepoint\sharepoint-get-folder-metadata-using-path-action.png" alt-text="Screenshot of the Get folder metadata using path action.":::

1. Deploy the **List folder** SharePoint action and populate the appropriate SharePoint URL and the previously retrieved identifier. The produced list contains custom objects representing items in the target folder.

    :::image type="content" source="media\sharepoint\sharepoint-list-folder-action.png" alt-text="Screenshot of the List folder action.":::

1. After retrieving the list, use a **For each** loop to iterate through the objects inside it.

    :::image type="content" source="media\sharepoint\for-each-action.png" alt-text="Screenshot of the For each loop that iterates through the retrieved custom objects.":::

1. If the items in the target folder are only files, use the Get file content using path action, and the **Path** property inside the block to retrieve the current file's contents.

    :::image type="content" source="media\sharepoint\sharepoint-get-file-content-using-path-action.png" alt-text="Screenshot of the Get file content using path action.":::

1. Then, deploy the **Convert binary data to file** action to store the retrieved data in a local file. You can use the **Name** property to name the new file with the same name as the original SharePoint file.

    :::image type="content" source="media\sharepoint\convert-binary-data-file-action.png" alt-text="Screenshot of the Convert binary data to file action.":::

The previous steps cover the case where the target folder contains only files. However, if the folder contains subfolders with files inside them, modify your desktop flow accordingly:

1. Add an **If** condition inside the previously deployed loop to check whether the currently selected item is a folder. To perform this check, use the **IsFolder** property of the current item.

    :::image type="content" source="media\sharepoint\if-action-folder.png" alt-text="Screenshot of the if action that checks whether the current item is a folder.":::

1. Inside the if-block, use the **Get folder metadata using path** action to get the identifier of the currently selected folder. The folder path is the same as the one you used at the beginning of the flow, plus the folder's name. You can access the folder using the **Name** property of the current item.

    :::image type="content" source="media\sharepoint\sharepoint-get-folder-metadata-using-path-actio-name-property.png" alt-text="Screenshot of the second Get folder metadata using path action.":::

1. As you did before, deploy the **List folder** SharePoint action and populate the appropriate SharePoint URL and the previously retrieved identifier.

    :::image type="content" source="media\sharepoint\sharepoint-list-folder-action-second.png" alt-text="Screenshot of the second List folder action.":::

1. Deploy a **For each** loop to iterate through the files inside the selected subfolder, and move and modify the previously deployed **Get file content using path** and **Convert binary data to file** actions to retrieve and save locally the contents of each file.

    :::image type="content" source="media\sharepoint\final-flow.png" alt-text="Screenshot of the final flow.":::

If you want to download files of specific subfolders, modify the previously deployed conditional to check the desired condition. For example, the following condition checks whether the current item's name is any other than 2022.

> [!NOTE]
> Although you could use a new nested **If** action, combining the checks in only one conditional makes the desktop flow less complicated and easier to read.

:::image type="content" source="media\sharepoint\if-action-item-name.png" alt-text="Screenshot of a conditional that checks the current item's name.":::

If you want to download only files of a specific type, add a conditional before retrieving the file contents to check whether the file name ends with a particular extension.

:::image type="content" source="media\sharepoint\if-action-item-type.png" alt-text="Screenshot of a conditional that checks the current item's file type.":::

### How to upload a local file to SharePoint

1. Ensure that you've installed the [latest version of Power Automate for desktop](../install.md).

1. Create a new desktop flow.

1. Deploy the **Convert file to binary data** action and select the desired file on your local drive. The action stores the converted file in the **BinaryData** variable.

    :::image type="content" source="media\sharepoint\convert-file-binary-data-action.png" alt-text="Screenshot of the Convert file to binary data action.":::

1. Find the **SharePoint (preview)** group of actions in the flow designer and deploy the **Create file** action in the workspace.

1. Select an existing connection reference and fill in the required parameters. Here's an example about how to fill the fields:

      > [!IMPORTANT]
      > Don't forget to add the appropriate file extension after the file name.

    :::image type="content" source="media\sharepoint\sharepoint-create-file-action.png" alt-text="Screenshot of the Create file SharePoint action.":::

## Upcoming features

- Dynamic content for output variables: cloud actions’ output variables can be expanded to show its underlying properties
- Share to **users** brings their own connection references upon each run
- Co-owners can use the same connection references
- ALM dependencies management (dependency checker upon import, add required objects, show dependencies)
- Connection references are visible in desktop flows details pages
- Exponential/manual retry policies in case the connector responds an error
- DLPs that include SharePoint cloud actions are enforced in desktop flows
- New SharePoint actions
