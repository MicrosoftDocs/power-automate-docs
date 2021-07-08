---
title: Governance in Power Automate Desktop | Microsoft Docs
description: Governance in Power Automate Desktop.
services: ''
suite: flow
documentationcenter: na
author: mariosleon
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.subservice: desktop-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/02/2021
ms.author: marleon
search.app: 
  - Flow 
search.audienceType: 
  - flowmaker
  - enduser
---

# Governance in Power Automate Desktop

## Prevent users manually updating Power Automate Desktop

Using the following registry entry you can prevent users to manually update Power Automate Desktop on their machines.

| | |
|---|---|
|Hive|HKEY_LOCAL_MACHINE|
|Key|SOFTWARE\Microsoft\Power Automate Desktop|
|Name|DisableOptionalUpdates|
|Type|DWORD|

***Value***
- 1: Users will not be able to manually update Power Automate Desktop.


## Prevent users accessing Power Automate Desktop using their Microsoft accounts

Using the following registry entry you can prevent users to login on Power Automate Desktop on their machines using a Microsoft account.

| | |
|---|---|
|Hive|HKEY_LOCAL_MACHINE|
|Key|SOFTWARE\Microsoft\Power Automate Desktop|
|Name|RestrictMSAAccountsSignIns|
|Type|DWORD|

***Value***
- 1: Users will not be able to sign-in using their Microsoft account


## Prevent users accessing Power Automate Desktop using their work or school accounts

You can use the following registry entry to prevent users from logging into Power Automate Desktop with their work or school account without a per user plan with attended RPA license.

| | |
|---|---|
|Hive|HKEY_LOCAL_MACHINE|
|Key|SOFTWARE\Microsoft\Power Automate Desktop|
|Name|RestrictNoLicenseOrgIDAccountsSignIns|
|Type|DWORD|

***Value***
- 1: Users will not be able to sign-in using their work or school account without a per user plan with attended RPA license

## Prevent users accessing Power Automate Desktop using their work or school accounts or organization premium accounts

You can use the following registry entry to prevent users from logging into Power Automate Desktop with their work or school accounts or organization premium accounts.

| | |
|---|---|
|Hive|HKEY_LOCAL_MACHINE|
|Key|SOFTWARE\Microsoft\Power Automate Desktop|
|Name|RestrictOrgIDAccountsSignIns|
|Type|DWORD|

***Value***
- 1: Users will not be able to sign-in using their work or school account or organization premium account

>[!Note]
>- Setting any value other than 1, or not setting a value at all will allow users to access Power Automate Desktop. When all registry keys are set to 1, users will not be able to login to Power Automate Desktop with any type of account.

## Restricting access to Power Automate Desktop

In order to restrict access to Power Automate Desktop on a workstation with Windows 10, use [Applocker](/windows/security/threat-protection/windows-defender-application-control/applocker/applocker-overview).

## Learn more

- Learn to [create Power Automate Desktop flows](create-flow.md).
- Learn how to run [desktop flows](run-desktop-flow.md).
- Learn to [manage desktop flows](manage.md).


[!INCLUDE[footer-include](../includes/footer-banner.md)]
