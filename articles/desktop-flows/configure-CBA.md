---
title: Configure CBA (preview)
description: Use Certificate-based authentication credentials (CBA) in desktop flow connections 
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

To get benefits of this feature, you will need first to follow the following pre-requisites.

> [!NOTE]
> These operations require Entra ID tenant admin.

## How to configure Microsoft Entra certificate-based authentication

Follow these [instructions](https://learn.microsoft.com/entra/identity/authentication/how-to-certificate-based-authentication#step-1-configure-the-certification-authorities) to configure and use Microsoft Entra CBA for tenants in Office 365 Enterprise and US Government plans. 

## (Optional) Entra ID CBA is configured to support validating MFA requirements

Microsoft Entra CBA can be used as a second factor to meet MFA requirements with single-factor certificates. 

> [!Important]
>  A user is considered MFA capable when they are included in the CBA method settings. This means the user can't use proof up as part of their authentication to register other available methods. Make sure users without a valid certificate aren't included in the CBA method settings.

Follow [the steps to 

## Certificates are stored on a credential provider (AKV)
•	 format of the certificate  pfx

## Admin consent (for unattended)

1. Admin authorisation – pairing machine 
1. Error code: need to link with the public doc

