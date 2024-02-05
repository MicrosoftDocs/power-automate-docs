---
title: Create an SAP desktop flow by using Power Automate Desktop | Microsoft Docs
description: Follow this step-by-step tutorial to create a desktop flow to automate the SAP GUI.
suite: flow
documentationcenter: na
author: kathyos
editor: ''
ms.custom: guidance

ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/01/2021
ms.author: kathyos
ms.reviewer: angieandrews
---

# Create an SAP desktop flow with Power Automate Desktop

![Screenshot of Power Automate Desktop designer window with a UI flow with two steps run application and wait.](media/PAD-designer-window-with-UI-flow.png)

1. To create a desktop flow, open Power Automate Desktop, and then select **New flow**.

2. Enter a name for the desktop flow, and then select **Create**.

    ![Screenshot of Power Automate Desktop dialog for naming a new flow.](media/naming-new-flow.png)

3. Select **Variables** in the Power Automate Desktop designer.

    ![Screenshot of Power Automate Desktop variables icon on the right of the screen.](media/power-automate-desktop-variables-icon.png)

4. Select the plus sign (**+**), and then select **Input**.
   
   You'll create several input variables which will be passed into this desktop flow from a cloud flow.

    ![Screenshot of the create variable UI in Power Automate Desktop.](media/create-variable-UI.png)

5. First, we'll create a few technical SAP variables, which will be needed in almost all SAP-based automation flows. For each variable in the following list, enter the **Variable name**, **External name** and **Description**, and then select **Update**.

   - SAPPassword

   - SAPUser

   - SAPClient

   - SAPSystemId

    ![Screenshot of Add a new variable dialog.](media/add-new-variable.png)

6. Next, create the following use-case-specific variables.

   - EmployeeId

   - AddressType

   - EffectiveDate

   - Street

   - City

   - State

   - ZipCode

   - CountryCode

    ![Screenshot of the variables windows with the created variable names.](media/variables-window-with-created-variable-names.png)

7. Next, we'll create our first process action. Search for, and then drag the **Run application** action onto the design surface. 

    ![Screenshot of a Run Application action dialog that has been added to the authoring canvas.](media/run-application-action.png)

8. Enter the following information into the parameter list, and then select **Save**.

   - **Application Path:** C:\\Program Files (x86)\\SAP\\FrontEnd\\SapGui\\sapshcut.exe

   - **Command line arguments**: start -system=%SAPSystemId% -client=%SAPClient% -user=%SAPUser% -pw=%SAPPassword% -maxgui

   - **Window style**: Maximized

   - **After application launch:** Wait for application to complete

    ![Screenshot of Run Application dialog with parameters entered.](media/run-application-dialog-with-parameters-entered.png)

9. Search for the **Wait** action, drag it onto the designer, enter **10** (seconds) into the **Duration** field, and then select **Save**.

    ![Screenshot of the Power Automate Desktop designer window with a Wait action dialog open.](media/power-automate-desktop-designer-with-wait-action.png)

10. Now, open SAP GUI and sign in to your system of choice.

11. In Power Automate Desktop, search for the **populate** action in the **Actions** search box, and then drag the **Populate text field in window** action onto the canvas.

    ![Screenshot of adding the Populate text field in window action after the Wait action in the Power Automate Desktop designer window.](media/adding-populate-text-field.png)

12. Select **Add new UI element**.

    ![Screenshot of the Populate text field in window dialog with Add a new UI element button.](media/populate-text-field-add-new-UI-element.png)

13. The **Tracking session** dialog opens, which tracks the individual controls you select on a screen.

    ![Screenshot of the Tracking session dialog.](media/tracking-session-dialog.png)

14. Select the SAP main window to give it focus.

    ![Screenshot of the SAP Easy Access window.](media/SAP-easy-access-window-2.png)

15. Hover over the transaction code field. When a red frame surrounds **Gui Ok Code Field**, hold down **Ctrl** while you click. This adds the control to the UI elements list in the **Add UI elements** dialog in Power Automate Desktop.

    ![Screenshot of the SAP Easy Access window with transaction code field selected.](media/SAP-easy-access-window-with-transaction-code.png)

    ![Screenshot of the Tracking session dialog with the GUI O K Code Field o k c d added to it.](media/tracking-session-dialog-with-okcd.png)

