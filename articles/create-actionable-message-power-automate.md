---
title: Create an actionable message in Power Automate
description: Learn how to create an actionable message in Power Automate.
ms.date: 03/13/2026
ms.update-cycle: 180-days
ms.topic: how-to
author: kisubedi
contributors:
  - kisubedi
  - v-aangie
ms.author: kisubedi
ms.reviewer: angieandrews
ms.collection: 
    - bap-ai-copilot
---

# Create an actionable message in Power Automate

Authenticated actionable messages enable you to build secure, enterprise-grade workflows via trigger conditions. This provides stronger protection against replay and misuse while preserving a seamless, interactive email experience.

## Create an actionable email

1. Sign in to the [Actionable Email Developer Dashboard](https://outlook.office.com/connectors/oam/publish).

1. Select a provider or create a new one. Learn more about actionable message providers in [Enable Microsoft Entra ID token for Actionable Messages](/outlook/actionable-messages/enable-entra-token-for-actionable-messages).

1. For the question, **Is this a Power Automate Scenario?**, select **Yes**.

    This sets the token type to `AadPfatToken (PFT + POP)` automatically.

1. Target URLs should contain the URL of the HTTP trigger flow, which is to be called by the actionable email. You can use `Regex`.

## HTTP trigger flow configuration

1. For the question, **Who can trigger the flow?**, select **Any user in my tenant** or **Specific users in my tenant**.

1. Under **HTTP trigger settings**, add **Trigger condition**.
1. Set this condition: `@equals(triggerOutputs()?['headers']?['Provider-Id'], 'your_actionable_email_provider_id')`

    If the header isn't valid when the flow is triggered, the HTTP call returns *202 Accepted*, but doesn't run actions and no run history shows for these calls.

## Power Automate processing actionable message request

If the trigger is from *actionable message* to an authenticated flow, only `AadPfatToken` is allowed. The **Provider Id** in the request is validated against the flow trigger condition.

 