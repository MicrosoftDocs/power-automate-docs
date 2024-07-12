---
title: Rebind reports without using a composite model
description: Learn how to rebind reports without using a composite model with different workspaces or the same workspace.
author: donums
contributors:
  - donums
  - v-aangie  
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/11/2024
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Rebind with composite model

To transfer the composite model of your Process Mining report from one workspace to another, follow the steps in this article. Learn more about composite models in [Use composite models in Power BI Desktop](/power-bi/transform-model/desktop-composite-models) and [Customize reports in power BI workspace](process-mining-pbi-workspace.md#customize-reports-in-power-bi-workspace).

## With two different workspaces

If you linked your process in the Test environment to a workspace (for example, WkSpace B) that's different from the one used by the process in the Dev environment (for example, WkSpace A), follow the steps in this section.

1. In the **Environments** dropdown menu at the top of the screen, select your Test environment.
1. On the navigation pane to the left, select **Process mining**.

    If your process was newly copied over to the Test environment, there's an exclamation mark inside a speech bubble on the process. This mark indicates that the process was imported.

    :::image type="content" source="media/process-mining-alm-rebind-without-comp/speech-bubble.png" alt-text="Screenshot of your process on the Process Mining home page.":::

If your process was newly copied to the Test environment, you will see an exclamation mark on the process. This just means that the process was imported. Select the process then select Confirm. If your process was not newly copied skip to step 4.



