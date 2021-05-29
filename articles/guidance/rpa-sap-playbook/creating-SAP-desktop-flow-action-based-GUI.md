---
title: Creating an SAP Desktop flow with Power Automate Desktop | Microsoft Docs
description: A step-by-step tutorial for creating a desktop flow to automate the SAP GUI.
suite: flow
documentationcenter: na
author: kathyos
manager: kvivek
editor: ''
ms.custom: guidance
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/01/2021
ms.author: kathyos
ms.reviewer: deonhe
---

# Creating an SAP Desktop flow with Power Automate Desktop

![Screenshot of Power Automate Desktop designer window with a UI flow with two steps run application and wait ](media/PAD-designer-window-with-UI-flow.png)

1. To create a flow in Power Automate Desktop, launch the application and select **+** **New Flow**.

2. Enter a name for the Flow and click **Create**.

![Screenshot of Power Automate Desktop dialog box for naming a new flow ](media/naming-new-flow.png)

3. Select **Power Automate Desktop** Designer Window and select **Variables**.

![Screenshot of Power Automate Desktop variables icon on the right of the screen ](media/power-automate-desktop-variables-icon.png)

4. Select **plus sign** and select **Input** to create several Input variables which will be passed into this flow from a Power Automate Desktop flow.

![Screenshot of the create variable UI in Power Automate Desktop ](media/create-variable-UI.png)

5. First, we'll create a few **technical SAP variables** which will be needed in almost all SAP based automation flows. For each variable below, enter the **Variable name**, **External** **name** and **Description** and select **Update.**

   - SAPPassword

   - SAPUser

   - SAPClient

   - SAPSystemId

![Screenshot of Add a new variable dialog box ](media/add-new-variable.png)

6. Next, we'll create our use-case-specific variables, namely:

   - EmployeeId

   - AddressType

   - EffectiveDate

   - Street

   - City

   - State

   - ZipCode

   - CountryCode

![Screenshot of the variables windows with the created variable names ](media/variables-window-with-created-variable-names.png)

7. Next, we'll create our first process action by searching for **Run application** in the **Actions** pane and dragging it onto the design canvas.

![Screenshot of a Run Application action dialog that has been added to the authoring canvas ](media/run-application-action.png)

8. Enter the following information in the parameter list and select **Save**:

   - **Application Path:** C:\\Program Files (x86)\\SAP\\FrontEnd\\SapGui\\sapshcut.exe

   - Command line arguments: start -system=%SAPSystemId% -client=%SAPClient% -user=%SAPUser% -pw=%SAPPassword% -maxgui

   - Window style: Maximized

   - **After application launch:** Wait for application to complete

![Screenshot of Run Application dialog box with parameters entered ](media/run-application-dialog-with-parameters-entered.png)

9. Now search for the action **Wait**, drag it onto the design canvas, enter **10** seconds wait time to the **Duration** field and select **Save**.

![Screenshot of Power Automate Desktop Designer window with a Wait action dialog box open ](media/power-automate-desktop-designer-with-wait-action.png)

10. Now, open SAP GUI and sign in to your system of choice.

11. In Power Automate Desktop, type **populate** in the **Actions** search bar to filter to actions that contain this word, and drag the **Populate text field in window** action onto the canvas.

![Screenshot of adding the Populate text field in window action after the Wait action in the Power Automate Desktop designer window ](media/adding-populate-text-field.png)

12. Select **Add new UI element**.

![Screenshot of the Populate text field in window dialog box with Add a new UI element button ](media/populate-text-field-add-new-UI-element.png)

13. The **Tracking session** dialog box opens, which tracks the individual controls you select on a screen.

![Screenshot of the Tracking session dialog box ](media/tracking-session-dialog.png)

14. Select SAP's main window to give it focus.

![Screenshot of the SAP Easy Access window ](media/SAP-easy-access-window-2.png)

