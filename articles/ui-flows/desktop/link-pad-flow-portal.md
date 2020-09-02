---
title: Link a Power Automate Desktop flow with a flow | Microsoft Docs
description: Link a Power Automate Desktop flow with a flow in the Power Automate portal
author: msftman
ms.service: flow
ms.topic: article
ms.date: 02/26/2020
ms.author: olmelnyk
ms.reviewer: olmelnyk
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Link a Power Automate Desktop flow with a flow

Go to **flow.microsoft.com** and sign in with your credentials. In Power Automate, select **My flows**. Select **New**, and from the drop-down select **Instant--from blank**.

![alttext](\media\imgname.png)

Enter a name from the flow, otherwise one will be automatically generated, and select **Manually trigger a flow** and then select **Create**.

![alttext](\media\imgname.png)

Select **+ New Step**.

![alttext](\media\imgname.png)

In the **Choose an action** prompt search field, enter **UI flow**. Under **Actions**, select **Run a UI flow (V2)**.

![alttext](\media\imgname.png)

In the action parameters, set Run mode to **Attended - Runs when you're signed in**, and in the UI flow drop-down select **Create a new UI flow**.

![alttext](\media\imgname.png)

Enter a name for the flow and select **Launch app**.

![alttext](\media\imgname.png)

A message from the browser may appear, asking whether to allow flow.microsoft.com to open an application. Allow this action to continue to PAD.

![alttext](\media\imgname.png)

PAD console creates the flow with the selected name and opens the flow designer to edit the new flow.

![alttext](\media\imgname.png)

Optionally, create Input/output variables to pass data back and forth from Power Automate to PAD. In the Variables pane, select **+** to add an input or output variable.

![alttext](\media\imgname.png)

To create an input or output variable, the Edit variable dialog will require filling in the fields as follows:
* Variable type — input or output
* Variable name — the name of the variable in flow designer
* Default value — the value which the variable holds if none is assigned
* Data type — the type of the variable (integer/string/datetime etc.)
* External name — the name used outside flow designer. This is the name that will appear in Power Automate.
* Description — a description of the variable. This is a mandatory field and will appear in Power Automate

![alttext](\media\imgname.png)

Create an Input variable to pass data to PAD from Power Automate. The variable can be used anywhere in the flow.

To pass data to Power Automate from PAD, create an Output variable.

Back in Power Automate, any input variables appear as fields in the UI action.

![alttext](\media\imgname.png)

Output variables from PAD can be used in Power Automate actions.

![alttext](\media\imgname.png)


