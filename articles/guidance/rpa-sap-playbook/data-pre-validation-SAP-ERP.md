---
title: Validate data with the SAP ERP connector | Microsoft Docs
description: In this step of the RPA Playbook for SAP GUI Automation with Power Automate tutorial, we do data validation using the certified SAP ERP connector  allows automation developers to connect to SAP through BAPI's and RFC's.
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

# Validate data with the SAP ERP (preview)

>[IMPORTANT]
>This is an optional step.

<!--Todo what's BAPI-->
This is an optional chapter that covers the [certified](https://www.sap.com/dmc/exp/2013_09_adpd/enEN/#/solutions?id=s:d0dcda07-de96-4870-bcad-dac797207da5) [SAP ERP (preview) connector](/power-platform-release-plan/2020wave1/cdm-data-integration/sap-erp-connector-power-apps-power-automate) which allows automation developers to connect to SAP through BAPI's and RFC's. There are [several pre-requisites that need to be met](https://powerapps.microsoft.com/blog/introducing-the-sap-erp-connector/).

Let's extend our current scenario to include a validation check that uses the SAP ERP connector to check whether the **Personnel no** supplied to the flow is valid and that the employee is in an active employment state. Depending on the results of this check, we'll decide if the flow ends.

Here's how the adjusted flow looks.

![Diagram of the example automation where the employee triggers an cloud flow, the cloud flow validates that the employee ID exists, then gets the secrets from Azure Key Vault and starts the UI flow the UI flow uses RPA to automate a new address in SAP, and the cloud flow emails a status message back to the employee ](media/diagram-of-example-automation.png)

There are several benefits to employing this approach.

- Avoids unnecessary RPA processing and complex UI-based exception handling.

- Better user experience through near real-time data validation feedback.

- Frees up virtual machine and bot capacity to run only on validated data.

- Employs data loss prevention policies, allowing/disallowing this connector to be used in conjunction with others.

Follow these steps to adjust the existing flow to incorporate the validation check.

<!--todo: check the numbered sections to confirm they are correct-->

1. Edit the **SAP RPA Playbook Demo Flow** you've created in section [**5.1**](#creating-the-api-flow-with-the-power-automate-portal).

1. Under the **Get SAP Client** action, select **New step**.

3. Search for SAP, and then select **Call SAP function (preview)**.

   ![Screenshot of the Choose an operation dialog with Call SAP function being added from the list of cloud flow actions ](media/choose-operation-dialog-with-call-SAP-function.png)

1. Select **SAP Authentication** in  **Authentication Type**, and set the **Data Gateway**, **SAP Username**, and **SAP Password**.

   >[!NOTE]
   >You'll need to supply your credentials manually. You can't use Key Vault secrets here because Power Automate validates the connection at design time.

   ![Screenshot of the SAP ERP action setup screen ](media/SAP-ERP-action-setup.png)

1. Select the three dots, and then select **Settings**.

   ![Screenshot of using the More dot dot dot  icon to open the Settings menu for the Call SAP Function action ](media/using-more-icon-open-settings-for-call-SAP-function-action.png)

1. Turn on the **Secure Input** and **Secure Output** options, and then select **Done**.

   ![Screenshot of Secure Inputs and Secure Outputs settings in Get Secret settings screen ](media/secure-inputs-secure-outputs-get-secret-settings-2.png)

   >[!TIP]
   >Use these settings to hide sensitive text from the run flow history.

1. Rename the action to **Check if personnel no exists**.

1. Enter **AS host**, **Client**, **AS System Number**, **BAPI_EMPLOYEE_GETDATA** as **SAP function name**, **No** in the **Stateful Session** field, and enter a valid **Personnel no** as **EMPLOYEE_ID**.

   ![Screenshot of the Check if personnel no exists action filled out and adding a valid Personnel number into the employee ID field](media/check-if-personnel-no-exists.png)

1. Under the **Check if personnel no exists** select **New step**.

1. Search for, and select **Condition**. Rename the condition to something meaningful, and then select the dynamic content **TYPE** for the **Choose value** field.

   ![Screenshot of the Condition segment with TYPE being added from the Dynamic Content pop up to make the phrase  quot Type is equal to choose a value quot  ](media/condition-segment-with-TYPE-being-added.png)

1. Drag the desktop flow action **SAP RPA Playbook** onto the **If yes** box.

   ![Screenshot of the condition with Yes and No branches and SAP RPA Playbook Demo Desktop flow in the Yes branch ](media/condition-with-yes-no-branches.png)

1. In the **If no** box, select **Add an action**, search for **Send an email** and configure the email action as shown in the following screenshot.

    ![Screenshot of a configured Send email action under the No branch ](media/configured-send-email-action.png)

1. In the **If no** box and below the email action, select **Add an action**. Search for **Terminate** and configure the **Terminate** action as follows.

    ![Screenshot of the condition with Yes and No branches and Terminate action with Status set to Failed after the Send email action in the No branch ](media/condition-with-yes-no-branches-terminate-action.png)

1. Go back up to action **SAP RPA Playbook Demo Desktop flow** and enter a  **Personnel No** that doesn't exist into the **EMPLOYEE ID** field.

    ![Screenshot of the SAP Call ERP function action where a non existing Personnel number in the EMPLOYEE Id field has been entered ](media/SAP-call-ERP-function-action-non-existing-personnel-number.png)

1. Select **Save** and then **Test** to test your flow with the non-existent **Personnel no**.

1. The resulting flow run should look like this.

    ![Screenshot of an unsuccessful cloud flow run ](media/unsuccessful-cloud-flow-run.png)

1. Run another **Test**, this time with a valid **Personnel no**. Confirm that the results look like this now.

    ![Screenshot of a successful cloud flow run ](media/successful-cloud-flow-run.png)

That's it. By incorporating the SAP ERP connector we've made the automation more efficient, intelligent, and end-user friendly.