15. Hover over the transaction code field. When a red frame appears surrounding the **Gui Ok Code Field** transaction code field, hold down **Ctrl** while clicking. This adds the control to the UI elements list in the **Add UI elements** dialog box in Power Automate Desktop.

![Screenshot of the SAP Easy Access window with transaction code field selected ](media/SAP-easy-access-window-with-transaction-code.png)

![Screenshot of the Tracking session dialog box with the GUI O K Code Field o k c d added to it ](media/tracking-session-dialog-with-okcd.png)

16. In the SAP window, hover over the **green checkmark** button and hold down **Ctrl** while **clicking**.

![Screenshot of the SAP Easy Access window with the checkmark next to the transaction code field selected ](media/SAP-easy-access-with-transaction-code-checkmark.png)

17. Enter transaction code **PA30** into the list box and select the **green checkmark** button.

![Screenshot of the SAP Easy Access window with PA30 entered into the transaction code field and the field selected ](media/SAP-easy-access-window-with-PA30.png)

18. We will continue our field selection process on the next screen.

![Screenshot of the Maintain HR Master Data window of the SAP Easy Access application ](media/maintain-HR-master-data-window.png)

19. Select the following fields and button:

![Screenshot of the Maintain HR Master Data window of the SAP Easy Access application. The Personnel number field is selected ](media/maintain-HR-master-data-window-with-personnel-no.png)

![Screenshot of the Maintain HR Master Data window of the SAP Easy Access application. In the Period area of the screen the From field is selected ](media/maintain-HR-master-data-window-with-from-in-period-field.png)

![Screenshot of the Maintain HR Master Data window of the SAP Easy Access application In the Direct Selection area of the screen the Infotype field is selected ](media/maintain-HR-master-data-window-with-infotype-field-selected.png)

![Screenshot of the Maintain HR Master Data window of the SAP Easy Access application. In the Direct Selection area of the screen the STy field is selected ](media/maintain-HR-master-data-window-with-STy-field-selected.png)

![Screenshot of the Maintain HR Master Data window of the SAP Easy Access application The Document icon button is selected ](media/maintain-HR-master-data-window-with-document-icon-selected.png)

20. The dialog box should include the following control names now. Select **Done** to close the dialog and to return to the design canvas.

![Screenshot of the Tracking session dialog box with the UI elements from the SAP Easy Access windows added to it ](media/tracking-session-with-UI-elements.png)

21. This is the dialog you should see once you've closed the previous dialog.

![Screenshot of the Populate text field in window dialog box ](media/populate-text-field-in-window.png)

22. Open the **Text box** dropdown, select "**Gui Ok Field 'okcd**" and click **Select**.

![Screenshot of the Populate text field in window dialog box with the Text box drop down open and the available UI elements showing ](media/populate-text-field-in-window-with-text-box-dropdown.png)

23. Enter the transaction code **PA30** and select **Save.**

![Screenshot of the Populate text field in window dialog box with PA30 added in the Text to fill in box ](media/populate-text-field-in-window-with-PA30.png)

24. On the right pane, select the **UI elements** icon. Select each individual control in the list and rename it. This is not mandatory, but highly recommended since your control library might include tens of control making it difficult to identify them by their system names.

![Screenshot of the UI elements pane in the Power Automate Desktop Designer window with the Rename UI element menu item selected ](media/UI-elements-pane-in-PAD-designer-with-rename-UI-element.png)

25. Here is the renamed control list.

![Screenshot of all the UI elements renamed with meaningful names in the UI elements pane ](media/UI-elements-with-meaningful-names.png)

26. Enter **press button** into the Action search box and drag the **Press button in window** action onto the canvas.

![Screenshot of Power Automate Desktop Designer window with Press button in Window being added from the Actions pane ](media/PAD-designer-with-press-button-in-window.png)

27. Select the **Continue button** control.

