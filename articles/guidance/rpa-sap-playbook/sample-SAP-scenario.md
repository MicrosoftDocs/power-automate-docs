---
title: Automate SAP GUI with Power Automate | Microsoft Docs
description: This is the initial example for the RPA SAP automation tutorials.
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

# Automate SAP GUI for this tutorial

We've provided the following simplified example, which we'll use as the base for our automation tutorials.

Let's say your organization doesn't have an employee self-service functionality, but you want to allow employees to submit a secondary address through a flow that they manually trigger to add a second address to their personnel profile.

   ![A diagram of the sample automation where the employee triggers an cloud flow. The cloud flow gets the secrets from Azure Key Vault and then starts the desktop flow. The desktop flow uses RPA to add a new address in SAP. The cloud flow emails a status message to the employee after it completes. ](media/diagram-example-automation.png)

>[!NOTE]
>Your HR department can provide you with the exact steps for you to follow to add the second address to SAP manually.

These are the steps:

1.  Enter the transaction code **PA30**, and then select **Enter**.

1.  Select or enter the **Personnel no .** for the employee.

1.  In the **Basic personal data** tab, enter **0006** (= Addresses) as **Infotype, 2** (= Temporary Address) as **STy** and a date value into the Period **From** field.

1.  Select the **Create (F5)** button on the upper toolbar.

1.  In the opened **Create Addresses** form, provide all relevant address fields such as **Address line 1, City, ZipCode, State**, etc.

1.  Select **Save (Ctrl+S)** on the upper toolbar.

1.  On the **Maintain HR Master Data** form, select **Back (F3)** to return to the starting point of your process recording.

1.  Optionally, log off from SAP and close all SAP windows.
