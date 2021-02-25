---
title: Getting started with a work or school account  | Microsoft Docs
description: Getting started with a work or school account
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

# Getting started with a work or school account

Power Automate Desktop enables users to automate repetitive desktop tasks through a collection of prebuilt drag-and-drop actions.

Using the available actions and built-in recorders, you can automate any business procedure, such as filling forms, retrieving data from web or desktop applications, and sending standardized emails.

Combining these features allows the creation of powerful flows that disengage humans from repetitive, unproductive procedures. Tasks like copying data across different systems are common in business environments, and Power Automate Desktop can entirely handle them.

Apart from third-party applications, Power Automate Desktop allows the automation of integrated Windows applications and features. Creating backups of critical files and running diagnostics or custom scripts can be performed effectively through desktop flows.

Using Power Automate Desktop with a work or school account is available at no additional cost. To unlock additional RPA features, such as running flows automatically, premium cloud connectors and flow sharing and monitoring, start a trial or upgrade to an [Organization premium account](getting-started-org.md).

To start a trial, select **Go Premium** on the Power Automate Desktop console.


## Flow example

To become familiar with the available features of Power Automate Desktop, follow the steps below to create a flow.

The presented flow creates a backup for all the files in your Documents folder and updates a log file containing their original location.

To create the flow:

1. Launch Power Automate Desktop and select the **New flow** button in the **Console**.

    ![The New flow button in the console.](media\getting-started-freeorg\getting-started-freeorg-console.png)

1. Populate a name for the flow and then select the **Create** button. In this example, the flow is named **Backup flow**.

    ![The Build a flow dialog.](media\getting-started-freeorg\getting-started-freeorg-new-flow.png)

1. When the **Flow designer** is launched, add a **Get special folder** action in the workspace and retrieve the Documents folder's path.

    ![The Get special folder action.](media\getting-started-freeorg\getting-started-freeorg-get-special-folder.png)

1. Add a **Get files in folder** action to retrieve all the files located in the previously retrieved Documents folder. Optionally, set the action to retrieve the files located in subfolders of the selected folder.

    ![The Get files in folder action.](media\getting-started-freeorg\getting-started-freeorg-get-files.png)

1. Deploy a **For each** action to access and handle each file of the retrieved list independently.

    ![A For each loop.](media\getting-started-freeorg\getting-started-freeorg-for-each.png)

1. Inside the **For each** loop, add a **Get file path part** action to retrieve the path of the currently selected file.

    ![The Get file path part action.](media\getting-started-freeorg\getting-started-freeorg-get-file-path-part.png)

1. Use a **Write text to file** action to append a new registry in the log file. In this example, the file is called **Logs.txt**, and each registry contains the original path of the copied file.

    ![The Write text to file action.](media\getting-started-freeorg\getting-started-freeorg-write-text-file.png)

1. Add a **Copy file** action to copy the currently selected file to the desired location. In this example, the destination folder is called **Backup**.

    ![The Copy file action.](media\getting-started-freeorg\getting-started-freeorg-copy-files.png)

1. To test if the flow runs as expected, select the **Run** button on the upper part of the **Flow designer**.

1. To check how every single action is implemented, run the flow step-by-step using the **Run next action** button.

1. If the flow runs as expected, select **Save** and close the **Flow designer** window.

    ![The final flow, and the Run, Run next action and Save buttons.](media\getting-started-freeorg\getting-started-freeorg-final.png)

1. Now, you can run your flow directly through the **Run** button in the **Console**. To stop the flow before its completion, select the **Stop** button.

    ![The Run and Stop buttons in the console.](media\getting-started-freeorg\getting-started-freeorg-run-flow-console.png)


## Next Steps

- Learn how to [set up Power Automate Desktop](setup.md).

- Begin your journey in Power Automate Desktop by [creating a Power Automate Desktop flow](create-flow.md). 

- Get familiar with the [console](console.md) and the [flow designer](flow-designer.md), which are part of Power Automate Desktop. 

- You'll find the list of actions available in the [Actions reference](actions-reference.md).