![Screenshot of Power Automate Desktop Designer window with Press button in Window dialog box open and the UI elements drop down open ](media/PAD-designer-with-press-button-in-window-and-UI-elements.png)

28. Select **Save**.

![Screenshot of Press button in Window dialog box ](media/press-button-in-window-dialog.png)

29. Enter **wait for** into the Action search box and drag the **Wait for window content** action onto the canvas.

![Screenshot of Power Automate Desktop Designer window with the Wait for window control action being added from the Actions page ](media/PAD-designer-with-wait-for-window-control-action.png)

30. Under **UI element** select the **Employee id** control and click **Select.**

![Screenshot of Power Automate Desktop Designer window with Wait for window content dialog box open and the UI element drop down open ](media/PAD-designer-with-wait-for-window-and_UI-element_dropdown.png)

31. Select **Save**.

![Screenshot of Wait for window content dialog box ](media/wait-for-window-content.png)

32. Enter **populate** into the Action search box and drag the **Populate text field window** action onto the canvas.

![Screenshot of Power Automate Desktop Designer window with Populate text field in Window being added from the Actions pane ](media/PAD-designer-with-populate-text-field-in-window.png)

33. Under **UI element** select the **Employee id** control and press **Select.**

![Screenshot of Power Automate Desktop Designer window with Populate text field in Window dialog box open and the UI elements drop down open ](media/PAD-designer-with-populate-text-field-in-window-and-UI-elements-dropdown.png)

34. Select the ![The Variables icon button ](media/variables-icon-button.png) icon which is in the **Text to fill-in** text box and chose **EmployeeId.**

![Screenshot of Power Automate Desktop Designer window with Populate text field in Window dialog box open and the variables list open ](media/PAD-designer-with-populate-text-field-in-window-and-variables-list.png)

35. Select **Save**.

![Screenshot the Populate text field in Window dialog box ](media/populate-text-field-in-window-employeeid.png)

36. Repeat step 33-36 for controls: **Infotype, Info subtype and Effective date** and select the variables or provide a fixed value as shown in the following pictures.

![Screenshot of the Populate text field in Window dialog box with Text box field set to Infotype and text to fill in set to 0006 ](media/populate-text-field-in-window-with-infotype_0006.png)

![Screenshot of the Populate text field in Window dialog box with Text box field set to Info subtype and text to fill in set to AddressType ](media/populate-text-field-in-window-with-info_addresstype.png)

![Screenshot of the Populate text field in Window dialog box with Text box field set to Effective Date and text to fill in set to EffectiveDate ](media/populate-text-field-in-window-with-text_effectivedate.png)

37. Enter **press button** into the Action search box and drag the **Press button in window** action onto the canvas.

![Screenshot of Power Automate Desktop Designer window with Press button in Window being added from the Actions pane ](media/PAD-designer-with-press-button-in-window-action.png)

38. Under UI element select the **New address** button control and select **Save**.

![Screenshot of the Press button in Window dialog box with the UI element field set to New address button ](media/press-button-in-window-with-UI-element-new-address-button.png)

39. Select **Save** and then **OK**.

![Screenshot of the Power Automate Desktop designer with the Saved successfully message box open ](media/PAD-designer-with-saved-successfully-message.png)

40. Enter **wait for** into the Action search box and drag the **Wait for window content** action onto the canvas.

![Screenshot of Power Automate Desktop Designer window with Wait for window content being added from the Actions pane ](media/PAD-designer-with-wait-for-window-content-action.png)

41. Select **UI element** and then the **Add new UI element** button to bring up the **Tracking session** dialog.

![Screenshot of Wait for window content dialog box with the UI elements drop down open ](media/wait-for-window-content-with-UI-elements-dropdown.png)

42. The Tracking session dialog box appears.

![Screenshot of the Tracking session dialog box ](media/tracking-session-dialog.png)

**Note:** For the following steps, you'll need valid SAP reference test data as outlined in point 5 of the [SAP GUI scripting configuration](#sap-gui-scripting-configurations) pre-requisites.

