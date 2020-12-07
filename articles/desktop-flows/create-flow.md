---
title: Create a Power Automate Desktop flow | Microsoft Docs
description: Use power automate and flow designer to design a desktop flow.
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

# Create a Power Automate Desktop flow


## Trigger the console from the portal



1. To create a UI flow in Power Automate Desktop, open the app and select **New Flow**.

   ![New flow button](\media\create-flow-console\console.png)

1. Enter a name for the UI flow, and click **OK**.

   ![build flow dialog box](\media\create-flow-console\build-flow-dialog.png)

1. Create the flow in the **flow designer** and press **Ctrl+S** to save the flow. Close the flow designer and the flow will appear in the console.

   ![console flow](\media\create-flow-console\console-flow.png)


## Design a flow in Power Automate and Power Automate Desktop

1. Create a new folder on the desktop, and name it **Countries**.

1. Go to **flow.microsoft.com**, select **My flows**, then **+New**, and **Instant from blank**.

   ![My flows instant blank](\media\design-flow\my-flows-instant-blank.png)

1. In the dialog box, enter a cloud flow name, select **Manually trigger a flow**, and then select **Create**.

   ![manually trigger flow](\media\design-flow\manually-trigger-flow.png)

1. Select **+New step**.

   ![new step](\media\design-flow\new-step.png)

    <!--todo: Needs new screenshot and verify if action names are being updated-->
1. Search for **UI flow**, and select the **Run a flow built by Power Automate Desktop (preview)** action.

   ![action search](\media\design-flow\action-search.png)

1. In the action, under Run mode select **Attended - Runs when you're signed in** and under UI flow select **+Create a new UI flow**.

   ![run UI flow action properties](\media\design-flow\run-desktop-flow-v2-action-properties.png)

1. Enter a desktop flow name or one will be generated and select **Launch app**.

   ![build UI flow dialog box](\media\design-flow\build-UI-flow-dialog.png)

1. A message from the browser may appear, asking whether to allow flow.microsoft.com to open an application. Allow this action to continue to Power Automate Desktop.

   ![browser open application](\media\design-flow\browser-open-application.png)

1. In Power Automate Desktop, open the Variables pane, select **+** and select **Input** to add a new input variable.

   ![add new input variable](\media\design-flow\add-new-input-variable.png)

1. Configure the variable as follows:
   * Variable type: **Input**
   * Variable name: **CountryName**
   * Default value: **France**
   * Data type: **String**
   * External name: **CountryName**
   * Description: **This is the country name input variable.**

   ![edit variable input](\media\design-flow\edit-variable-input.png)

1. Add the **Get current date and time** action and set **Retrieve** to **Current date only**. Select **Save** to add the action to the Power Automate Desktop workspace. This action retrieves only the current date, and stores it in a variable.

   ![get current date and time action properties](\media\design-flow\get-current-date-and-time-action-properties.png)

1. Add the **Convert datetime to text** action. In **Datetime to convert**, select the **variables** icon and double-click on **%CurrentDateTime%** in the pop-out to add the variable to the field. For Format to use set **Custom**, and enter **MM-dd-yyyy** in **Custom Format**. This action converts the datetime variable to a text variable, while also converting the date to the specified format.

   ![convert datetime text](\media\design-flow\convert-datetime-text.png)

1. Add the **Get special folder** action. The **Special folder name** will default to **Desktop**. This action stores the location of the current user's Desktop in a variable.

   ![get special folder action properties](\media\design-flow\get-special-folder-action-properties.png)

1. Add the **Create Folder** action and set **Create new folder into** to **%SpecialFolderPath%\Countries** and **New folder name** to **%CountryName%**. This action creates a new folder with the specified name, in the specified location.

   ![create folder action properties](\media\design-flow\create-folder-action-properties.png)

1. Add the **Write text to file** action and use the variables pop-out to set **File path** to **%SpecialFolderPath%\Countries\\%CountryName%\\%FormattedDateTime%.txt**. 

1. Set **Text to write** to **This text was written by Power Automate Desktop**. This action writes the specified text to a text file on the current user's desktop, and sets the filename to the current date.

   This action writes the specified text into a text file.

   ![write text file action properties](\media\design-flow\write-text-file-action-properties.png)

1. Add the **Get files in folder** action and set **Folder** to **%SpecialFolderPath%\Countries\\%CountryName%**. This action retrieves a list of the files in a specified folder.

   ![get files folder action properties](\media\design-flow\get-files-folder-action-properties.png)

1. In the **Variables** pane, create two Output variables as follows:
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

1. Add two **Set variable** actions and configure them as follows:
   
   * Set variable: **FilePath**
   * To: **%SpecialFolderPath%\Countries\\%CountryName%\\%FormattedDateTime%.txt**
   
   and
   
   * Set variable: **FileCount**
   * To: **%Files.count%**

   ![set variable action properties](\media\design-flow\set-variable-action-properties.png)

   ![set variable action properties 2](\media\design-flow\set-variable-action-properties-2.png)

1. Select **Save** to save the flow and close the flow designer.

   ![save complete flow](\media\design-flow\save-complete-flow.png)

1. Back in Power Automate, in the dialog box select **Keep Working**.

   ![pad portal dialog box keep working](\media\design-flow\pad-portal-dialog-keep-working.png)

1. Select the new UI flow in the action, and enter **Greece** into **CountryName**.

   ![run UI flow action properties 2](\media\design-flow\run-desktop-flow-v2-action-properties-2.png)

1. Select **Save** to save the flow and then select **Test**.

   ![save test flow](\media\design-flow\save-test-flow.png)

1. Select **I'll perform the trigger action.** and **Test**.

   ![test flow](\media\design-flow\test-flow.png)

1. When Power Automate connects to Power Automate Desktop, select **Continue**, then **Run Flow** and then **Done**.

   ![run flow pop out 3](\media\design-flow\run-flow-pop-out-3.png)

1. When the flow finishes running, all actions will have a green checkmark icon and a notification will confirm that the flow ran successfully.

   ![successful flow run](\media\design-flow\successful-flow-run.png)

   <!--todo: Needs new screenshot and verify if action names are being updated-->
  
1. Select the **Run a flow built by Power Automate Desktop (preview)** action to open its inputs and outputs. In the Outputs, select **Show raw outputs**. The values of the two variables, **FileCount** and **FilePath**, were returned from Power Automate Desktop. Similarly, any output variables may be used elsewhere in the flow.

   ![variables values](\media\design-flow\variables-values.png)

1. Check the **Countries** folder on the desktop. A folder with the name **Greece** has been added, and contains a text file with today's date.
