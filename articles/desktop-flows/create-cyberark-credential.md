---
title: Create a CyberArk credential
description: Use credentials in desktop flow connections 
author: QuentinSele
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 06/26/2024
ms.author: quseleba
ms.reviewer: 
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Create a CyberArk credential

This feature allows users to create a Power Automate credential that retrieves CCP CyberArk® secrets from vault during runtime.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality.
> - These features are available before an official release so that customers can get early access and provide feedback.
> - Currently, this feature isn't available for US Government Clouds.

## Prerequisites: setup CyberArk® CCP 

### Setup their CyberArk® central credential provider (if not done already)
1.	Install the Central Credential Provider (CCP). You can retrieve instructions here.
2.	Ensure that your RPA machines can communicate with the CyberArk® server
3.	You need to allow https connections to contact the CCP AIMWebservice

### Create an application with client certification authentication from PVWA
A signed certificate enables the application authentication with a certificate serial number

1.	Sign-in to CyberArk®’s PVWA
2.	From the left nav, select Applications tab then select Add Application.  
3.	Provide the information in the Application window (at least a name) and select Add.
4.	In the details of the application, select Add on the Authentication tab.
5.	Select Certificate serial number and enter the value. Learn more about [Application authentication methods](https://docs.cyberark.com/credential-providers/Latest/en/Content/CP%20and%20ASCP/Application-Authentication-Methods-general.htm#ClientCert)

### Setup a CyberArk® safe that contains their user accounts
(Optional) If you don’t have a safe yet, you can create a Safe from PVWA:
1.	From the left nav, select Policies then select Safes.
2.	Select Create Safe
a.	  Enter a safe name and select PasswordManager
b.	  Enter Safe members and Access then select Create Safe

From PVWA, you can then add your machine accounts.

> [!NOTE]
> You can also create accounts from PrivateArk client.

1.	From the left nav, select Accounts then select Add Account
2.	Select Windows as system type
3.	Select the safe you created to store your RPA machine accounts.
4.	Provide information about your account and select Add.

### Define application and credential provider as safe member

Add the Credential Provider user as a Safe Member with the following authorizations:
•	List accounts
•	Retrieve accounts
•	View Safe Members

Add the application(s) as a Safe Member with the following authorizations:
•	Retrieve accounts

## Add a CyberArk® application to machine / group
If you want to run a desktop flow on a machine or a group using CyberArk® credentials, you need to add your CyberArk® application information in the Power Automate portal.
1.	Sign-in to Power Automate
2.	From the left nav, select **Machines** and select the machine or the group.
3.	In the Machine details, select **Configure CyberArk®**

4.	Select New application
    - Enter the app id of the application you created from CyberArk® PVWA.
    - Select the certificate (allowed formats: .pfx or .p12 file) which stores the private and the public key of the certificate. Note: the private key should be marked as exportable
    - Enter the certificate file password (that is used to open the certificate file). Note: the password will not be stored, the certificate will be opened and encrypted with the machine public key so it can only be read from the registered machines
    - Enter a description (optional) then select Save

## Create a CyberArk® credential

Now that you have completed all the prerequisites steps, you can create your CyberArk® credentials.
1.	From the left nav, select **Credentials**
2.	Select **New credential** 
3.	In the wizard, define a credential name and a small description and then select **Next**
4.	In the second step
     - select CyberArk® CCP as the type of credential store
     - if you have already defined a CyberArk® store, you can select it from the dropdown. Otherwise, select Create new.
       - **Display name**
       - **Server address**: the server address is the Central Credential Provider URL example: https://svc.skytap.com:8992
       - **Application id**: to find the application ID, open CyberArk® PVWA (Password Vault Web Access) on a web browser and navigate to the Applications tab
       - **Safe**: populate the name of the safe displayed in CyberArk® PVWA
       - **Folder** (optional): populate the folder name where your credentials are stored. By default, credentials are stored in the “Root” folder.

5.	In the last step of the wizard, you need to provide the information about the user account:
    - **Username**: select a username from your text environment variables or create a new one by selecting new
    - **Object name**: this is the CyberArk® object name (can be also called account name in PVWA) store in the CyberArk® safe.
  
Your credential is now created. You can use it in a desktop flow connection.


