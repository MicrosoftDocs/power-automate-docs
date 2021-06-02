---
title: SAP GUI automation using built-in desktop recorder in Power Automate Desktop | Microsoft Docs
description: In this step of the RPA Playbook for SAP GUI Automation with Power Automate tutorial, the Desktop recorder translates each mouse click and key stroke into Power Automate Desktop actions and adds them to your Desktop flow. 
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

# Action-based SAP GUI automation – using the built-in desktop recorder 

With the [Power Automate Desktop October update](https://flow.microsoft.com/blog/power-automate-desktop-october-2020-update/) we introduced support for SAP GUI-based desktop recording in Power Automate Desktop. Now, in addition to manual action design, you can use Power Automate Desktop's built-in [Desktop recorder](../ui-flows/desktop/recording-flow) to record SAP GUI interactions. The Desktop recorder translates each mouse click and key stroke into Power Automate Desktop actions and adds them to your Desktop flow.

If you want to see the new desktop recording experience in action, please follow these steps to re-configure the action-based automation you built in steps 6.1-6.3.

1.  Select the **ProcessHRMasterForm** subflow tab and then select **Desktop recorder**.![Screenshot of Power Automate Desktop showing the Desktop recorder button ](media/desktop-recorder-button.png)

2.  Open SAP, bring the SAP Easy Access window to the foreground, and then in the Desktop recorder window, select **Start recording**. ![Screenshot of SAP GUI with Desktop recorder tracking window and instruction to start recording ](media/desktop-recorder-tracking-window-start-recording.png)

3.  Type **PA30** in the Transaction field, then press the **Enter** key.

![Screenshot of SAP GUI with Desktop recorder tracking window and SAP transaction code being marked for recording ](media/desktop-recorder-tracking-with-SAP-transaction-code.png)

4.  Enter a **Personnel no** and press **Enter**.

![Screenshot of SAP GUI with Desktop recorder tracking window and SAP Personnel no  field being marked for recording ](media/desktop-recorder-tracking-with-SAP-personnel-no.png)

5.  Select **Addresses** as the **Infotype Text** and enter a value in **STy** (such as "2" or any other value suitable for your use case).

![Screenshot of SAP GUI with Desktop recorder tracking window and SAP Infotype text field being selected and STy field marked for recording ](media/desktop-recorder-tracking-with-SAP-infotype.png)

6.  Enter a date in the **From** field and click the **New** icon.

![Screenshot of SAP GUI with Desktop recorder tracking window and SAP period from field being specified and marked for recording ](media/desktop-recorder-tracking-with-SAP-period-from.png)

7.  Enter a street with house number in **Address line 1**.

![Screenshot of SAP GUI with Desktop recorder tracking window and SAP address line 1 field being specified and marked for recording ](media/desktop-recorder-tracking-with-SAP-address-line.png)

8.  Enter values for **City, State/zip code** and **Country key** and select **Save.**

![Screenshot of SAP GUI with Desktop recorder tracking window and SAP address relevant fields being listed on the screen and the save button is also marked as recording step ](media/desktop-recorder-tracking-with-SAP-address-fields-and-save-button.png)

9.  Select the **Back (F3)** icon.

![Screenshot of SAP GUI with Desktop recorder tracking window and SAP back button ](media/desktop-recorder-tracking-with-SAP-back-button.png)

10. This completes the address creation process, so select **Finish** in the Desktop recorder window.

![Screenshot of SAP GUI with Desktop recorder tracking window ](media/SAP-gui-with-desktop-recorder-tracking.png)

11. Your Desktop flow script should look like this.

![Screenshot of Power Automate Desktop showing the recorded actions on its canvas ](media/PAD-showing-recorded-actions.png)

12. During recording you might have accidently clicked on different Windows and UI elements; so if necessary, do some cleanup to remove duplicate or unnecessary action steps.

![Screenshot of Power Automate Desktop showing duplicate or accidentally captured actions to be removed ](media/PAD-showing-actions-to-be-removed.png)

![Screenshot of Power Automate Desktop showing duplicate or accidentally captured actions to be removed  continued  ](media/PAD-showing-more-actions-to-be-removed.png)

13. Highlight all actions that were manually defined in section 6, then right-click and select **Delete selection** to remove them from the subflow.

![Screenshot of Power Automate Desktop showing previously added actions which should be deleted ](media/PAD-with-actions-to-be-deleted.png)

14. Edit the **Populate text field in window** action for **Employee Id** and replace the **Text to fill-in** value with our previously defined **EmployeeId** variable.

![Screenshot of Power Automate Desktop showing a Populate text field action dialog where hard coded employee id can be replaced with previously defined variable ](media/PAD-with-populate-text-with-hard-coded-employee-id.png)

![Screenshot of Power Automate Desktop showing a Populate text field action dialog listing previously defined EmployeeId variable ](media/PAD-with-populate-text-with-employee-id-variable.png)

15. Edit the **Populate text field in window** action for **Info subtype** and replace the **Text to fill-in** value with our previously defined **AddressType** variable.

![Screenshot of Power Automate Desktop showing a Populate text field action dialog where hard coded info subtype can be replaced with previously defined variable ](media/PAD-with-populate-text-with-info-subtype.png)

![Screenshot of Power Automate Desktop showing a Populate text field action dialog listing previously defined AddressType variable ](media/PAD-with-populate-text-with-addresstype-variable.png)

16. Edit and replace the hard-coded text with variables in the **Populate text field in window** actions for **Effective Date, Street, City, State, ZipCode, Country** as well.

![Screenshot of Power Automate Desktop showing the action results after renaming fields Effective Date  Street  City  State  ZipCode  and Country ](media/PAD-after-renaming-fields.png)

17. Highlight the actions that will be needed for the employee address creation subflow, right-click and select **Cut**.

![Screenshot of Power Automate Desktop showing address creation relevant actions have been highlighted and cut out ](media/PAD-with-address-actions-highlighted.png)

18. Open the **ProcessEmployeeAddressForm** subflow, select all actions then right-click and select **Delete** (not **Cut**!).

![Screenshot of Power Automate Desktop highlighting all actions to be deleted within the ProcessEmployeeAddressMaster sub flow ](media/PAD-with-actions-deleted-in-processemployeeaddressmaster.png)

19. In **ProcessEmployeeAddressForm** subflow, right-click and select **Paste**.

![Screenshot of Power Automate Desktop showing a context menu within the ProcessEmployeeAddressForm sub flow highlighting the paste command ](media/PAD-with-processemployeeaddressmaster-subflow-and-paste.png)

20. Under the **Variables** pane, edit all variables and provide **Default values** which will be used to test the updated Desktop flow.

![Screenshot of Power Automate Desktop showing Variables pane and a context menu to edit variables and their default values ](media/PAD-with-variables-pane-and-edit-variables.png)

![Screenshot showing the Edit Variable dialog box with default values ](media/edit-variable-dialog-with-default-values.png)

21. Select **Save** and close the confirmation message.

22. Select **Run**.

![Screenshot of Power Automate Desktop showing the final UI flow layout ready to be tested by selecting the run command ](media/PAD-with-final-UI-flow-ready-to-be-tested.png)

Awesome! With this new desktop recording option, some minor action tweaks, and a bit of re-factoring you've managed to further reduce development time and simplified the overall Desktop flow action definition process.

**IMPORTANT:** Delete all previously defined default values before you leave the Desktop flow authoring experience in Power Automate Desktop!
