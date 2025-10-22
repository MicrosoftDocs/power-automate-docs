---
title: Enable self-service disaster recovery for Power Automate Cloud Flows(preview)
description: Learn how and when to prepare your environment for disaster recovery for Power Automate Cloud Flows.
author: kisubedi
ms.author: kisubedi
ms.reviewer: angieandrews
ms.date: 10/09/2025
ms.topic: concept-article
ms.service: power-automate
#customer intent: I want to enable SSDR to prepare my Power Autoamte environment for disaster recovery.
---

# What is Self service disaster recovery

Self-service disaster recovery (SSDR) is a capability in Power Platform that allows organizations to replicate production environments across geographically distant regions and initiate failover themselves. Unlike built-in in-region resilience, which automatically handles zone-level failures, SSDR provides a way to mitigate large scale disasters or outages. It gives customers control to trigger failover and failback once primary region is restored without relying on Microsoft support. This approach enhances business continuity by reducing downtime, ensuring data availability even during regional outages, and allowing proactive testing of recovery plans. Ultimately, SSDR empowers businesses with greater autonomy, faster recovery, and improved resilience for mission-critical applications.

Here are the key benefits of Self-Service Disaster Recovery (SSDR):

**Cross-region protection**: Keeps a copy of your production environment in a secondary region for large-scale disaster resilience.

**Customer-controlled failover**: You can initiate failover operations without waiting for Microsoft support.

**Proactive testing**: Enables running disaster recovery drills to validate business continuity plans.

**Reduced downtime**: Faster recovery compared to traditional manual processes.

**Improved autonomy**: Gives organizations more control over their disaster recovery strategy.

You can find documentation on SSDR [here](https://learn.microsoft.com/en-us/power-platform/admin/business-continuity-disaster-recovery?tabs=new).

# Enable self-service disaster recovery for Power Automate Cloud Flows

We encourage you to enable Self service disaster recovery (SSDR) for Power Automate on an environment, by signing up for a limited preview through this [Form](https://forms.office.com/r/Pe9DqSwxV9).

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

Since this is a limited preview at this time, we suggest you either enable in sandbox environment or if in production environment, don't use with production workloads.

To turn on self-service disaster recovery, make sure your environment is managed and linked to a [pay-as-you-go billing plan](https://learn.microsoft.com/en-us/power-platform/admin/pay-as-you-go-overview). For more information about managed environments, go to [Managed Environments](https://learn.microsoft.com/en-us/power-platform/admin/managed-environment-overview).

## Restrictions

Like with CMK (customer managed keys), with SSDR, certain flows aren't protected by SSDR. You can follow the same instructions to protect them for SSDR.

More information: [Power Automate CMK application warning messages](customer-managed-keys.md#power-automate-cmk-application-warning-messages)

# Notes:

Desktop flows are already fully supported and covered by SSDR toggle in PPAC.
