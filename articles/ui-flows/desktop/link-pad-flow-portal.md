---
title: Trigger a Power Automate Desktop flow from another flow | Microsoft Docs
description: Link a Power Automate Desktop flow with a flow in the Power Automate portal
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

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

Go to **flow.microsoft.com** and sign in with your credentials. In Power Automate, select **My flows**. Select **New**, and from the drop-down select **Instant--from blank**.

![my flows instant blank](\media\link-pad-flow-portal\my-flows-instant-blank.png)

Enter a name from the flow, otherwise one will be automatically generated. Select **Manually trigger a flow** and then select **Create**.

![manually trigger flow](\media\link-pad-flow-portal\manually-trigger-flow.png)

Select **+ New Step**.

![new step](\media\link-pad-flow-portal\new-step.png)

In the **Choose an action** prompt search field, enter **UI flow**. Under **Actions**, select **Run a flow built by Power Automate Desktop (preview)**.

![action search](\media\link-pad-flow-portal\action-search.png)

In the action parameters, set Run mode to **Attended - Runs when you're signed in**, and in the UI flow drop-down select **Create a new UI flow**.

![run ui flow power automate desktop action properties](\media\link-pad-flow-portal\run-ui-flow-v2-action-properties.png)

Enter a name for the flow and select **Launch app**.

![build ui flow dialog box](\media\link-pad-flow-portal\build-UI-flow-dialog.png)

A message from the browser may appear, asking whether to allow flow.microsoft.com to open an application. Allow this action to continue to Power Automate Desktop.

![browser open application](\media\link-pad-flow-portal\browser-open-application.png)

The Power Automate Console creates the flow with the selected name and opens the flow designer to edit the new flow.

![flow designer blank](\media\link-pad-flow-portal\flow-designer-blank.png)

Optionally, create Input/output variables to pass data back and forth from Power Automate to Power Automate Desktop. In the Variables pane, select **+** to add an input or output variable.

![new input output var](\media\link-pad-flow-portal\new-input-output-var.png)

To create an input or output variable, the Edit variable dialog box will require filling in the fields as follows:
* Variable type—input or output
* Variable name—the name of the variable in flow designer
* Default value—the value which the variable holds if none is assigned
* Data type—the type of the variable (integer, string, datetime, and so on.)
* External name—the name used outside flow designer. This name appears in Power Automate.
* Description—a description of the variable. This mandatory field appears in Power Automate

![add new input var](\media\link-pad-flow-portal\add-new-input-var.png)

Create an Input variable to pass data to Power Automate Desktop from Power Automate. The variable can be used anywhere in the flow.

To pass data to Power Automate from Power Automate Desktop, create an Output variable.

Back in Power Automate, any input variables appear as fields in the UI action.

![run ui flow power automate desktop action properties 2](\media\link-pad-flow-portal\run-ui-flow-v2-action-properties-2.png)

Output variables from Power Automate Desktop can be used in other Power Automate actions.