16. In the SAP window, hover over the green check mark button, and then hold down **Ctrl** and click.

    ![Screenshot of the SAP Easy Access window with the check mark next to the transaction code field selected.](media/SAP-easy-access-with-transaction-code-checkmark.png)

17. Enter transaction code **PA30** into the list box, and then select the green check mark button.

    ![Screenshot of the SAP Easy Access window with PA30 entered into the transaction code field and the field selected.](media/SAP-easy-access-window-with-PA30.png)

18. We'll continue our field selection process on the next screen.

    ![Screenshot of the Maintain HR Master Data window of the SAP Easy Access application.](media/maintain-HR-master-data-window.png)

19. Select the following fields and button:

    ![Screenshot of the Maintain HR Master Data window of the SAP Easy Access application. The Personnel number field is selected.](media/maintain-HR-master-data-window-with-personnel-no.png)

    ![Screenshot of the Maintain HR Master Data window of the SAP Easy Access application. In the Period area of the screen the From field is selected.](media/maintain-HR-master-data-window-with-from-in-period-field.png)

    ![Screenshot of the Maintain HR Master Data window of the SAP Easy Access application In the Direct Selection area of the screen the Infotype field is selected.](media/maintain-HR-master-data-window-with-infotype-field-selected.png)

    ![Screenshot of the Maintain HR Master Data window of the SAP Easy Access application. In the Direct Selection area of the screen the STy field is selected.](media/maintain-HR-master-data-window-with-STy-field-selected.png)

    ![Screenshot of the Maintain HR Master Data window of the SAP Easy Access application The Document icon button is selected.](media/maintain-HR-master-data-window-with-document-icon-selected.png)

20. Verify that the dialog includes the following control names now. Select **Done** to close the dialog and to return to the design canvas.<!--note from editor: Is this alt text descriptive enough?-->

    ![Screenshot of the Tracking session dialog with the UI elements from the SAP Easy Access windows added to it.](media/tracking-session-with-UI-elements.png)

21. This is the dialog you should see after you've closed the previous dialog.

    ![Screenshot of the Populate text field in window dialog with GUI button selected.](media/populate-text-field-in-window.png)

22. Open the **Text box** dropdown menu, select **Gui Ok Field 'okcd**, and then select **Select**.

    ![Screenshot of the Populate text field in window dialog with the Text box dropdown menu open and the available UI elements showing.](media/populate-text-field-in-window-with-text-box-dropdown.png)

23. Enter the transaction code **PA30**, and then select **Save.**

    ![Screenshot of the Populate text field in window dialog with PA30 added in the Text to fill in box.](media/populate-text-field-in-window-with-PA30.png)

24. On the right pane, select the **UI elements** icon. Select each control in the list and rename it. 

      >[!TIP]
      >This step isn't required, but it's highly recommended because your control library might include dozens of controls, making it difficult to identify them by their system names.

    ![Screenshot of the UI elements pane in the Power Automate Desktop designer window with the Rename UI element menu item selected for GUI Main Window.](media/UI-elements-pane-in-PAD-designer-with-rename-UI-element.png)

25. Here's the renamed control list.

    ![Screenshot of all the UI elements renamed with meaningful names for Maintain HR Master Data in the UI elements pane.](media/UI-elements-with-meaningful-names.png)

26. Enter **press button** into the **Action** search box, and then drag the **Press button in window** action onto the canvas.

    ![Screenshot of the Power Automate Desktop designer window with Press button in Window being added from the Actions pane below wait 10 seconds.](media/PAD-designer-with-press-button-in-window.png)

27. Select **Continue**.

    ![Screenshot of the Power Automate Desktop designer window with Press button in Window dialog open and the UI elements dropdown menu open.](media/PAD-designer-with-press-button-in-window-and-UI-elements.png)

28. Select **Save**.

    ![Screenshot of Press button in Window dialog with Continue button selected and Save highlighted.](media/press-button-in-window-dialog.png)

