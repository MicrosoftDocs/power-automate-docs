---
title: RPA Playbook for SAP GUI Automation with Power Automate | Microsoft Docs
description: This playbook includes prerequisites, patterns and best practices for SAP GUI based automation leveraging Power Automate and Power Automate Desktop.
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


# RPA Playbook for SAP GUI Automation with Power Automate: Cloud flows, Desktop flows, and Power Automate Desktop

## Summary

This playbook includes prerequisites, patterns and best practices for SAP GUI based automation leveraging Power Automate and Power Automate Desktop.

**Author**: Apostolis Papaioannou

Principal Program Manager

Microsoft

**Published**: October 2020

**Version:** 1.2

This document is provided "as-is." Information and views expressed in this document, including URL and other Internet Web site references, may change without notice. You bear the risk of using it. Some examples are fictitious and are for illustration only. No real association is intended or inferred. This document does not provide you with any legal rights to any intellectual property in any Microsoft product.

© 2021 Microsoft Corporation. All rights reserved. 

Table of Contents

[1 Introduction 2](introduction.md)

[1.1 Lifecycle of a typical enterprise RPA bot 2](#lifecycle-of-a-typical-enterprise-rpa-bot)

[2 Prerequisites 2](#prerequisites)

[2.1 License requirements 2](#license-requirements)

[2.2 Software prerequisites 2](#software-prerequisites)

[2.3 SAP GUI scripting configurations 2](#sap-gui-scripting-configurations)

[2.4 Azure Key Vault credentials (optional) 2](#azure-key-vault-credentials-optional)

[3 Core Components 2](#core-components)

[3.1 Power Automate 2](#power-automate)

[3.2 Desktop flows 2](#desktop-flows)

[3.3 Power Automate Desktop 2](#power-automate-desktop)

[3.4 On-premises data gateway 2](#on-premises-data-gateway)

[4 Sample SAP scenario for this tutorial 2](#sample-sap-scenario-for-this-tutorial)

[5 VBScript-based SAP GUI automation 2](#vbscript-based-sap-gui-automation)

[5.1 Reviewing the generated code 2](#reviewing-the-generated-code)

[5.2 Adding variables to your VBScript 2](#adding-variables-to-your-vbscript)

[5.3 Creating SAP Desktop flow with Power Automate Desktop 2](#creating-sap-desktop-flow-with-power-automate-desktop)

[5.4 Creating the cloud flow with the Power Automate portal 2](#creating-the-api-flow-with-the-power-automate-portal)

[5.5 Optional – Data pre-validation using the Power Automate SAP ERP (Preview) connector 2](#optional-–-data-pre-validation-using-the-power-automate-sap-erp-preview-connector)

[6 Action-based SAP GUI automation – using manually defined actions 2](#action-based-sap-gui-automation-–-using-manually-defined-actions)

[6.1 Creating an SAP Desktop flow with Power Automate Desktop 2](#creating-an-sap-desktop-flow-with-power-automate-desktop)

[6.2 A bit of flow refactoring 2](#a-bit-of-flow-refactoring)

[6.3 Getting ready to debug 2](#getting-ready-to-debug)

[6.4 Creating the cloud flow with Power Automate 2](#creating-the-api-flow-with-power-automate)

[7 Action-based SAP GUI automation – using the built-in desktop recorder 2](#action-based-sap-gui-automation-–-using-the-built-in-desktop-recorder)

[8 Extracting information from SAP GUI UI 2](#extracting-information-from-sap-gui-ui)

[8.1 Pro-code approach 2](#pro-code-approach)

[8.1 Low-code approach 2](#low-code-approach)

[9 Feature highlights per approach 2](#feature-highlights-per-approach)

[10 Conclusion 2](#conclusion)

Version history

| Version | Change log | Date |
|-------------------------|-------------------------|-------------------------|
| 1.0 | Initial version | Oct 14 2020 |
| 1.1 | <ul></br><li>Alt Text added to images and minor text changes</li></br><li>Introduced Section 7 "Action-based SAP GUI automation – using the built-in desktop recorder"</li></br></ul> | Oct 27 2020 |
| 1.2 | <ul></br><li>Flow renaming from UI flow to Desktop flow, numbering fixes, screenshot updates reflecting latest release and introduced [section 8](#extracting-information-from-sap-gui-ui) that shows how to extract status text from SAP GUI during flow processing.</li></br></ul> | Mar 22 2021 |

