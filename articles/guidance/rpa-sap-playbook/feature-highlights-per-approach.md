---
title: VBScript vs Actions for SAP GUI automation with Power Automate | Microsoft Docs
description: There are pros and cons for each approach. Depending on the type of developer you are, you might find that a certain approach fits better your intended use case and skillset.
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

# Feature highlights per approach

As with many other technologies and techniques, there are pros and cons for each approach which are summarized in the table below. Depending on the type of developer you are, you might find that a certain approach fits better your intended use case and skillset.

There will be occasions where combining both techniques will be highly beneficial, like adding a VBScript action with some Excel VBA code to support advanced formatting as part of your action-based automation.

| Feature | VBScript | Actions |
|-------------------------|-------------------------|-------------------------|
| Citizen developer play |  | <ul></br><li></li></br></ul> |
| IT pro and pro developer play | <ul></br><li></li></br></ul> | <ul></br><li></li></br></ul> |
| Faster development | <ul></br><li></li></br></ul> |  |
| Faster execution | <ul></br><li></li></br></ul> |  |
| Lower maintenance | <ul></br><li></li></br></ul> |  |
| Multilevel exception handling support |  | <ul></br><li></li></br></ul> |
| Resilient to UI changes and versioning | <ul></br><li></li></br></ul> | <ul></br><li></li></br></ul> |
| Reusability support | <ul></br><li></li></br></ul> |  |
| Requires individual UI element capturing |  | <ul></br><li></li></br></ul> |
| Requires SAP scripting configurations | <ul></br><li></li></br></ul> | <ul></br><li></li></br></ul> |
| Supports silent and resilient sign-in with sapshcut.exe | <ul></br><li></li></br></ul> | <ul></br><li></li></br></ul> |
| Takes advantage of the SAP internal recording engine | <ul></br><li></li></br></ul> |  |

