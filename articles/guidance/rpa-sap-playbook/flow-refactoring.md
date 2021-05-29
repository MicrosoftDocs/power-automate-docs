---
title: Creating a subflow for SAP GUI automation with Power Automate | Microsoft Docs
description: In this step of the RPA Playbook for SAP GUI Automation with Power Automate tutorial, we'll create a modular subflow for our desktop flow. 
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

# A bit of flow refactoring

Now, let's modularize our current flow by moving actions that carry out specific interdependent tasks (e.g. filling out a form) into a new sub flow.

1.  Create a new sub flow, name it **ProcessHRMasterForm** and select **Save**.

![Screenshot of Power Automate Desktop Designer window with Subflows area open  A new subflow is added and named ](media/PAD-designer-with-subflows-area.png)

2.  Go back to the **Main** flow tab and select all actions below (row 4 – 11), then right click and select **Cut**.

![Screenshot of Power Automate Desktop Designer window with rows 4 through 11 selected and then then right click menu open with Cut selected ](media/PAD-designer-with-rows-4-through-11-selected.png)

3.  Go to sub flow tab **ProcessHRMasterForm**, right click and select **Paste**.

![Screenshot of Power Automate Desktop Designer window with ProcessHRMasterForm subflow open in the Subflows tab  and the copied rows pasted in ](media/PAD-designer-with-processHRmasterform.png)

4.  Go back to the **Main** flow tab.

5.  Enter **run sub flow** into the Action search box and drag the **Run subflow** action onto the canvas and select **ProcessHRMasterForm** as **Call subflow** value and select **Save**.

![Screenshot of Power Automate Desktop Designer window with Run subflow being added from the Actions pane ](media/PAD-designer-with-run-subflow.png)

6.  Create another sub flow, name it **ProcessEmployeeAddressForm** and select **Save**.

![Screenshot of Power Automate Desktop Designer window with Subflows area open  A new subflow is added and named ](media/PAD-designer-with-processemployeeaddress-subflow.png)

7.  Go back to the **Main** flow tab.

8.  On the **Main** flow tab mark all actions below (row 4 – 14), the right click and select **Cut**.

![Screenshot of Power Automate Desktop Designer window with rows 4 through 14 selected and then then right click menu open with Cut selected ](media/PAD-designer-with-rows-4-through-14-selected.png)

9.  Go to sub flow tab **ProcessEmployeeAddressForm**, right click and select **Paste**.

![Screenshot of Power Automate Desktop Designer window with ProcessEmployeeAddressForm subflow open in the Subflows tab  before the copied rows are pasted in ](media/PAD-designer-with-processemployeeaddress-subflow-before-paste.png)

![Screenshot of Power Automate Desktop Designer window with ProcessEmployeeAddressForm subflow open in the Subflows tab  after the copied rows are pasted in ](media/PAD-designer-with-processemployeeaddress-subflow-after-paste.png)

10. Go back to the **Main** flow tab.

11. Enter **run subflow** into the Action search box and drag the **Run subflow** action onto the canvas and select **ProcessEmployeeAddressForm** as **Call subflow** value and select **Save**.

![Screenshot of Power Automate Desktop Designer window with Run subflow being added from the Actions pane ](media/PAD-designer-with-run-subflow-processemployeeaddress.png)
