---
title: Power Automate environments move to new architecture
description: Learn how to ensure your environment is upgraded so that you can access faster runtimes and new features in Power Automate.
#customer intent: As a Power Automate user, I want to verify if my environment is on the most current architecture so that I can access faster runtimes and new features.
author: kisubedi
ms.author: kisubedi
ms.reviewer: angieandrews
ms.date: 10/24/2025
ms.topic: concept-article
---

# Power Automate environments move to new architecture

Power Automate is upgrading environments to new architecture&mdash;SelfHost Multitenant&mdash;for better performance and feature support. To access faster runtimes and new features like [express mode](/microsoft-copilot-studio/agent-flow-express-mode), your environment needs to be on SelfHost Multitenant architecture.

To check your environment:

1. Sign in to [Power Automate](https://make.powerautomate.com/).
1. In the upper right, select **Environments**, and then select the desired environment from the dropdown list.
1.  Press **Ctrl** + **Alt** + **A** to view environment debug info and search for **environmentFlowHostingType**.

    1. If the value is **SelfHostMultiTenant**, your environment is already on the new SelfHost Multitenant architecture&mdash;no action is required.
    1. If the value is **LogicApps**, your environment is on the current architecture.

        Power Automate is auto-upgrading environments to the SelfHost Multitenant architecture iteratively, with a safe upgrade to the new architecture following safe deployment practices.

1. (If the value is **LogicApps**) Some flows might block environment upgrades. We strongly recommend you update these flows, which unblock environment upgrades.

    Learn about existing HTTP and Teams webhook trigger flows in [Troubleshoot common issues with triggers](/troubleshoot/power-platform/power-automate/flow-run-issues/triggers-troubleshoot?tabs=new-designer#changes-to-http-or-teams-webhook-trigger-flows).

    These steps ensure that in the routine automatic process of upgrading, your environment can be picked up in the next batch of environment upgrades.
