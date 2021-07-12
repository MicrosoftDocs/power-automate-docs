---
title: Troubleshooting Power Automate Desktop| Microsoft Docs
description: Troubleshooting Power Automate Desktop
services: ''
suite: flow
documentationcenter: na
author: mariosleon
manager: ''
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

# Troubleshooting Power Automate Desktop

To open the troubleshoot tool:
1. Open the Power Automate Desktop console
1. Select Help
1. Select Troubleshoot (Preview)

>[!NOTE]
>You need to have admin privileges to open the troubleshoot tool from Power Automate Desktop  

## Change the on-premises Service account
The UIFlowService uses the virtual account “NT SERVICE\UIFlowService”. This account needs the ability to “Logon as a service” in order to successfully startup.

Most environments wouldn't require to change the default configuration. If your company has some restrictions in place, you can either ask your domain administrator to grant “NT SERVICE\UIFlowService” the right to “Logon as a service” or change the account here with an allowed one.
1. Select **Change account**
1. Select **This account**
1. Provide the new account. Ex: DOMAIN\AlexJohnson  
1. Provide the password of this account and select Configure
 
![Power Automate Desktop troubleshoot.](\media\troubleshoot\image001.png)

## Collect Machine logs 
There are several logs you can collect for the machine’s configuration and service logs, and you should always start with the logs. 
In the Troubleshoot tool, select Exports logs link, as shown in the following image.

![Machine logs.](\media\troubleshoot\image003.png)

This file is saved to the desktop as a zip file.