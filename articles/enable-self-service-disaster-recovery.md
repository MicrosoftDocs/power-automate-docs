---
title: Enable self-service disaster recovery (preview)
description: Learn how and when to prepare your environment for disaster recovery.
author: kisubedi
ms.author: kisubedi
ms.reviewer: angieandrews
ms.date: 10/09/2025
ms.topic: concept-article
ms.service: power-automate
#customer intent: I want to enable SSDR to prepare my environment for disaster recovery.
---

# Enable self-service disaster recovery (preview)

[!INCLUDE[cc-preview-features-definition](includes/cc-preview-features-top-note.md)]

If you want to use Self service disaster recovery (SSDR) for Power Automate on an existing environment, you must open a support ticket/ICM (Incident Management) before turning on the feature in Power Platform admin center to prepare your environment for disaster recovery. The process of preparing the environment could take a while. There's no SLA (Service Level Agreement) for completion of this process; times can vary depending on the resource demands within a region and other factors. Once the ICM is resolved, you can follow normal SSDR steps.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

For a newly created environment, opening a ticket isn't required. You can enable disaster recovery at any time.

## Restrictions

Like with CMK (customer managed keys), with SSDR, certain flows aren't protected by SSDR. You can follow the same instructions to protect them for SSDR.

More information: [Power Automate CMK application warning messages](customer-managed-keys.md#power-automate-cmk-application-warning-messages)