43. Enter values for **Personnel no**, **Period From**, **Infotype** (always provide 0006 as this is a standard type in SAP systems), **STy** (this is the Infotype subtype) and select **Create (F5)**.

![Screenshot of the HR Master Data window in SAP Easy Access ](media/HR-master-data-in-SAP-easy-access.png)

44. Move your mouse over the **Address line 1** field. You should see a red frame surrounding the field "Gui Ok Text Field". Hold down **Ctrl** while **clicking** to add the control to the UI elements list which will show up in the Tracking session dialog box.

![Screenshot of the Create addresses window in SAP Easy Access with highlight on the Address Line 1 field in the Address area ](media/create-addresses-in-SAP-easy-access-with-address-line-1-field.png)

45. Repeat step 44 for these fields as well: **City/county, State, Zip code, Country key** and the **Save (Ctrl+S)** button.

![Screenshot of the Create addresses window in SAP Easy Access with highlight on the City County field in the Address area ](media/create-addresses-in-SAP-easy-access-with-citycounty-field.png)

![Screenshot of the Create addresses window in SAP Easy Access with highlight on the State field in the Address area ](media/create-addresses-in-SAP-easy-access-with-state-field.png)

![Screenshot of the Create addresses window in SAP Easy Access with highlight on the Zip Code field in the Address area ](media/create-addresses-in-SAP-easy-access-with-zipcode-field.png)

![Screenshot of the Create addresses window in SAP Easy Access with highlight on the Country Key field in the Address area ](media/create-addresses-in-SAP-easy-access-with-country-key-field.png)

![Screenshot of the Create addresses window in SAP Easy Access with highlight on the Save button ](media/create-addresses-in-SAP-easy-access-with-save_button.png)

46. In the **Tracking session** dialog box, select **Done**. Be sure to leave the SAP form open.

![Screenshot showing the SAP Easy Access window with the Power Automate Desktop Tracking Session window ](media/SAP-easy-access-window-with-PAD-tracking-session.png)

47. Select **UI element** and then the "**Gui Text Field 'P0006-STRAS"** and then **Save** to close the dialog.

![Screenshot of Wait for window content dialog box open and the UI elements drop down open ](media/wait-for-window-content-with-UI-elements-dropdown-create-addresses.png)

48. On the right pane, select the **UI elements** icon. Select each of the newly added controls in the list and rename them. This is not mandatory, but highly recommended since your control library might include tens of control making it difficult to identify them by their system names.

![Screenshot of all the UI elements in the UI elements pane ](media/ui-elements-pane.png)

![Screenshot of the UI elements pane in the Power Automate Desktop Designer window with the Rename UI element menu item selected ](media/UI-elements-pane-with-rename-UI-element.png)

![Screenshot of all the UI elements renamed with meaningful names in the UI elements pane ](media/UI-elements-with-meaningful-names-create-addresses.png)

49. Enter **populate** in the Action search box and drag the **Populate text field window** action onto the canvas.

![Screenshot of Power Automate Desktop Designer window with Populate text field in Window being added from the Actions pane ](media/PAD-designer-with-populate-text-field-in-window-being-added.png)

50. Select **UI element** and then the **Street**.

![Screenshot of the Populate text field in window dialog box with the Text box drop down open and the available UI elements showing ](media/populate-text-field-in-window-with-text-box-dropdown-with-UI-elements.png)

51. On the **Text to fill-in** box select the ***fx*** icon and then double-click on the **Street** variable.

![Screenshot of Populate text field in Window dialog box and the variables list open then selecting the Street variable ](media/populate-text-field-in-window-with-variables-list-with-street.png)

52. Select **Save**.

![Screenshot of Populate text field in Window dialog box with Street variable in Text to fill in field ](media/populate-text-field-in-window-with-street-in-text-to-fill-in.png)

