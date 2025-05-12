---
title: Create the cloud flow to update an address in SAP | Microsoft Docs
description: In this step of the RPA Playbook for SAP GUI Automation with Power Automate tutorial, we'll create the cloud flow that employees use to request an updated address. This cloud flow passes the input variables to the desktop flow you created in the previous section.
suite: flow
documentationcenter: na
author: kathyos
editor: ''
ms.custom: guidance

ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/01/2022
ms.author: mapichle
ms.reviewer: angieandrews
---

# Create the cloud flow to update an address with Power Automate 
<!--note from editor: Suggest making the title more specific, otherwise they begin to run together I think.-->
Now, we'll create the cloud flow that employees use to request an updated address. This cloud flow passes the input variables to the desktop flow you created in the previous section.<!--note from editor: Not sure if this reference is good enough or should it be a link.-->

We highly recommended that you create cloud flows, desktop flows and other Microsoft Power Platform artifacts within solutions to allow for better portability, application lifecycle management (ALM), and encapsulation.

1. Navigate to <https://make.powerautomate.com> and sign in with your Microsoft Entra credentials.

2. Confirm that you're in the same environment as the one in which you built the desktop flow with Power Automate Desktop, and then select **Solutions** > **+ New solution**.

   ![Screenshot of the Power Automate portal window with Solutions selected on the left pane and the New solution button selected.](media/power-automate-portal-with-new-solution-button.png)

3. Enter a **Display name**, select a **Publisher**, and then select **Create**.

   ![Screenshot of the New Solution dialog.](media/new-solution-dialog.png)

4. Open the solution by selecting its name.

   ![Screenshot of the Power Automate Solutions list with the new solution selected.](media/solutions-list-with-RPA-SAP-solution.png)

5. Select **+ Add existing**, select **Desktop flow**, select the flow you created in Power Automate Desktop, and then select **Add**.

   ![Screenshot of adding an existing solution, with Desktop flow selected from the dropdown menu.](media/add-existing-desktop-flow-to-solution.png)

   ![Screenshot of the Power Automate Solutions area with the RPA SAP Address Solution showing the SAP RPA Playbook Demo flow in the list.](media/SAP-RPA-playbook-demo-UI-flow-in-solution-list.png)

6. Select **+ New** > **Cloud flow**.

   ![Screenshot of the Power Automate solution screen with Cloud flow selected in the New menu.](media/power-automate-solution-screen-with-cloud-flow-in-new-menu.png)

7. Give your flow a name, and select **Manually trigger a flow** as the trigger.

   ![Screenshot of the Power Automate flow designer with the Manually trigger a flow trigger being added.](media/power-automate-flow-designer-with-manually-trigger-a-flow.png)

8. Select **+ Add an input**, and then select the appropriate data type to create the eight inputs listed in step 9.

   ![Screenshot of the Manually trigger a flow dialog with the Add an input button.](media/manually-trigger-a-flow-add-input-button.png)

   ![Screenshot of the Manually trigger a flow dialog with Choose the type of user input selection area.](media/manually-trigger-a-flow-choose-user-input.png)

   ![Screenshot of the Manually trigger a flow dialog with AddressType added as Text type.](media/manually-trigger-a-flow-with-addresstype.png)

9. Add the following inputs to the flow trigger.

   :::image type="complex" source="media/manually-trigger-a-flow-with-multiple-inputs.png" alt-text="Add inputs to the trigger flow.":::
   Screenshot of the Manually trigger a flow dialog with Address Type as Text, Effective Date as Date, and the following six inputs all of Text type: Employee ID, New Street, New City, New ZipCode, New State, and New Country.
   :::image-end:::
<!--![Screenshot of the Manually trigger a flow box with Effective Date added as Date type  Employee ID added as text type  and New Street  New City  New ZipCode  New State  and New Country all added as text type.](media/manually-trigger-a-flow-with-multiple-inputs.png)-->

10. Select **New step**.

    ![Screenshot of the Power Automate flow designer with the New Step button under the trigger box.](media/power-automate-flow-designer-with-new-step-button.png)

   >[!NOTE]
   >The following Azure Key Vault action configurations are optional, so if you aren't using Key Vault today, or you just want to test your desktop flow without it, feel free to skip them.<!--note from editor: I assume the reader wouldn't just stop here if they didn't want to configure Key Vault - which step should they skip to? It would be much clearer to have the first 10 steps end  the next set of steps their own heading, something like **To configure Azure Key Vault actions (optional)**. I'm not sure where the main procedure resumes, so I can't suggest where that would go.-->

11. Enter **azure key vault** into the search box.

    ![Screenshot of selecting the Azure Key Vault Get secret action in the Power Automate flow designer.](media/selecting-Azure-Key-Vault-get-secret-action.png)

12. If you don't have an existing Key Vault connection, you'll be prompted to create one. You can sign in either with a Microsoft Entra user account or a Service Principal (recommended).

    ![Screenshot of an Azure Key Vault action in the Power Automate flow designer.](media/selecting-Azure-Key-Vault-action-in-flow-designer.png)

