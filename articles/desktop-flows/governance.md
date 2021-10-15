---
title: Governance in Power Automate | Microsoft Docs
description: Governance in Power Automate.
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

# Governance in Power Automate

## Prevent users manually updating Power Automate for desktop 

Using the following registry entry you can prevent users to manually update Power Automate for desktop on their machines and receive update notifications.

| | |
|---|---|
|Hive|HKEY_LOCAL_MACHINE|
|Key|SOFTWARE\Microsoft\Power Automate Desktop|
|Name|DisableOptionalUpdates|
|Type|DWORD|

***Value***
- **1**: Users will not be able to manually update Power Automate for Desktop.


## Prevent users accessing Power Automate for desktop using their Microsoft accounts

Using the following registry entry you can prevent users to login on Power Automate for desktop on their machines using a Microsoft account.

| | |
|---|---|
|Hive|HKEY_LOCAL_MACHINE|
|Key|SOFTWARE\Microsoft\Power Automate Desktop|
|Name|RestrictMSAAccountsSignIns|
|Type|DWORD|

***Value***
- **1**: Users will not be able to sign-in using their Microsoft account


## Prevent users accessing Power Automate for desktop using their work or school accounts

You can use the following registry entry to prevent users from logging into Power Automate for desktop with their work or school account without a per user plan with attended RPA license.

| | |
|---|---|
|Hive|HKEY_LOCAL_MACHINE|
|Key|SOFTWARE\Microsoft\Power Automate Desktop|
|Name|RestrictNoLicenseOrgIDAccountsSignIns|
|Type|DWORD|

***Value***
- **1**: Users will not be able to sign-in using their work or school account without a per user plan with attended RPA license

## Prevent users accessing Power Automate for desktop using their work or school accounts or organization premium accounts

You can use the following registry entry to prevent users from logging into Power Automate for desktop with their work or school accounts or organization premium accounts.

| | |
|---|---|
|Hive|HKEY_LOCAL_MACHINE|
|Key|SOFTWARE\Microsoft\Power Automate Desktop|
|Name|RestrictOrgIDAccountsSignIns|
|Type|DWORD|

***Value***
- **1**: Users will not be able to sign-in using their work or school account or organization premium account

>[!Note]
>- Setting any value other than 1, or not setting a value at all will allow users to access for desktop. When all registry keys are set to 1, users will not be able to login to Power Automate for desktop with any type of account.

## Restricting access to Power Automate for desktop

In order to restrict access to Power Automate for desktop on a workstation with Windows 10, use [Applocker](/windows/security/threat-protection/windows-defender-application-control/applocker/applocker-overview).

## Configure Power Automate for desktop to interact with a corporate proxy server

IT administrators, may set the following registry keys, to configure the Power Automate’s interaction with a corporate proxy server.

| | |
|---|---|
|Hive|HKEY_LOCAL_MACHINE|
|Key|SOFTWARE\Microsoft\Power Automate Desktop|
|Name|ProxyServer|
|Type|String|

***Value***
- **ProxyAddress:Port (e.g.: myproxy.com:3128)**: The proxy server and port configured, will override the proxy server and port configured in Windows.

## Configure Power Automate for desktop to bypass a corporate proxy server

| | |
|---|---|
|Hive|HKEY_LOCAL_MACHINE|
|Key|SOFTWARE\Microsoft\Power Automate Desktop|
|Name|DisableWindowsProxy|
|Type|DWORD|

***Value***
- **1**: Power Automate for desktop will not honor the Windows Proxy settings and the proxy server will be bypassed for Power Automate's traffic. 

## Configure Power Automate for desktop to authenticate to a corporate proxy server using the current user's credentials

| | |
|---|---|
|Hive|HKEY_LOCAL_MACHINE|
|Key|SOFTWARE\Microsoft\Power Automate Desktop|
|Name|UseDefaultProxyCredentials|
|Type|DWORD|

***Value***
- **1**: Power Automate for desktop will authenticate to the corporate proxy server using the current user's credentials.
 
 
## Learn more

- Learn to [create Power Automate desktop flows](create-flow.md).
- Learn how to run [desktop flows](run-desktop-flow.md).
- Learn to [manage desktop flows](manage.md).


[!INCLUDE[footer-include](../includes/footer-banner.md)]
