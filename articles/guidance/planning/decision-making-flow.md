---
title: Flowchart to help you decide how to design your automation in Power Automate | Microsoft Docs
description: This article shows a flowchart that you can use to determine how to architect your automation.
author: taiki-yoshida
ms.service: flow
ms.topic: conceptual
ms.custom: guidance
ms.date: 12/05/2020
ms.author: tayoshi
ms.reviewer: kathyos

---

# Decision-making flowchart for your design

Based on the design considerations mentioned previously in this section, this flowchart can help you determine how to architect your automation.<!--note from editor: This must be a worst case for alt text! Please check it over carefully.-->
<!--
![Decision-making flowchart for your design](media/decision-making-flow.png "Decision-making flowchart for your design")-->
<!--tayoshi: Checked. Looks great! Thank you-->
:::image type="complex" source="media/decision-making-flow.png" alt-text="Decision-making flowchart for your design":::
   From Start, an arrow leads to the decision "Connectors are available." From "Connectors are available," Yes leads to the decision "Is run on a schedule" and No leads to the decision "Have a developer who can create connector." From "Is run on a schedule," Yes leads to the endpoint "Automation using connectors with scheduled triggers", and No leads to another decision, "Is run based on events of other systems." From "Is run based on events of other systems," No leads to the endpoint "Automation using connectors with instant triggers" and Yes leads to the endpoint "Automation using connectors with automated triggers." From "Have a developer who can create connector," Yes leads to the endpoint "Automation using custom connector" and No leads to the endpoint "Automation using UI flows." 
:::image-end:::