53. Repeat steps 50-52 with these controls / fields: **City, State** and **ZipCode**.

![Screenshot of Populate text field in Window dialog box with City in the Text box field and the City variable in Text to fill in field ](media/populate-text-field-in-window-with-city-in-text-to-fill-in.png)

![Screenshot of Populate text field in Window dialog box with State in the Text box field and the State variable in Text to fill in field ](media/populate-text-field-in-window-with-state-in-text-to-fill-in.png)

![Screenshot of Populate text field in Window dialog box with ZipCode in the Text box field and the ZipCode variable in Text to fill in field ](media/populate-text-field-in-window-with-zipcode-in-text-to-fill-in.png)

**Note:** SAP GUI combo boxes need special handling, which requires us to use a combination of actions to select the correct list items within combo boxes

54. Enter **click UI** into the Action search box and drag the **Click UI element in window** action onto the canvas.

![Screenshot of Power Automate Desktop Designer window with Click UI element in Window being added from the Actions pane ](media/PAD-designer-with-click-UI-element-in-window.png)

55. Select **UI element** and then the **Country**.

![Screenshot of Power Automate Desktop Designer window with Click UI element in Window dialog box open and the variables list open ](media/PAD-designer-with-click-UI-element-in-window-and-variables.png)

56. Keep the default value for **Click type**.

![Screenshot of Power Automate Desktop Designer window with click UI element in window and left click type ](media/PAD-designer-with-click-UI-element-in-window-and-left-click-type.png)

57. Enter **send keys** into the Action search box and drag the **Click UI element in window** action onto the canvas.

![Screenshot of Power Automate Desktop Designer window with Send keys being added from the Actions pane ](media/PAD-designer-with-send-keys-action.png)

58. In the **Text to send** field select the ***fx*** icon and then double-click **CountryCode.**

![Screenshot of Power Automate Desktop Designer window with Send keys dialog box open and the variables list open ](media/PAD-designer-with-send-keys-action-and-variables.png)

59. Amend the **%CountryCode%** text by typing **{Enter}** right after the variable name. The **{Enter}** reference mimics an **Enter** keystroke on your keyboard.

![Screenshot of Send Keys dialog box with CountryCode Enter in the Text to send field ](media/send-keys-with-countrycode-enter.png)

60. Drag another **Send keys** action onto the end of the flow.

![Screenshot of Power Automate Desktop Designer window with Send keys being added from the Actions pane ](media/PAD-designer-with-second-send-keys-action.png)

61. Enter **{Enter}** into the **Text to send** field and select **Save**.

![Screenshot of Send keys dialog box with Enter in the Text to send field ](media/send-keys-with-enter-in-text-to-send.png)

62. Enter **press button** into the Action search box and drag the **Press button in window** action onto the canvas.

![Screenshot of Power Automate Desktop Designer window with Press button in Window being added from the Actions pane ](media/PAD-designer-with-another-press-button-in-window-action.png)

63. Under UI element select **Save button**.

![Screenshot of Power Automate Desktop Designer window with Press button in Window dialog box open and the variables list open ](media/PAD-designer-with-press-button-in-window-action-with-variables.png)

64. Select **Save**.

![Screenshot of Press button in window dialog box ](media/press-button-in-window-dialog-create-addresses-save-button.png)

**Note:** We need to make sure that the save operation has finished for our SAP record before we interact with additional controls. To make sure this is the case, we'll add a wait action to wait for a control to become visible.

65. Enter **wait** into the Action search box and drag the **Wait for window content** action onto the canvas.

![Screenshot of Power Automate Desktop Designer window with Wait for window content being added from the Actions pane ](media/PAD-designer-with-another-wait-for-window-content-action.png)

66. Under UI element select **Employee id** and click **Select**.

![Screenshot of Power Automate Desktop Designer window with Wait for window content dialog box open and the variables list open ](media/PAD-designer-with-wait-for-window-content-and-variables.png)

