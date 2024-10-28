---
title: Configure CBA (preview)
description: Use Certificate-based authentication credentials (CBA) in desktop flow connections (preview)
author: QuentinSele
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 10/28/2024
ms.author: quseleba
ms.reviewer: dmartens
contributors:
  - DanaMartens
search.audienceType: 
  - flowmaker
  - envadmin
---

# Configure Certificate-based authentication 

Power Automate allows users to [create credentials](create-AzureKeyVault-credentials.md) using **Certificate-based authentication** (preview). 
Entra-ID certificate-based authentication is one of the options that can allow customers to satisfy **Multifactor authentication (MFA) requirements**.

## How CBA credentials work in Power Automate

:::image type="content" source="./media/manage-machines/CBA-overview.png" alt-text="Screenshot of how works CBA in Power Automate.":::

1. Certificate are stored and managed in Azure key vault.
2. Credentials are created in Power Automate and stored in Dataverse. 
3. Credentials are used in the desktop flow connection.

>[!Note]
> CBA is supported for Windows session credentials (Desktop Flow connection) but cannot be used within the Desktop Flow or with other connectors.

## How to configure Microsoft Entra certificate-based authentication

To get benefits of this feature, you will need first to follow the following pre-requisites.

> [!NOTE]
> These operations require Entra ID tenant admin.

Follow these [instructions](https://learn.microsoft.com/entra/identity/authentication/how-to-certificate-based-authentication#step-1-configure-the-certification-authorities) to configure and use Microsoft Entra CBA for tenants in Office 365 Enterprise and US Government plans. 

### (Optional) Entra ID CBA is configured to support validating MFA requirements

Microsoft Entra CBA can be used as a second factor to meet MFA requirements with single-factor certificates. 

## Certificates are stored on Azure Key Vault

To use Certificates with Power Automate, you will need to store the certificates in Azure key vault.
Follow these steps to learn [how to importe a certificate in Azure key vault](https://learn.microsoft.com/azure/key-vault/certificates/tutorial-import-certificate?tabs=azure-portal).

>[!Note] The format of the certificate must be a .pfx file (not en PEM).

## Create a credential

Now that you have completed all these steps, you can [create your Azure key vault credential](create-AzureKeyVault-credential.md).

## Admin consent (for unattended)

1. Admin authorisation – pairing machine 
1. Error code: need to link with the public doc

### Limitations / Minimal requirements

1. To use CBA credentials in Power Automate, you need to store them in Azure key vault. Other vaults are not supported today.
2. You need to use a version of Power Automate for desktop equals or above 2.49.
3. If you are using Windows Server, version 2019 or above are supported.
4. Non Entra-ID machines are not supported. 

