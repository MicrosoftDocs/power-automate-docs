---
title: Sample automation of SAP GUI with Power Automate | Microsoft Docs
description: This is the initial example for the RPA SAP automation tutorials.
suite: flow
documentationcenter: na
author: kathyos
editor: ''
ms.custom: guidance

ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/01/2021
ms.author: mapichle
ms.reviewer: angieandrews
---

# Sample automation of SAP GUI

We've provided the following simplified example, which we'll use as the base for our automation tutorials.

Let's say your organization doesn't have employee self-service functionality, but you want to allow employees to add a second address to their personnel profile by using a flow that they manually trigger.

![A diagram of the sample automation where the employee triggers a cloud flow. The cloud flow gets the secrets from Azure Key Vault and then starts the desktop flow. The desktop flow uses RPA to add a new address in SAP. After it's completed, the cloud flow emails a status message to the employee.](media/diagram-example-automation.png)

>[!NOTE]
>The following procedure was developed as an example for this playbook. Your HR department can provide you with the exact steps for you to follow to add the second address to SAP.

These are the steps:

1.  Enter the transaction code **PA30**, and then select **Enter**.

1.  Select or enter the **Personnel number** for the employee.

1.  On the **Basic personal data** tab, do the following:

    1. For **Infotype**, enter **0006** (= Addresses).
    1. For **STy**, enter **2** (= Temporary Address).
    1. For **From**, enter a date value.

1.  Select the **Create (F5)** button on the toolbar.

1.  In the opened **Create Addresses** form, provide all relevant address fields, such as **Address line 1**, **City**, **ZipCode**, and **State**.

1.  Select **Save (Ctrl+S)** on the toolbar.

1.  On the **Maintain HR Master Data** form, select **Back (F3)** to return to the starting point of your process recording.

1.  Optionally, sign out of SAP and close all SAP windows.

> [!div class="nextstepaction"]
> [Next step: Pro-code RPA with SAP GUI in Power Automate Desktop](vbscript-based-sap-gui-automation-overview.md)
