---
title: Trigger a Power Automate Desktop flow from another flow | Microsoft Docs
description: Link a Power Automate Desktop flow with a cloud flow in the Power Automate portal
author: olegmelnykov
ms.service: flow
ms.topic: article
ms.date: 09/22/2020
ms.author: olmelnyk
ms.reviewer: olmelnyk
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---


# Trigger a Power Automate Desktop flow from another flow


## Prerequisites

- You need the [on-premises data gateway](https://go.microsoft.com/fwlink/?LinkID=820580&clcid=0x409) for your device to have the desktop flow triggered by Power Automate.
   
   The gateway is an enterprise-grade secure connection between Power Automate and your device (where your UI flow runs). Power Automate uses the gateway to access your on-premises device so that it can trigger your UI flows from an event, schedule, or button.
- A work or school account. 

   >[!IMPORTANT]
   >You must use the same work or school account to set up the gateway, to sign into Power Automate, and to log into your Windows device.
   

1. Go to **flow.microsoft.com** and sign in with your credentials. In Power Automate, select **My flows**. Select **+ New flow**, and from the drop-down select **Instant cloud flow**.

   ![my flows instant blank](\media\link-pad-flow-portal\my-flows-instant-blank.png)

1. Enter a name for the cloud flow, otherwise one will be automatically generated. Select **Manually trigger a flow** and then select **Create**.

   ![manually trigger flow](\media\link-pad-flow-portal\manually-trigger-flow.png)

1. Select **+ New Step**.

   ![new step](\media\link-pad-flow-portal\new-step.png)

1. In the **Choose an action** prompt search field, enter **power automate desktop**. Under **Actions**, select **Run a flow built with Power Automate Desktop**.

   ![action search](\media\link-pad-flow-portal\action-search.png)

1. In the action parameters, set Run mode to **Attended - Runs when you're signed in**, and in the desktop flow drop-down select **Create a new desktop flow**.

   ![run desktop flow power automate desktop action properties](\media\link-pad-flow-portal\run-desktop-flow-v2-action-properties.png)

1. Enter a name for the desktop flow and select **Launch app**.

   ![build desktop flow dialog](\media\link-pad-flow-portal\build-desktop-flow-dialog.png)

1. A message from the browser may appear, asking whether to allow flow.microsoft.com to open an application. Allow this action to continue to Power Automate Desktop.

   ![browser open application](\media\link-pad-flow-portal\browser-open-application.png)

1. The Power Automate Console creates a desktop flow with the selected name and opens the flow designer to edit the new flow.

   ![flow designer blank](\media\link-pad-flow-portal\flow-designer-blank.png)

1. Optionally, create Input/output variables to pass data back and forth from Power Automate to Power Automate Desktop. In the Variables pane, select **+** to add an input or output variable.

   ![new input output var](\media\link-pad-flow-portal\new-input-output-var.png)

1. To create an input or output variable, the Edit variable dialog box will require filling in the fields as follows:
   * Variable type—input or output
   * Variable name—the name of the variable in flow designer
   * Default value—the value which the variable holds if none is assigned
   * Data type—the type of the variable (integer, string, datetime, and so on.)
   * External name—the name used outside flow designer. This name appears in Power    Automate.
   * Description—a description of the variable. This mandatory field appears in Power Automate

   ![add new input var](\media\link-pad-flow-portal\add-new-input-var.png)

1. Create an Input variable to pass data from Power Automate to Power Automate Desktop. The variable can be used anywhere in the desktop flow.

1. To pass data from Power Automate Desktop to Power Automate, create an Output variable.

1. Back in Power Automate, any input variables appear as fields in the UI action.

   ![run desktop flow power automate desktop action properties 2](\media\link-pad-flow-portal\run-desktop-flow-v2-action-properties-2.png)

1. Output variables from Power Automate Desktop can be used in other Power Automate actions.


