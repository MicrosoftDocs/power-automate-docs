---
title: Create the cloud flow to update an address in SAP | Microsoft Docs
description: In this step of the RPA Playbook for SAP GUI Automation with Power Automate tutorial, we'll create the cloud flow that employees use to request an updated address. This cloud flow passes the input variables to the desktop flow you created in the previous section.
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

# Create the cloud flow with Power Automate 

Now, we'll create the cloud flow that employees use to request an updated address. This cloud flow passes the input variables to the desktop flow you created in the previous section.

We highly recommended that you create cloud flows, Desktop flows and other Microsoft Power Platform artifacts within solutions to allow for better portability, application lifecycle management (ALM), and encapsulation.

1. Navigate to <https://powerautomate.com> and sign-in with your Azure AD credentials.

2. Confirm that you are in the same environment as the one used to build the Desktop flow with Power Automate Desktop, select **Solutions** and **+ New Solution**.

   ![Screenshot of the Power Automate Portal window with Solutions selected in the left pane and the New solution button selected ](media/power-automate-portal-with-new-solution-button.png)

3. Enter a **Display name**, select a **Publisher** and then select **Create**.

   ![Screenshot of the New Solution dialog box ](media/new-solution-dialog.png)

4. Open the solution by clicking its name.

   ![Screenshot of the Power Automate Solutions list with the new solution selected ](media/solutions-list-with-RPA-SAP-solution.png)

5. Select **+ Add existing**, select the **Desktop flow** you've created in Power Automate Desktop and select **Add**.

   ![Screenshot of adding an existing solution, with desktop flow selected from drop-down menu](media/add-existing-desktop-flow-to-solution.png)

   ![Screenshot of the Power Automate Solutions are with the RPA SAP Address Solution showing the SAP RPA Playbook Demo UI flow in the list ](media/SAP-RPA-playbook-demo-UI-flow-in-solution-list.png)

6. Select **+ New** and select **Flow.**

   ![Screenshot of the Power Automate solution screen with Cloud flow selected in the New menu ](media/power-automate-solution-screen-with-cloud-flow-in-new-menu.png)

7. Give your flow a name and select **Manually trigger a flow** as trigger.

   ![Screenshot of the Power Automate flow designer  with Manually trigger a flow trigger being added ](media/power-automate-flow-designer-with-manually-trigger-a-flow.png)

8. Create several inputs by selecting **+ Add an input** and selecting the appropriate data type, for all the variables listed in step 9.

   ![Screenshot of the Manually trigger a flow box with the Add an input button ](media/manually-trigger-a-flow-add-input-button.png)

   ![Screenshot of the Manually trigger a flow box with Choose the type of user input selection area ](media/manually-trigger-a-flow-choose-user-input.png)

   ![Screenshot of the Manually trigger a flow box with AddressType added as Text type ](media/manually-trigger-a-flow-with-addresstype.png)

9. Add the following inputs to the flow trigger.

   ![Screenshot of the Manually trigger a flow box with Effective Date added as Date type  Employee ID added as text type  and New Street  New City  New ZipCode  New State  and New Country all added as text type ](media/manually-trigger-a-flow-with-multiple-inputs.png)

10. Select **New step**.

    ![Screenshot of Power Automate flow designer with New Step button under the trigger box ](media/power-automate-flow-designer-with-new-step-button.png)

   >[!NOTE]
   >The following Key Vault action configurations are optional, so if you aren't using Key Vault today, or you just want to test your Desktop flow without it, feel free to skip them.

11. Enter **azure key vault** into the search bar.

    ![Screenshot of selecting the Azure Key Vault Get secret action in Power Automate flow designer ](media/selecting-Azure-Key-Vault-get-secret-action.png)

12. If you don't have an existing Key Vault connection, you'll be prompted to create one. You can sign in either with an **Azure Active Directory user account** or a **Service Principal** (recommended).

    ![Screenshot of Azure Key Vault action in Power Automate flow designer  ](media/selecting-Azure-Key-Vault-action-in-flow-designer.png)

13. Let's assume you want to connect with Service Principal.

    ![Screenshot of establishing a connection using the Azure Key Vault action in Power Automate flow designer  after signing in ](media/establishing-connection-using-Azure-Key-Vault-action.png)

