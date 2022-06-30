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

> [!IMPORTANT]
> Gateways for desktop flows will be deprecated soon (June 30th) except for China region. Start to switch to our machine-management capabilities. [Learn more](manage-machines.md#switch-from-gateways-to-direct-connectivity).

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

1. In the **Choose an action** prompt search field, enter **Power Automate for desktop**. Under **Actions**, select **Run a flow built with Power Automate for desktop**.

   ![Screenshot of the Run a flow built with Power Automate Desktop action.](media\link-pad-flow-portal\action-search.png)

1. In the action parameters, set Run mode to **Attended - Runs when you're signed in**, and in the desktop flow drop-down select **Create a new desktop flow**.

   ![Screenshot of the fields of the Run a flow built with Power Automate Desktop action.](media\link-pad-flow-portal\run-desktop-flow-v2-action-properties.png)

1. Enter a name for the desktop flow and select **Launch app**.

   ![Screenshot of the Build a desktop flow dialog.](media\link-pad-flow-portal\build-desktop-flow-dialog.png)

1. A message from the browser may appear, asking whether to allow flow.microsoft.com to open an application. Allow this action to continue to Power Automate for desktop.

   ![Screenshot of a browser message asking whether to open an application.](media\link-pad-flow-portal\browser-open-application.png)

1. The Power Automate Console creates a desktop flow with the selected name and opens the flow designer to edit the new flow.

   ![Screenshot of the flow designer.](media\link-pad-flow-portal\flow-designer-blank.png)

1. Optionally, create input/output variables to pass data back and forth from the Power Automate web portal to your desktop flow. In the Variables pane, select **+** to add an input or output variable.

   ![Screenshot of the option to create a new input variable.](media\link-pad-flow-portal\new-input-output-var.png)

1. To create an input or output variable, the **New input/output variable** dialog requires filling in the fields as follows:

   - **Variable name**: The name of the variable in the flow.
   - **Data type**: The type of the variable: [text](variable-data-types.md#text-value), [number](variable-data-types.md#numeric-value), [boolean](variable-data-types.md#boolean-value), [custom object](variable-data-types.md#custom-object), [list](variable-data-types.md#list) or [datatable](variable-data-types.md#datatable).
   - **Default value**: The default value when the flow runs from the Power Automate flow designer or the Power Automate console.
   - **External name**: The name of the variable used outside the flow designer. The external name is the name that will appear in the cloud or desktop flow designer while calling the flow.
   - **Description**: A description of the variable that will appear in the cloud or desktop flow designer while calling the flow.
   - **Mark as sensitive**: Defines whether to mark the variable as sensitive or not. You can find information regarding senstive variables in [Sensitive variables](manage-variables.md#sensitive-variables).

   ![Screenshot of the Add a new input variable dialog.](media\link-pad-flow-portal\add-new-input-var.png)

1. Create an input variable to pass data from cloud flows to your desktop flow. The variable can be used anywhere in the desktop flow.

1. To pass data from your desktop flow to a cloud flow, create an output variable.

1. Back in the Power Automate portal, any input variables appear as fields in the **Run a flow built with Power Automate for desktop** action.

   > [!NOTE]
   > If an input variable contains sensitive data, you may want to obfuscate or omit it from the logs. To find more information regarding sensitive text inputs, refer to [Manage sensitive input like passwords](../how-tos-use-sensitive-input.md).

   ![Screenshot of the input variables in the Run a flow built with Power Automate for desktop action.](media\link-pad-flow-portal\run-desktop-flow-v2-action-properties-2.png)

1. Output variables from desktop flows can be used in most cloud flow actions.




[!INCLUDE[footer-include](../includes/footer-banner.md)]