---
title: Use no-code RPA with SAP GUI in Power Automate Desktop | Microsoft Docs
description: The desktop recorder translates each mouse click and keystroke into Power Automate Desktop actions and adds them to your desktop flow. 
suite: flow
documentationcenter: na
author: kathyos
editor: ''
ms.custom: guidance

ms.topic: overview
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/01/2021
ms.author: kathyos
ms.reviewer: angieandrews
---

# Use no-code RPA with SAP GUI in Power Automate Desktop

You can use the [Power Automate Desktop recorder](../../desktop-flows/recording-flow.md) to record SAP GUI interactions. The desktop recorder translates each mouse click and keystroke into Power Automate Desktop actions, and then adds these actions to your desktop flow.

If you want to see the new desktop recording experience in action, follow these steps to reconfigure the action-based automation you built in the [Low-code RPA with SAP GUI in Power Automate Desktop](action-based-SAP-GUI-automation-manually-overview.md) section of this playbook.

You can also follow along in the no-code approach in episode 6 of the video series:

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=e98fa76a-db96-4295-ac31-7e15604a254c ]

1. Select the **ProcessHRMasterForm** subflow tab, and then select **Desktop recorder**.

   ![Screenshot of Power Automate Desktop showing the Desktop recorder button.](media/desktop-recorder-button.png)

2. Open SAP, bring the SAP **Easy Access** window to the foreground, and then in the Desktop recorder window, select **Start recording**.

   ![Screenshot of SAP GUI with Desktop recorder tracking window and instruction to start recording.](media/desktop-recorder-tracking-window-start-recording.png)

3. Enter **PA30** into the **Transaction** field, and then select **Enter**.

  ![Screenshot of SAP GUI with Desktop recorder tracking window and SAP transaction code being marked for recording.](media/desktop-recorder-tracking-with-SAP-transaction-code.png)

4. Enter a **Personnel number**, and then select **Enter**.

   ![Screenshot of SAP GUI with Desktop recorder tracking window and SAP Personnel number field being marked for recording.](media/desktop-recorder-tracking-with-SAP-personnel-no.png)

5. Select **Addresses** as the **Infotype Text**, and then enter a value in **STy** (such as **2** or any other value suitable for your use case).

   ![Screenshot of SAP GUI with Desktop recorder tracking window and SAP Infotype text field being selected and STy field marked for recording.](media/desktop-recorder-tracking-with-SAP-infotype.png)

6. Enter a date in the **From** field, and then select the **New** icon.

   ![Screenshot of SAP GUI with Desktop recorder tracking window and SAP period from field being specified and marked for recording.](media/desktop-recorder-tracking-with-SAP-period-from.png)

7. Enter a street name along with a house number in **Address line 1**.

   ![Screenshot of SAP GUI with Desktop recorder tracking window and SAP address line 1 field being specified and marked for recording.](media/desktop-recorder-tracking-with-SAP-address-line.png)

8. Enter values for **City, State/zip code** and **Country key**, and then select **Save.**

   ![Screenshot of SAP GUI with desktop recorder tracking window and SAP address relevant fields being listed on the screen and the save button is also marked as recording step.](media/desktop-recorder-tracking-with-SAP-address-fields-and-save-button.png)

9. Select the **Back** (**F3**) icon.

   ![Screenshot of SAP GUI with Desktop recorder tracking window and SAP back button.](media/desktop-recorder-tracking-with-SAP-back-button.png)

10. This completes the address creation process, so select **Finish** in the desktop recorder window.

    ![Screenshot of SAP GUI with Desktop recorder tracking window.](media/SAP-gui-with-desktop-recorder-tracking.png)

11. Your desktop flow script should look similar to the following image.

    ![Screenshot of Power Automate Desktop that shows the recorded actions on its canvas.](media/PAD-showing-recorded-actions.png)