14. After you establish the connection, add four **Get secret** Azure Key Vault actions to the canvas, select the secret, and then rename the actions appropriately.

    ![Screenshot of Get SAP User action with SAPUser secret  Get SAP Password action with SAPPassword secret  Get SAP System ID action with SAP HCM SystemId secret  and Get SAP Client action with SAP HCM Client secret ](media/add-4-get-secret-Azure-Key-Vault-actions.png)

15. Select the **…** next to the action name, select **Settings**, turn on **Secure Inputs** and **Secure Outputs**, and then select **Done**. Repeat this step for the other three **Get secret** actions.

    ![Screenshot of Secure Inputs and Secure Outputs settings in Get Secret settings screen ](media/secure-inputs-secure-outputs-settings-in-get-secret.png)

16. Select the plus sign **(+)**, and then select **Add an action**.

    ![Screenshot of adding an action under the Manually trigger a flow trigger ](media/adding-an-action.png)

17. Enter **scope** into the search bar, and then select the **Scope** action.

    ![Screenshot of searching for Scope actions ](media/searching-for-scope-actions.png)

18. Drag all your Key Vault actions onto the **Scope** container, and then rename it to **Try**.

    ![Screenshot of dragging the Get secret actions in to the Scope box ](media/dragging-get-secret-to-scope-box.png)

    ![Screenshot of the Scope box with all the Get secret actions in it](media/scope-box-with-get-secret-actions.png)

19. Search for, and then select the **initialize variable** action to add it under the trigger.

    ![Screenshot of adding an action under the trigger ](media/adding-another-action.png)

20. Enter **Bot failed** as the variable **Name**, **Boolean** as the data **Type,** and **false** as **Value**, and then select **OK** on the expression dialog.

    ![Screenshot of the Initialize Variable box and the Expression pop out ](media/initialize-variable-box-and-expression-pop-out.png)

21. Add two scope actions. Name them **Catch** and **Finally**.

    ![Screenshot of Try  Catch  and Finally scope boxes ](media/try-catch-finally-scope-box.png)

22. On the catch scope, select the **…** next to its name, and then select **Configure run after**.

    ![Screenshot of Catch Scope box with Configure Run After being selected in the dot dot dot menu ](media/catch-scope-box-with-configure-run-after.png)

23. Select **has failed**, **is skipped**, and **has timed out**, and then select **Done**.

    ![Screenshot of Run after setup for Catch box ](media/run-after-setup-for-catch-box.png)

24. Open the setting of the finally block, and then select the settings as shown in the following images.

    ![Screenshot of Finally Scope box with Configure Run After being selected in the dot dot dot menu ](media/finally-scope-box-with-configure-run-after.png)

    ![Screenshot of Run after setup for Finally box ](media/run-after-setup-for-finally-box.png)

25. Search for, and then add the **set variable** action.

    ![Screenshot of Catch scope box with Set variable action being added ](media/catch-scope-box-with-set-variable-action.png)

26. Select the **Bot failed** variable, enter **true** in the expression box, and then select **OK**.

    ![Screenshot of the Set Variable box and the Expression pop out ](media/set-variable-box-with-expression-pop-out.png)

    ![Screenshot of the Set Variable box with Name equal to Bot Failed and Value equal to the expression True ](media/set-variable-box-with-name-bot-failed-and-value-true.png)

27. Search for the **condition** action, and then add it within the finally block.

    ![Screenshot of Finally scope box with condition action being added ](media/finally-scope-box-with-condition-action.png)

28. Select the **Bot failed** variable from the Dynamic content list and then assign it to the **Choose a value** field.

    ![Screenshot of Finally scope box with Condition action and Dynamic expression pop up ](media/finally-scope-box-with-condition-action-and-dynamic-expression.png)

29. Set the expression to **false**, and then assign it to the **value** field.

    ![Screenshot of the Condition segment with Dynamic Content pop up to make the phrase Bot failed is equal to false ](media/condition-segment-with-bot-failed-false.png)

30. Within the **If yes** section add a **Send an email (V2)** action.

    ![Screenshot of If Yes condition with Send an email action being added ](media/if-yes-condition-with-send-email-action.png)

    ![Screenshot of Send an email action box  ](media/send-email-action.png)

31. Select the **User email** from the dynamic content list and add it to the **To** field, provide a **subject** and an email **body**.

    ![Screenshot of Send an email action being configured ](media/send-email-action-being-configured.png)

