---
title: VBScript-based SAP GUI automation | Microsoft Docs
description: Use the VBScript that the SAP GUI automation engine generates in Power Automate Desktop actions.
suite: flow
documentationcenter: na
author: kathyos
editor: ''
ms.custom: guidance

ms.topic: overview
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/01/2021
ms.author: kathyos
ms.reviewer: angieandrews
---

# Pro-code RPA with SAP GUI in Power Automate Desktop 

The VBScript-based approach is well-suited for RPA Center of Excellence (CoE) teams because they typically consist of a mix of IT pros, pro developers, security specialists, and business analysts whose charter is to create, maintain, secure, and scale enterprise automation solutions across the organization. With these diverse skill sets, they can pursue more complex SAP GUI automation techniques than those that citizen RPA developers undertake.

One of these techniques involves using VBScript to interact with the underlying [SAP GUI Scripting API](https://help.sap.com/viewer/b47d018c3b9b45e897faf66a6c0885a8/760.03/babdf65f4d0a4bd8b40f5ff132cb12fa.html). In fact, SAP includes its own proprietary SAP GUI automation engine that generates VBScript output that's based on user interactions that are captured during screen recording.

The good news is that you can use the VBScript that the SAP GUI automation engine generates in a Power Automate Desktop action. To use this VBScript, all you have to do is to replace the manually entered text that was captured during recording with dynamic inputs in Power Automate Desktop. 

Take a look at this video ([episode 8](https://www.youtube.com/watch?v=b9TUrVtcUhA&list=PLi9EhCY4z99W9D8zAMd0Ej5kNOI_4mfkC&index=8) of the series) to learn more about the pro-code approach for automating SAP GUI-based applications:

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=71b48d1b-f69d-4bb5-93e9-c10cc3668c89]

> [!div class="nextstepaction"]
> [Next step: Record VBScript with the SAP GUI automation engine](recording-vbscript-using-sap-gui-automation-engine.md)