29. Enter **wait for** into the **Actions** search box, and then drag the **Wait for window content** action onto the canvas.

    ![Screenshot of the Power Automate Desktop designer window with the Wait for window control action being added from the Actions page.](media/PAD-designer-with-wait-for-window-control-action.png)

30. Under **UI element** select **Employee id**, and then select **Select**.

    ![Screenshot of the Power Automate Desktop designer window with Wait for window content dialog open and the UI element drop down open.](media/PAD-designer-with-wait-for-window-and_UI-element_dropdown.png)

31. Select **Save**.

    ![Screenshot of Wait for window content dialog.](media/wait-for-window-content.png)

32. Enter **populate** into the **Actions** search box, and then drag the **Populate text field window** action onto the canvas.

    ![Screenshot of the Power Automate Desktop designer window with Populate text field in Window being added from the Actions pane after Wait for window content.](media/PAD-designer-with-populate-text-field-in-window.png)

33. Under **UI element** select **Employee id**, and then select **Select**.

    ![Screenshot of the Power Automate Desktop designer window with Populate text field in Window dialog open and the UI elements drop down open.](media/PAD-designer-with-populate-text-field-in-window-and-UI-elements-dropdown.png)

34. Select the ![The Variables icon button.](media/variables-icon-button.png) icon, which is in the **Text to fill-in** text box, and then select **EmployeeId**.

    ![Screenshot of the Power Automate Desktop designer window with Populate text field in Window dialog open and the variables list open.](media/PAD-designer-with-populate-text-field-in-window-and-variables-list.png)

35. Select **Save**.

    ![Screenshot the Populate text field in Window dialog.](media/populate-text-field-in-window-employeeid.png)

    <!--todo: I changed the repeat numbers from 36 to 35. confirm.-->

36. Repeat from step 33 through 35 for controls **Infotype**, **Info subtype**, and **Effective date**, and select the variables or provide a fixed value as shown in the following images.

    ![Screenshot of the Populate text field in Window dialog with Text box field set to Infotype and text to fill in set to 0006.](media/populate-text-field-in-window-with-infotype_0006.png)

    ![Screenshot of the Populate text field in Window dialog with Text box field set to Info subtype and text to fill in set to AddressType.](media/populate-text-field-in-window-with-info_addresstype.png)

    ![Screenshot of the Populate text field in Window dialog with Text box field set to Effective Date and text to fill in set to EffectiveDate.](media/populate-text-field-in-window-with-text_effectivedate.png)

37. Enter **press button** into the **Actions** search box, and then drag the **Press button in window** action onto the canvas.

    ![Screenshot of the Power Automate Desktop designer window with Press button in Window being added from the Actions pane after Effective Date.](media/PAD-designer-with-press-button-in-window-action.png)

38. Under **UI element**, select **New address**, and then select **Save**.

    ![Screenshot of the Press button in Window dialog with the UI element field set to New address button.](media/press-button-in-window-with-UI-element-new-address-button.png)

39. Select **Save**, and then select **OK**.

    ![Screenshot of the Power Automate Desktop designer with the Saved successfully message box open.](media/PAD-designer-with-saved-successfully-message.png)

40. Enter **wait for** into the **Actions** search box, and then drag the **Wait for window content** action onto the canvas.

    ![Screenshot of the Power Automate Desktop designer window with Wait for window content being added from the Actions pane after New address button.](media/PAD-designer-with-wait-for-window-content-action.png)

41. Select **UI element**, and then select the **Add new UI element** button to bring up the **Tracking session** dialog.

    ![Screenshot of Wait for window content dialog with the UI elements drop down open.](media/wait-for-window-content-with-UI-elements-dropdown.png)

42. The Tracking session dialog appears.

    ![Screenshot of the Tracking session dialog.](media/tracking-session-dialog.png)

    >[!IMPORTANT]
    >For the following steps, you'll need valid SAP reference test data as outlined in step 5 of the [SAP GUI scripting configuration](prerequisites.md#sap-gui-scripting-configuration) prerequisites.

