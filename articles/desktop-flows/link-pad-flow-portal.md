---
title: Trigger a desktop flow from a cloud flow | Microsoft Docs
description: Link a Power Automate desktop flow with a cloud flow in the Power Automate portal
author: georgiostrantzas

ms.subservice: desktop-flow
ms.topic: article
ms.date: 09/22/2020
ms.author: v-gtrantzas
ms.reviewer: v-gtrantzas
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---


# Trigger a desktop flow from a cloud flow


## Prerequisites

- To trigger desktop flows through Power Automate, you have to use [machines](manage-machines.md) or [machine groups](manage-machine-groups.md). Machines are physical or virtual devices that are used to automate desktop processes. Machine groups allow you to organize multiple machines together to help distribute your automation workload.

   As an alternative to the machines, you can use the [on-premises data gateway](https://go.microsoft.com/fwlink/?LinkID=820580&clcid=0x409). The gateway is an enterprise-grade secure connection between Power Automate and your device. 

- A work or school account. 

   >[!IMPORTANT]
   >You must use the same work or school account to set up the gateway, to sign into Power Automate, and to log into your Windows device.
   

1. Go to **flow.microsoft.com** and sign in with your credentials. In Power Automate, select **My flows**. Select **+ New flow**, and from the drop-down select **Instant cloud flow**.

   ![Screenshot of the option to create an instant cloud flow.](media\link-pad-flow-portal\my-flows-instant-blank.png)

   Alternatively, you can select **Automated cloud flow** to create a flow that is triggered by a specific event, like the creation of a new file in an OneDrive for Business account.

   ![Screenshot of the Build an automated cloud flow dialog.](media\link-pad-flow-portal\automated-cloud-flow.png)

1. Enter a name for the cloud flow, otherwise one will be automatically generated. Select **Manually trigger a flow** and then select **Create**.

   ![Screenshot of the Build an instant cloud flow dialog.](media\link-pad-flow-portal\manually-trigger-flow.png)

1. Select **+ New Step**.

   ![Screenshot of the New step action.](media\link-pad-flow-portal\new-step.png)

1. In the **Choose an action** prompt search field, enter **power automate desktop**. Under **Actions**, select **Run a flow built with Power Automate desktop**.

   ![Screenshot of the Run a flow built with Power Automate Desktop action.](media\link-pad-flow-portal\action-search.png)

1. In the action parameters, set Run mode to **Attended - Runs when you're signed in**, and in the desktop flow drop-down select **Create a new desktop flow**.

   ![Screenshot of the fields of the Run a flow built with Power Automate Desktop action.](media\link-pad-flow-portal\run-desktop-flow-v2-action-properties.png)

1. Enter a name for the desktop flow and select **Launch app**.

   ![Screenshot of the Build a desktop flow dialog.](media\link-pad-flow-portal\build-desktop-flow-dialog.png)

1. A message from the browser may appear, asking whether to allow flow.microsoft.com to open an application. Allow this action to continue to Power Automate for desktop.

   ![Screenshot of a browser message asking whether to open an application.](media\link-pad-flow-portal\browser-open-application.png)

1. The Power Automate Console creates a desktop flow with the selected name and opens the flow designer to edit the new flow.

   ![Screenshot of the flow designer.](media\link-pad-flow-portal\flow-designer-blank.png)

1. Optionally, create Input/output variables to pass data back and forth from the Power Automate web portal to your desktop flow. In the Variables pane, select **+** to add an input or output variable.

   ![Screenshot of the option to create a new input variable.](media\link-pad-flow-portal\new-input-output-var.png)

1. To create an input or output variable, the Edit variable dialog box will require filling in the fields as follows:
   * Variable type—input or output
   * Variable name—the name of the variable in flow designer
   * Default value—the value which the variable holds if none is assigned
   * Data type—the type of the variable (integer, string, datetime, and so on.)
   * External name—the name used outside flow designer. This name appears in Power    Automate.
   * Description—a description of the variable. This mandatory field appears in Power Automate
   * Mark as sensitive-enable this option to set the variable as sensitive and hide its content in the flow designer and the Power Automate logs.

   ![Screenshot of the Add a new input variable dialog.](media\link-pad-flow-portal\add-new-input-var.png)

1. Create an Input variable to pass data from Power Automate web portal to your desktop flow. The variable can be used anywhere in the desktop flow.

1. To pass data from your desktop flow to Power Automate web portal, create an Output variable.

1. Back in Power Automate, any input variables appear as fields in the UI action.

   > [!NOTE]
   > If an input variable contains sensitive data, you may want to obfuscate or omit it from the logs. To find more information regarding sensitive text inputs, refer to [Manage sensitive input like passwords](../how-tos-use-sensitive-input.md).

   ![Screenshot of the input variables in the Run a flow built with Power Automate Desktop action.](media\link-pad-flow-portal\run-desktop-flow-v2-action-properties-2.png)

1. Output variables from desktop flows can be used in other Power Automate actions.




[!INCLUDE[footer-include](../includes/footer-banner.md)]