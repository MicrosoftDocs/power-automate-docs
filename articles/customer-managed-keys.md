---
title: Support for customer-managed keys (preview)
description: Learn about support for customer-managed Keys in Power Automate.
suite: flow
documentationcenter: na
author: v-aangie
contributors:
  - v-aangie
editor: ''
tags: ''
ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/31/2023
ms.author: rakrish
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Support for customer-managed keys (preview)

[This article is pre-release documentation and is subject to change.]

All customer data stored in Power Platform is encrypted at rest using Microsoft-managed keys by default. With customer-managed keys (CMKs), customers can bring their own encryption keys to encrypt Power Automate data. This allows customers to have an extra protective layer to manage their Power Platform assets. With this feature, you can rotate or swap encryption keys on demand. It also prevents Microsoft’s access to your customer data, if you choose to revoke key access to Microsoft services at any time.

> [!IMPORTANT]
>
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]
>
> - *Before applying the enterprise policy, ensure that the environment doesn't have any flows.*
> - If you apply enterprise policy on an environment with flows, the customer key wouldn't be applied to encrypt data, and the workflows and their data would continue to be encrypted with Microsoft-managed keys.
> - Currently, customer-managed keys aren't leveraged to encrypt non-OAuth connections. Such non-Microsoft Entra based connections will continue to be encrypted at rest using Microsoft-managed keys.

Applying an encryption key is a gesture performed by Power Platform admins and is totally invisible to users. Users can create, save, and execute Power Automate workflows exactly the same way they would if the data was encrypted by Microsoft-managed keys.

To learn more about the customer-managed key, and the step-by-step instructions to enable customer-managed keys, go to [Manage your customer-managed encryption key (preview)](/power-platform/admin/customer-managed-key). This enables you to leverage the single enterprise policy created on the environment to secure Power Automate workflows.

With customer-managed keys, your workflows and all associated at-rest data will be stored and executed on a dedicated infrastructure, partitioned by the environment. This includes your workflow definitions, both cloud and desktop flows and workflow execution history with detailed inputs and outputs.  

### See also

[Manage your customer-managed encryption key (preview)](/power-platform/admin/customer-managed-key)