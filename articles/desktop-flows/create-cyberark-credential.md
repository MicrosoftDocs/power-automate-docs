---
title: Create a CyberArk credential
description: Use CyberArk credentials in desktop flow connections 
author: QuentinSele
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 06/26/2024
ms.author: quseleba
ms.reviewer: dmartens
contributors:
  - DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---

# Create a CyberArk credential

[!INCLUDE [cc-preview-features-top-note](../includes/cc-preview-features-top-note.md)]

This feature allows users to create a Power Automate credential that retrieves CCP CyberArk® secrets from vault during runtime.

[!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

## Availability

Currently, this feature isn't available for US Government Clouds.

## Prerequisites

### Set up your CyberArk® Central Credential Provider (CCP)

If your CyberArk® Central Credential Provider (CCP) isn't set up, complete the following actions:

1. Install the Central Credential Provider (CCP). You can retrieve instructions here.
1. Ensure that your machines can communicate with the CyberArk® server.
1. Allow https connections to contact the CCP AIMWebService.

### Create an application with client certification authentication from PVWA

A signed certificate enables the application authentication with a certificate serial number

1. Sign-in to CyberArk®’s Password Vault Web Access (PVWA).
1. From the left navigation, select the **Applications** tab and then select **Add Application**.  
1. Provide the information in the Application window (at least a name) and select **Add**.
1. In the details of the application, select **Add** on the **Authentication** tab.
1. Select Certificate serial number and enter the value. Learn more in [Application authentication methods](https://docs.cyberark.com/credential-providers/Latest/en/Content/CP%20and%20ASCP/Application-Authentication-Methods-general.htm#ClientCert).

### Set up a CyberArk® safe that contains their user accounts

(Optional) If you don’t have a safe yet, you can create a Safe from PVWA:

1. From the left navigation, select **Policies** then select **Safes**.
1. Select **Create Safe**.
1. Enter a safe name and select **PasswordManager**.
1. Enter Safe members and Access then select **Create Safe**.

From PVWA, you can then add your machine accounts.

> [!NOTE]
> You can also create accounts from PrivateArk client.

1. From the left navigation, select **Accounts** > **Add Account**.
1. Select **Windows** as system type.
1. Select the safe you created to store your robotic process automation (RPA) machine accounts.
1. Provide information about your account and select **Add**.

### Define application and credential provider as safe member

Add the Credential Provider user as a Safe Member with the following authorizations:
• List accounts
• Retrieve accounts
• View Safe Members

Add the application as a Safe Member with the following authorizations:
• Retrieve accounts

## Add a CyberArk® application to machine / group

If you want to run a desktop flow on a machine or a group using CyberArk® credentials, you need to add your CyberArk® application information in the Power Automate portal.

1. Sign-in to Power Automate.
1. From the left navigation, select **Machines** and select the machine or the group.
1. In the Machine details, select **Configure CyberArk®**.
1. Select **New application**
    1. Enter the app ID of the application you created from CyberArk® PVWA.
    1. Select the certificate, which stores the private and the public key of the certificate.
    - The allowed formats are .pfx or .p12 files.
    - The private key should be marked as exportable.
    1. Enter the certificate file password that is used to open the certificate file.

        > [!NOTE]
        > The password is not stored. The certificate is opened and encrypted with the public key of the machine group so it is only readable from the registered machines.

    1. Enter a description (optional) and then select **Save**.

## Create a CyberArk® credential

Now that you complete all the prerequisites steps, you can create your CyberArk® credentials.

1. From the left navigation, select **Credentials**.
1. Select **New credential**.
1. In the wizard, define a credential name and a small description and then select **Next**
1. In the second step
     - Select CyberArk® CCP as the type of credential store.
     - If you already defined a CyberArk® store, you can select it from the dropdown. Otherwise, select **Create new**.
       - **Display name**
       - **Server address**: The server address is the Central Credential Provider URL. For example, `https://svc.skytap.com:8992`.
       - **Application id**: To find the application ID, open CyberArk® PVWA (Password Vault Web Access) on a web browser and navigate to the Applications tab.
       - **Safe**: Populate the name of the safe displayed in CyberArk® PVWA.
       - **Folder** (optional): Populate the folder name where your credentials are stored. By default, credentials are stored in the "Root" folder.

1. In the last step of the wizard, you need to provide the information about the user account:
    - **Username**: Select a username from your text environment variables or create a new one by selecting new.
    - **Object name**: The object name corresponds to the CyberArk® object name store in the CyberArk® safe. This value is also called account name in PVWA.
  
Your credential is now created. You can use it in a desktop flow connection.
