---
title: Design a flow | Microsoft Docs
description: Use power automate and flow designer to design a flow.
author: olegmelnykov
ms.service: flow
ms.topic: article
ms.date: 09/22/2020
ms.author: olmelnyk
ms.reviewer: olmelnyk
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Design a flow in Power Automate and Power Automate Desktop

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

Create a new folder on the desktop, and name it **Countries**.

Go to **flow.microsoft.com**, select **My flows**, then **+New**, and **Instant from blank**.

![My flows instant blank](\media\design-flow\my-flows-instant-blank.png)

In the dialog box, enter a flow name, select **Manually trigger a flow**, and then select **Create**.

![manually trigger flow](\media\design-flow\manually-trigger-flow.png)

Select **+New step**.

![new step](\media\design-flow\new-step.png)

Search for **UI flow**, and select the **Run a flow built by Power Automate Desktop (preview)** action.

![action search](\media\design-flow\action-search.png)

In the action, under Run mode select **Attended - Runs when you're signed in** and under UI flow select **+Create a new UI flow**.

![run UI flow action properties](\media\design-flow\run-ui-flow-v2-action-properties.png)

Enter a flow name or one will be generated and select **Launch app**.

![build UI flow dialog box](\media\design-flow\build-UI-flow-dialog.png)

A message from the browser may appear, asking whether to allow flow.microsoft.com to open an application. Allow this action to continue to Power Automate Desktop.

![browser open application](\media\design-flow\browser-open-application.png)

In Power Automate Desktop, open the Variables pane, select **+** and select **Input** to add a new input variable.

![add new input variable](\media\design-flow\add-new-input-variable.png)

Configure the variable as follows:
* Variable type: **Input**
* Variable name: **CountryName**
* Default value: **France**
* Data type: **String**
* External name: **CountryName**
* Description: **This is the country name input variable.**

![edit variable input](\media\design-flow\edit-variable-input.png)

Add the **Get current date and time** action and set **Retrieve** to **Current date only**. Select **Save** to add the action to the Power Automate Desktop workspace. This action retrieves only the current date, and stores it in a variable.

![get current date and time action properties](\media\design-flow\get-current-date-and-time-action-properties.png)

Add the **Convert datetime to text** action. In **Datetime to convert**, select the **variables** icon and double-click on **%CurrentDateTime%** in the pop-out to add the variable to the field. For Format to use set **Custom**, and enter **MM-dd-yyyy** in **Custom Format**. This action converts the datetime variable to a text variable, while also converting the date to the specified format.

![convert datetime text](\media\design-flow\convert-datetime-text.png)

Add the **Get special folder** action. The **Special folder name** will default to **Desktop**. This action stores the location of the current user's Desktop in a variable.

![get special folder action properties](\media\design-flow\get-special-folder-action-properties.png)

Add the **Create Folder** action and set **Create new folder into** to **%SpecialFolderPath%\Countries** and **New folder name** to **%CountryName%**. This action creates a new folder with the specified name, in the specified location.

![create folder action properties](\media\design-flow\create-folder-action-properties.png)

Add the **Write text to file** action and use the variables pop-out to set **File path** to **%SpecialFolderPath%\Countries\\%CountryName%\\%FormattedDateTime%.txt**. 

Set **Text to write** to **This text was written by Power Automate Desktop**. This action writes the specified text to a text file on the current user's desktop, and sets the filename to the current date.

This action writes the specified text into a text file.

![write text file action properties](\media\design-flow\write-text-file-action-properties.png)

Add the **Get files in folder** action and set **Folder** to **%SpecialFolderPath%\Countries\\%CountryName%**. This action retrieves a list of the files in a specified folder.

![get files folder action properties](\media\design-flow\get-files-folder-action-properties.png)

In the **Variables** pane, create two Output variables as follows:

* Variable type: **Output**
* Variable name: **FileCount**
* External name: **FileCount**
* Description: **This is the file count output variable.**

and

* Variable type: **Output**
* Variable name: **FilePath**
* External name: **FilePath**
* Description: **This is the file path output variable.**

![new output variable](\media\design-flow\new-output-variable.png)

![new output variable 2](\media\design-flow\new-output-variable-2.png)

Add two **Set variable** actions and configure them as follows:

* Set variable: **FilePath**
* To: **%SpecialFolderPath%\Countries\\%CountryName%\\%FormattedDateTime%.txt**

and

* Set variable: **FileCount**
* To: **%Files.count%**

![set variable action properties](\media\design-flow\set-variable-action-properties.png)

![set variable action properties 2](\media\design-flow\set-variable-action-properties-2.png)

Select **Save** to save the flow and close the flow designer.

![save complete flow](\media\design-flow\save-complete-flow.png)

Back in Power Automate, in the dialog box select **Keep Working**.

![pad portal dialog box keep working](\media\design-flow\pad-portal-dialog-keep-working.png)

Select the new UI flow in the action, and enter **Greece** into **CountryName**.

![run UI flow action properties 2](\media\design-flow\run-ui-flow-v2-action-properties-2.png)

Select **Save** to save the flow and then select **Test**.

![save test flow](\media\design-flow\save-test-flow.png)

Select **I'll perform the trigger action.** and **Test**.

![test flow](\media\design-flow\test-flow.png)

When Power Automate connects to Power Automate Desktop, select **Continue**, then **Run Flow** and then **Done**.

![run flow pop out 3](\media\design-flow\run-flow-pop-out-3.png)

When the flow finishes running, all actions will have a green checkmark icon and a notification will confirm that the flow ran successfully.

![successful flow run](\media\design-flow\successful-flow-run.png)

Select the **Run a flow built by Power Automate Desktop (preview)** action to open its inputs and outputs. In the Outputs, select **Show raw outputs**. The values of the two variables, **FileCount** and **FilePath**, were returned from Power Automate Desktop. Similarly, any output variables may be used elsewhere in the flow.

![variables values](\media\design-flow\variables-values.png)

Check the **Countries** folder on the desktop. A folder with the name **Greece** has been added, and contains a text file with today's date.