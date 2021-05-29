---
title: Testing a Power Automate Desktop flow run with default variable values | Microsoft Docs
description: In this step of the RPA Playbook for SAP GUI Automation with Power Automate tutorial, we'll test a Power Automate Desktop flow by temporarily assigning a default value to the variables.
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

# Getting ready to debug

Before we continue with the primary flow in the Power Automat portal, let's test run our flow in by **temporarily** assigning a **default value** to the variables defined earlier.

1.  In the Variables pane, select the **…** next to the **AddressType** variable name and then **Edit.**

![Screenshot of the authoring experience of Power Automate Desktop with a selected variable to be edited ](media/PAD-designer-with-variable-to-be-edited.png)

2.  Enter a **Default value** (e.g. 2 for Temporary Address) and select **Update**.

![Screenshot of the Edit dialog of the AddressType variable with a Default value being set to 2 ](media/edit-variable-addresstype.png)

3.  Repeat steps 1-2 for the **other 11** variables as well.

![Screenshot of Power Automate Desktop Designer window with the Variables pane open and default values added for all the variables ](media/PAD-designer-with-default-values-for-variables.png)

4.  Select **Save**, close the confirmation dialog, and then select **Run**.

![Screenshot of Power Automate Desktop Designer window with the Run button selected ](media/PAD-designer-with-run-button.png)

This will execute your flow. If you run into an error during execution, make sure you observe the error status bar in the lower part of the Power Automate Desktop designer and apply the appropriate fix.

**IMPORTANT:** Delete all previously defined default values before you leave the Desktop flow authoring experience in Power Automate Desktop!