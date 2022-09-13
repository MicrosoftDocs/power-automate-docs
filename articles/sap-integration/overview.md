---
title: Overview of SAP integration with Power Platform (preview)
description: Learn about the SAP integration with Power Platform, and the capabilities of the SAP connector working with Power Automate.
services: ''
suite: flow
documentationcenter: na
author: EllenWehrle
manager: jongilman
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/19/2022
ms.author: ellenwehrle
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Overview of SAP integration with Power Platform (preview)

[This article is pre-release documentation and is subject to change.]

SAP ERP is enterprise resource planning software developed by SAP SE. SAP ERP is a centralized system of record that enables many departments within an organization to manage data.

 SAP Integration offers enhanced connectivity capabilities with SAP ERP and a prebuilt solution supported by Power Apps, Power Automate, and Azure Logic Apps. The prebuilt solution offers a streamlined view of SAP ERP's core business functions while automating the workflows behind the scenes.

## What's new?

### SAP ERP connector enhancements

The SAP ERP (V2) (preview) connector has been updated with the following improvements:

- RFC Call now uses environment variables for system connection credentials
- New RFC Call message server support
- New action screens allow connection parameter input
- New Parse RFC Read Table action
- Distinction now maintained between required and optional parameters
- SAP BAPIs/functions with over 1000 parameters now properly render


### Prebuilt solution

A prebuilt solution that works with SAP ERP's sales and purchasing workflows. The prebuilt solution is designed to enable organizations to efficiently get connected to and communicate with their SAP system. The public preview prebuilt solution contains the following:

- Power Apps templates
- Power Automate flows
- Additional components and new technical features

Learn more at [Prebuilt solution available for integrating SAP with Power Platform](solutions.md).

## What value will SAP Integration add?

SAP integration with the Power Platform will help your organization achieve the following:

- Accelerated automation
- Enhanced employee productivity and collaboration
- Intelligent insights

## Get started

1. Complete the [public preview signup form](<https://aka.ms/PowerAutomate-SAPIntegration-Signup>). Completing the form may give you access to the team that works on the SAP Integration.

1. Assemble a team of IT administrators to prepare for and set up the SAP ERP integration with Power Platform. [set up and prepare](set-up-prepare.md) the required infrastructure.
2. A maker sets up Power Apps with the following:  

- An appropriate environment 
- The Microsoft Dataverse connector
- The SAP ERP connector