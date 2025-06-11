---
title: Power Automate v2 schema
description: Learn about the Power Automate v2 schema.
author: nvigne
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 05/02/2025
ms.author: nvigne
ms.reviewer: matp
contributors:
  - DanaMartens
  - yiannismavridis
search.audienceType: 
  - flowmaker
  - enduser
---
# Power Automate v2 schema

> [!NOTE]
> The Power Automate and Dataverse feature described in this article is applicable to users who sign in [with work, or school accounts, or organization premium accounts](/power-automate/desktop-flows/requirements#sign-in-account-comparison).

Power Automate stores desktop flows in Microsoft Dataverse, which lets you securely store and manage data used by business applications.

This functionality enables you to use features like solutions for Application Lifecycle Management (ALM). However, handling data stored in this way might be challenging.

Thus, a new storage schema for desktop flows in Dataverse (v2) is available. It makes working with Dataverse APIs easier and enables future product enhancements with desktop flows. The new storage schema is publicly available along with Power Automate for desktop (v2.29).

## Enable the v2 schema

The v2 schema effectively reduces Dataverse database consumption for paid license users. Also, it offloads components of your desktop flows into your [Dataverse for Apps File Capacity](/power-platform/admin/capacity-storage#licenses-for-the-new-storage-model), which is part of your current subscription.

There's no immediate need to act, although we recommend you to enable future product enhancements. Before enabling the new schema, ensure that users and unattended runtime machines have been updated to the appropriate Power Automate for desktop version.

Power Platform administrators can choose when to enable the v2 storage schema. To enable it, go to the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com) > **Environments** > **Settings** > **Product** > **Features** > **Enable storage of desktop flow files into v2 schema**. This setting applies at the environment level.

:::image type="content" source="media/schema/schema-v2-on.png" alt-text="The option in the Power Platform Admin Center to enable the new schema.":::

Convert desktop flows stored in the v1 schema to the v2 schema by end of 2024, as then the v1 schema will be deprecated. You need Power Automate for desktop v2.29 or later to author and run desktop flows using environments where the v2 schema is enabled. This requirement ensures desktop flow makers and attended and unattended users can take advantage of the new functionality.

## Schema v2 enabled by default

Starting January 2024, v2 schema is automatically enabled for all environments. Although not recommended, the option to opt-out of the autoenablement is available in the Power Platform admin center. Turning on the opt-out delays the enablement of v2 schema on this particular environment.

:::image type="content" source="media/schema/schema-v2-off.png" alt-text="The option in the Power Platform Admin Center to opt-out of schema v2 enabled by default.":::

Later in 2024, v2 schema will be turned on for all environments without the option to disable the feature and the option won't be visible in Power Platform admin center. As a best practice, we recommend that you enable the feature in advance so users can benefit from the product enhancements, which come with it.

As of October 1st, 2024, the v2 schema is enabled by default in all Public regions of the Power Platform.

## Manage desktop flows in environments with the v2 schema enabled

Power Automate desktop flows currently stored in the v1 schema continues functioning as intended in environments where the v2 schema is enabled. New, modified, and resaved desktop flows are stored in the v2 schema.

If a desktop flow belongs to a solution in a v2-enabled environment, follow [these additional steps](alm-schema.md) to ensure the solution package contains all the binaries required for the flow to function correctly.

## Roll back converted desktop flows

Power Automate for desktop version 2.29 or later allows organizations that moved ahead with the v2 schema to roll back until the v1 schema becomes deprecated.

You can roll back a desktop flow converted to the v2 schema by resaving the desktop flow to an environment where the Power Platform administrator has the feature disabled.

For most scenarios, there's no need to downgrade your version of Power Automate for desktop. However, desktop flows that use v2-related features that aren't supported by the v1 schema can't roll back.

A rollback from v2 to v1 can result in some screenshots associated with UI elements not being saved. Although those screenshots aren't necessary for the desktop flow to run, you can save them:

1. Go to the **UI Elements** right panel in Power Automate desktop.
1. Select each UI element in the list.

This ensures that the screenshots are saved when you rollback to v1.

## Limitations of v2 schema desktop flows

Desktop flows stored in the v2 schema only function in environments with the v2 schema feature enabled.

V1 schema desktop flows in a managed solution might operate in an environment where the v2 schema is enabled, but first you should resave them into another environment where the v2 schema is enabled.

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

## Exceeded size limit

When you save a desktop flow in v2 schema, you might see the following error:

"The flow can't be saved as it has exceeded the allowed size limit."

:::image type="content" source="media/schema/desktopflow-v2-limit.png" alt-text="Error during flow save error message indicating limit on the flow size.":::

The limit applies to the definition of the desktop flow saved in Dataverse, which can't exceed 16M characters. The issue can occur with a large desktop flow, such as when actions have large property values or variables have large default values. For example, an image saved as base64 and set as a default variable value.

We recommend to not store a large payload in the action properties or in the variable default value. Instead retrieve the value from other actions or pass the value as an input variable. You can also split your desktop flow into multiple child desktop flows.

## Dataverse schema

With v2 schema, we change the data model stored in Dataverse. In addition to the workflow entity, we use the desktop flow binary entity to store data related to the desktop flow including images and metadata.

:::image type="content" source="media/schema/desktopflowbinaries-v2.png" alt-text="Desktop flow in v2 schema with desktop flow binaries.":::

> [!IMPORTANT]
> The desktop flow binary objects are required components of the desktop flow as they store required data for the desktop flow to be able to open or run. Don't delete these binary objects. Deleting them results in permanent data loss for the desktop flow, which makes the respective flow non-editable.

The number of desktop flow binaries might vary depending on the size of the desktop flow.

## Roles and privileges

With the v2 schema, the desktop flow binary table is used. For desktop flows to work as expected, you need additional privileges. If you're using the default security roles `Environment Maker` and `Basic User`, there's no change needed.

If you use custom security roles to manage the access to your desktop flow, Power Platform admins need to add the following list of privileges to the role:

- `prvCreatedesktopflowbinary`
- `prvReaddesktopflowbinary`
- `prvWritedesktopflowbinary`
- `prvDeletedesktopflowbinary`
- `prvSharedesktopflowbinary`
- `prvAssigndesktopflowbinary`
- `prvAppenddesktopflowbinary`
- `prvAppendTodesktopflowbinary`
- `prvReadSolution`
- `prvReadtag`
- `prvReadtaggedprocess`

The minimum access level for each privilege is basic (user). More information: [Security roles and privileges](/power-platform/admin/security-roles-privileges)

:::image type="content" source="media/schema/desktopflowbinary-permissions.png" alt-text="Privilege and access level required for desktop flow binaries with v2 schema":::
