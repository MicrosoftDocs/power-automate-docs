---
title: Test a desktop flow with default variable values | Microsoft Docs
description: In this step of the RPA Playbook for SAP GUI Automation with Power Automate tutorial, we'll test a Power Automate Desktop flow by temporarily assigning a default value to the variables.
suite: flow
documentationcenter: na
author: kathyos
editor: ''
ms.custom: guidance

ms.topic: how-to
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/01/2021
ms.author: mapichle
ms.reviewer: angieandrews
---

# Get ready to debug

Before we continue with the primary flow in the Power Automate portal, let's test the flow by temporarily assigning a default value to the variables that we defined earlier.

1. In the **Variables** pane, select **More** (**…**) next to the **AddressType** variable name, and then select **Edit**.

   ![Screenshot of the authoring experience of Power Automate Desktop with a selected variable to be edited.](media/PAD-designer-with-variable-to-be-edited.png)

1. For **Default value**, enter **2** (for example, for a temporary address).
   
1. Select **Update**.

   ![Screenshot of the Edit dialog of the AddressType variable with the default value set to 2.](media/edit-variable-addresstype.png)

1. Repeat steps 1 and 2 for the other 11 variables.

   ![Screenshot of Power Automate Desktop designer window with the Variables pane open and default values added for all the variables.](media/PAD-designer-with-default-values-for-variables.png)

1. Select **Save**, close the confirmation dialog, and then select **Run**.

   ![Screenshot of Power Automate Desktop designer window with the Run button selected.](media/PAD-designer-with-run-button.png)

If you run into an error as your flow is executed for this test run, observe the error status bar in the lower part of the Power Automate Desktop designer and apply the appropriate fix.

>[!IMPORTANT]
>Delete all default values before you leave the desktop flow authoring experience in Power Automate Desktop.

> [!div class="nextstepaction"]
> [Next step: Create the cloud flow to update an address with Power Automate](creating-cloud-flow-to-update-address.md)
