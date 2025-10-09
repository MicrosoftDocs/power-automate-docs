---
title: Enable self-service disaster recovery
description: Learn how and when to prepare your environment for disaster recovery.
author: kisubedi
ms.author: kisubedi
ms.reviewer: angieandrews
ms.date: 08/25/2025
ms.topic: concept-article
ms.service: power-automate
---

# Enable self-service disaster recovery

If you want to use Self service disaster recovery (SSDR) for Power Automate on an existing environment, you must open a support ticket/ICM (Incident Management) before turning on the feature in Power Platform admin center to prepare your environment for disaster recovery. The process of preparing the environment could take a while. There's no SLA (Service Level Agreement) for completion of this process; times can vary depending on the resource demands within a region and other factors. Once the ICM is resolved, you can follow normal SSDR steps.

For a newly created environment, opening a ticket isn't required. You can enable disaster recovery at any time.

Self-service disaster recovery is currently in PREVIEW for Power Automate. See the https://azure.microsoft.com/support/legal/preview-supplemental-terms/ 

## Restrictions

Like with CMK (customer managed keys), with SSDR, certain flows aren't protected by SSDR. You can follow the same instructions to protect them for SSDR.

More information: [Power Automate CMK application warning messages](customer-managed-keys.md#power-automate-cmk-application-warning-messages)

