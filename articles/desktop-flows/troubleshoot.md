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
 
![Screenshot of the Power Automate Desktop troubleshoot dialog.](\media\troubleshoot\image001.png)


## Resolve sign in and sign out issues

Power Automate Desktop uses a file named **msalcache.bin3** to acquire tokens and authenticate users.

If you encounter errors while signing in or signing out, try to delete this file to erase all the stored tokens.

To delete the file, navigate to **C:\Users\Username\AppData\Local\Microsoft\Power Automate Desktop**. 

> [!NOTE]
> If the **AppData** folder isn't visible in your user folder, try to [display hidden files](https://support.microsoft.com/windows/show-hidden-files-0320fe58-0117-fd59-6851-9b7f9840fdb2).

If you have installed Power Automate Desktop in another drive, replace **C** with the letter of the respective drive. Also, replace **Username** with the name of your user folder.

![Screenshot of the msalcache.bin3 file in the file explorer.](\media\troubleshoot\msal-file.png)

After deleting the **msalcache.bin3** file, restart the Power Automate Desktop service and sing in to your account.


## Collect Machine logs 
There are several logs you can collect for the machine’s configuration and service logs, and you should always start with the logs. 
In the Troubleshoot tool, select Exports logs link, as shown in the following image.

![Screenshot of the Machine logs.](\media\troubleshoot\image003.png)

This file is saved to the desktop as a zip file.