43. Enter values for **Personnel number**, **Period From**, **Infotype** (always provide **0006**, because this is a standard type in SAP systems), **STy** (this is the Infotype subtype), and then select **Create** (**F5**).

    ![Screenshot of the HR Master Data window in SAP Easy Access.](media/HR-master-data-in-SAP-easy-access.png)

44. Hover over **Address line 1**. A red frame surrounds the field **Gui Ok Text Field**. Hold down **Ctrl**, and then click to add the control to the **UI elements** list, which shows up in the **Tracking session** dialog.

    ![Screenshot of the Create addresses window in SAP Easy Access with highlight on the Address Line 1 field in the Address area.](media/create-addresses-in-SAP-easy-access-with-address-line-1-field.png)

45. Repeat step 44 for these fields as well: **City/county**, **State**, **Zip code**, **Country key**, and the **Save (Ctrl+S)** button.

    ![Screenshot of the Create addresses window in SAP Easy Access with highlight on the City County field in the Address area.](media/create-addresses-in-SAP-easy-access-with-citycounty-field.png)

    ![Screenshot of the Create addresses window in SAP Easy Access with highlight on the State field in the Address area.](media/create-addresses-in-SAP-easy-access-with-state-field.png)

    ![Screenshot of the Create addresses window in SAP Easy Access with highlight on the Zip Code field in the Address area.](media/create-addresses-in-SAP-easy-access-with-zipcode-field.png)

    ![Screenshot of the Create addresses window in SAP Easy Access with highlight on the Country Key field in the Address area.](media/create-addresses-in-SAP-easy-access-with-country-key-field.png)

    ![Screenshot of the Create addresses window in SAP Easy Access with highlight on the Save button.](media/create-addresses-in-SAP-easy-access-with-save_button.png)

46. In the **Tracking session** dialog, select **Done**. 

    >[!IMPORTANT]
    >Be sure to leave the SAP form open.

    ![Screenshot showing the SAP Easy Access window with the Power Automate Desktop Tracking Session window.](media/SAP-easy-access-window-with-PAD-tracking-session.png)

47. Select **UI element** and then select **Gui Text Field 'P0006-STRAS"**, and then select **Save** to close the dialog.

    ![Screenshot of Wait for window content dialog open and the UI elements drop down open.](media/wait-for-window-content-with-UI-elements-dropdown-create-addresses.png)

48. On the right pane, select the **UI elements** icon. Select each of the newly added controls in the list, and then rename them. This isn't mandatory but highly recommended because your control library might include dozens of controls, making it difficult to identify them by their system names.

    ![Screenshot of all the UI elements in the UI elements pane.](media/ui-elements-pane.png)

    ![Screenshot of the UI elements pane in the Power Automate Desktop designer window with the Rename UI element menu item selected.](media/UI-elements-pane-with-rename-UI-element.png)

    ![Screenshot of all the UI elements renamed with meaningful names in the UI elements pane.](media/UI-elements-with-meaningful-names-create-addresses.png)

49. Enter **populate** in the **Actions** search box, and then drag the **Populate text field window** action onto the canvas.

    ![Screenshot of the Power Automate Desktop designer window with Populate text field in Window being added from the Actions pane.](media/PAD-designer-with-populate-text-field-in-window-being-added.png)

50. Select **UI element**, and then select **Street**.

    ![Screenshot of the Populate text field in window dialog with the Text box drop down open and the available UI elements displayed.](media/populate-text-field-in-window-with-text-box-dropdown-with-UI-elements.png)

51. On the **Text to fill-in** box, select the ***fx*** icon, and then double-click to select the **Street** variable.

    ![Screenshot of Populate text field in Window dialog and the variables list open then selecting the Street variable.](media/populate-text-field-in-window-with-variables-list-with-street.png)

52. Select **Save**.

    ![Screenshot of Populate text field in Window dialog with Street variable in Text to fill in field.](media/populate-text-field-in-window-with-street-in-text-to-fill-in.png)

