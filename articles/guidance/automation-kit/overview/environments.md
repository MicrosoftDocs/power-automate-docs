---
title: Overview of the Automation kit Environments | Microsoft Docs
description: Overview of the Automation kit Environments.
suite: flow
documentationcenter: na
author: grarchib
manager: marcsc
editor: ''
ms.custom: guidance

ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/18/2022
ms.author: grarchib
ms.reviewer: deonhe
---

# Main environment / Satellite environments

The concept consists of one main environment and it can utilize multiple satellite environments.

A satellite environment is where the automation projects are developed, tested, and then deployed to production. Here, the production satellite is configured to monitor and meter solutions and solution artifacts that are related to an automation project. After a solution is metered, the automation project is monitored based on the runs (flow sessions) to determine the automation projects estimated money saved and ROI.

The data from the metered solutions syncs to the main environment in near realtime using Power Automate.
