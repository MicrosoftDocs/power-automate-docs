---
title: Enable Self Service Disaster Recovery for Power Automate cloud flows (preview)
description: Learn how and when to prepare your environment for disaster recovery for Power Automate cloud flows.
author: kisubedi
ms.author: kisubedi
ms.reviewer: angieandrews
ms.date: 10/23/2025
ms.topic: concept-article
ms.service: power-automate
#customer intent: I want to enable SSDR to prepare my Power Autoamte environment for disaster recovery.
---

# Enable Self Service Disaster Recovery for Power Automate cloud flows (preview)

[!INCLUDE[c-preview-features-top-note](./includes/cc-preview-features-top-note.md)]

This article explains what Self Service Disaster Recovery (SSDR) is, its benefits, and how to enable it for Power Automate cloud flows in your environment.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## What is Self Service Disaster Recovery (SSDR)

SSDR is a capability in Power Platform that allows organizations to replicate production environments across geographically distant regions and initiate failover themselves. Unlike built-in in-region resilience, which automatically handles zone-level failures, SSDR provides a way to mitigate large scale disasters or outages. It gives customers control to trigger failover and failback once primary region is restored without relying on Microsoft support. This approach enhances business continuity by reducing downtime, ensuring data availability even during regional outages, and allowing proactive testing of recovery plans. Ultimately, SSDR empowers businesses with greater autonomy, faster recovery, and improved resilience for mission-critical applications.

## Benefits of Self Service Disaster Recovery (SSDR)

Here are the key benefits of SSDR:

- **Cross-region protection**: Keeps a copy of your production environment in a secondary region for large-scale disaster resilience.
- **Customer-controlled failover**: You can initiate failover operations without waiting for Microsoft support.
- **Proactive testing**: Enables running disaster recovery drills to validate business continuity plans.
- **Reduced downtime**: Faster recovery compared to traditional manual processes.
- **Improved autonomy**: Gives organizations more control over their disaster recovery strategy.

Learn more about SSDR in [Business continuity and disaster recovery](/power-platform/admin/business-continuity-disaster-recovery).

## Enable Self Service Disaster Recovery (SSDR) in an environment

We encourage you to enable SSDR for Power Automate on an environment, by signing up for a limited preview through this [form](https://forms.office.com/r/Pe9DqSwxV9).

Since SSDR is in a limited preview at this time, we suggest you either enable in a sandbox environment, or if in production environment, don't use with production workloads.

To turn on SSDR, make sure your environment is managed and linked to a [pay-as-you-go billing plan](/power-platform/admin/pay-as-you-go-overview). Learn more about managed environments in [Managed environments overview](/power-platform/admin/managed-environment-overview).

## Restrictions

Like with CMK (customer managed keys), with SSDR, certain flows aren't protected by SSDR. You can follow the same instructions to protect them for SSDR.

More information: [Power Automate CMK application warning messages](customer-managed-keys.md#power-automate-cmk-application-warning-messages)

> [!NOTE]
> Desktop flows are already fully supported and covered by SSDR toggle in Power Platform admin center.
