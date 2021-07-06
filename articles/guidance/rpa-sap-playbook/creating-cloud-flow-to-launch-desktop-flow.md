---
title: Create the cloud flow with the Power Automate | Microsoft Docs
description: In this step of the RPA Playbook for SAP GUI Automation with Power Automate tutorial, we'll create a Power Automate cloud flow that calls our desktop flow using secure input parameters from the cloud.
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

# Create the cloud flow with the Power Automate

<!--todo: we need an intro for each of these documents that tells the customer that they must have compeleted other steps before this one-->

You can close both Power Automate Desktop windows and go to the [Power Automate designer](https://flow.microsoft.com/). Here, we'll create a Power Automate cloud flow that calls our desktop flow by using secure input parameters from the cloud.

>[!NOTE]
>This cloud flow is designed as a **happy path", which means it has no exception handling, scoping, or try-catch-finally patterns. You can find a more resilient design approach in section [6.1 Creating SAP desktop flow with Power Automate Desktop](#creating-an-sap-desktop-flow-with-power-automate-desktop).

1. [Open the Power Automate](https://flow.microsoft.com/), sign in, and confirm you're in the same Dataverse environment as the one you were in when you created the the previous flow in Power Automate Desktop.

   ![Screenshot of Power Automate Desktop home screen open with current Environment indicated ](media/power-automate-desktop-home-screen-with-current-environment.png)

   ![Screenshot of Power Automate Portal home screen open with current Environment indicated  ](media/power-automate-portal-with-current-environment.png)

1. Select **My flows** from the navigation bar on the left, select **New flow**, and then select **Instant cloud flow**.

   ![Screenshot of a new flow dialog with instant cloud flow selection within the Power Automate Portal ](media/new-flow-dialog-with-instant-cloud-flow.png)

1. In the **Build an instant flow** dialog box, enter a flow name, select the **Manually trigger a flow** trigger from the list, and then select **Create**.

   ![Screenshot of new cloud flow dialog wizard in the Power Automate Portal ](media/new-cloud-flow-dialog-wizard.png)

1. This opens the designer and it should look similar to the following image.

   ![Screenshot of the cloud flow authoring canvas in Power Automate Portal ](media/cloud-flow-canvas.png)

>[!IMPORTANT]
>The next steps will involve action component configuration. To securely pass parameters into our desktop flow, we'll be following the [optional but recommended](#azure-key-vault-credentials-optional) approach of using Key Vault secrets. 

>[!NOTE]
>If you don't have access to Key Vault, you can skip the next two steps and provide your credentials and other parameters later as clear text instead.

1. Select **New step**.

1. Search for **Azure Key Vault Get secret**, and then select **Get secret action**.

   ![Screenshot of selecting the Azure Key Vault  Get secret action in Power Automate flow designer ](media/azure-key-vault-get-secret-action.png)

1. If this is the first time you've configured Key Vault in a flow, you'll get a prompt to set up a connection. You can choose to connect either through user credentials or a service principal account (which is recommended for production scenarios).

   **Establishing a connection with user credentials**

   ![Screenshot of establishing a connection with user credentials in the Azure Key Vault action in Power Automate flow designer  The Sign In button is active ](media/establishing-connection-with-user-credentials-azure-key-vault-action.png)

   **Establishing a connection with Service Principal**

   ![Screenshot of establishing a connection with a Service Principal account in the Azure Key Vault action in Power Automate flow designer  The Sign In button is active ](media/establishing-connection-with-service-principal-azure-key-vault-action.png)

   ![Screenshot of establishing a connection using the Azure Key Vault action in Power Automate flow designer after signing in ](media/establishing-connection-with-azure-key-vault-action-after-signin.png)

1. After you configure the connection, select the appropriate **Name of the secret** from the list.

   ![Screenshot of selecting the name of the secret from the list of secrets stored in Azure Key Vault ](media/selecting-name-of-secret-azure-key-vault.png)

1. Select the three dots, and then select **Settings**.

   ![Screenshot of selecting Settings from the More Actions dot dot dot menu in the Get Secret action ](media/selecting-settings-more-actions-menu-get-secret-action.png)

1. Turn on the **Secure Input** and **Secure Output (preview)**, and then select **Done**.

   ![Screenshot of Secure Inputs and Secure Outputs settings in Get Secret settings screen ](media/secure-inputs-secure-outputs-get-secret-settings.png)

   >[!NOTE]
   >These settings will hide sensitive text from the run flow history.

   ![Screenshot of Get SAP User section of flow run history with Inputs and Outputs areas both saying Content not shown due to security configuration](media/get-SAP-user-section-flow-run-history.png)

1. Select the three dots, and then select **Rename** to enter a more specific action name, for example, "Get SAP User".

1. Select the three dots, and then select **Copy to my clipboard**.

1. Select **New step**.

1. Select **My Clipboard**, and then select the name of the previously copied action, for example, "Get SAP User".

   ![Screenshot of Choose an action segment of the flow with My Clipboard tab indicated](media/choose-action-segment-with-my-clipboard-tab.png)

1. Select the three dots, and then select **Rename**. Enter a more specific action name. For example, "Get SAP Password".

   <!--todo double check if it is really step 14-->

1. Repeat steps 14 through 18 for all other Key Vault–based secrets.

   ![Screenshot of Get SAP User action with SAPUser secret Get SAP Password action with SAPPassword secret Get SAP System ID action with SAP HCM SystemId secret and Get SAP Client action with SAP HCM Client secret ](media/get-SAP-user-action-with-secrets.png)

1. Select **New step**.

1. Search for **Desktop flows** and then select **Run a flow built with Power Automate Desktop**.

   ![Screenshot of selecting the Run a flow built with Power Automate Desktop action ](media/selecting-run-flow-built-with-pad-action.png)

1. If this is the first time you've used the desktop flow action, you'll be prompted to create a connection. Provide your **Gateway name**, **Domain and username** (DOMAIN\\User), and **Password**.

1. After the connection is established, select the previously created desktop flow.

   ![Screenshot of selecting the SAP RPA Playbook Demo from the list of desktop flows in the Run a flow built with Power Automate Desktop action ](media/selecting-SAP-RPA-playbook-demo.png)

1. Select **Attended – Runs when you're signed in** as **Run Mode**.

1. Enter each parameter field and either select the appropriate data from the **Dynamic content** pop-up window (such as **SAP System Id**, **SAP Client**, **SAP User**, and **SAP Password**) or manually enter placeholder data (for all the other parameters in the list). If you aren't using the Key Vault option for your SAP credentials, enter them manually and in free text instead.

   ![Screenshot of the Run a Desktop Flow action screen and selecting the Password value from the Get SAP Password field in the Dynamic Content pop up ](media/run-desktop-flow-action-screen-with-dynamic-content.png)

1. Once you've renamed the action to something meaningful and supplied all parameters, the action should look like this.

   ![Screenshot of the Run a Desktop Flow action with SAPSystemID  SAPClient  SAPUser  and SAPPassword all using values from Dynamic Content ](media/run-desktop-flow-action-screen-selecting-password-value.png)

## Test the flow

1. Close all SAP windows.

1. Select **Save**, and then wait until the flow is saved.

1. Select **Test**, and then under **Test Flow**, select **Test** again.

   ![Screenshot of the Test Flow dialog box in Power Automate Portal ](media/test-flow-dialog.png)

1. Authorize any connections, if needed and then select **Continue**.

   ![Screenshot of the Run flow connection dialog box in Power Automate Portal ](media/run-flow-connection-dialog.png)

1. Select **Run flow**.

   ![Screenshot of the Run flow dialog box in Power Automate Portal ](media/run-flow-dialog.png)

1. Select **Done**.

   >[!IMPORTANT]
   >Don't interact with your mouse or keyboard until the process completes.

1. Watch the desktop flow execution.

   ![Screenshot of the Run flow history in Power Automate Portal ](media/run-flow-history.png)

Congratulations, you've just created and launched a secure desktop flow from the cloud and connected to your desktop flow to add an employee address to SAP.