12. During recording, you might have accidentally selected windows or other UI elements that aren't relevant to your flow. If this happens, you can remove duplicate or unnecessary action steps from the script.

    ![Screenshot of Power Automate Desktop that shows duplicate or accidentally captured actions.](media/PAD-showing-actions-to-be-removed.png)

    ![Screenshot of more Power Automate Desktop showing duplicate or accidentally captured actions to be removed - continued.](media/PAD-showing-more-actions-to-be-removed.png)

13. Highlight all actions that were manually defined in [Low-code RPA with SAP GUI in Power Automate Desktop](action-based-sap-gui-automation-manually-overview.md), right-click, and then select **Delete selection** to remove them from the subflow.

    ![Screenshot of Power Automate Desktop that shows added actions which should be deleted.](media/PAD-with-actions-to-be-deleted.png)

14. Edit the **Populate text field in window** action for **Employee Id**, and replace the **Text to fill-in** value with the previously defined **EmployeeId** variable.

    ![Screenshot of Power Automate Desktop that shows a Populate text field action dialog where a hard-coded employee ID can be replaced with a previously defined variable.](media/PAD-with-populate-text-with-hard-coded-employee-id.png)

    ![Screenshot of Power Automate Desktop showing a Populate text field action dialog listing the previously defined EmployeeId variable.](media/PAD-with-populate-text-with-employee-id-variable.png)

15. Edit the **Populate text field in window** action for **Info subtype**, and replace the **Text to fill-in** value with the previously defined **AddressType** variable.

    ![Screenshot of Power Automate Desktop showing a Populate text field action dialog where the hard-coded info subtype can be replaced with a previously defined variable.](media/PAD-with-populate-text-with-info-subtype.png)

    ![Screenshot of Power Automate Desktop that shows a Populate text field action dialog with a previously defined AddressType variable.](media/PAD-with-populate-text-with-addresstype-variable.png) 

16. Edit and replace the hard-coded text with variables in the **Populate text field in window** actions for **Effective Date**, **Street**, **City**, **State**, **ZipCode**, and **Country**.

    ![Screenshot of Power Automate Desktop that shows the action results after renaming Effective Date  Street  City  State  ZipCode  and Country.](media/PAD-after-renaming-fields.png)

17. Highlight the actions that you'll need for the employee address creation subflow, right-click the actions you selected, and then select **Cut**.

    ![Screenshot of Power Automate Desktop that shows address creation actions have been highlighted and removed.](media/PAD-with-address-actions-highlighted.png)

18. Open the **ProcessEmployeeAddressForm** subflow, select all actions, right-click, and then select **Delete**.

    ![Screenshot of Power Automate Desktop that highlights all actions that are to be deleted within the ProcessEmployeeAddressMaster subflow.](media/PAD-with-actions-deleted-in-processemployeeaddressmaster.png)

19. In **ProcessEmployeeAddressForm** subflow, right-click, and then select **Paste**.

    ![Screenshot of Power Automate Desktop that shows a context menu within the ProcessEmployeeAddressForm sub flow with the paste command highlighted.](media/PAD-with-processemployeeaddressmaster-subflow-and-paste.png)

20. Under the **Variables** pane, edit all variables and then provide **Default values**. These default values will be used to test the updated desktop flow.

    ![Screenshot of Power Automate Desktop that shows the Variables pane and a context menu to edit variables and their default values.](media/PAD-with-variables-pane-and-edit-variables.png)

    ![Screenshot that shows the Edit Variable dialog box with default values.](media/edit-variable-dialog-with-default-values.png)

21. Select **Save**, and then close the confirmation message.

22. Select **Run**.

    ![Screenshot of Power Automate Desktop that shows the final desktop flow that’s ready to be tested. Select the run command to start the test.](media/PAD-with-final-UI-flow-ready-to-be-tested.png)

Awesome! With this new desktop recording option, some minor action tweaks, and a bit of refactoring, you've reduced development time and simplified the overall desktop flow action definition process.

>[!IMPORTANT]
>Delete all previously defined default values before you leave the desktop flow authoring experience.

> [!div class="nextstepaction"]
> [Next step: Extract data from the SAP GUI UI with Power Automate](extracting-information-from-sap-gui-ui.md)
