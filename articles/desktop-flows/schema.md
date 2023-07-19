---
title: Power Automate v2 schema
description: Learn about the Power Automate v2 schema.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 07/11/2023
ms.author: dbekirop
ms.reviewer: gtrantzas
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---
# Power Automate v2 schema

> [!NOTE]
> The Power Automate and Dataverse feature described in this article is applicable to users who sign in [with work, or school accounts, or organization premium accounts](/power-automate/desktop-flows/requirements#sign-in-account-comparison). 

Power Automate stores desktop flows in Microsoft Dataverse, which lets you securely store and manage data used by business applications.

This functionality enables you to use features like solutions for Application Lifecycle Management (ALM). However, handling data stored in this way may be challenging.

Thus, a new storage schema for desktop flows in Dataverse (v2) is available. It makes working with Dataverse APIs easier and enables future product enhancements with desktop flows. The new storage schema is publicly available along with Power Automate for desktop (v2.29).

## Enable the v2 schema

The v2 schema effectively reduces Dataverse database consumption for paid license users. Also, it offloads components of your desktop flows into your [Dataverse for Apps File Capacity](/power-platform/admin/capacity-storage#licenses-for-the-new-storage-model), which is part of your current subscription.

There's no immediate need to act, although we recommend you to enable future product enhancements. Before enabling the new schema, ensure that users and unattended runtime machines have been updated to the appropriate Power Automate for desktop version.

Power Platform administrators can choose when to enable the v2 storage schema. To enable it, go to the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com) > **Environments** > **Settings** > **Product** > **Features** > **Enable storage of desktop flow files into v2 schema**. This setting applies at the environment level.

:::image type="content" source="media/schema/schema-v2-on.png" alt-text="The option in the Power Platform Admin Center to enable the new schema.":::

Convert desktop flows stored in the v1 schema to the v2 schema by Q1 2024, as then the v1 schema will be deprecated. You need Power Automate for desktop v2.29 or later to author and run desktop flows using environments where the v2 schema is enabled. This requirement ensures desktop flow makers and attended and unattended users can take advantage of the new functionality.

## Schema v2 enabled by default

Starting in October 2023, we will turn on schema v2 on all environments. If you don't want to have schema v2 enabled on your environment, you can opt-out for this change by turning on the opt-out toggle in Power Platform Admin Center.

:::image type="content" source="media/schema/schema-v2-off.png" alt-text="The option in the Power Platform Admin Center to opt-out of schema v2 enabled by default.":::

In 2024, we will force schema v2 to be turn on for all environments, we recommend to enable schema v2 as soon as possible to benefit from product enhancements.

## Manage desktop flows in environments with the v2 schema enabled

Power Automate desktop flows currently stored in the v1 schema continues functioning as intended in environments where the v2 schema is enabled. New, modified, and resaved desktop flows are stored in the v2 schema.

If a desktop flow belongs to a solution in a v2-enabled environment, follow [these additional steps](alm-schema.md) to ensure the solution package contains all the binaries required for the flow to function correctly.

## Roll back converted desktop flows

Power Automate for desktop version 2.29 or later allows organizations that moved ahead with the v2 schema to roll back until the v1 schema becomes deprecated.

You can roll back a desktop flow converted to the v2 schema by resaving the desktop flow to an environment where the PPAC administrator has the feature disabled.

For most scenarios, there's no need to downgrade your version of Power Automate for desktop. However, desktop flows that use v2-related features that aren't supported by the v1 schema can't roll back.

## Limitations of v2 schema desktop flows

Desktop flows stored in the v2 schema only function in environments with the v2 schema feature enabled.

V1 schema desktop flows in a managed solution may operate in an environment where the v2 schema is enabled, but first you should resave them into another environment where the v2 schema is enabled.

Then, you can import the updated v2 schema version of the same process to the managed environment where it's intended to run. The active layer can be replaced by the v2 schema version of the automated process.

|Scenario|Power Automate for desktop prior to February 2023 release | Power Automate for desktop after to February 2023 release |
|--------|----------------------------------------------------------|-----------------------------------------------------------|
|**Can run v1 schema desktop flows in environments with the v2 schema enabled?** |Yes|Yes|
|**Can run v2 schema desktop flows in environments with the v2 schema enabled?** |No (user notified of error)|Yes|
|**Can run v2 schema desktop flows in environments with the v2 schema disabled?** |No (user notified of error)|Yes|
|**Can edit/save v1 desktop flows into v1 schema in environments with the v2 schema disabled?** |Yes|Yes|
|**Can edit/save v1 desktop flows into v1 schema in environments with the v2 schema enabled?** |Yes|No (flows are upconverted and saved in the v2 schema)|
|**Can edit/save v2 desktop flows into z1 schema in environments with the v2 schema disabled?** |No (user notified of error)|Yes (flows are downgraded to and saved in the v1 schema)|
|**Can edit/save v2 desktop flows into v2 schema in environments with the v2 schema enabled?** |No (user notified of error)|Yes|
