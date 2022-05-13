---
title: Governance in Power Automate | Microsoft Docs
description: Governance in Power Automate.
services: ''
suite: flow
documentationcenter: na
author: mariosleon
editor: ''
tags: ''

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

|Hive|Key|Name|Type|
|---|---|---|---|
|HKEY_LOCAL_MACHINE|SOFTWARE\Microsoft\Power Automate Desktop|DisableOptionalUpdates|DWORD|

***Value***
- **1**: Users won't be able to manually update Power Automate for Desktop.


## Prevent users accessing Power Automate for desktop using their Microsoft accounts

Using the following registry entry you can prevent users to sign in on Power Automate for desktop on their machines using a Microsoft account.

|Hive|Key|Name|Type|
|---|---|---|---|
|HKEY_LOCAL_MACHINE|SOFTWARE\Microsoft\Power Automate Desktop|RestrictMSAAccountsSignIns|DWORD|

***Value***
- **1**: Users won't be able to sign-in using their Microsoft account


## Prevent users accessing Power Automate for desktop using their work or school accounts

You can use the following registry entry to prevent users from logging into Power Automate for desktop with their work or school account without a per user plan with attended RPA license.

|Hive|Key|Name|Type|
|---|---|---|---|
|HKEY_LOCAL_MACHINE|SOFTWARE\Microsoft\Power Automate Desktop|RestrictNoLicenseOrgIDAccountsSignIns|DWORD|

***Value***
- **1**: Users won't be able to sign-in using their work or school account without a per user plan with attended RPA license

## Prevent users accessing Power Automate for desktop using their work or school accounts or organization premium accounts

You can use the following registry entry to prevent users from logging into Power Automate for desktop with their work or school accounts or organization premium accounts.

|Hive|Key|Name|Type|
|---|---|---|---|
|HKEY_LOCAL_MACHINE|SOFTWARE\Microsoft\Power Automate Desktop|RestrictOrgIDAccountsSignIns|DWORD|

***Value***
- **1**: Users won't be able to sign-in using their work or school account or organization premium account

>[!Note]
>- Setting any value other than 1, or not setting a value at all will allow users to access for desktop. When all registry keys are set to 1, users will not be able to login to Power Automate for desktop with any type of account.

## Restricting access to Power Automate for desktop

In order to restrict access to Power Automate for desktop on a workstation with Windows 10, use [Applocker](/windows/security/threat-protection/windows-defender-application-control/applocker/applocker-overview).

## Allow users to select a particular organization in Power Automate for desktop

You can use the following registry entry to allow users to select the organization of their preference in Power Automate for desktop.

|Hive|Key|Name|Type|
|---|---|---|---|
|HKEY_LOCAL_MACHINE|SOFTWARE\Microsoft\Power Automate Desktop|EnableOrganizationPicker|String|

***Values***
- **"isEnabled":1**: Signed in users will be able to select the organization of their preference through the “Switch organization” option in the Power Automate for desktop console.
- **"isEnabled":0**: Signed in users won't be able to select the organization of their preference and the “Switch organization” option will be disabled.

- **"organizationList":[OrgID(s)] (e.g.: organizationList:["10z677m8-l4v6-9cm5-c6n6-r1747rp5338k","86d487j7-y1t2-9gk7-k7n2-x5079jq4619r"])**: The organizations with the specified IDs listed, will be available to connect during sign in. 

- **"selectOrganizationFromListIsEnabled":1**: Power Automate for desktop will try to connect to each one of the organizations specified in the "organizationList" value based on their order, during sign in.
- **"selectOrganizationFromListIsEnabled":0**: The specified list in the "organizationList" value won’t be taken into consideration during sign in.

> [!NOTE]
> The "isEnabled” values aren't related to the "organizationList" and "selectOrganizationFromListIsEnabled" values. The "isEnabled” values define if the “Switch organization” option will be available to signed in users, whereas the "organizationList" and "selectOrganizationFromListIsEnabled" values define the organizations that Power Automate for desktop will try to connect to automatically during the sign in procedure.

## Allow users of Power Automate for desktop to connect to a region

You can use the following registry entry to allow users to select the region they want to connect to.


|Hive|Key|Name|Type|
|---|---|---|---|
|HKEY_LOCAL_MACHINE|SOFTWARE\Microsoft\Power Automate Desktop|Cloud|DWORD|

***Value***
- **0**: The user will have the option to select the region of their preference to connect to through an additional option in the sign in screen.
- **1**: The user will be automatically connected to the first available region they are registered to.
- **2**: The user will connect to the global public region.
- **3**: The user will connect to the US Government GCC region.
- **4**: The user will connect to the US Government GCC High region.
- **5**: The user will connect to the US Government DoD region.
- **6**: The user will connect to the China (operated by 21Vianet) region.


## Configure Power Automate for desktop to interact with a corporate proxy server

IT administrators, may set the following registry key, to configure the Power Automate’s interaction with a corporate proxy server.

|Hive|Key|Name|Type|
|---|---|---|---|
|HKEY_LOCAL_MACHINE|SOFTWARE\Microsoft\Power Automate Desktop|ProxyServer|String|

***Value***
- **ProxyAddress:Port (e.g.: myproxy.com:3128)**: The proxy server and port configured, will override the proxy server and port configured in Windows.

## Configure Power Automate for desktop to bypass a corporate proxy server

IT administrators, may set the following registry key, to configure the Power Automate’s bypassing of a corporate proxy server.

|Hive|Key|Name|Type|
|---|---|---|---|
|HKEY_LOCAL_MACHINE|SOFTWARE\Microsoft\Power Automate Desktop|DisableWindowsProxy|DWORD|

***Value***
- **1**: Power Automate for desktop won't honor the Windows Proxy settings and the proxy server will be bypassed for Power Automate's traffic. 

## Configure Power Automate for desktop to authenticate to a corporate proxy server using the current user's credentials

IT administrators, may set the following registry key, to configure the Power Automate’s authentication with a corporate proxy server.

|Hive|Key|Name|Type|
|---|---|---|---|
|HKEY_LOCAL_MACHINE|SOFTWARE\Microsoft\Power Automate Desktop|UseDefaultProxyCredentials|DWORD|

***Value***
- **1**: Power Automate for desktop will authenticate to the corporate proxy server using the current user's credentials.

## Configure Power Automate for desktop to prevent cleaning up of run files

You can use the following registry entry to configure the cleanup of Power Automates' run files. 

|Hive|Key|Name|Type|
|---|---|---|---|
|HKEY_LOCAL_MACHINE|SOFTWARE\Microsoft\Power Automate Desktop\Global|DisableRunFilesCleanup|DWORD|

***Value***
- **1**: Run files won't be deleted from the local disk after the run is completed.

## Configure Power Automate for desktop notification settings 

You can use the following registry entry to configure how Power Automate for desktop displays notifications and monitoring information. 

|Hive|Key|Name|Type|
|---|---|---|---|
|HKEY_CURRENT_USER|SOFTWARE\Microsoft\Power Automate Desktop|NotificationsType|DWORD|

***Value***

- **1**: Power Automate for desktop will display notifications through the flow monitoring window.
- **2**: Power Automate for desktop will use the integrated Windows notifications.
- **3**: Power Automate for desktop won't display notifications.
 
 
## Learn more

- Learn to [create Power Automate desktop flows](create-flow.md).
- Learn how to run [desktop flows](run-desktop-flow.md).
- Learn to [manage desktop flows](manage.md).


[!INCLUDE[footer-include](../includes/footer-banner.md)]
