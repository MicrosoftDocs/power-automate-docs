---
title: Power Automate v2 schema
description: Learn about the Power Automate v2 schema.
author: nvigne
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 05/04/2026
ms.author: nvigne
ms.reviewer: ellenwehrle
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

## Access v2 schema setting in Power Platform admin center

The v2 schema effectively reduces Dataverse database consumption for paid license users. Also, it offloads components of your desktop flows into your [Dataverse for Apps File Capacity](/power-platform/admin/capacity-storage#licenses-for-the-new-storage-model), which is part of your current subscription.

To effectively use the new schema, ensure that users and unattended runtime machines are updated to the appropriate Power Automate for desktop version.

As a Power Platform administrator, you can access the v2 storage schema setting, called *Enhanced desktop flow schema*, for desktop flows in your environments by following these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com)
1. On the navigation pane, select **Manage**.
1. On the **Manage** pane, select **Environments**.
1. On the **Environments** page, select the environment you want to configure.
1. On the command bar, select **Settings**.
1. Expand **Product**, and then select **Features**.
1. On the **Features** page, navigate to **Enhanced desktop flow schema**. This setting applies at the environment level.

## Schema v2 enabled by default

As of October 1st, 2024, the v1 schema is deprecated and the v2 schema is **enabled by default** in all Public regions of the Power Platform. You need Power Automate for desktop v2.29 or later to author and run desktop flows using environments where the v2 schema is enabled. This requirement ensures desktop flow makers and attended and unattended users can take advantage of the new functionality.

:::image type="content" source="media/schema/schema-v2-default.png" alt-text="The option in the Power Platform Admin Center to opt-out of schema v2 enabled by default.":::

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

With the v2 schema, the desktop flow binary table is used. For desktop flows to work as expected, you need additional privileges. If you're using the default security roles `Environment Maker` and `Basic User`, no additional configuration is required for desktop flows to work as expected. These built-in roles already include all required permissions for creating, running, and managing flows in the v2 schema.

In addition to the permissions provided by the Basic User and Environment Maker roles, the following privileges are required for desktop flows when using custom security roles:

- `prvCreatedesktopflowbinary`
- `prvReaddesktopflowbinary`
- `prvWritedesktopflowbinary`
- `prvDeletedesktopflowbinary`
- `prvSharedesktopflowbinary`
- `prvAssigndesktopflowbinary`
- `prvAppenddesktopflowbinary`
- `prvAppendTodesktopflowbinary`
- `prvReadSolution`
- `prvReadtag` (optional starting with version 2.57)
- `prvReadtaggedprocess` (optional starting with version 2.57)

The minimum access level for each privilege is basic (user). More information: [Security roles and privileges](/power-platform/admin/security-roles-privileges)

:::image type="content" source="media/schema/desktopflowbinary-permissions.png" alt-text="Privilege and access level required for desktop flow binaries with v2 schema":::

> [!IMPORTANT]
> Assigning only the privileges listed in [Roles and privileges](#roles-and-privileges) may not be sufficient if other required Dataverse or Power Platform permissions normally granted by *Basic User* or *Environment Maker* are missing.