32. Select **New step** within the try block. Search for **Desktop flows**, and then select the **Run a flow built by Power Automate Desktop** action to add it to the flow.
   
    ![Screenshot of adding the Run flow built by Power Automate Desktop action ](media/adding-run-flow-built-by-power-automate-desktop.png)

33. Select your data gateway and then enter a domain, username, and password for an account that has sufficient privileges to run your desktop flows. 

    >[!IMPORTANT]
    >Your on-premises data gateway must be deployed into the same region as your environment; otherwise, it won't appear in the drop-down list.

    ![Screenshot of the Desktop flow connection property dialog for Run a flow built by Power Automate Desktop action ](media/desktop-flow-connection-property-dialog-for-run-flow.png)

34. Select the **SAP RPA Playbook Demo** desktop flow and select **Attended – Runs when you're signed** in as the **Run mode**.

    ![Screenshot of Run a flow built by Power Automate Desktop box with the Desktop flow being selected ](media/run-a-flow-built-by-PAD-with-desktop-flow-selected.png)

    ![Screenshot of Run a flow built by Power Automate Desktop box with the run mode being selected ](media/run-a-flow-built-by-PAD-with-run-mode-selected.png)

35. Select the **System Id** field, select **value** from the **Get SAP System Id** action output in the the dynamic content list.

    ![Screenshot of Run a UI flow built by Power Automate Desktop box with the system ID being added from dynamic content ](media/run-a-UI-flow-built-by-PAD-with-system-ID.png)

36. Check the expected date time format in SAP and make adjustments if needed through the formatDateTime function. For example, use **formatDateTime(triggerBody()\['date'\],'dd.MM.yyyy')** to get to a German formatted date of 13.10.2020.

    ![Screenshot of Run a UI flow built by Power Automate Desktop box with the date format being set from Expressions box ](media/run-a-UI-flow-built-by-PAD-with-date-format-being-set.png)

    ![Screenshot of Run a UI flow built by Power Automate Desktop box with the date format expression ](media/run-a-UI-flow-built-by-PAD-with-date-format-set.png)

37. Supply the data for all other fields by selecting the appropriate property from the trigger dynamic content list for the cloud flow.

    ![Screenshot of Run a UI flow built by Power Automate Desktop box with variables being set ](media/run-a-UI-flow-built-by-PAD-with-variables-being-set.png)

    ![Screenshot of Run a UI flow built by Power Automate Desktop box with all variables set](media/run-a-UI-flow-built-by-PAD-with-variables-set.png)

38. Select **Save** to save the flow.

    ![Screenshot of Save button in Power Automate flow designer ](media/save-button-in-flow-designer.png)

39. Select **Test**.

    ![Screenshot of Test button in Power Automate flow designer ](media/test-button-in-flow-designer.png)

    <!--Todo: save and test... is it in the UI?-->

40. Select I'll perform the trigger action, and then select **Save & Test**.

    ![Screenshot of the Test Flow dialog box in Power Automate Portal ](media/test-flow-dialog-box.png)

41. Authenticate if needed, and then select **Continue**.

    ![Screenshot of the Run flow dialog box in Power Automate Portal  with Sign in area for connection authorization and Continue button active ](media/run-flow-dialog-with-sign-in-area.png)

42. Supply all parameters, and then select **Run flow**.

    ![Screenshot of the Run flow dialog box in Power Automate Portal with variables entered and Run flow button active ](media/run-flow-dialog-with-variables-and-run-flow-button.png)

43. Select **Done**.

    >[!NOTE]
    >Don't interact with your mouse or keyboard until the process completes.

    ![Screenshot of Run Flow dialog box with Your flow has successfully started message ](media/run-flow-dialog-with-successfully-started-message.png)

The cloud flow starts and calls the desktop flow, which enters data into SAP.

![Screenshot of the test run of the flow executing in the Power Automate Portal  with checkmarks applied to each step being executed ](media/test-run-of-flow-with-checkmarks.png)

![Screenshot of the test run of the flow executing in the Power Automate Portal  with checkmarks applied to each step that was executed and the Your flow ran successfully banner message ](media/test-run-of-flow-with-checkmarks-and-banner-message.png)

Congratulations! You've successfully implemented two SAP GUI automation techniques. We're excited to see what you build next with SAP and Power Automate.