13. Let's assume you select **Connect with Service Principal**.

    ![Screenshot of establishing a connection using the Azure Key Vault action in Power Automate flow designer after signing in.](media/establishing-connection-using-Azure-Key-Vault-action.png)

14. After you establish the connection, add four **Get secret** Key Vault actions to the canvas, select the secret, and then rename the actions as shown in the following image.

    :::image type="complex" source="media/add-4-get-secret-Azure-Key-Vault-actions.png" alt-text="Add Get secret actions to the canvas.":::
    Screenshot showing four actions: Get SAP System Id, renamed SAP-HCM-SystemId; Get SAP Client, renamed SAP-HCM-Client; Get SAP User, renamed SAPUser; and Get SAP Password, renamed SAPPassword.
    :::image-end:::

15. Select **More** (**…**) next to the action name, select **Settings**, turn on **Secure Inputs** and **Secure Outputs**, and then select **Done**. Repeat this step for the other three **Get secret** actions.

    ![Screenshot of Secure Inputs and Secure Outputs turned on in the settings for the Get SAP System Id secret.](media/secure-inputs-secure-outputs-settings-in-get-secret.png)

16. Select the plus sign **(+)**, and then select **Add an action**.

    ![Screenshot of adding an action under the Manually trigger a flow trigger.](media/adding-an-action.png)

17. Enter **scope** into the search box, and then select the **Scope** action.

    ![Screenshot of searching for Scope actions.](media/searching-for-scope-actions.png)

18. Drag all your Key Vault actions onto the **Scope** container, and then rename it to **Try**.<!--note from editor: In the second screenshot, I think the name should be **Try** just to show that this step has been completed. -->

    ![Screenshot of dragging the Get secret actions to the Scope container.](media/dragging-get-secret-to-scope-box.png)

    ![Screenshot of the Scope container with all the Get secret actions in it.](media/scope-box-with-get-secret-actions.png)

19. Search for, and then select, the **initialize variable** action to add it under the trigger.

    ![Screenshot of adding an action under the trigger.](media/adding-another-action.png)

20. In the **Initialize variable** dialog, make the following settings, and then select **OK** in the **Expression** dialog:

    - For **Name**, enter **Bot failed**.
    - For **Type**, select **Boolean**.
    - For **Value**, enter **false**.

    ![Screenshot of the Initialize variable and Expression dialogs.](media/initialize-variable-box-and-expression-pop-out.png)

21. Add two scope actions. Name them **Catch** and **Finally**.

    ![Screenshot of Try, Catch, and Finally scope containers.](media/try-catch-finally-scope-box.png)

22. In the upper-right corner of the **Catch** scope, select **…**, and then select **Configure run after**.

    ![Screenshot of the Catch scope with Configure run after selected in the More menu.](media/catch-scope-box-with-configure-run-after.png)

23. Select **has failed**, **is skipped**, and **has timed out**, and then select **Done**.

    ![Screenshot of the Catch should run after dialog.](media/run-after-setup-for-catch-box.png)

24. In the upper-right corner of the **Finally** scope, select **…**, select **Configure run after**, and then select the **is successful**, **has failed**, **is skipped**, and **has timed out** checkboxes. Select **Done**.

    ![Screenshot of the Finally scope with Configure run after selected in the More menu.](media/finally-scope-box-with-configure-run-after.png)

    ![Screenshot of the Finally should run after dialog.](media/run-after-setup-for-finally-box.png)

25. Search for, and then add, the **set variable** action to the **Catch** scope container.<!--note from editor: Edit okay? -->

    ![Screenshot of the Catch scope with the Set variable action being added.](media/catch-scope-box-with-set-variable-action.png)

26. Select the **Bot failed** variable, enter **true** in the **Expression** dialog, and then select **OK**.

    ![Screenshot of the Set variable action and Expression dialogs.](media/set-variable-box-with-expression-pop-out.png)

    ![Screenshot of the Set variable action with Name equal to Bot failed and Value equal to the expression true.](media/set-variable-box-with-name-bot-failed-and-value-true.png)

27. Search for the **condition** action, and then add it to the **Finally** block.

    ![Screenshot of the Finally scope with a condition action being added.](media/finally-scope-box-with-condition-action.png)

28. Select the **Bot failed** variable from the **Dynamic content** list and then assign it to the **Choose a value** field.

    ![Screenshot of the Finally scope with Condition action and Dynamic expression dialogs.](media/finally-scope-box-with-condition-action-and-dynamic-expression.png)

29. Set the expression to **false**, and then assign it to the **value** field.

    ![Screenshot of the Condition segment with Dynamic content dialog to set the phrase Bot failed equal to false.](media/condition-segment-with-bot-failed-false.png)

30. In the **If yes** section, add a **Send an email (V2)** action.

    ![Screenshot of the If yes condition with Send an email action being added.](media/if-yes-condition-with-send-email-action.png)

    ![Screenshot of the Send an email (V2) action.](media/send-email-action.png)

