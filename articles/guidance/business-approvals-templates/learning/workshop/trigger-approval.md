---
title: Approvals Kit workshop trigger approval | Microsoft Learn
description: Approvals Kit workshop trigger approval
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 11/10/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Triggering a defined Approval

The prior [First approval module](./first-approval.md) provided tasks and steps required to create a Contoso Coffee machine request and a simple Approval workflow that when triggered will send an Approval to you for approval. This module extended this functionality by using a Power Automate Cloud flow to begin a business approval process when a Machine Request is created in Dataverse.

## Task 1 - Creating a solution

The first task is to create a Power Platform solution to create a container to you to group your related Platform resources together.

> NOTE: If solutions are a new concept for you, the [Solution Overview](/power-apps/maker/data-platform/solutions-overview) and [Solution Concepts](/power-platform/alm/solution-concepts-alm) provides some further reading.

1. Sign in to [Power Apps](https://make.powerapps.com)

1. Select the assigned Approvals Kit environment for this workshop content

1. Select Solutions from the left navigation. If the item isn’t in the left navigation pane, select **… More** and then select Solutions.

1. Select **New Solution**

1. Enter a Solution display name. For example Contoso Coffee Approvals.

1. Select a publisher. You can either create a new publisher or select one of the existing publishers for your environment.

> The Power Apps create solution guidance includes information on the [Solution Publisher](/power-apps/maker/data-platform/create-solution#solution-publisher). On how to select or create a solution publisher.

1. Select **Create**.

1. Wait for your solution to be created.

## Task 2 - Creating Cloud Flow

In your created solution perform these steps:

1. Select **New** > **Automation** > **Cloud flow** > **Automated**

> For more guidance on create a Cloud flow with solutions you can reference [Create a cloud flow in a solution](/create-flow-solution).

1. Enter Flow name of **Machine request**

1. Search for trigger by entering **Dataverse** to choose your trigger

1. Select trigger **When a row is added, modified or deleted (Microsoft Dataverse)**

1. Select **Create**.

1. Select change type of **Added**.

1. Select Table name of **Machine Orders**.

1. Select the scope of the change. For example **Organization** read more on [Scope](/dataverse/create-update-delete-trigger#scope)

> NOTE: For more information on Datavere trigger parameters you can reference [Trigger flows when a row is added, modified, or deleted](/dataverse/create-update-delete-trigger)

  > [!div class="mx-imgBorder"]
  ![Screenshot of Power Automate Dataverse trigger when Machine Order is Added](./media/power-automate-cloud-flow-dataverse-trigger.png)

1. Select **New Step**.

1. Select **Custom** tab.

1. Select **Start business approval process** action.

  > [!div class="mx-imgBorder"]
  ![Screenshot of adding Approvals kit start business approvals process inside Power Automate Cloud Flow](./media/power-automate-approvals-kit-custom-connector.png)

1. Select the workflow process that you published in the [First Approval](./first-approval.md) module.

  > [!div class="mx-imgBorder"]
  ![Screenshot of adding Approvals kit start business approvals process inside Power Automate Cloud Flow](./media/power-automate-approvals-kit-connector-select-workflow.png)

1. Select **Save**

## Task 3 - Creating a new Machine Request

Now that a cloud flow trigger has been defined for the **Machine Order** table peform these steps to create a new Machine request that should trigger an Approval workflow.

1. Select **Apps** and select the **Machine Ordering App**

  > [!div class="mx-imgBorder"]
  ![Screenshot of starting the Contoso Coffee Machine Ordering app](./media/machine-ordering-app-play.png)

1. If prompted select Allow for the Office 365 users connector.

  > [!div class="mx-imgBorder"]
  ![Screenshot of Power Platform Office 365 USers connection consent dialog](./media/office-365-users-connection-allow.png)

1. Select a few machines and click **Compare**.

  > [!div class="mx-imgBorder"]
 ![Screenshot of Contoso Coffee Machine Ordering app with multiple machines selected](./media/contoso-coffee-select-machines.png)

1. Select one of the machines and select **Submit**

  > [!div class="mx-imgBorder"]
 ![Screenshot of Contoso Coffee Machine Ordering app for submit screen request](./media/contoso-coffee-submit-request.png)

1. Select OK to close the submitted Machine Request

  > [!div class="mx-imgBorder"]
  ![Screenshot of Contoso Coffee Machine Ordering app for submit screen request](./media/contoso-coffee-submitted-request.png)

1. Close the application.

## Task 4 - Approve the request

After submitting the Machine request the cloud flow should be triggered and begin your defined business approval process. Use these steps to approve the request in the Power Automate web portal.

> NOTE: This workshop guide performs in the Approval inside the Power Automate Portal. If the user is configured with an Office 365 license the the approval will also be available via Outlook or in [Microsoft Teams](/teams/native-approvals-in-teams).

1. Open the [Power Automate Portal](https://make.powerautomate.com)

1. Select the assigned Approvals Kit environment for this workshop content.

1. From the left navigation select **Approvals**.

1. Wait for the approval to be sent.

1. Select the received approval.

1. Select **Approve**.

  > [!div class="mx-imgBorder"]
 ![Screenshot of selecting an Approval in the Power Automate web portal](./media/power-automate-approvals-select.png)

1. Select **Confirm** to approve the approval.

  > [!div class="mx-imgBorder"]
  ![Screenshot of selecting an Approval in the Power Automate web portal](./media/power-automate-approvals-approve-confirm.png)

1. Select **Done** to close the Approval once confirmed.

## Task 5 - View the Completed Approval

In this task use the Business Approval Management application of the Approvals Kit to view the updated status of the approved request.

1. Select **Solutions** from the left navigation of the Power Automate web portal

1. Select **Business Approval Kit** from the list of solution

1. Select **Apps** from the Objects navigation item

1. Select **Business Approval Management** from the list of apps.

1. Select the **...** next to the application name and select **Play**.
  
1. Select **Approval Instances** from the left navigation.

1. Select the completed approval.

  > [!div class="mx-imgBorder"]
  ![Screenshot of active Business Approval Instances](./media/business-approval-management-approval-instances.png).

1. Review the details and outcome of the Approval

  > [!div class="mx-imgBorder"]
  ![Screenshot of active Business Approval Details view](./media/business-approval-management-approval-instance-info.png).

## Summary

In this module we combined the Contoso Coffee Machine Request solution with the business approval created in the [First approval](./first-approval.md) module. A Power Automate Cloud flow was created combing a Dataverse trigger for the Machine Order table and the Approvals kit connector to begin a selected business approval process.

The **Business Approval Manager** application was used to view the results of the completed Business Approval. If there was an error in the process or the stage was not completed the Instance status would be **Running** or **Error**.
