---
title: Getting started with a work or school account  | Microsoft Docs
description: Getting started with a work or school account
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 09/22/2020
ms.author: marleon
ms.custom: intro-internal
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Getting started with a work or school account

Power Automate enables users to automate repetitive desktop tasks through a collection of prebuilt drag-and-drop actions.

Using the available actions and [built-in recorder](recording-flow.md), you can automate any business procedure, such as [filling forms](automation-web.md#data-population-on-the-web), [retrieving data from web](automation-web.md#web-data-extraction) or [desktop applications](desktop-automation.md), and [sending standardized emails](actions-reference/email.md).

Combining these features allows the creation of powerful flows that disengage humans from repetitive, unproductive procedures. Tasks like copying data across different systems are common in business environments, and Power Automate can entirely handle them.

Apart from third-party applications, Power Automate allows the automation of integrated Windows applications and features. Creating backups of critical files and running diagnostics or custom scripts can be performed effectively through desktop flows.

Using Power Automate with a work or school account is available at no additional cost. To use Power Automate for desktop, your default environment must contain a [Dataverse database](create-database.md). To unlock additional RPA features, such as running flows automatically, premium cloud connectors and flow sharing and monitoring, start a trial or upgrade to an [Organization premium account](getting-started-org.md).

To start a trial, select **Go Premium** on the Power Automate for desktop console.

## Flow example

To become familiar with the available features of Power Automate, follow the steps below to create a flow.

The presented flow copies all the files located in the Documents folder and creates a backup to a secondary drive. The original location of each file is appended to an existing log file.

> [!NOTE]
> To implement this example, a secondary drive has to be connected to your computer. If a secondary drive isn't available, select a different destination folder for the files.

To create the flow:

1. Launch Power Automate for desktop and select the **New flow** button in the **Console**.

    ![Screenshot of the New flow button in the console.](media\getting-started-freeorg\getting-started-freeorg-console.png)

1. Populate a name for the flow and then select the **Create** button. In this example, the flow is named **Backup flow**.

    ![Screenshot of the Build a flow dialog.](media\getting-started-freeorg\getting-started-freeorg-new-flow.png)

1. When the **Flow designer** is launched, add a **Get special folder** action in the workspace and retrieve the Documents folder's path.

    ![Screenshot of the Get special folder action.](media\getting-started-freeorg\getting-started-freeorg-get-special-folder.png)

1. Add a **Get files in folder** action to retrieve all the files located in the previously retrieved Documents folder. Optionally, set the action to retrieve the files located in subfolders of the selected folder.

    ![Screenshot of the Get files in folder action.](media\getting-started-freeorg\getting-started-freeorg-get-files.png)

1. Deploy a **For each** action to access and handle each file of the retrieved list independently.

    ![Screenshot of a For each loop.](media\getting-started-freeorg\getting-started-freeorg-for-each.png)

1. Inside the **For each** loop, add a **Get file path part** action to retrieve the path of the currently selected file.

    ![Screenshot of the Get file path part action.](media\getting-started-freeorg\getting-started-freeorg-get-file-path-part.png)

1. Add a **Copy file** action to copy the currently selected file to the desired location. In this example, the destination folder is called **Backup** and it's located in the **D** drive.

    > [!NOTE]
    > If a secondary drive isn't available, select a different destination folder for the copied file.

    ![Screenshot of the Copy file action.](media\getting-started-freeorg\getting-started-freeorg-copy-files.png)

1. Use a **Write text to file** action to append a new registry in the log file. In this example, the file is called **Logs.txt**, and each registry contains the original path of the copied file.

    ![Screenshot of the Write text to file action.](media\getting-started-freeorg\getting-started-freeorg-write-text-file.png)

1. To test if the flow runs as expected, select the **Run** button on the upper part of the **Flow designer**.

1. To check how every single action is implemented, run the flow step-by-step using the **Run next action** button.

1. If the flow runs as expected, select **Save** and close the **Flow designer** window.

    ![Screenshot of the final flow, and the Run, Run next action and Save buttons.](media\getting-started-freeorg\getting-started-freeorg-final.png)

1. Now, you can run your flow directly through the **Run** button in the **Console**. To stop the flow before its completion, select the **Stop** button.

    ![Screenshot of the Run and Stop buttons in the console.](media\getting-started-freeorg\getting-started-freeorg-run-flow-console.png)

## Next Steps

- Learn how to [set up Power Automate for desktop](setup.md).

- Begin your journey in Power Automate by [creating a Power Automate desktop flow](create-flow.md). 

- Get familiar with the [console](console.md) and the [flow designer](flow-designer.md), which are part of Power Automate. 

- You'll find the list of actions available in the [Actions reference](actions-reference.md).