31. Select **User email** from the **Dynamic content** list and add it to the **To** field, and then enter a **subject** and an email **body**.

    ![Screenshot of the Send an email action being configured.](media/send-email-action-being-configured.png)

32. In the **Try** container, select **New step**. Search for **Desktop flows**, and then select the **Run a flow built by Power Automate Desktop** action to add it to the flow.
   
    ![Screenshot of adding the Run flow built by Power Automate Desktop action.](media/adding-run-flow-built-by-power-automate-desktop.png)

33. Select your data gateway and then enter a domain, username, and password for an account that has sufficient privileges to run your desktop flows. 

    >[!IMPORTANT]
    >Your on-premises data gateway must be deployed into the same region as your environment; otherwise, it won't appear in the dropdown list.

    ![Screenshot of the Desktop flows connection property dialog for the Run a flow built by Power Automate Desktop action.](media/desktop-flow-connection-property-dialog-for-run-flow.png)

34. For **Desktop flow**, select **SAP RPA Playbook Demo**. For **Run mode**, select **Attended – Runs when you're signed in**.

    ![Screenshot of the Run a flow built by Power Automate Desktop dialog with Desktop flow selected.](media/run-a-flow-built-by-PAD-with-desktop-flow-selected.png)

    ![Screenshot of the Run a flow built by Power Automate Desktop dialog with Run mode selected.](media/run-a-flow-built-by-PAD-with-run-mode-selected.png)

35. Select the **System Id** field, and then select **value** from the **Get SAP System Id** action output in the **Dynamic content** list.

    ![Screenshot of the Run a flow built by Power Automate Desktop dialog with the system ID being added from dynamic content.](media/run-a-UI-flow-built-by-PAD-with-system-ID.png)

36. Check the expected date time format in SAP and make adjustments if needed by using the formatDateTime function. For example, use **formatDateTime(triggerBody()\['date'\],'dd.MM.yyyy')** to get a date formatted day-month-year, as in the German-formatted date of 13.10.2020.

    ![Screenshot of the Run a flow built by Power Automate Desktop dialog with the date format being set from the Expressions dialog.](media/run-a-UI-flow-built-by-PAD-with-date-format-being-set.png)

    ![Screenshot of the Run a flow built by Power Automate Desktop dialog with the date format expression.](media/run-a-UI-flow-built-by-PAD-with-date-format-set.png)

37. Supply the data for all other fields by selecting the appropriate property from the trigger **Dynamic content** list for the cloud flow.

    ![Screenshot of the Run a flow built by Power Automate Desktop dialog with variables being set.](media/run-a-UI-flow-built-by-PAD-with-variables-being-set.png)

    :::image type="complex" source="media/run-a-UI-flow-built-by-PAD-with-variables-set.png" alt-text="Screenshot of the Run a flow built by Power Automate Desktop dialog after all variables are set.":::
    Screenshot of the Run a flow built by Power Automate Desktop dialog with the following variables and their settings: SystemId, Client, SAPUser, SAPPassword all set as secret values; EffectiveDate as formatDateTime, Street as New Street, City as New City, State as New State, ZipCode as New ZIP Code, EmployeeId as Employee ID, AddressType as Address Type, and CountryCode as New Country.
    :::image-end:::

38. Select **Save** to save the flow.

    ![Screenshot of Save button in the Power Automate flow designer.](media/save-button-in-flow-designer.png)

39. Select **Test**.

    ![Screenshot of Test button in the Power Automate flow designer.](media/test-button-in-flow-designer.png)

40. Select **I'll perform the trigger action**, and then select **Save & Test**.

    ![Screenshot of the Test Flow dialog in the Power Automate portal.](media/test-flow-dialog-box.png)

41. Authenticate if needed, and then select **Continue**.

    ![Screenshot of the Run flow dialog in the Power Automate portal with a sign-in area for connection authorization and Continue selected.](media/run-flow-dialog-with-sign-in-area.png)

42. Supply values for all variables, and then select **Run flow**.

    ![Screenshot of the Run flow dialog in the Power Automate portal with values entered and the Run flow button selected.](media/run-flow-dialog-with-variables-and-run-flow-button.png)

43. Select **Done**.

    >[!NOTE]
    >Don't interact with your mouse or keyboard until the process is completed.

    ![Screenshot of the Run flow dialog with Your flow has successfully started message.](media/run-flow-dialog-with-successfully-started-message.png)

The cloud flow starts and calls the desktop flow, which enters data into SAP.

![Screenshot of the test run of the flow being executed in the Power Automate portal, with check marks displayed next to each step being executed.](media/test-run-of-flow-with-checkmarks.png)

![Screenshot of the test run after each step was successfully executed, with the Your flow ran successfully banner message.](media/test-run-of-flow-with-checkmarks-and-banner-message.png)

Congratulations! You've successfully implemented two SAP GUI automation techniques. We're excited to see what you build next with SAP and Power Automate.

> [!div class="nextstepaction"]
> [Next step: No-code RPA with SAP GUI in Power Automate Desktop](action-based-sap-gui-automation-recorder-overview.md)