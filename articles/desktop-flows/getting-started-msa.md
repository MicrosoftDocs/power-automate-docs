---
title: Getting started with a Microsoft account  | Microsoft Docs
description: Getting started with a Microsoft account
author: mariosleon
ms.service: flow
ms.topic: article 
ms.date: 09/22/2020
ms.author: marleon
ms.reviewer: marleon
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Getting started with a Microsoft account

Power Automate Desktop enables regular and power users alike to create flows, which save time and eliminate human error. 

Focus on other activities by automating routine and repetitive tasks like organizing or backing up your files and folders. Create flows to extract product prices from a website and save them in an Excel spreadsheet and email it as an attachment. Fill in web forms by supplying information dynamically from your files.  

Create automated workflows with step-by-step guidance and an intuitive, no-code interface anyone can use, regardless of their technical expertise. Build flows from a wide variety of pre-made actions, or record your interactions as steps to be played back anytime. 

Using Power Automate Desktop with a Microsoft account is available at no additional cost.

>[!Note]
>Flows built with Power Automate Desktop using a Microsoft account are stored automatically on the users' OneDrive.

## Build your first flow



The following example demonstrates the creation of a short flow. The completed flow will prompt the user to select a folder. The flow will then copy the folder to another folder named **backup** on the user's desktop.

To create the flow:

1. Launch Power Automate Desktop and select the New flow button in the console.

    ![console new flow](media\getting-started-msa\console-new-flow.png)


1. Populate a name for the flow and then select **Create**. In this example, the flow is named **Copy Folder to Desktop**

    ![build flow dialog](media\getting-started-msa\build-flow-dialog.png)


1. When the Flow Designer opens, go to the Actions pane, open the **Folders** group, and drag and drop the **Get special folder** action to the workspace to add it to the flow.

    ![add action](media\getting-started-msa\add-action.png)



1. In the resulting action properties dialog, the desktop folder is selected by default. Select OK to add the action to the flow.

    ![get special folder action properties](media\getting-started-msa\get-special-folder-action-properties.png)


1. Similarly to step 3, go to the **Message boxes** group, and add the **Display select folder dialog** action to the flow. Set **Dialog description** to **Select a folder to back up:**.

    ![display select folder dialog action properties](media\getting-started-msa\display-select-folder-dialog-action-properties.png)


1. In the **Folders** group, add **Create folder** to the flow. Set the **Create new folder into** field to **%SpecialFolderPath%** and **New folder name** to **backup**.

    ![create folder action properties](media\getting-started-msa\create-folder-action-properties.png)


1. In the same group, select the **Copy folder** action. Set **Folder to copy** to **%SelectedFolder%**, **Destination folder** to **%SpecialFolderPath%\backup** and add the action to the flow.

    ![copy folder action properties](media\getting-started-msa\copy-folder-action-properties.png)


1. Select run to run the flow.

    ![run flow](media\getting-started-msa\run-flow.png)

1. Close process designer and save the flow. Now you can run the flow from the console.

    ![run flow console](media\getting-started-msa\run-flow-console.png)


When prompted for a folder, select any folder you wish to copy. The flow will create a new folder on your desktop called **backup** with the selected folder inside.

Following this example, it is possible to imagine a wide range of scenarios where these actions could be combined with other actions. Among the many possibilities, users could:
* Select an additional folder on a flash drive to back up to
* Back up files based on specific criteria
* Create a file structure for the backup
* Iterate through a list of folders and only back up selected folders


## Next Steps

- Learn how to [set up Power Automate Desktop](setup.md).

- Begin your journey in Power Automate Desktop by [creating a Power Automate Desktop flow](create-flow.md). 

- Get familiar with the [console](console.md) and the [flow designer](flow-designer.md), which are part of Power Automate Desktop. 

- You'll find the list of actions available in the [Actions reference](actions-reference.md).