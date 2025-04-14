---
title: Use customer-managed keys for cloud flows
description: Learn how to use customer-managed keys for your cloud flows in Power Automate to enhance data security and meet compliance requirements.
#customer intent: As a Power Automate user, I want to use customer-managed keys for cloud flows so that I can meet compliance policies for data security and privacy.
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

# Use customer-managed keys for cloud flows

Typically, Microsoft or a service provider manages the encryption keys that secure a customer's data. Customer-managed keys allow organizations to use their own encryption keys. The keys are usually stored in a secure key management system such as Azure Key Vault. This approach provides organizations with greater control over their data security and compliance with regulatory requirements.

In the context of Power Automate, you can use customer-managed keys to encrypt and protect data in your cloud flows. This article explains how to use customer-managed keys in Power Automate and the benefits they provide.

## Benefits of customer-managed keys

Using customer-managed keys with your cloud flows provides several benefits:

- **Greater control**: Using customer-managed keys gives you more control over the encryption keys that protect your data.

- **Regulatory compliance**: Customer-managed keys meet regulatory and compliance requirements that mandate customer-controlled encryption.

- **Data access management**: You can easily revoke access to data by disabling or deleting the encryption keys.

- **Encryption at rest**: Customer-managed keys allow you to encrypt the data that's stored in Power Automate at rest using your own keys.

- **Azure Key Vault security**: The keys are typically stored and managed in Azure Key Vault, which provides secure key management capabilities.

- **Key rotation and management**: You have the ability to rotate, revoke, and audit the keys, providing enhanced control over the encryption life cycle.

Learn more in [Support for customer-managed keys](/power-automate/customer-managed-keys) and [Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key).
