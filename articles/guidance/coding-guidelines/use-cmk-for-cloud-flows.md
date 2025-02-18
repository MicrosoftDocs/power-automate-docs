---
title: Use customer managed keys for cloud flows
description: Learn how to use customer managed keys (CMK) for cloud flows in Power Automate to enhance data security and meet compliance requirements.
#customer intent: As a Power Automate user, I want to use customer managed keys for cloud flows so that I can meet compliance policies for data security and privacy.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/18/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
  - flowmaker
---

# Use customer managed keys for cloud flows

Customer managed keys (CMK) within the context of cloud flows in Power Automate enable organizations to use their own encryption keys to encrypt and protect data within their flows. CMK provides enhanced control over the encryption keys and meets compliance requirements for data security and privacy. 

## What is CMK

Customer managed keys (CMK) enable organizations to manage their own encryption keys, typically using a key management service such as Azure Key Vault. By using CMK, organizations can:

- Gain greater control over the encryption keys used to protect their data.
- Meet regulatory and compliance requirements that mandate customer-controlled encryption.
- Revoke access to data by disabling or deleting keys.

## How CMK works in Power Automate

This added protective layer provides:

- **Encryption at rest**: CMK allows you to encrypt the data stored by Power Automate at rest using your own keys.

- **Azure Key Vault security**: The keys are typically stored and managed in Azure Key Vault, which provides secure key management capabilities.

- **Key rotation and management**: You have the ability to rotate, revoke, and audit the keys, providing enhanced control over the encryption lifecycle.

Learn more:

- [Support for customer-managed keys in Power Automate](/power-automate/customer-managed-keys)
- [Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key) 