67. Select **Save**.

![Screenshot of Wait for window content dialog box ](media/wait-for-window-content.png)

68. Enter **press button** into the Action search box and drag the **Press button in window** action onto the canvas.

![Screenshot of Power Automate Desktop Designer window with Press button in Window being added from the Actions pane ](media/PAD-designer-with-a-third-press-button-in-window-action.png)

69. Under **UI element**, select **Add new UI element** button.

![Screenshot of Power Automate Desktop Designer window with Press button in Window dialog box open and the variables list open ](media/press-button-in-window-action-and-variables.png)

70. Hover over the **Back (F3)** button. ![Screenshot of Back button in Create Addresses window in SAP Easy Access ](media/back-button-in-create-addresses-in-SAP-easy-access.png)

71. Hold down **Ctrl** while **clicking** to add the control to the UI elements list in the **Tracking session** dialog box. (**Note:** we kept this form open in step 46.)

![Screenshot of the Create Addresses window in SAP Easy Access with the Back button highlighted ](media/create-addresses-in-SAP-easy-access-with-back-button.png)

72. Now **click** the **Back** button (without Ctrl key) to go back to the previous screen. If you see a "Data will be lost" dialog, confirm with **Yes**.

![Screenshot of Data will be lost message box in Create Addresses window in SAP Easy Access ](media/data-will-be-lost-message-box.png)

73. You should be on this screen now. In the Tracking session dialog box, select **Done**.

![Screenshot of Maintain HR Master Data window in SAP Easy Access alongside the Tracking session window from Power Automate Desktop ](media/maintain-HR-master-data-window-with-tracking-session-window.png)

74. Select **Save**.

![Screenshot of Press button in Window dialog box ](media/press-button-in-window-dialog-HR-master-data.png)

75. Rename the button we've just added to the control library to **Back button**.

![Screenshot of renaming the new button UI elements in the UI elements pane ](media/renaming-new-button-UI-elements.png)

![Screenshot of UI elements pane with UI elements renamed ](media/UI-elements-pane-with-UI-elements-renamed.png)

76. Enter **close window** into the Action search box and drag the **Close window** action onto the canvas.

![Screenshot of Power Automate Desktop Designer window with Close Window being added from the Actions pane ](media/PAD-designer-with-close-window-action.png)

77. Under **UI element** select **Window "SAP Easy Access"** and then **Save**.

![Screenshot of Power Automate Desktop Designer window with Close Window dialog box open and the variables list open ](media/PAD-designer-with-close-window-and-variables.png)

78. Enter **close window** into the Action search box and drag the **Close window** action onto the canvas.

![Screenshot of Power Automate Desktop Designer window with Close window being added from the Actions pane ](media/PAD-designer-with-close-window-SAP-easy-access.png)

79. Under **Window** select the **Add new UI** **element** button.

![Screenshot of Power Automate Desktop Designer window with Close Window dialog box open and the variables list open ](media/close-window-with-add-new-ui-element.png)

80. Hover over the outer window frame of the **SAP Logon 760** window. Hold down **Ctrl** while clicking to add the window element to the UI elements list, which appears in the **Tracking session** dialog box.

![Screenshot of the SAP Logon 760 screen with a surrounding red bordered box and a Power Automate Desktop tracking session window ](media/SAP-logon-760-screen.png)

81. Under **UI element** select **Window "SAP Logon 760"** (the number 760 reflect the SAP GUI version, so this might differ in your environment) and then **Save.**

![Screenshot of Power Automate Desktop Designer window with Close Window dialog box open and the variables list open ](media/close-window-SAP-logon-760.png)

82. Select **Save**.

![Screenshot of Close Window dialog box ](media/close-window-SAP-logon-760-save.png)

83. Select **Save** to save the flow.

![Screenshot of Power Automate Desktop Designer window with Save dialog box open ](media/PAD-designer-save-flow.png)
