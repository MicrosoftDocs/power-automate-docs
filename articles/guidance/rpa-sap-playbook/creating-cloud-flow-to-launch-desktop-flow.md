---
title: Create a cloud flow to call the desktop flow | Microsoft Docs
description: In this step of the RPA Playbook for SAP GUI Automation with Power Automate tutorial, we'll create a Power Automate cloud flow that calls our desktop flow using secure input parameters from the cloud.
suite: flow
documentationcenter: na
author: kathyos
editor: ''
ms.custom: guidance

ms.topic: how-to
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/01/2021
ms.author: kathyos
ms.reviewer: angieandrews
---

# Create the cloud flow with the Power Automate

You can close both Power Automate Desktop windows and then go to the [Power Automate designer](https://make.powerautomate.com). Here, we'll create a Power Automate cloud flow that calls our desktop flow by using secure input parameters from the cloud.

>[!NOTE]
>This cloud flow is designed as a "happy path," which means it has no exception handling, scoping, or try-catch-finally patterns. You can find a more resilient design approach in the [Low-code RPA with SAP GUI in Power Automate Desktop](action-based-sap-gui-automation-manually-overview.md) section.<!--note from editor: Please double-check this link. I think it should go to the "head" of the relevant section, just to set the stage for the reader.-->

1. Go to [Power Automate](https://make.powerautomate.com), sign in, and confirm that you're in the same Microsoft Dataverse environment as the one you were in when you created the previous flow in Power Automate Desktop.

   ![Screenshot of the Power Automate Desktop home screen, with the current environment indicated.](media/power-automate-desktop-home-screen-with-current-environment.png)

   ![Screenshot of the Power Automate home screen, with the current environment indicated.](media/power-automate-portal-with-current-environment.png)

1. On the left pane, select **My flows**, select **New flow**, and then select **Instant cloud flow**.

   ![Screenshot of a new flow dialog with instant cloud flow selection within Power Automate.](media/new-flow-dialog-with-instant-cloud-flow.png)

1. In the **Build an instant flow** dialog, enter a flow name, select the **Manually trigger a flow** trigger from the list, and then select **Create**.

   ![Screenshot of new cloud flow dialog wizard in Power Automate.](media/new-cloud-flow-dialog-wizard.png)

1. This opens the designer, and it should look similar to the following image.

   ![Screenshot of the cloud flow authoring canvas in Power Automate.](media/cloud-flow-canvas.png)

   >[!IMPORTANT]
   >The next steps will involve configuring action components. To securely pass parameters into our desktop flow, we'll be following the optional, but recommended, approach of using Azure Key Vault secrets. 

   >[!NOTE]
   >If you don't have access to Key Vault, you can skip the following steps that show you how to configure Key Vault and provide your credentials and other parameters later as clear text. Microsoft does not recommend that you use clear text credentials in production environments.

1. Select **New step**.

1. Search for **Azure Key Vault Get secret**, and then select **Get secret action**.

   ![Screenshot of selecting the Azure Key Vault  Get secret action in Power Automate flow designer.](media/azure-key-vault-get-secret-action.png)

1. If this is the first time you've configured Key Vault in a flow, you'll get a prompt to set up a connection. You can choose to connect either through user credentials or a service principal account (which we recommend for production scenarios).

   **Establishing a connection with user credentials**

   ![Screenshot of establishing a connection with user credentials in the Azure Key Vault action in Power Automate flow designer. The Sign In button is active.](media/establishing-connection-with-user-credentials-azure-key-vault-action.png)

   **Establishing a connection with service principal**

   ![Screenshot of establishing a connection with a service principal account in the Key Vault action in Power Automate flow designer. The Sign In button is active.](media/establishing-connection-with-service-principal-azure-key-vault-action.png)

   ![Screenshot of establishing a connection using the Azure Key Vault action in Power Automate flow designer after signing in.](media/establishing-connection-with-azure-key-vault-action-after-signin.png)

1. After you configure the connection, select the appropriate **Name of the secret** from the list.

   ![Screenshot of selecting the name of the secret from the list of secrets stored in Key Vault.](media/selecting-name-of-secret-azure-key-vault.png)

1. Select **More** (**...**), and then select **Settings**.

   ![Screenshot of selecting Settings from the More Actions dot dot dot menu in the Get Secret action.](media/selecting-settings-more-actions-menu-get-secret-action.png)

1. Turn on **Secure Inputs** and **Secure Outputs**, and then select **Done**.

   ![Screenshot of Secure Inputs and Secure Outputs settings in the Get Secret settings screen.](media/secure-inputs-secure-outputs-get-secret-settings.png)

   >[!NOTE]
   >These settings will hide sensitive text from the run flow history.

   ![Screenshot of Get SAP User section of flow run history with Inputs and Outputs areas both saying Content not shown due to security configuration.](media/get-SAP-user-section-flow-run-history.png)

1. Select **...**, and then select **Rename** to enter a more specific action name—for example, **Get SAP User**.

1. Select **...**, and then select **Copy to my clipboard**.

1. Select **New step**.

1. Select **My Clipboard**, and then select the name of the previously copied action—in our example, **Get SAP User**.

   ![Screenshot of Choose an action segment of the flow with My Clipboard tab indicated.](media/choose-action-segment-with-my-clipboard-tab.png)

1. Select **...**, and then select **Rename**. Enter a more specific action name—for example, **Get SAP Password**.

   <!--todo double check if it is really step 14-->

1. Repeat steps 14 through 18 for all other Key Vault–based secrets.<!--note from editor: I wish I could tell you which steps this should be, but I'm a bit lost here.-->

   ![Screenshot of Get SAP User action with SAPUser secret Get SAP Password action with SAPPassword secret Get SAP System ID action with SAP HCM SystemId secret and Get SAP Client action with SAP HCM Client secret.](media/get-SAP-user-action-with-secrets.png)

1. Select **New step**.

1. Search for **Desktop flows**, and then select **Run a flow built with Power Automate Desktop**.

   ![Screenshot of selecting the Run a flow built with Power Automate Desktop action.](media/selecting-run-flow-built-with-pad-action.png)

1. If this is the first time you've used the desktop flow action, you'll be prompted to create a connection. Provide your **Gateway name**, **Domain and username** (DOMAIN\\User), and **Password**.

1. After the connection is established, select the previously created desktop flow.

   ![Screenshot of selecting the SAP RPA Playbook Demo from the list of desktop flows in the Run a flow built with Power Automate Desktop action.](media/selecting-SAP-RPA-playbook-demo.png)

1. Select **Attended – Runs when you're signed in** as **Run Mode**.

1. Enter each parameter field and either select the appropriate data from the **Dynamic content** pop-up window (such as **SAP System Id**, **SAP Client**, **SAP User**, and **SAP Password**) or manually enter placeholder data (for all the other parameters in the list). If you aren't using the Key Vault option for your SAP credentials, enter them manually and in free text instead.

   ![Screenshot of the Run a Desktop Flow action screen and selecting the Password value from the Get SAP Password field in the Dynamic Content pop up.](media/run-desktop-flow-action-screen-with-dynamic-content.png)

1. After you've renamed the action to something meaningful and supplied all parameters, the action should look like this.

   ![Screenshot of the Run a Desktop Flow action with SAPSystemID  SAPClient  SAPUser  and SAPPassword all using values from Dynamic Content.](media/run-desktop-flow-action-screen-selecting-password-value.png)

## Test the flow

1. Close all SAP windows.

1. Select **Save**, and then wait until the flow is saved.

1. Select **Test**, and then under **Test Flow**, select **Test** again.

   ![Screenshot of the Test Flow dialog in Power Automate.](media/test-flow-dialog.png)

1. Authorize any connections, if needed, and then select **Continue**.

   ![Screenshot of the Run flow connection dialog in Power Automate.](media/run-flow-connection-dialog.png)

1. Select **Run flow**.

   ![Screenshot of the Run flow dialog in Power Automate.](media/run-flow-dialog.png)

1. Select **Done**.

   >[!IMPORTANT]
   >Don't interact with your mouse or keyboard until the process completes.

1. Watch the desktop flow execution.

   ![Screenshot of the Run flow history in Power Automate.](media/run-flow-history.png)

Congratulations, you've just created and launched a secure desktop flow from the cloud and connected to your desktop flow to add an employee address to SAP.

> [!div class="nextstepaction"]
> [Next step: Validate data with the SAP ERP connector](data-pre-validation-sap-erp.md)
