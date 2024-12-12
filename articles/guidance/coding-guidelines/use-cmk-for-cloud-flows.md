---
title: Use CMK (Customer Managed Keys) for Cloud flows
description: Learn how to use CMK (Customer Managed Keys) for Cloud flows
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
search.audienceType: 
  - admin
  - flowmaker
---

# Use CMK (Customer Managed Keys) for Cloud flows

Customer Managed Keys (CMK) for cloud flows in Power Automate is a security feature that allows organizations to use their own encryption keys to encrypt and protect data within their flows. This provides enhanced control over the encryption keys and meets specific compliance requirements for data security and privacy. Here's an overview of how CMK works in Power Automate and how to implement it:

## What is Customer Managed Keys (CMK)?

Customer Managed Keys (CMK) enable organizations to manage their own encryption keys, typically using a key management service such as Azure Key Vault. By using CMK, organizations can:

Gain greater control over the encryption keys used to protect their data.

Meet regulatory and compliance requirements that mandate customer-controlled encryption.

Revoke access to data by disabling or deleting keys.

## How CMK Works in Power Automate

**Encryption at Rest**: CMK allows you to encrypt the data stored by Power Automate at rest using your own keys.

**Azure Key Vault**: The keys are typically stored and managed in Azure Key Vault, which provides secure key management capabilities.

**Key Rotation and Management**: You have the ability to rotate, revoke, and audit the keys, providing enhanced control over the encryption lifecycle.

For more information, refer to the following learn [document](/power-automate/customer-managed-keys)

More details on [Managing CMK](/power-platform/admin/customer-managed-key) 