53. Repeat steps 50 and 52 with these controls: **City**, **State**, and **ZipCode**.

    ![Screenshot of Populate text field in Window dialog with City in the Text box field and the City variable in Text to fill in field.](media/populate-text-field-in-window-with-city-in-text-to-fill-in.png)

    ![Screenshot of Populate text field in Window dialog with State in the Text box field and the State variable in Text to fill in field.](media/populate-text-field-in-window-with-state-in-text-to-fill-in.png)

    ![Screenshot of Populate text field in Window dialog with ZipCode in the Text box field and the ZipCode variable in Text to fill in field.](media/populate-text-field-in-window-with-zipcode-in-text-to-fill-in.png)

    >[!NOTE]
    >SAP GUI combo boxes need special handling, which requires us to use a combination of actions to select the correct list items within combo boxes.

54. Enter **click UI** into the **Actions** search box, and then drag the **Click UI element in window** action onto the canvas.

    ![Screenshot of the Power Automate Desktop designer window with Click UI element in Window being added from the Actions pane.](media/PAD-designer-with-click-UI-element-in-window.png)

55. Select **UI element**, and then **Country**.

    ![Screenshot of the Power Automate Desktop designer window with Click UI element in Window dialog open and the variables list open.](media/PAD-designer-with-click-UI-element-in-window-and-variables.png)

56. Keep the default value for **Click type**.

    ![Screenshot of the Power Automate Desktop designer window with click UI element in window and left click type.](media/PAD-designer-with-click-UI-element-in-window-and-left-click-type.png)

57. Enter **send keys** into the **Actions** search box, and then drag the **Click UI element in window** action onto the canvas.

    ![Screenshot of the Power Automate Desktop designer window with Send keys being added added after Country.](media/PAD-designer-with-send-keys-action.png)

58. In the **Text to send** field, select the ***fx*** icon, and then double-click to select **CountryCode**.

    ![Screenshot of the Power Automate Desktop designer window with Send keys dialog open and the variables list open.](media/PAD-designer-with-send-keys-action-and-variables.png)

59. Amend the **%CountryCode%** text by typing **{Enter}** right after the variable name. The **{Enter}** reference mimics an **Enter** keystroke on your keyboard.

    ![Screenshot of Send Keys dialog with CountryCode Enter in the Text to send field.](media/send-keys-with-countrycode-enter.png)

60. Drag another **Send keys** action onto the end of the flow.

    ![Screenshot of the Power Automate Desktop designer window with Send keys being added.](media/PAD-designer-with-second-send-keys-action.png)

61. Enter **{Enter}** into the **Text to send** field, and then select **Save**.

    ![Screenshot of Send keys dialog with Enter in the Text to send field.](media/send-keys-with-enter-in-text-to-send.png)

62. Enter **press button** into the **Actions** search box, and then drag the **Press button in window** action onto the canvas.

    ![Screenshot of the Power Automate Desktop designer window with Press button in Window being added from the Actions pane.](media/PAD-designer-with-another-press-button-in-window-action.png)

63. Under **UI element**, select **Save**.

    ![Screenshot of the Power Automate Desktop designer window with Press button in Window dialog open and the variables list open and Save button selected.](media/PAD-designer-with-press-button-in-window-action-with-variables.png)

64. Select **Save**.

    ![Screenshot of Press button in window dialog.](media/press-button-in-window-dialog-create-addresses-save-button.png)

    >[!IMPORTANT]
    >Confirm that the save operation is complete for the SAP record before you interact with other controls or windows.To make sure the operation is complete, add a **Wait** action to wait for a control to become visible.

65. Enter **wait** into the **Actions** search box, and then drag the **Wait for window content** action onto the canvas.

    ![Screenshot of the Power Automate Desktop designer window with Wait for window content being added from the Actions pane.](media/PAD-designer-with-another-wait-for-window-content-action.png)

66. Under **UI element**, select **Employee id**, and then select **Select**.

    ![Screenshot of the Power Automate Desktop designer window with Wait for window content dialog open and the variables list open.](media/PAD-designer-with-wait-for-window-content-and-variables.png)

67. Select **Save**.

    ![Screenshot of Wait for window content dialog.](media/wait-for-window-content.png)

