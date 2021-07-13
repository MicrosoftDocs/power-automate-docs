---
title: Introduction to SAP GUI based RPA in Power Automate Desktop  | Microsoft Docs
description: Introduction to SAP GUI based RPA in Power Automate Desktop.
services: ''
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

#  Introduction to SAP GUI based RPA in Power Automate Desktop  

Robotic process automation (RPA) enables you to automate mundane, rules-based tasks. With RPA, you can automate legacy software without APIs, which opens the world of automation to include software that's old or new, on-premises, or in the cloud.

Executives who implemented RPA in their organizations have experienced the positive impact it brings. Increasing the level of automation is a top strategic priority at most organizations.

Many of these of organizations use SAP to manage their finance, supply chain, production, and human resources processes. They are looking for ways to automate their most frequent, mundane, and rules-based tasks. That's exactly what we'll be focusing on in this playbook: SAP GUI automation patterns and best practices using Microsoft Power Automate, Power Automate Desktop, and desktop flows.

[!VIDEO https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Faka.ms%2FAutomateItSAPSeriesVideo5&data=04%7C01%7Cdeonhe%40microsoft.com%7C5d9e1a1e90504e25f88208d941545de3%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637612652903834102%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=2%2BERZyg0CjjcnmT4OP76VDNL4%2F99t22WlxmPc7pT5qM%3D&reserved=0]

## Lifecycle of a typical enterprise RPA bot 

Power Automate empowers everyone to automate while providing security, compliance, and control over the usage and execution of automation across the IT ecosystem, whether on-premises or in the cloud.

This playbook takes you through prototyping the automation of an example SAP scenario. However, it's important to understand that building sophisticated, robust, and impactful RPA solutions that span multiple legacy systems takes time. And, as shown in the following drawing, most of this time is spent on production readiness, including advanced retry and exception handling.

![Diagram showing the total effort to develop a bot  increasing with how sophisticated it is  Make sure the effort is proportional to the bot's R O I ](media/bot-ROI.png)