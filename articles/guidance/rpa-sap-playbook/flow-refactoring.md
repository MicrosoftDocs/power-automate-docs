---
title: Create a subflow for SAP GUI automation with Power Automate | Microsoft Docs
description: In this step of the RPA Playbook for SAP GUI Automation with Power Automate tutorial, we'll create a modular subflow for our desktop flow. 
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

# Create a subflow for SAP GUI automation

Now, let's modularize our current flow by moving actions that carry out specific interdependent tasks (in our scenario, filling out a form) into a new subflow.

1. Create a new subflow, name it **ProcessHRMasterForm**, and then select **Save**.

   ![Screenshot of Power Automate Desktop designer window with the Subflows area open and a new subflow added and named.](media/PAD-designer-with-subflows-area.png)

2. Go to the **Main** tab for the **Subflows** area, select the highlighted actions shown in the following image (rows 4 through 11), right-click, and then select **Cut**.

   ![Screenshot of the Power Automate Desktop Designer window with rows 4 through 11 selected and the shortcut menu open with Cut selected.](media/PAD-designer-with-rows-4-through-11-selected.png)

3. Go to the **ProcessHRMasterForm** tab, right-click to select it, and then select **Paste**.

   ![Screenshot of the Power Automate Desktop Designer window with the ProcessHRMasterForm subflow open and the copied rows pasted in.](media/PAD-designer-with-processHRmasterform.png)

4. Go back to the **Main** tab.

5. In the **Actions** search box, enter **run subflow**, and then drag the **Run subflow** action onto the canvas. For **Call subflow**, select **ProcessHRMasterForm**, and then select **Save**.

   ![Screenshot of the Power Automate Desktop designer window with Run subflow being added from the Actions pane.](media/PAD-designer-with-run-subflow.png)

6. Create another subflow, name it **ProcessEmployeeAddressForm**, and then select **Save**.

   ![Screenshot of the Power Automate Desktop designer window with a new subflow named ProcessEmployeeAddressForm.](media/PAD-designer-with-processemployeeaddress-subflow.png)

7. Go back to the **Main** tab.

8. On the **Main** tab, select the highlighted actions shown in the following image (rows 4 through 14), right-click, and then select **Cut**.

   ![Screenshot of the Power Automate Desktop designer window with rows 4 through 14 selected and the shortcut menu open with Cut selected.](media/PAD-designer-with-rows-4-through-14-selected.png)

9. Go to the **ProcessEmployeeAddressForm** tab, right-click to select it, and then select **Paste**.

   ![Screenshot of the Power Automate Desktop designer window with the ProcessEmployeeAddressForm subflow open before the copied rows are pasted in.](media/PAD-designer-with-processemployeeaddress-subflow-before-paste.png)

   ![Screenshot of the Power Automate Desktop designer window with the ProcessEmployeeAddressForm subflow open after the copied rows are pasted in.](media/PAD-designer-with-processemployeeaddress-subflow-after-paste.png)

10. Go back to the **Main** tab.

11. In the **Actions** search box, enter **run subflow**, and then drag the **Run subflow** action onto the canvas. For **Call subflow**, select **ProcessEmployeeAddressForm**, and then select **Save**.

    ![Screenshot of the Power Automate Desktop Designer window with Run subflow being added from the Actions pane after the ProcessHRMasterForm subflow is added.](media/PAD-designer-with-run-subflow-processemployeeaddress.png)

> [!div class="nextstepaction"]
> [Next step: Get ready to debug](getting-ready-to-debug.md)