68. Enter **press button** into the **Actions** search box, and then drag the **Press button in window** action onto the canvas.

    ![Screenshot of the Power Automate Desktop designer window with Press button in Window being added from the Actions pane after Employee ID.](media/PAD-designer-with-a-third-press-button-in-window-action.png)

69. Under **UI element**, select **Add new UI element**.

    ![Screenshot of the Power Automate Desktop designer window with Press button in Window dialog open and the variables list open.](media/press-button-in-window-action-and-variables.png)

70. Hover over the **Back (F3)** button. 

    ![Screenshot of Back button in Create Addresses window in SAP Easy Access.](media/back-button-in-create-addresses-in-SAP-easy-access.png)

<!--Todo: isn't not clear which control we are adding here-->

71. Hold down **Ctrl** while clicking to add the control to the UI elements list in the **Tracking session** dialog. (**Note:** we kept this form open in step 46.)

    ![Screenshot of the Create Addresses window in SAP Easy Access with the Back button highlighted.](media/create-addresses-in-SAP-easy-access-with-back-button.png)

72. Now, select the **Back** button (without the **Ctrl** key) to go back to the previous screen. 

    If you see a "Data will be lost" message, confirm by selecting **Yes**.

    ![Screenshot of Data will be lost message box in Create Addresses window in SAP Easy Access.](media/data-will-be-lost-message-box.png)

73. You should be on the following screen now. In the **Tracking session** dialog, select **Done**.

    ![Screenshot of Maintain HR Master Data window in SAP Easy Access alongside the Tracking session window from Power Automate Desktop.](media/maintain-HR-master-data-window-with-tracking-session-window.png)

74. Select **Save**.

    ![Screenshot of Press button in Window dialog.](media/press-button-in-window-dialog-HR-master-data.png)

75. Rename the button we've just added to the control library to **Back button**.

    ![Screenshot of renaming the new button UI elements in the UI elements pane.](media/renaming-new-button-UI-elements.png)

    ![Screenshot of UI elements pane with UI elements renamed.](media/UI-elements-pane-with-UI-elements-renamed.png)

76. Enter **close window** into the **Actions** search box, and then drag the **Close window** action onto the canvas.

    ![Screenshot of the Power Automate Desktop designer window with Close Window being added from the Actions pane.](media/PAD-designer-with-close-window-action.png)

77. Under **UI element**, select **Window "SAP Easy Access"**, and then select **Save**.

    ![Screenshot of the Power Automate Desktop designer window with Close Window dialog open and the variables list open and Windows SAP Easy Access selected.](media/PAD-designer-with-close-window-and-variables.png)

78. Enter **close window** into the **Actions** search box, and then drag the **Close window** action onto the canvas.

    ![Screenshot of the Power Automate Desktop designer window with Close window being added from the Actions pane.](media/PAD-designer-with-close-window-SAP-easy-access.png)

79. Under **Window**, select **Add a new UI element**.

    ![Screenshot of the Power Automate Desktop designer window with Close Window dialog open and the variables list open.](media/close-window-with-add-new-ui-element.png)

80. Hover over the outer window frame of the **SAP Logon 760** window. Hold down **Ctrl** and click to add the window element to the UI elements list, which appears in the **Tracking session** dialog.

    ![Screenshot of the SAP Logon 760 screen with a surrounding red bordered box and a Power Automate Desktop tracking session window.](media/SAP-logon-760-screen.png)

81. Under **UI element**, select **Window "SAP Logon 760"** (the number 760 reflects the SAP GUI version, so this might differ in your environment), and then select **Save**.

    ![Screenshot of the Power Automate Desktop designer window with Close Window dialog open and the variables list open and Window SAP Login 760 selected.](media/close-window-SAP-logon-760.png)

82. Select **Save**.

    ![Screenshot of Close Window dialog.](media/close-window-SAP-logon-760-save.png)

83. Select **Save** to save the flow.

    ![Screenshot of the Power Automate Desktop designer window with Save dialog open.](media/PAD-designer-save-flow.png)

> [!div class="nextstepaction"]
> [Next step: Create a subflow for SAP GUI automation](flow-refactoring.md)
