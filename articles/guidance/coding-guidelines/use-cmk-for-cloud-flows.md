---
title: Use CMK (Customer Managed Keys) for Cloud flows
description: Learn how to use CMK (Customer Managed Keys) for Cloud flows
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 01/31/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
search.audienceType: 
  - admin
  - flowmaker
---

# Use CMK (customer managed keys) for cloud flows

Customer Managed Keys (CMK) for cloud flows in Power Automate is a security feature that allows organizations to use their own encryption keys to encrypt and protect data within their flows. This approach provides enhanced control over the encryption keys and meets specific compliance requirements for data security and privacy. 

## What is customer managed keys (CMK)?

Customer Managed Keys (CMK) enable organizations to manage their own encryption keys, typically using a key management service such as Azure Key Vault. By using CMK, organizations can:

- Gain greater control over the encryption keys used to protect their data.
- Meet regulatory and compliance requirements that mandate customer-controlled encryption.
- Revoke access to data by disabling or deleting keys.

## How CMK works in Power Automate

- **Encryption at rest**: CMK allows you to encrypt the data stored by Power Automate at rest using your own keys.

- **Azure key vault**: The keys are typically stored and managed in Azure Key Vault, which provides secure key management capabilities.

- **Key rotation and management**: You have the ability to rotate, revoke, and audit the keys, providing enhanced control over the encryption lifecycle.

Learn more:

- [Support for customer-managed keys in Power Automate](/power-automate/customer-managed-keys)
- [Managing customer-managed keys](/power-platform/admin/customer-managed-key) 