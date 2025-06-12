---
title: Configure certificate-based authentication 
description: Configure certificate-based authentication (CBA) in Power Automate. Learn how to set up and use CBA credentials to meet MFA requirements.
author: QuentinSele
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 03/31/2025
ms.author: quseleba
ms.reviewer: dmartens
contributors:
  - DanaMartens
search.audienceType: 
  - flowmaker
  - envadmin
ms.custom:
- ai-gen-docs-bap
- ai-gen-description
- ai-seo-date:11/05/2024
---

# Configure certificate-based authentication 


Power Automate lets you [create credentials](create-AzureKeyVault-credential.md) using certificate-based authentication (CBA). Microsoft Entra ID certificate-based authentication helps meet multifactor authentication (MFA) requirements.


## How CBA credentials work in Power Automate

:::image type="content" source="./media/manage-machines/cba-overview.png" alt-text="Screenshot of how certificate-based authentication works in Power Automate.":::

1. Certificates are stored and managed in Azure Key Vault.
2. Credentials are created in Power Automate and stored in Dataverse.
3. Credentials are used in the desktop flow connection.

>[!Note]
> CBA is supported for Windows session credentials (desktop flow connection) but cannot be used within the desktop flow or with other connectors.

## How to configure Microsoft Entra certificate-based authentication

To use this feature, make sure you meet these prerequisites.

> [!NOTE]
> These operations require an Entra ID tenant admin.

Follow the instructions in [Configure the certification authorities](/entra/identity/authentication/how-to-certificate-based-authentication#step-1-configure-the-certification-authorities) to set up and use Microsoft Entra CBA for tenants in Office 365 Enterprise and US Government plans.

### (Optional) Microsoft Entra ID CBA supports validating MFA requirements

Microsoft Entra CBA can be used as a second factor to meet MFA requirements with single-factor certificates.

## Certificates are stored in Azure Key Vault

To use certificates with Power Automate, store them in Azure Key Vault. Learn more at [how to import a certificate in Azure Key Vault](/azure/key-vault/certificates/tutorial-import-certificate?tabs=azure-portal).

> [!NOTE]
> The certificate format must be .pfx (not PEM).

## Create a credential

After completing these steps, [create your Azure key vault credential](create-AzureKeyVault-credential.md).

## Admin consent for unattended runs

Admin consent is required for unattended runs with certificate credentials on a Microsoft Entra ID joined device. Learn more at [Admin consent for unattended runs](run-unattended-desktop-flows.md#admin-consent-for-unattended-runs-using-cba-or-sign-in-credentials-with-nla-preview).

## Limitations and minimal requirements

1. To use certificate-based authentication (CBA) credentials in Power Automate, store them in Azure Key Vault. Other vaults aren't supported today.
1. Use Power Automate for desktop version 2.49 or later.
1. If you're using Windows Server, version 2019 or later is supported.
1. Target machines must be joined to Microsoft Entra ID.
