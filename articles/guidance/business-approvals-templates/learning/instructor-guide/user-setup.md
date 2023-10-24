---
title: Approvals Kit instructor user setup | Microsoft Learn
description: Approvals Kit instructor user setup
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 11/10/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# User Setup

Now that you have completed the [Tenant Setup](./tenant-setup.md) section of the workshop, the next stage is to get ready to create user account setup. In this section, we'll cover how to set up users to create Power Platform Developer environments. It's important to ensure that licenses are assigned via a security group to ensure that users have the appropriate access to the Power Platform. Additionally, if you are creating a demo environment where Power Apps and Power Automate licenses are not available, you will need to sign up for the Power Platform Developer Plan and the Power Automate Free licenses. Let's dive in and get started!

## Development / Trial Licenses

If the tenant that has been selected does not have access to [Power Apps licenses](https://powerapps.microsoft.com/pricing/) on option for development / test of the Approvals Kit for non production scenarios is the [Power Apps Devloper Plan](https://learn.microsoft.com/power-platform/developer/plan). The learn page has more information on the Power Apps Developer Plan and how to signup for a Developer Plan.

If learners do not have access to [Power Automate licenses](https://powerautomate.microsoft.com/pricing/) then you could explore the **Try it for free** option from Power Automate pricing page.

> NOTE: The Associated setup scripts assume that the Power Apps Developer Plan and the Power Automate Free licenses are available in the selected learner tenant.

## Security Group

One way of managing access to power platform resources is via a Security group. You can assign the licenses to the security group so that members inherit the required licenses required to run the workshop.

> NOTE: The Associated setup scripts assume security group is named **Makers**. There are PowerShell scripts available to setup and assign the development and trial licenses required.

### Automated Setup

> NOTE: For instructions on how to download and setup the instructor guide automation scripts follow the [Setup Instructor Guide Scripts](./setup-instructor-scripts.md)

1. Import the security PowerShell commands

```pwsh
. .\src\scripts\security.ps1
```

1. Login to Azure as the Administrator of the Entra Id tenant. This command uses the Azure CLI to login

```pwsh
Invoke-AzureLogin
```

2. Create Makers security group

```pwsh
Add-SecurityMakersGroup
```

> NOTE: Review the [How are role-assignable groups protected](https://learn.microsoft.com/entra/identity/role-based-access-control/groups-concept#how-are-role-assignable-groups-protected) for security roles that the logged in Azure Login account will require.

3. Assign Microsoft Developer Plan to the Makers group using guidance from https://learn.microsoft.com/azure/active-directory/enterprise-users/licensing-ps-examples

```pwsh
Add-SecurityMakersGroupAssignDeveloperPlan
```

## Microsoft Entry ID Applications

The instructor guide assumes that two Microsoft Entra applications have been created.

> NOTE: To learn more about [Create a Microsoft Entra application and service principal that can access resources](https://learn.microsoft.com/entra/identity-platform/howto-create-service-principal-portal) for guidance on  permissions required to register an app.

### Automation Kit Application

The Automation Kit application is used by the Approvals Kit custom connector to provide delegated permissions to access Microsoft Dataverse. The results of this process should be stored in the **CLIENT_ID** and **CLIENT_SECRET** secure variables.

1. Create a new Application following [Register an application with microsoft entra id and create a service principal](https://learn.microsoft.com/entra/identity-platform/howto-create-service-principal-portal#register-an-application-with-microsoft-entra-id-and-create-a-service-principal)

1. The default redirect URL should be **https://global.consent.azure-apim.net/redirect**.

> NOTE: This value could change depending on the environment you deploy your custom connector within.

1. In the API Permissions section ensure that Delegated Dynamics (user_impersonation) have been granted with administrator consent.

  ![Screenshot of adding Delegated Dynamics CRM Permissions](../../media/app-registration-dynamics-crm-delegated-permissions.png)

1. Create Secret by moving to **Certificates and Secrets** section and click **New client secret**.

1. Add description and select an appropriate expiry date. Click **Add**.

1. Copy the secret value and save it in **CLIENT_SECRET**.

1. Also make a note of Client ID from Overview section to store in **CLIENT_ID**.

### Install Administration Application

The Install Administration application is used by the instructir gudie setup scripts to provide user administration. The results of this process should be stored in the **ADMIN_APP_ID** and **ADMIN_APP_SECRET** secure variables.

1. Create a new Application named **Approvals Kit Instructor Admin** following [Register an application with Microsoft Entra id and create a service principal](https://learn.microsoft.com/entra/identity-platform/howto-create-service-principal-portal#register-an-application-with-microsoft-entra-id-and-create-a-service-principal)

1. Ensure that API perssions of type **application** for **User.ReadWrite.Add** and **UserAuthenticationMethod.ReadWrite.All** have been allocated admin consent granted

1. Create Secret by moving to **Certificates and Secrets** section and click **New client secret**.

1. Add description and select an appropriate expiry date. Click **Add**.

1. Copy the secret value and save it in **ADMIN_APP_SECRET**.

1. Also make a note of Client ID from Overview section to store in **ADMIN_APP_ID**.

## Setting up secure install variables

To run the following:

1. Change to the workshop folder for the approvals kit

```pwsh
cd ~/powercat-business-approvals-kit/Workshop
```

1. Create a and move to new folder named secure

```pwsh
mkdir secure
cd secure
```

1. Create a secure store location to hold values

```pwsh
SecureStore create secrets.json --keyfile secret.key
```

1. Store the values for your setup

```pwsh
SecureStore set DEMO_PASSWORD "SomePassword" --keyfile secret.key
SecureStore set CLIENT_ID "Azure Client id" --keyfile secret.key
SecureStore set CLIENT_SECRET "Azure Client secret" "--keyfile secret.key
SecureStore set ADMIN_APP_ID "Azure Admin Client id" --keyfile secret.key
SecureStore set ADMIN_APP_SECRET "Azure Admin Client secret value" --keyfile secret.key
```

## Creating Users

You can optionally create users via the automated scripts for demonstration tenants.

1. Ensure that you have the users scripts imported

```pwsh
. .\src\scripts\users.ps1
```

2. Setup a user with known password

```pwsh
Reset-User "first.last@contoso.OnMicrosoft.com"
```

> NOTE: Either delegated scope **User.ReadWrite.All** or **Directory.AccessAsUser.All** is required to reset a user's password. In addition to the correct scope, the signed-in user would need sufficient privileges to reset another user's password.

3. (Optional) To setup a group of users, assuming they have the same password the following PowerShell could be used

```pwsh
"LidiaH","LynneR" | Foreach-Object { 
    $upn = "$($_)@contoso.OnMicrosoft.com"
    Write-Host "-------------------------------------------------------------------------"
    Write-Host $upn
    Write-Host "-------------------------------------------------------------------------"
    Reset-User $upn
}
```

## Summary

Before starting the [Environment Setup](./environment-setup.md) the following should be in place

- Users should be created in the Microsoft Entra ID tenant

- They should have licenses for the workshop assigned directly or inherited via a security group membership

- Microsoft Entra ID Applications have been created that will be used for the custom connector and to assist with automated setup.

- Setup variables are configured in SecureStore
