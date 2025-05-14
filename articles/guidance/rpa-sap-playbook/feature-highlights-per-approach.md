---
title: VBScript vs. actions for SAP GUI automation | Microsoft Docs
description: There are pros and cons for each approach. Depending on the type of developer you are, you might find that a certain approach is a better fit with your intended use case and skill set.
suite: flow
documentationcenter: na
author: kathyos
editor: ''
ms.custom: guidance

ms.topic: concept-article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/01/2021
ms.author: mapichle
ms.reviewer: angieandrews
---

# Summary of the benefits of VBScript vs. actions for SAP GUI automation

As with many other technologies and techniques, there are pros and cons for each approach. Depending on the type of developer you are, you might find that a certain approach better fits your intended use case and skill set.

There will be occasions when combining both techniques will be beneficial, like adding a VBScript action with some Excel VBA code to support advanced formatting as part of your action-based automation.

Here's a summary of the two approaches.

| Feature | VBScript | Actions |
|-------------------------|-------------------------|-------------------------|
| Citizen developer play |  | ![Yes](media/green-checkmark.png) |
| IT pro and pro developer play | ![Yes](media/green-checkmark.png) | ![Yes](media/green-checkmark.png) |
| Faster development | ![Yes](media/green-checkmark.png) |  |
| Faster execution | ![Yes](media/green-checkmark.png) |  |
| Lower maintenance | ![Yes](media/green-checkmark.png) |  |
| Multilevel exception-handling support |  | ![Yes](media/green-checkmark.png) |
| Resilient to UI changes and versioning | ![Yes](media/green-checkmark.png) | ![Yes](media/green-checkmark.png) |
| Reusability support | ![Yes](media/green-checkmark.png) |  |
| Requires individual UI element capturing |  | ![Yes](media/green-checkmark.png) |
| Requires SAP scripting configurations | ![Yes](media/green-checkmark.png) | ![Yes](media/green-checkmark.png) |
| Supports silent and resilient sign-in with sapshcut.exe | ![Yes](media/green-checkmark.png) |
| Takes advantage of the SAP internal recording engine | ![Yes](media/green-checkmark.png) |  |


> [!div class="nextstepaction"]
> [Next step: Conclusion of RPA Playbook for SAP GUI automation tutorial with Power Automate](conclusion.md)
