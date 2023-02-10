---
title: Power Automate v2 schema
description: Learn about the Power Automate v2 schema.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 02/10/2023
ms.author: dbekirop
ms.reviewer: gtrantzas
contributors:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Power Automate v2 schema

> [!NOTE]
> The following article applies only to users with paid Power Automate subscriptions.

The new Dataverse storage schema enables future product enhancements in desktop flows, and it's available in Power Automate for desktop v2.29 or later.

There's no immediate need to act, although it's recommended to enable future product enhancements. Before enabling the new schema, ensure that users and unattended runtime machines have been updated to the appropriate Power Automate for desktop version.

Power Platform administrators can choose when to enable the v2 storage schema. To enable it, use the toggle for the v2 storage schema in the Power Platform Admin Center. This setting applies at the environment level.

Convert desktop flows stored in the v1 schema to the v2 schema by Q1 2024, as then the v1 schema will be deprecated. You need Power Automate for desktop v2.29 or later to author and run desktop flows using environments where the v2 schema is enabled. This requirement ensures desktop flow makers and attended and unattended users can take advantage of the new functionality.

## Manage desktop flows in environments with the v2 schema enabled

Power Automate desktop flows currently stored in the v1 schema continues functioning as intended in environments where the v2 schema is enabled. New, modified, and resaved desktop flows are stored in the v2 schema.

## Roll back converted desktop flows

Power Automate for desktop version 2.29 or later allows organizations that moved ahead with the v2 schema to roll back until the v1 schema becomes deprecated.

You can roll back a desktop flow converted to the v2 schema by resaving the desktop flow to an environment where the PPAC administrator has the feature disabled.

For most scenarios, there's no need to downgrade your version of Power Automate for desktop. However, desktop flows that use v2-related features that aren't supported by the v1 schema can't roll back.

## Limitations of v2 schema desktop flows

Desktop flows stored in the v2 schema only function in environments with the v2 schema feature enabled.

V1 schema desktop flows in a managed solution may operate in an environment where the v2 schema is enabled, but first you must resave them into another environment where the v2 schema is enabled.

The updated v2 schema version of the same process can then be imported to the managed environment where it's intended to run. The active layer can be replaced by the v2 schema version of the automated process.

|Scenario|Power Automate for desktop prior to February 2023 release | Power Automate for desktop after to February 2023 release |
|--------|----------------------------------------------------------|-----------------------------------------------------------|
|**Can run v1 schema desktop flows in environments with the v2 schema enabled?** |Yes|Yes|
|**Can run v2 schema desktop flows in environments with the v2 schema enabled?** |No (user notified of error)|Yes|
|**Can run v2 schema desktop flows in environments with the v2 schema disabled?** |No (user notified of error)|Yes|
|**Can edit/save v1 desktop flows into v1 schema in environments with the v2 schema disabled?** |Yes|Yes|
|**Can edit/save v1 desktop flows into v1 schema in environments with the v2 schema enabled?** |Yes|No (flows are upconverted and saved in the v2 schema)|
|**Can edit/save v2 desktop flows into z1 schema in environments with the v2 schema disabled?** |No (user notified of error)|Yes (flows are downgraded to and saved in the v1 schema)|
|**Can edit/save v2 desktop flows into v2 schema in environments with the v2 schema enabled?** |No (user notified of error)|Yes|
