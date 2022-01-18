---
title: Create a Power Automate desktop flow | Microsoft Docs
description: Use the Power Automate designer to create a desktop flow.
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 01/15/2022
ms.author: v-gtrantzas
ms.reviewer: v-gtrantzas
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Create a Power Automate desktop flow

Desktop flows are used to automate tasks on the Web or the desktop. Using [Power Automate](introduction.md) you can automate tasks on the desktop as well as the Web. Alternatively, you can use the two legacy methods of creating desktop flows: [Windows recorder (V1) and Selenium ID](overview.md).

## Prerequisites

- To trigger desktop flows through Power Automate, you have to use [machines](manage-machines.md) or [machine groups](manage-machine-groups.md). Machines are physical or virtual devices that are used to automate desktop processes. Machine groups allow you to organize multiple machines together to help distribute your automation workload.

   As an alternative to the machines, you can use the [on-premises data gateway](https://go.microsoft.com/fwlink/?LinkID=820580&clcid=0x409). The gateway is an enterprise-grade secure connection between Power Automate and your device. 

- To create a desktop flow in Power Automate, you need a Microsoft work, school or organization premium account. To create and trigger a desktop flow through Power Automate, you need an organization premium or trial premium account.

   >[!IMPORTANT]
   >You must use the same work or school account to set up the gateway, to sign into Power Automate, and to log into your Windows device.

## Create a new desktop flow in Power Automate


1. To create a desktop flow in Power Automate, open the app and select **New Flow**.

   ![Screenshot of the New flow button in the console.](media\create-flow-console\console.png)

1. Enter a name for the desktop flow, and click **OK**.

   ![Screenshot of the Build a flow dialog.](media\create-flow-console\build-flow-dialog.png)

1. Create the flow in the **flow designer** and press **Ctrl+S** to save the flow. Close the flow designer and the flow will appear in the console.

   ![Screenshot a desktop flow in the console.](media\create-flow-console\console-flow.png)


## Design a flow in Power Automate

1. Create a new folder on the desktop, and name it **Countries**.

1. Go to **flow.microsoft.com**, select **My flows**, then **+New flow**, and **Instant cloud flow**.

   ![Screenshot of the Instant cloud flow option in the Power Automate portal.](media\design-flow\my-flows-instant-blank.png)

1. In the dialog box, enter a cloud flow name, select **Manually trigger a flow**, and then select **Create**.

   ![Screenshot of the Manually trigger a flow option.](media\design-flow\manually-trigger-flow.png)

1. Select **+ New step**.

   ![Screenshot of the New step button.](media\design-flow\new-step.png)

    <!--todo: Needs new screenshot and verify if action names are being updated-->
1. Search for **Power Automate**, and select the **Run a flow built with Power Automate for desktop** action.

   ![Screenshot of the field to search for actions.](media\design-flow\action-search.png)

1. If there isn't an existing connection to your machine, the action will prompt you to create a new one. You can find more information regarding triggering flows on machines in [Manage machines](manage-machines.md).

   ![Screenshot of the machine connection settings.](media\design-flow\machine-connection-settings.png)

1. In the action, under **Run mode** select **Attended (runs when you're signed in)** and under Desktop flow select **Create a new desktop flow**.

   ![Screenshot of the properties of the Run a flow built with Power Automate Desktop action.](media\design-flow\run-desktop-flow-v2-action-properties.png)

1. Enter a desktop flow name or one will be generated and select **Launch app**.

   ![Screenshot of flow name field in the Build a desktop flow dialog.](media\design-flow\build-desktop-flow-dialog.png)

1. A message from the browser may appear, asking whether to allow flow.microsoft.com to open an application. Allow this action to continue to Power Automate for desktop.

   ![Screenshot of a browser message asking whether to allow to open an application.](media\design-flow\browser-open-application.png)

1. In Power Automate for desktop, open the Variables pane, select **+** and select **Input** to add a new input variable.

   ![Screenshot of the button to add a new input variable.](media\design-flow\add-new-input-variable.png)

1. Configure the variable as follows:
   * Variable type: **Input**
   * Variable name: **CountryName**
   * Data type: **Text**
   * Default value: **France**
   * External name: **CountryName**
   * Description: **This is the country name input variable.**

   ![Screenshot of the Add a new input variable dialog.](media\design-flow\edit-variable-input.png)

1. Add the **Get current date and time** action and set **Retrieve** to **Current date only**. Select **Save** to add the action to the workspace. This action retrieves only the current date, and stores it in a variable.

   ![Screenshot of the Get current date and time action.](media\design-flow\get-current-date-and-time-action-properties.png)

1. Add the **Convert datetime to text** action. In **Datetime to convert**, select the **variables** icon and double-click on **%CurrentDateTime%** in the pop-out to add the variable to the field. 

   ![Screenshot of the icon to select variables in the Convert datetime to text action.](media\design-flow\convert-datetime-text-variable.png)


   For Format to use set **Custom**, and enter **MM-dd-yyyy** in **Custom Format**. This action converts the datetime variable to a text variable, while also converting the date to the specified format.

   ![Screenshot of the populated Convert datetime text action.](media\design-flow\convert-datetime-text.png)

1. Add the **Get special folder** action. The **Special folder name** will default to **Desktop**. This action stores the location of the current user's Desktop in a variable.

   ![Screenshot of the Get special folder action.](media\design-flow\get-special-folder-action-properties.png)

1. Add the **Create Folder** action and set **Create new folder into** to **%SpecialFolderPath%\Countries** and **New folder name** to **%CountryName%**. This action creates a new folder with the specified name, in the specified location.

   ![Screenshot of the Create folder action.](media\design-flow\create-folder-action-properties.png)

1. Add the **Write text to file** action and use the variables pop-out to set **File path** to **%SpecialFolderPath%\Countries\\%CountryName%\\%FormattedDateTime%.txt**. 

   > [!NOTE]
   > To use both hardcoded text and variables in the field, populate the hardcoded text manually, and use the variables pop-out to insert each variable in the currently selected part of the text.

1. Set **Text to write** to **This text was written by Power Automate**. This action writes the specified text to a text file on the current user's desktop, and sets the filename to the current date.

   This action writes the specified text into a text file.

   ![Screenshot of the Write text file action.](media\design-flow\write-text-file-action-properties.png)

1. Add the **Get files in folder** action and set **Folder** to **%SpecialFolderPath%\Countries\\%CountryName%**. This action retrieves a list of the files in a specified folder.

   ![Screenshot of the Get files folder action.](media\design-flow\get-files-folder-action-properties.png)

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

   ![Screenshot of the dialog to create the FileCount output variable.](media\design-flow\new-output-variable.png)

   ![Screenshot of the dialog to create the FilePath output variable.](media\design-flow\new-output-variable-2.png)

1. Add two **Set variable** actions and configure them as follows:
   
   * Set variable: **FilePath**
   * To: **%SpecialFolderPath%\Countries\\%CountryName%\\%FormattedDateTime%.txt**
   
   and
   
   * Set variable: **FileCount**
   * To: **%Files.count%**

   ![Screenshot of the Set variable action that creates the FilePath variable.](media\design-flow\set-variable-action-properties.png)

   ![Screenshot of the Set variable action that creates the FileCount variable.](media\design-flow\set-variable-action-properties-2.png)

1. Select **Save** to save the flow and close the flow designer.

   ![Screenshot of the Save button in the flow designer.](media\design-flow\save-complete-flow.png)

1. Back in Power Automate, in the dialog box select **Keep Working**.

   ![Screenshot of the Keep working option in the Power Automate dialog box.](media\design-flow\pad-portal-dialog-keep-working.png)

1. Select the new desktop flow in the action, and enter **Greece** into **CountryName**.

   ![Screenshot of the input variables in the Run a flow built with Power Automate Desktop action.](media\design-flow\run-desktop-flow-v2-action-properties-2.png)

1. Select **Save** to save the flow and then select **Test**.

   ![Screenshot of the Save and Test options.](media\design-flow\save-test-flow.png)

1. Select **Manually** and **Test**.

   ![Screenshot of the option to perform the trigger action.](media\design-flow\test-flow.png)

1. When Power Automate connects to the desktop app, select **Run flow**, and then **Done**.

   ![Screenshot of a dialog showing that the flow ran successfully.](media\design-flow\run-flow-pop-out-3.png)

1. When the flow finishes running, all actions will have a green checkmark icon and a notification will confirm that the flow ran successfully.

   ![Screenshot of a message showing that the flow ran successfully.](media\design-flow\successful-flow-run.png)

   <!--todo: Needs new screenshot and verify if action names are being updated-->
  
1. Select the **Run a flow built with Power Automate for desktop** action to open its inputs and outputs. The values of the two variables, **FileCount** and **FilePath**, were returned from Power Automate. Similarly, any output variables may be used elsewhere in the flow.

   ![Screenshot of the values of the input and output variables.](media\design-flow\variables-values.png)

1. Check the **Countries** folder on the desktop. A folder with the name **Greece** has been added, and contains a text file with today's date.


[!INCLUDE[footer-include](../includes/footer-banner.md)]
