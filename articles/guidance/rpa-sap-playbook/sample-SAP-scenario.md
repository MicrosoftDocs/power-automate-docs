---
title: Example scenario for SAP GUI Automation with Power Automate | Microsoft Docs
description: Explanation of the fictitious example used as the base for our RPA SAP automation tutorials.
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

# Sample SAP scenario for this tutorial

We've provided the following simplified fictitious example, which we'll use as the base for our automation tutorials.

Let's say your organization doesn't have any employee self-service functionality today, but you want to allow employees to submit a secondary address through a manually triggered flow that will insert the respective address record in the employee's personnel record.

![Diagram of the example automation where the employee triggers an cloud flow  the cloud flow gets the secrets from Azure Key Vault and starts the UI flow  the UI flow uses RPA to automate a new address in SAP  and the cloud flow emails a status message back to the employee ](media/diagram-example-automation.png)

Your HR department has provided you with the exact steps you would have to follow when processing the address addition in SAP manually.

These are the steps:

1.  Enter transaction code **PA30** and press **Enter**.

2.  Select or enter the **Personnel no.** of the employee.

3.  In tab **Basic personal data** enter **0006** (= Addresses) as **Infotype, 2** (= Temporary Address) as **STy** and a date value into the Period **From** field.

4.  Select **Create (F5)** button on the upper toolbar.

5.  In the opened form **Create Addresses**, fill in all relevant address fields such as **Address line 1, City, ZipCode, State** etc.

6.  Select **Save (Ctrl+S)** in the upper toolbar.

7.  Back in the **Maintain HR Master Data** form, select **Back (F3)** to return to the starting point of your process recording.

8.  Optionally, log off from SAP and close all SAP windows.
